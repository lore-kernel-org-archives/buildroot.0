Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5BCEC433EF
	for <buildroot@archiver.kernel.org>; Wed, 30 Mar 2022 07:13:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E16880E48;
	Wed, 30 Mar 2022 07:13:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H26uDISwAIZe; Wed, 30 Mar 2022 07:13:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7149580DB6;
	Wed, 30 Mar 2022 07:13:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9FCF51BF5E0
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 07:13:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8D1D840B3E
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 07:13:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jh88nx69aFVB for <buildroot@lists.busybox.net>;
 Wed, 30 Mar 2022 07:13:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D9FDB40C76
 for <buildroot@buildroot.org>; Wed, 30 Mar 2022 07:13:34 +0000 (UTC)
Received: from webmail.serv15.avernis.de (ip6-localhost [IPv6:::1])
 by serv15.avernis.de (Postfix) with ESMTPSA id 6A70CD8C4136;
 Wed, 30 Mar 2022 09:13:32 +0200 (CEST)
MIME-Version: 1.0
Date: Wed, 30 Mar 2022 07:13:32 +0000
From: Andreas Ziegler <br015@umbiko.net>
To: Dan Jackson <dan@thejacksons.uk>
In-Reply-To: <AM6PR02MB4884A6522909A9322C4C9E2EDA1E9@AM6PR02MB4884.eurprd02.prod.outlook.com>
References: <mailman.22068.1648533484.192135.buildroot@buildroot.org>
 <2854f91f1188e166bf02e3a6ab6249a4@umbiko.net>
 <AM6PR02MB48848F8B3F5238DF24891A59DA1E9@AM6PR02MB4884.eurprd02.prod.outlook.com>
 <0b1ebd93c431e1c06678303eaffd8a79@umbiko.net>
 <AM6PR02MB488490D703CC6DAD1FF356CFDA1E9@AM6PR02MB4884.eurprd02.prod.outlook.com>
 <54f87d03a99935fb452424992a81409c@umbiko.net>
 <AM6PR02MB4884A6522909A9322C4C9E2EDA1E9@AM6PR02MB4884.eurprd02.prod.outlook.com>
Message-ID: <35c2351b33bcb44d81333adfa848d221@umbiko.net>
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

Hi Dan,

cutting some old content.

On 2022-03-29 19:19, Dan Jackson wrote:

<cut>

>> > However, now I have a new missing file error, and I can't seem to
>> > locate a suitable candidate:
>> >
>> > In file included from
>> > /home/danj/buildroot-2022.02/output/build/linux-
>> custom/arch/arm/include/asm/system.h:165,
>> >                  from
>> > /home/danj/buildroot-2022.02/output/build/linux-
>> custom/arch/arm/include/asm/bitops.h:27,
>> >                  from include/linux/bitops.h:22,
>> >                  from include/linux/kernel.h:17,
>> >                  from include/linux/sched.h:55,
>> >                  from arch/arm/kernel/asm-offsets.c:13:
>> > /home/danj/buildroot-2022.02/output/build/linux-
>> custom/arch/arm/include/asm/memory.h:19:10:
>> > fatal error: mach/memory.h: No such file or directory
>> >    19 | #include <mach/memory.h>
>> >       |          ^~~~~~~~~~~~~~~
>> > compilation terminated.
>> > /home/danj/buildroot-2022.02/output/build/linux-custom/./Kbuild:81:
>> > recipe for target 'arch/arm/kernel/asm-offsets.s' failed
>> > make[3]: *** [arch/arm/kernel/asm-offsets.s] Error 1
>> > Makefile:1009: recipe for target 'prepare0' failed
>> > make[2]: *** [prepare0] Error 2
>> > make[2]: *** Waiting for unfinished jobs....
>> >   HOSTCC  scripts/mod/modpost.o
>> >   HOSTCC  scripts/mod/sumversion.o
>> >   HOSTLD  scripts/mod/modpost
>> > make[2]: *** wait: No child processes. Stop.
>> > package/pkg-generic.mk:289: recipe for target
>> > '/home/danj/buildroot-2022.02/output/build/linux-custom/.stamp_built'
>> > failed
>> > make[1]: ***
>> > [/home/danj/buildroot-2022.02/output/build/linux-custom/.stamp_built]
>> > Error 2
>> > Makefile:84: recipe for target '_all' failed
>> > make: *** [_all] Error 2
>> 
>> This seems not to be the defconfig from above? It now uses 
>> linux-custom ...
>> The failure may be due to the default kernel configuration. Try to 
>> configure
>> the correct one and see if you get further.
>> 
>> > I think maybe I am still doing something wrong because it sure seems
>> > to be compiling a lot of stuff instead of letting me configure things.
>> 
>> It gets better once everything necessary is built.
> 
> Still no luck I'm afraid. Same error with mach/memory.h as above.
> 
> Buildroot defconfig now looks like this:
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
> BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="/home/danj/DG3270_9.1.103FB/sourcecode/ti_linux/linux-2.6.39.3/src/.config"
> BR2_PACKAGE_DROPBEAR=y
> BR2_PACKAGE_DROPBEAR_LOCALOPTIONS_FILE="/home/danj/localoptions.h"
> BR2_PACKAGE_JOE=y
> 
> I forgot to mention this before but the buildroot manual page you
> mentioned said to create a local.mk file in order to use external
> source, this looks like this:
> 
> LINUX_OVERRIDE_SRCDIR =
> /home/danj/DG3270_9.1.103FB/sourcecode/ti_linux/linux-2.6.39.3/src/
> 
> For the kernel configuration I entered the kernel source dir and did
> "make menuconfig", I left everything at the defaults except for
> enabling the USB related items.
> 
> The resulting configuration file is attached as a text file.
> Unfortunately it's been literally decades since I last actually
> compiled a kernel, so I'm afraid I have no idea what bits would be
> suitable to disable/remove to get the results I want (I'm guessing
> this will be the most likely way to eliminate the error I'm getting?)

I did a compile test this morning, the Buildroot version was some early 
2022.02 version, not up-to-date.

You have a potential header mismatch, Select Toolchain -> Kernel Headers 
-> Same as kernel being built to use the vendor source also for the 
headers.

I could configure Linux with make menuconfig, did not encounter the 
missing memory.h error above, but the build stops during Linux kernel 
compilation with this error:

/tmp/ccSO8f6S.s: Assembler messages:
/tmp/ccSO8f6S.s:950: Error: .err encountered
make[3]: *** [scripts/Makefile.build:284: 
arch/arm/kernel/sys_oabi-compat.o] Error 1
make[2]: *** [Makefile:969: arch/arm/kernel] Error 2
make[1]: *** [package/pkg-generic.mk:292: 
/home/data/test/buildroot/output/build/linux-custom/.stamp_built] Error 
2
make: *** [Makefile:84: _all] Error 2

Full error log is here: https://pastebin.com/VrXqSVsD

You might now do some research:

https://stackoverflow.com/questions/61235299/gcc-8-3-arm-assembly-error-when-building-linux-kernel-3-14-17-in-buildroot-2020
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85745

or try to switch to an older compiler ...

--
Andreas

<cut>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
