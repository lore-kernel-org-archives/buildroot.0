From: Mike Sander <msander@ripnet.com>
Date: Fri, 09 May 2008 12:34:09 -0400
Subject: [Buildroot] $(DATE) out of sync with system
In-Reply-To: <000601c8b1ed$8d50afe0$070514ac@atmel.com>
References: <4823B69A.2040508@ripnet.com>
	<000601c8b1ed$8d50afe0$070514ac@atmel.com>
Message-ID: <48247D01.9030009@ripnet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ulf Samuelsson wrote:
>> I have Custom rootfs suffix set to the default $(DATE).   I have noticed 
>> that a few hours before midnight my rootfs.arm-yyyymmdd.romfs, the dd 
>> portion advances prematurely. this breaks a script I have to copy 
>> binaries after the build.
>>
>> I suspect it is somehow related to DATE not using the timezone correctly 
>> (maybe I dont have it set correctly?).  I have attempted to find where 
>> DATE is being set.  I would imaging that it is using the "date" function 
>> & format specifiers.   Unfortunately DATE is a VERY common symbol under 
>> buildroot.  I am unable to locate where this symbol is initially set.
>>
>> Can someone tell me where to look?
>>
>>     
>
>
> Top Makefile
>   
Thanks.  I had done a multi level grep for "DATE" and "="..... but this 
generated literally hundreds of lines of output..... that proverbial 
needle in the hay stack.

The relevant line does the following DATE:= $(shell date -u +%Y%m%d).  
Anyone know why the "-u" which specifies Coordinated Universal Time?  
This explains the rollover I see a few hours before midnight.  Would it 
not make more sense for this just to be local time?    FWIW... I can 
update my script to be consistent with the DATE logic now that I know 
what is going on.

Regards,

Mike
> Best Regards
> Ulf Samuelsson
>
>
>
> =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
> Scanned with Copfilter Version 0.84beta3a (P3Scan 2.2.1)
> AntiSpam:  SpamAssassin 3.2.3
> by Markus Madlener @ http://www.copfilter.org
>
>   
