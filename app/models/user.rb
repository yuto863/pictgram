class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  
  
  validates :password, length: { minimum: 8, maximum: 32}, format: {with: /\A[A-Za-z0-9]+\z/}
  validates :email, format: {with: /[^\s]@[^\s]/}
  validates :name, length: { maximum: 15}

  has_many :topics
  has_many :favorites
  has_many :favorite_topics, through: :favorites, source: 'topic'

  has_secure_password
end