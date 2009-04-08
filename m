From: Mike Sander <msander@cogeco.ca>
Date: Wed, 08 Apr 2009 12:16:03 -0400
Subject: [Buildroot] u-boot fails with custom board support
In-Reply-To: <49DCCA02.30105@atmel.com>
References: <49DCAFCE.4030001@cogeco.ca> <49DCCA02.30105@atmel.com>
Message-ID: <49DCCDC3.5030607@cogeco.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ulf Samuelsson wrote:
> mike sander skrev:
>   
>> Hi All:
>>
>> I'm using buildroot-2009.02. I have a custom board based on atmel
>> at91sam9g20. I have created a top level board config.
>>
>> I invoke make as follows:
>>
>> make BOARD=xx
>>
>> u-boot is failing with the following messages (see below). I have
>> specified "at91sam9g20ek" in the "board name" section for u-boot (same
>> behaviour with default setting). It appears that u-boot does correctly
>> do the at91sam9g20ek_config. I cannot see how/why make is looking for
>> "Project Name" items under u-boot towards the end of the u-boot build.
>> Manually building u-boot with "make at91sam9g20ek_config;make" works
>> fine. Stock u-boot is perfectly acceptable.
>>
>> I've read the br docs. I did not see any indication that u-boot needs
>> to be tailored when using custom board support. Any suggestions on how
>> to force u-boot to build the stock config? I have tried latest br
>> snapshot too. same behavior. I suspect I have missed something obvious.
>>     
>
> As for U-Boot, there is NO support for at91sam9g20 in vanilla u-boot.
> You have to apply the Atmel specific sam9g20 patches
> in menuconfig
> BR
> Ulf Samuelsson
>
>   
yes, I am aware of this.   I *can* build stock u-boot targeting the 
at91sam9g20ek from the u-boot-2009.01 directory.

regards,

ms
>> /usr/bin/make -C board/atmel/xx/
>> make: Entering an unknown directory
>> make: *** board/atmel/xx/: No such file or directory. Stop.
>> make: Leaving an unknown directory
>> make[1]: *** [board/atmel/xx/libxx.a] Error 2
>> make[1]: Leaving directory
>> `/home/br/buildroot/project_build_arm/xx/u-boot-2009.03'
>> make: ***
>> [/home/br/buildroot/project_build_arm/xx/u-boot-2009.03/u-boot.bin]
>> Error 2
>>
>>
>>
>> thanks in advance,
>>
>> mike sander
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>>     
>
>
>
> =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
> Scanned with Copfilter Version 0.84beta3a (P3Scan 2.2.1)
> AntiSpam:  SpamAssassin 3.2.3
> by Markus Madlener @ http://www.copfilter.org
>
>   
