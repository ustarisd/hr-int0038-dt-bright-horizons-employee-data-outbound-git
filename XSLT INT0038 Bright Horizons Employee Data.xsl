<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:bc="urn:com.workday/bc"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xtt="urn:com.workday/xtt"
    xmlns:wd="urn:com.workday.report/INT0038_Bright_Horizons"
    xmlns:etv="urn:com.workday/etv" xmlns:out="http://www.workday.com/integration/output"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    version="2.0" exclude-result-prefixes="xsd xsl bc out">



    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Dec 9, 2014</xd:p>
            <xd:p><xd:b>Author:</xd:b> Darren Ustaris</xd:p>
            <xd:p>INT0038 Bright Horizons Employee Data Document Transform XSLT</xd:p>
        </xd:desc>
    </xd:doc>
    
    <xd:doc>
        <xd:desc>
            <xd:p> Set the output method to xml</xd:p>
        </xd:desc>
    </xd:doc>
    
    <xsl:output method="xml" indent="yes"/>
    
    

    <xsl:template match="wd:Report_Data">
        
        <File >
            
            <!-- Header Record-->
            <HeaderRecord xtt:endTag="&#xA;" xtt:separator="|">
                
                <EmployeeID xtt:attribute="Employee ID"></EmployeeID>
                <WorkEmail xtt:attribute="Work Email"></WorkEmail>
                <FirstName xtt:attribute="First Name"></FirstName>
                <LastName xtt:attribute="Last Name"></LastName>
                <HomeCity xtt:attribute="Home City"></HomeCity>
                <HomeState xtt:attribute="Home State"></HomeState>
                <HomeZipCode xtt:attribute="Home Zip Code"></HomeZipCode>
                <WorkLocation xtt:attribute="Work Location"></WorkLocation>
                <BusinessUnit xtt:attribute="Business Unit"></BusinessUnit>
            </HeaderRecord>



            
            <xsl:for-each select="wd:Report_Entry">
              
                <!--Disbursement Record-->
                <DisbursementRecord xtt:endTag="&#xA;" xtt:separator="|" xtt:align="left">
  
                   
                   <EmployeeID><xsl:value-of select="wd:Employee_ID"/></EmployeeID>
                   <WorkEmail><xsl:value-of select="wd:primaryWorkEmail"/></WorkEmail>
                    <FirstName><xsl:value-of select="wd:Legal_Name_-_First_Name"/></FirstName>
                    <LastName><xsl:value-of select="wd:Legal_Name_-_Last_Name"/></LastName>
                   <HomeCity><xsl:value-of select="wd:Primary_Home_Address_-_City"/></HomeCity>
                    <HomeState><xsl:value-of select="wd:Primary_Home_Address_-_State/wd:Primary_Home_Address_-_State"/></HomeState>
                   <HomeZipCode><xsl:value-of select="wd:Primary_Home_Address_-_Postal_Code"/></HomeZipCode>
                    <WorkLocation><xsl:value-of select="wd:CF_INT0038_CT_Work_Address"/></WorkLocation>
                    <BusinessUnit><xsl:value-of select="wd:CF_INT0038_ST_GL_Business_Unit"/></BusinessUnit>
                   
                   
                   
                </DisbursementRecord>
               
            </xsl:for-each>
           

            
        </File>
    </xsl:template>

    
</xsl:stylesheet>