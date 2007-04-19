From: Ulf Samuelsson <ulf@atmel.com>
Date: Thu, 19 Apr 2007 06:41:06 +0200
Subject: [Buildroot] Problem booting 2.6.20.4 on AT91RM9200EK
References: <1176934731.28639.10.camel@elrond.sweden.atmel.com>
	<4626C339.6020603@geeo.net>
Message-ID: <003e01c7823d$954a7810$01c4af0a@Glamdring>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Ulf Samuelsson wrote:
>> Trying out linux-2.6.20.4 on an AT91RM9200EK
>> built by a buildroot downloaded 20070405 (with fixes).
>>
>>
>> Using gcc-3.4.6/binutils 2.16.1 initially built by buildroot
>> but now used as an external toolchain.
>>
>>
>> Getting the following error messages.
>>
>> /sbin/ init: can't load library 'libgcc_s.so.1'
>> Kernel panic - not syncing: Attempted to kill init!
>>
>>
>> Any clues?
>>
>> Found "toolchain_build_arm_small/gcc-3.4.6-final/gcc/libgcc_s.so.1"
>> which I guess is what I am looking for.
>> What is the approriate way to get that into the root file system?
>>
>>
>> [...]
> 
> I've had this problem in the past when I have defined 
> "BR2_GCC_SHARED_LIBGCC" via "Build/install a shared libgcc" in your 
> Toolchain Options. Unless you otherwise need it, you might try disabling 
> and rebuilding.
> 
> Jeremy
> 

Apparently this problem occurs if you remove the "root" directory"
without rebuilding the toolchain.
I 

Probably a ton of errors which results from this

Best Regards
Ulf Samuelsson
