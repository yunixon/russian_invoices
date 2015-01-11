class RussianInvoices::CommercialInvoice < RussianInvoices::BaseModel

  attr_accessor :invoice_number, :invoice_from_date, :correction_number, :correction_date,
                :vendor_name, :vendor_address, :vendor_inn, :vendor_kpp,
                :shipper_name, :shipper_address,
                :consignee_name, :consignee_address, :to_the_payment_documents,
                :buyer_name, :buyer_address, :buyer_inn, :buyer_kpp, :goods,
                :chief_organization, :chief_accountant,
                :chief_organization_signature, :chief_accountant_signature,
                :stamp

  validates_presence_of :invoice_number, :invoice_from_date, :correction_number,
                        :correction_date,
                        :vendor_name, :vendor_address, :vendor_inn, :vendor_kpp,
                        :shipper_name, :shipper_address,
                        :consignee_name, :consignee_address, :to_the_payment_documents,
                        :buyer_name, :buyer_address, :buyer_inn, :buyer_kpp

  before_save :prepare_data

  def landscape?
    true
  end

  protected

    def prepare_data
      self.invoice_number = invoice_number.to_s.rjust(6, '0')
      self.correction_number = if correction_number
        invoice_number.to_s.rjust(3, '0')
      else
        '---'
      end
      self.correction_date ||= '---'
    end

end
