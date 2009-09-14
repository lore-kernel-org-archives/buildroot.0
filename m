From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Mon, 14 Sep 2009 07:57:41 +0200
Subject: [Buildroot] External Toolchain in latest stable buildroot
In-Reply-To: <BD79186B4FD85F4B8E60E381CAEE190901CBEE46@mi8nycmail19.Mi8.com>
References: <330EC2471BF24E48B513AF1A6975EB69AD87F9@MAIL-UA.ccs.local><20090911091415.19422fbb@surf><330EC2471BF24E48B513AF1A6975EB69AD8816@MAIL-UA.ccs.local>	<330EC2471BF24E48B513AF1A6975EB69AD887B@MAIL-UA.ccs.local>
	<BD79186B4FD85F4B8E60E381CAEE190901CBEE46@mi8nycmail19.Mi8.com>
Message-ID: <4AADDB55.3050408@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

H Hartley Sweeten skrev:
> On Friday, September 11, 2009 3:50 AM, Teemu Keskinarkaus wrote:
>> Hi,
>>
>> So I was able to get some of the stuff compile and some not. The
>> external toolchain I'm using is Codesourcery's toolchain for arm.
>> Version is(Sourcery G++ Lite 2009q1-203) (gcc version 4.3.3)
>>
>> I'm quite sure that this is not 100% buildroot problem, but I ask
>> anyway.
>>
>> I hit problems when compiling bootstrap for AT91.
>>
>> Get few of these errors:
>>
>> build/at91sam9263ek/main.o:(.ARM.exidx+0x0): undefined reference to
>> `__aeabi_unwind_cpp_pr1'
>> build/at91sam9263ek/at91sam9263ek.o:(.ARM.exidx+0x0): undefined
>> reference to `__aeabi_unwind_cpp_pr0'
>>
>> I did some digging and it seems that the problem might be in the
>> toolchain, but it might also need some work in buildroot side.
>>
>> Has anyone been able to use CodeSourcerys toolchain to compile buildroot
>> for ARM? Or is anyone even using CodeSourcerys toolchain for ARM?
>>
>> Teemu Keskinarkaus
> 
> The Sourcery G++ Lite 2009q1-203 toolchain is a multilib sysroot toolchain.
> I had similar problems trying to get it to work for an EP93XX processor.
> 
> I think the AT91 processor is an ARM920T so you need to pass -march=armv4t
> to the toolchain to in order for it to compile the code correctly.  This
> is the same option I need for the EP93XX.

The AT91SAM9263 is an ARM926EJ-S.
BR
Ulf Samuelsson


> 
> I spent the last three weeks trying to get this toolchain to work correctly.
> I finally got "way" over my head and built my own toolchain with crosstool-ng.
> Personally I would prefer to use a prebuilt external toolchain but at least
> everything works now.
> 
> Regards,
> Hartley
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
