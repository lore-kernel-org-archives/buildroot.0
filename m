Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D550C433EF
	for <buildroot@archiver.kernel.org>; Tue, 29 Mar 2022 17:52:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5CB198427D;
	Tue, 29 Mar 2022 17:52:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ij6AE1JePGVn; Tue, 29 Mar 2022 17:52:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9BDB83227;
	Tue, 29 Mar 2022 17:52:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 590841BF34A
 for <buildroot@lists.busybox.net>; Tue, 29 Mar 2022 17:52:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 46D9B83227
 for <buildroot@lists.busybox.net>; Tue, 29 Mar 2022 17:52:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 96ECTx15-Q11 for <buildroot@lists.busybox.net>;
 Tue, 29 Mar 2022 17:52:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5439C819F6
 for <buildroot@buildroot.org>; Tue, 29 Mar 2022 17:52:17 +0000 (UTC)
Received: from webmail.serv15.avernis.de (ip6-localhost [IPv6:::1])
 by serv15.avernis.de (Postfix) with ESMTPSA id DC24EC906855;
 Tue, 29 Mar 2022 19:52:14 +0200 (CEST)
MIME-Version: 1.0
Date: Tue, 29 Mar 2022 17:52:14 +0000
From: Andreas Ziegler <br015@umbiko.net>
To: Dan Jackson <dan@thejacksons.uk>
In-Reply-To: <AM6PR02MB488490D703CC6DAD1FF356CFDA1E9@AM6PR02MB4884.eurprd02.prod.outlook.com>
References: <mailman.22068.1648533484.192135.buildroot@buildroot.org>
 <2854f91f1188e166bf02e3a6ab6249a4@umbiko.net>
 <AM6PR02MB48848F8B3F5238DF24891A59DA1E9@AM6PR02MB4884.eurprd02.prod.outlook.com>
 <0b1ebd93c431e1c06678303eaffd8a79@umbiko.net>
 <AM6PR02MB488490D703CC6DAD1FF356CFDA1E9@AM6PR02MB4884.eurprd02.prod.outlook.com>
Message-ID: <54f87d03a99935fb452424992a81409c@umbiko.net>
X-Sender: br015@umbiko.net
X-Virus-Scanned: clamav-milter 0.103.5 at serv15.avernis.de
X-Virus-Status: Clean
Subject: Re: [Buildroot] Adding USB support to existing device on 2.6.39.3
 kernel - possible?
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 2022-03-29 16:17, Dan Jackson wrote:
>> -----Original Message-----
>> From: Andreas Ziegler <br015@umbiko.net>
>> Sent: 29 March 2022 16:14
>> To: Dan Jackson <dan@thejacksons.uk>
>> Cc: buildroot@buildroot.org
>> Subject: Re: Adding USB support to existing device on 2.6.39.3 kernel 
>> -
>> possible?
>> 
>> Hi Dan,
>> 
>> On 2022-03-29 12:48, Dan Jackson wrote:
>> >> -----Original Message-----
>> >> From: Andreas Ziegler <br015@umbiko.net>
>> >> Sent: 29 March 2022 10:40
>> >> To: Dan Jackson <dan@thejacksons.uk>
>> >> Cc: Buildroot <buildroot@buildroot.org>
>> >> Subject: Re: Adding USB support to existing device on 2.6.39.3 kernel
>> >> -
>> >> possible?
>> >>
>> >> Hi Dan,
>> >>
>> >> On 2022-03-29 05:58, Dan Jackson <dan@thejacksons.uk> wrote:
>> >>
>> >> > Hello,
>> >> >
>> >> > Sorry once again if this is a silly/noob question.
>> >> >
>> >> > If I have an existing router device running a 2.6.39.3 kernel,
>> >> > which has a USB port and is capable of supporting USB devices, but
>> >> > the manufacturer has removed/not installed the necessary kernel
>> >> > modules, can I use Buildroot to recreate the missing modules and
>> >> > thus re-enable the missing USB support?
>> >>
>> >> It might work: the driver is contained in the USB module, so building
>> >> and loading that module could do the trick.
>> >>
>> >> > If so, how would I do it?
>> >>
>> >> Supposing the Linux kernel source contained in [1] is the one that is
>> >> running on your device, you need to configure Buildroot to build a
>> >> Linux kernel (BR2_LINUX_KERNEL). The manual [2] has some information
>> >> about how to do this for a Kernel source tree (see chapter 8.14.6).
>> >
>> > It looks like I got that part to work. The buildroot build process
>> > definitely seems to be able to see the kernel source tree which is in
>> > /home/danj/DG3270_9.1.103FB/sourcecode/ti_linux/linux-2.6.39.3/src.
>> >
>> >>
>> >> You then need to enable USB support in the kernel (Device Drivers ->
>> >> USB support), probably
>> >>
>> >>    CONFIG_USB=m
>> >>    CONFIG_USB_EHCI_HCD=y
>> >>    CONFIG_USB_OHCI_HCD=y
>> >>
>> >> is enough, otherwise try some of the hardware specific (driver)
>> >> options.
>> >
>> > This is where I have fallen down. I did "make linux-menuconfig"
>> > expecting to be able to configure the kernel/modules (as I couldn't
>> > see any options for that in buildroot's own "make menuconfig").
>> >
>> > However, at this point it seems like it went off and tried to build
>> > the whole kernel from a default configuration.
>> 
>> 'make linux-menuconfig' needs a working build system. If they are not
>> present, all dependencies of the Linux package get built. First step 
>> is the
>> installation of the kernel source; if Buildroot tries to install a 
>> default kernel,
>> something is amiss with your configuration.
>> 
>> > This eventually failed, so I tried "make linux-reconfigure" at that
>> > point but that did not work either.
>> >
>> > Here is the error it gave upon failure:
>> >
>> > /home/danj/buildroot-2022.02/output/host/lib/gcc/armeb-buildroot-
>> linux-uclibcgnueabi/11.2.0/../../../../armeb-buildroot-linux-
>> uclibcgnueabi/bin/ld:
>> > /home/danj/buildroot-2022.02/output/host/libexec/gcc/armeb-buildroot-
>> linux-uclibcgnueabi/11.2.0/liblto_plugin.so:
>> > error loading plugin:
>> > /home/danj/buildroot-2022.02/output/host/libexec/gcc/armeb-buildroot-
>> linux-uclibcgnueabi/11.2.0/liblto_plugin.so:
>> > undefined symbol: _onload
>> > collect2: error: ld returned 1 exit status
>> > Makefile.in:114: recipe for target '../utils/getconf' failed
>> > make[3]: *** [../utils/getconf] Error 1
>> > Makefile.in:455: recipe for target 'utils' failed
>> > make[2]: *** [utils] Error 2
>> > package/pkg-generic.mk:380: recipe for target
>> > '/home/danj/buildroot-2022.02/output/build/uclibc-
>> 1.0.40/.stamp_target_installed'
>> > failed
>> > make[1]: ***
>> > [/home/danj/buildroot-2022.02/output/build/uclibc-1.0.40/.stamp_target
>> > _installed]
>> > Error 2
>> > Makefile:84: recipe for target '_all' failed
>> > make: *** [_all] Error 2
>> 
>> This error is from the uClibc build - do you use an internal or 
>> external
>> toolchain? Maybe you have conflicting static /dynamic library options?
>> Again, probably a buildroot misconfiguration ...
> 
> This turned out to be that I had some wrong environment variables set
> from a previous attempt. Logged out and back in and now I am past that
> error.
> 
>> 
>> Maybe you could post your buildroot configuration (the result of make
>> savedefconfig)?
> 
> It's quite short as it turns out:
> 
> BR2_armeb=y
> BR2_STATIC_LIBS=y
> BR2_KERNEL_HEADERS_VERSION=y
> BR2_DEFAULT_KERNEL_VERSION="2.6.39.3"
> BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_REALLY_OLD=y
> BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
> BR2_PTHREAD_DEBUG=y
> BR2_BINUTILS_VERSION_2_37_X=y
> BR2_GCC_VERSION_9_X=y
> BR2_TOOLCHAIN_BUILDROOT_CXX=y
> BR2_PACKAGE_HOST_GDB=y
> BR2_GDB_VERSION_9_2=y
> BR2_LINUX_KERNEL=y
> BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="2.6.39.3"
> BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
> BR2_PACKAGE_DROPBEAR=y
> BR2_PACKAGE_DROPBEAR_LOCALOPTIONS_FILE="/home/danj/localoptions.h"
> BR2_PACKAGE_JOE=y

The configuration uses a kernel downloaded from kernel.org, not the 
vendor kernel. You need to configure Buildroot to use a custom source 
directory.

> I can see I have got a USE_ARCH_DEFAULT_CONFIG in there which I'm
> guessing is part of my problems?

You need to configure Buildroot to use your existing .config with 
BR2_LINUX_CUSTOM_KERNEL_CONFIG_FILE.

>> 
>> > Looking at this error message, maybe I need to select an older version
>> > of gcc, in my buildroot configuration? Is it that the kernel can only
>> > be compiled by gcc versions that existed at the time?
>> 
>> Older kernels used to have a include/compiler.h which had predefined
>> includes for specific compiler versions. Use the oldest compiler 
>> available in
>> Buildroot and try to either get a compiler-gcc9.h from a newer kernel 
>> or
>> make your own. I believe this schema changed somewhere between 3.x and
>> 4.x For newer compilers, this file is comparatively empty.
> 
> GCC 9.x is the oldest option available in current buildroot so I have
> switched to that.
> 
> I found a compiler-gcc5.h in kernel 4.1, newer kernels do not have any
> numbered files of this type at all. I downloaded this one and
> symlinked it as compiler-gcc9.h and it looks like this got me past
> this error.
> 
> However, now I have a new missing file error, and I can't seem to
> locate a suitable candidate:
> 
> In file included from
> /home/danj/buildroot-2022.02/output/build/linux-custom/arch/arm/include/asm/system.h:165,
>                  from
> /home/danj/buildroot-2022.02/output/build/linux-custom/arch/arm/include/asm/bitops.h:27,
>                  from include/linux/bitops.h:22,
>                  from include/linux/kernel.h:17,
>                  from include/linux/sched.h:55,
>                  from arch/arm/kernel/asm-offsets.c:13:
> /home/danj/buildroot-2022.02/output/build/linux-custom/arch/arm/include/asm/memory.h:19:10:
> fatal error: mach/memory.h: No such file or directory
>    19 | #include <mach/memory.h>
>       |          ^~~~~~~~~~~~~~~
> compilation terminated.
> /home/danj/buildroot-2022.02/output/build/linux-custom/./Kbuild:81:
> recipe for target 'arch/arm/kernel/asm-offsets.s' failed
> make[3]: *** [arch/arm/kernel/asm-offsets.s] Error 1
> Makefile:1009: recipe for target 'prepare0' failed
> make[2]: *** [prepare0] Error 2
> make[2]: *** Waiting for unfinished jobs....
>   HOSTCC  scripts/mod/modpost.o
>   HOSTCC  scripts/mod/sumversion.o
>   HOSTLD  scripts/mod/modpost
> make[2]: *** wait: No child processes. Stop.
> package/pkg-generic.mk:289: recipe for target
> '/home/danj/buildroot-2022.02/output/build/linux-custom/.stamp_built'
> failed
> make[1]: ***
> [/home/danj/buildroot-2022.02/output/build/linux-custom/.stamp_built]
> Error 2
> Makefile:84: recipe for target '_all' failed
> make: *** [_all] Error 2

This seems not to be the defconfig from above? It now uses linux-custom 
... The failure may be due to the default kernel configuration. Try to 
configure the correct one and see if you get further.

> I think maybe I am still doing something wrong because it sure seems
> to be compiling a lot of stuff instead of letting me configure things.

It gets better once everything necessary is built.

>> 
>> >>
>> >> Copy usbcore.ko from Buildroot target/lib/modules/{kernel-version}/
>> >> to the corresponding location on your device and load the driver with
>> >> modprobe.
>> >>
>> >> Depending on which functionality (e.g. USB_STORAGE) you want on your
>> >> USB port, additional configurations changes may be necessary.
>> >
>> > Yes, USB storage functionality is what I would like to add back in.
>> > Incidentally, this is a newer router than the one I was experimenting
>> > with before; this one has a Puma 6 CPU. Though, oddly I found it
>> > necessary to select an armv5 CPU type in buildroot in order to get
>> > binaries that work, despite /proc/cpuinfo on the device claiming it is
>> > armv6.
>> >
>> >>
>> >> Kind regards,
>> >> Andreas
>> >>
>> >> > This time I successfully managed to build other binaries (e.g.
>> >> > dropbear, busybox) which run OK on the device.
>> >> >
>> >> > Thanks,
>> >> > Dan Jackson.
>> >> > -------------- next part -------------- An HTML attachment was
>> >> > scrubbed...
>> >> > URL:
>> >> > <http://lists.buildroot.org/pipermail/buildroot/attachments/2022032
>> >> > 9/4
>> >> > 3c49a2d/attachment.html>
>> >>
>> >> [1]
>> >> https://sourceforge.net/projects/dg3270.arris/files/DG3270_9.1.103FB/
>> >> [2]
>> >>
>> https://buildroot.org/downloads/manual/manual.html#_advanced_usage,
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
