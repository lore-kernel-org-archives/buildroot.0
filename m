Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64AF1C43334
	for <buildroot@archiver.kernel.org>; Mon, 20 Jun 2022 09:03:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EB67440AD7;
	Mon, 20 Jun 2022 09:03:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB67440AD7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gJZTXi1cBNoU; Mon, 20 Jun 2022 09:03:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E316D40AD0;
	Mon, 20 Jun 2022 09:03:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E316D40AD0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ED7681BF2E5
 for <buildroot@lists.busybox.net>; Mon, 20 Jun 2022 09:03:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C842682C4D
 for <buildroot@lists.busybox.net>; Mon, 20 Jun 2022 09:03:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C842682C4D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ubAKO3vDYrK9 for <buildroot@lists.busybox.net>;
 Mon, 20 Jun 2022 09:03:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CF59382BBA
 for <buildroot@uclibc.org>; Mon, 20 Jun 2022 09:03:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF59382BBA
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id EDC8E872EF; Mon, 20 Jun 2022 08:50:39 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Mon, 20 Jun 2022 09:03:00 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2022.05
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ian_ormshaw@waters.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone attachments.created
Message-ID: <bug-14856-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 14856] New: nvidia-driver package fails to build
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://bugs.busybox.net/show_bug.cgi?id=14856

            Bug ID: 14856
           Summary: nvidia-driver package fails to build
           Product: buildroot
           Version: 2022.05
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: ian_ormshaw@waters.com
                CC: buildroot@uclibc.org
  Target Milestone: ---

Created attachment 9326
  --> https://bugs.busybox.net/attachment.cgi?id=9326&action=edit
config files

I an trying to build a system with kernel 5.15.44-rt46 to use openCl on an
nvidia graphics card.  If I enable Target packages->Hardware
handling->nvidia-driver I get the following build error:

>>> linux 5.15.44 Installing to images directory
/usr/bin/install -m 0644 -D
/home/ian/build/amst-hiwire-linux-8009b251-x86_64/buildroot/build/linux-5.15.44/arch/x86/boot/bzImage
/home/ian/build/amst-hiwire-linux-8009b251-x86_64/buildroot/images/bzImage
touch
/home/ian/build/amst-hiwire-linux-8009b251-x86_64/buildroot/build/linux-5.15.44/.stamp_images_installed
touch
/home/ian/build/amst-hiwire-linux-8009b251-x86_64/buildroot/build/linux-5.15.44/.stamp_installed
>>> nvidia-driver 390.132 Building
>>> nvidia-driver 390.132 Building kernel module(s)
PATH="/home/ian/build/amst-hiwire-linux-8009b251-x86_64/buildroot/host/bin:/home/ian/build/amst-hiwire-linux-8009b251-x86_64/buildroot/host/sbin:/usr/lib64/ccache:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/home/ian/bin"
PKG_CONFIG="/home/ian/build/amst-hiwire-linux-8009b251-x86_64/buildroot/host/bin/pkg-config"
PKG_CONFIG_SYSROOT_DIR="/" PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1
PKG_CONFIG_ALLOW_SYSTEM_LIBS=1
PKG_CONFIG_LIBDIR="/home/ian/build/amst-hiwire-linux-8009b251-x86_64/buildroot/host/lib/pkgconfig:/home/ian/build/amst-hiwire-linux-8009b251-x86_64/buildroot/host/share/pkgconfig"
BR_BINARIES_DIR=/home/ian/build/amst-hiwire-linux-8009b251-x86_64/buildroot/images
KCFLAGS=-Wno-attribute-alias /usr/bin/make -j17 -C
/home/ian/build/amst-hiwire-linux-8009b251-x86_64/buildroot/build/linux-5.15.44
HOSTCC="/home/ian/build/amst-hiwire-linux-8009b251-x86_64/buildroot/host/bin/ccache
/usr/lib64/ccache/gcc -O2
-I/home/ian/build/amst-hiwire-linux-8009b251-x86_64/buildroot/host/include
-L/home/ian/build/amst-hiwire-linux-8009b251-x86_64/buildroot/host/lib
-Wl,-rpath,/home/ian/build/amst-hiwire-linux-8009b251-x86_64/buildroot/host/lib"
ARCH=x86_64
INSTALL_MOD_PATH=/home/ian/build/amst-hiwire-linux-8009b251-x86_64/buildroot/target
CROSS_COMPILE="/home/ian/build/amst-hiwire-linux-8009b251-x86_64/buildroot/host/bin/x86_64-WatersAMST-linux-gnu-"
WERROR=0
DEPMOD=/home/ian/build/amst-hiwire-linux-8009b251-x86_64/buildroot/host/sbin/depmod
NV_KERNEL_SOURCES="/home/ian/build/amst-hiwire-linux-8009b251-x86_64/buildroot/build/linux-5.15.44"
NV_KERNEL_OUTPUT="/home/ian/build/amst-hiwire-linux-8009b251-x86_64/buildroot/build/linux-5.15.44"
NV_KERNEL_MODULES="nvidia nvidia-modeset nvidia-drm nvidia-uvm"
PWD=/home/ian/build/amst-hiwire-linux-8009b251-x86_64/buildroot/build/nvidia-driver-390.132/kernel
M=/home/ian/build/amst-hiwire-linux-8009b251-x86_64/buildroot/build/nvidia-driver-390.132/kernel
modules
make[2]: Entering directory
'/home/ian/build/amst-hiwire-linux-8009b251-x86_64/buildroot/build/linux-5.15.44'
test -e include/generated/autoconf.h -a -e include/config/auto.conf || (       
        \
echo >&2;                                                       \
echo >&2 "  ERROR: Kernel configuration is invalid.";           \
echo >&2 "         include/generated/autoconf.h or include/config/auto.conf are
missing.";\
echo >&2 "         Run 'make oldconfig && make prepare' on kernel src to fix
it.";      \
echo >&2 ;                                                      \
/bin/false)
/usr/bin/make -f ./scripts/Makefile.build
obj=/home/ian/build/amst-hiwire-linux-8009b251-x86_64/buildroot/build/nvidia-driver-390.132/kernel
\
single-build= \
need-builtin=1 need-modorder=1

Compiler version check failed:

The major and minor number of the compiler used to
compile the kernel:

x86_64-WatersAMST-linux-gnu-gcc.br_real (Buildroot 2022.05) 9.4.0, GNU ld (GNU
Binutils) 2.37

does not match the compiler used here:

x86_64-WatersAMST-linux-gnu-gcc.br_real (Buildroot 2022.05) 9.4.0
Copyright (C) 2019 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.


It is recommended to set the CC environment variable
to the compiler that was used to compile the kernel.

The compiler version check can be disabled by setting
the IGNORE_CC_MISMATCH environment variable to "1".
However, mixing compiler versions between the kernel
and kernel modules can result in subtle bugs that are
difficult to diagnose.

*** Failed CC version check. Bailing out! ***

make[3]: ***
[/home/ian/build/amst-hiwire-linux-8009b251-x86_64/buildroot/build/nvidia-driver-390.132/kernel/Kbuild:189:
cc_version_check] Error 1
make[3]: *** Waiting for unfinished jobs....
make[2]: *** [Makefile:1868:
/home/ian/build/amst-hiwire-linux-8009b251-x86_64/buildroot/build/nvidia-driver-390.132/kernel]
Error 2
make[2]: Leaving directory
'/home/ian/build/amst-hiwire-linux-8009b251-x86_64/buildroot/build/linux-5.15.44'
make[1]: *** [package/pkg-generic.mk:294:
/home/ian/build/amst-hiwire-linux-8009b251-x86_64/buildroot/build/nvidia-driver-390.132/.stamp_built]
Error 2
make[1]: Leaving directory
'/home/ian/projects/amst-hiwire-linux/source/buildroot'
make: *** [Makefile:616: buildroot] Error 2

My development system is Fedora 36 GNU/Linux 5.18.5-200.fc36.x86_64

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
