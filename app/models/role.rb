class Role < ActiveRecord::Base

    has_many :auditions

    def actors
        actors_array = []
        self.auditions.each do |audition|
            actors_array << audition.actor
        end
        actors_array
    end

    def locations 
        locations_array = []
        self.auditions.each do |audition|
            locations_array << audtion.location
        end
        locations_array
    end

    def lead
        result = self.auditions.order(hired: :asc).first
        if result 
            result
        else
            'no actor has been hired for this role'
        end
    end

    def understudy
        result = self.auditions.order(hired: :asc)[1]
        if result 
            result
        else
            'no actor has been hired for understudy for this role'
        end
    end



  
end