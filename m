Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B507BEB64D7
	for <buildroot@archiver.kernel.org>; Mon, 26 Jun 2023 20:23:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A2A660A6A;
	Mon, 26 Jun 2023 20:23:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A2A660A6A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fIYSZMcyb6Jw; Mon, 26 Jun 2023 20:23:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A42960A70;
	Mon, 26 Jun 2023 20:23:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A42960A70
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C59F41BF3A0
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 20:23:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9F424812BA
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 20:23:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F424812BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4qTUsyZR59s3 for <buildroot@lists.busybox.net>;
 Mon, 26 Jun 2023 20:23:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B863D812C2
 for <buildroot@uclibc.org>; Mon, 26 Jun 2023 20:23:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B863D812C2
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id A74F584AE9; Mon, 26 Jun 2023 20:23:52 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Mon, 26 Jun 2023 20:23:52 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jbglaw@lug-owl.de
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: FIXED
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-15658-163-6JKXITI4rm@https.bugs.busybox.net/>
In-Reply-To: <bug-15658-163@https.bugs.busybox.net/>
References: <bug-15658-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 15658] hifive_unleashed_defconfig: Linker errors
 in opensbi-0.9
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

https://bugs.busybox.net/show_bug.cgi?id=15658

--- Comment #7 from Jan-Benedict Glaw <jbglaw@lug-owl.de> ---
Now breaks in uboot:

[build 2023-06-26 20:19:23] /usr/bin/make -f ./scripts/Makefile.build
obj=scripts/dtc/pylibfdt
[build 2023-06-26 20:19:23]   cat scripts/dtc/pylibfdt/libfdt.i_shipped >
scripts/dtc/pylibfdt/libfdt.i
[build 2023-06-26 20:19:23]   unset CROSS_COMPILE; unset CFLAGS;
CC="/usr/bin/gcc -O2 -isystem
/var/lib/laminar/run/buildroot-hifive_unleashed_defconfig/7/buildroot/output/host/include"
LDSHARED="/usr/bin/gcc -O2 -isystem
/var/lib/laminar/run/buildroot-hifive_unleashed_defconfig/7/buildroot/output/host/include
-shared "
LDFLAGS="-L/var/lib/laminar/run/buildroot-hifive_unleashed_defconfig/7/buildroot/output/host/lib
-Wl,-rpath,/var/lib/laminar/run/buildroot-hifive_unleashed_defconfig/7/buildroot/output/host/lib"
VERSION="2023.04" CPPFLAGS="
-I/var/lib/laminar/run/buildroot-hifive_unleashed_defconfig/7/buildroot/output/build/uboot-2023.04/scripts/dtc/libfdt"
OBJDIR=scripts/dtc/pylibfdt
SOURCES="/var/lib/laminar/run/buildroot-hifive_unleashed_defconfig/7/buildroot/output/build/uboot-2023.04/scripts/dtc/libfdt/fdt.c
/var/lib/laminar/run/buildroot-hifive_unleashed_defconfig/7/buildroot/output/build/uboot-2023.04/scripts/dtc/libfdt/fdt_ro.c
/var/lib/laminar/run/buildroot-hifive_unleashed_defconfig/7/buildroot/output/build/uboot-2023.04/scripts/dtc/libfdt/fdt_wip.c
/var/lib/laminar/run/buildroot-hifive_unleashed_defconfig/7/buildroot/output/build/uboot-2023.04/scripts/dtc/libfdt/fdt_sw.c
/var/lib/laminar/run/buildroot-hifive_unleashed_defconfig/7/buildroot/output/build/uboot-2023.04/scripts/dtc/libfdt/fdt_rw.c
/var/lib/laminar/run/buildroot-hifive_unleashed_defconfig/7/buildroot/output/build/uboot-2023.04/scripts/dtc/libfdt/fdt_strerror.c
/var/lib/laminar/run/buildroot-hifive_unleashed_defconfig/7/buildroot/output/build/uboot-2023.04/scripts/dtc/libfdt/fdt_empty_tree.c
/var/lib/laminar/run/buildroot-hifive_unleashed_defconfig/7/buildroot/output/build/uboot-2023.04/scripts/dtc/libfdt/fdt_addresses.c
/var/lib/laminar/run/buildroot-hifive_unleashed_defconfig/7/buildroot/output/build/uboot-2023.04/scripts/dtc/libfdt/fdt_overlay.c
scripts/dtc/pylibfdt/libfdt.i"
SWIG_OPTS="-I/var/lib/laminar/run/buildroot-hifive_unleashed_defconfig/7/buildroot/output/build/uboot-2023.04/scripts/dtc/libfdt
-I/var/lib/laminar/run/buildroot-hifive_unleashed_defconfig/7/buildroot/output/build/uboot-2023.04/scripts/dtc/libfdt/.."
python3 scripts/dtc/pylibfdt/setup.py --quiet build_ext --inplace
[build 2023-06-26 20:19:23] Traceback (most recent call last):
[build 2023-06-26 20:19:23]   File
"/var/lib/laminar/run/buildroot-hifive_unleashed_defconfig/7/buildroot/output/build/uboot-2023.04/scripts/dtc/pylibfdt/setup.py",
line 23, in <module>
[build 2023-06-26 20:19:23]     from setuptools import setup, Extension
[build 2023-06-26 20:19:23] ModuleNotFoundError: No module named 'setuptools'
[build 2023-06-26 20:19:23] make[3]: *** [scripts/dtc/pylibfdt/Makefile:33:
rebuild] Error 1
[build 2023-06-26 20:19:23] make[2]: *** [scripts/Makefile.build:397:
scripts/dtc/pylibfdt] Error 2
[build 2023-06-26 20:19:23] make[1]: *** [Makefile:2003: scripts_dtc] Error 2
[build 2023-06-26 20:19:23] make[1]: Leaving directory
'/var/lib/laminar/run/buildroot-hifive_unleashed_defconfig/7/buildroot/output/build/uboot-2023.04'
[build 2023-06-26 20:19:23] make: *** [package/pkg-generic.mk:293:
/var/lib/laminar/run/buildroot-hifive_unleashed_defconfig/7/buildroot/output/build/uboot-2023.04/.stamp_built]
Error 2


I'm doing the CI builds in quite minimal Docker containers, with just the bare
minimum documented packages installed. Shall I add Python's setuptools? Or is
it a missing dependency? (Maybe I'd have put that into a new ticket?)

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
