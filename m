From: Stephane Viau (OSS) <stephane.viau@oss.nxp.com>
Date: Mon, 29 Jun 2020 06:38:36 +0000
Subject: [Buildroot] [PATCH 1/2] package/freescale-imx: Add option for
 all i.MX FW needs
In-Reply-To: <20200625203307.GP20645@scaer>
References: <1593012228-18959-1-git-send-email-stephane.viau@oss.nxp.com>
 <1593012228-18959-2-git-send-email-stephane.viau@oss.nxp.com>
 <20200624225831.2183d1b0@windsurf>
 <DB8PR04MB5755C99B335ACE9AFC7552CDA7920@DB8PR04MB5755.eurprd04.prod.outlook.com>,
 <20200625203307.GP20645@scaer>
Message-ID: <DB8PR04MB575585960BB8ED2EB33E9556A7930@DB8PR04MB5755.eurprd04.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, Sebastien, all,

>> Thomas wrote:                                                                 
>> >However, I am wondering if package/freescale-imx/Config.in is the right      
>> >place for all this logic. After all, this is only related to the             
>> >firmware-imx package.                                                        
>> >                                                                             
>> >Shouldn't we instead move that to                                            
>> >package/freescale-imx/firmware-imx/Config.in, with the following form:       
>> >                                                                             
>> >config BR2_PACKAGE_FREESCALE_IMX_NEEDS_DDR_FW                                
>> >        bool                                                                 
>> >        default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M                
>> >        default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM               
>> >        default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN               
>> >                                                                             
>> >and ditto the other options ? Here as well, it would require a               
>> >preparation patch to take care of the NEEDS_DDR_FW case, and then your       
>> >patch that handles all other FW files.                                       
>>                                                                               
>> I'd like to have Yann's and/or Gary's feedback on this. I'm using 'select' based on this comment:
>> "                                                                             
>>   As Yann mentioned on IRC:                                                   
>>   "Usually, when we introduce such option, it does not 'default y' based      
>>   on some other options. Instead, the other options 'select' it."             
>> "                                                                             
>> from http://lists.busybox.net/pipermail/buildroot/2020-May/283180.html        
>                                                                                
>True, that's what I said. That was based on the assumption that the             
>options would be in package/freescale-imx/Config.in.                            
>                                                                                
>But now, seeing the reasonning by Thomas, I agree with him: those are           
>better suited to live in package/freescale-imx/firmware-imx/Config.in/          
>                                                                                
>And thus it is less clean that the variant selection in the generic             
>choice would have to catter with options specific to a package.                 
>                                                                                
>Hence, the "default y if ..." is indeed better.                                 
>                                                                                
>Sorry I did not have that insight to begin with...                              

No worries ; thank you all for your comments!
Will send out a v2 soon..

BTW, I'm also thinking of embedding the 'install path' fix proposed by Sebastien here:
http://lists.busybox.net/pipermail/buildroot/2020-June/284875.html 

BR,
Stephane. 
                                                                                 
>                                                                                
>Regards,                                                                        
>Yann E. MORIN.                                                                  
>                                                                                
>--                                                                              
>.-----------------.--------------------.------------------.--------------------.
>|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
>| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
>| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
>| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
>'------------------------------^-------^------------------^--------------------'
