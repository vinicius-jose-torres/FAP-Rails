class User < ApplicationRecord
  has_many :question_users

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable, :trackable
  include DeviseTokenAuth::Concerns::User

  def calculate_result
    value = 0
    question_users.each do |question_user|
      if question_user.answer == 'option_1'
        value += 1
      elsif question_user.answer == 'option_2'
        value += 2
      elsif question_user.answer == 'option_3'
        value += 3
      else
        value += 5
         
      end
    end
    value
  end
  


end