Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1804DC6FD1D
	for <buildroot@archiver.kernel.org>; Fri, 17 Mar 2023 16:46:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9AE2761AF7;
	Fri, 17 Mar 2023 16:46:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9AE2761AF7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AoVNCiVJLxWD; Fri, 17 Mar 2023 16:46:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CAC2A61AF4;
	Fri, 17 Mar 2023 16:46:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CAC2A61AF4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5F7641BF33E
 for <buildroot@lists.busybox.net>; Fri, 17 Mar 2023 16:46:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 45919822D7
 for <buildroot@lists.busybox.net>; Fri, 17 Mar 2023 16:46:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 45919822D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e-i0d5u_BMYt for <buildroot@lists.busybox.net>;
 Fri, 17 Mar 2023 16:46:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 60A9F822C5
 for <buildroot@uclibc.org>; Fri, 17 Mar 2023 16:46:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 60A9F822C5
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 5127B85D3F; Fri, 17 Mar 2023 16:46:32 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Fri, 17 Mar 2023 16:46:31 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jbglaw@lug-owl.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone
Message-ID: <bug-15416-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 15416] New: u-boot may need swig for some
 configurations
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

https://bugs.busybox.net/show_bug.cgi?id=15416

            Bug ID: 15416
           Summary: u-boot may need swig for some configurations
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: jbglaw@lug-owl.de
                CC: buildroot@uclibc.org
  Target Milestone: ---

Hi!

I found four configurations (nitrogen8mp_defconfig, nitrogen8mn_defconfig,
nitrogen8mm_defconfig, nitrogen8m_defconfig) that all require `swig` to build:

[build 2023-03-15 04:55:01] /usr/bin/make -f ./scripts/Makefile.build
obj=scripts/dtc/pylibfdt
[build 2023-03-15 04:55:01]   cat scripts/dtc/pylibfdt/libfdt.i_shipped >
scripts/dtc/pylibfdt/libfdt.i
[build 2023-03-15 04:55:01]   unset CROSS_COMPILE; unset CFLAGS;
CC="/usr/bin/gcc -O2 -isystem
/var/lib/laminar/run/buildroot-nitrogen8m_defconfig/1/buildroot/output/host/include"
LDSHARED="/usr/bin/gcc -O2 -isystem
/var/lib/laminar/run/buildroot-nitrogen8m_defconfig/1/buildroot/output/host/include
-shared "
LDFLAGS="-L/var/lib/laminar/run/buildroot-nitrogen8m_defconfig/1/buildroot/output/host/lib
-Wl,-rpath,/var/lib/laminar/run/buildroot-nitrogen8m_defconfig/1/buildroot/output/host/lib"
VERSION="u-boot-2022.04" CPPFLAGS="
-I/var/lib/laminar/run/buildroot-nitrogen8m_defconfig/1/buildroot/output/build/uboot-custom/scripts/dtc/libfdt"
OBJDIR=scripts/dtc/pylibfdt
SOURCES="/var/lib/laminar/run/buildroot-nitrogen8m_defconfig/1/buildroot/output/build/uboot-custom/scripts/dtc/libfdt/fdt.c
/var/lib/laminar/run/buildroot-nitrogen8m_defconfig/1/buildroot/output/build/uboot-custom/scripts/dtc/libfdt/fdt_ro.c
/var/lib/laminar/run/buildroot-nitrogen8m_defconfig/1/buildroot/output/build/uboot-custom/scripts/dtc/libfdt/fdt_wip.c
/var/lib/laminar/run/buildroot-nitrogen8m_defconfig/1/buildroot/output/build/uboot-custom/scripts/dtc/libfdt/fdt_sw.c
/var/lib/laminar/run/buildroot-nitrogen8m_defconfig/1/buildroot/output/build/uboot-custom/scripts/dtc/libfdt/fdt_rw.c
/var/lib/laminar/run/buildroot-nitrogen8m_defconfig/1/buildroot/output/build/uboot-custom/scripts/dtc/libfdt/fdt_strerror.c
/var/lib/laminar/run/buildroot-nitrogen8m_defconfig/1/buildroot/output/build/uboot-custom/scripts/dtc/libfdt/fdt_empty_tree.c
/var/lib/laminar/run/buildroot-nitrogen8m_defconfig/1/buildroot/output/build/uboot-custom/scripts/dtc/libfdt/fdt_addresses.c
/var/lib/laminar/run/buildroot-nitrogen8m_defconfig/1/buildroot/output/build/uboot-custom/scripts/dtc/libfdt/fdt_overlay.c
scripts/dtc/pylibfdt/libfdt.i"
SWIG_OPTS="-I/var/lib/laminar/run/buildroot-nitrogen8m_defconfig/1/buildroot/output/build/uboot-custom/scripts/dtc/libfdt
-I/var/lib/laminar/run/buildroot-nitrogen8m_defconfig/1/buildroot/output/build/uboot-custom/scripts/dtc/libfdt/.."
python3 scripts/dtc/pylibfdt/setup.py --quiet build_ext --inplace
[build 2023-03-15 04:55:01]
/var/lib/laminar/run/buildroot-nitrogen8m_defconfig/1/buildroot/output/build/uboot-custom/scripts/dtc/pylibfdt/setup.py:21:
DeprecationWarning: The distutils package is deprecated and slated for removal
in Python 3.12. Use setuptools or check PEP 632 for potential alternatives
[build 2023-03-15 04:55:01]   from distutils.core import setup, Extension
[build 2023-03-15 04:55:01] error: command 'swig' failed: No such file or
directory
[build 2023-03-15 04:55:01] make[3]: *** [scripts/dtc/pylibfdt/Makefile:30:
rebuild] Error 1
[build 2023-03-15 04:55:01] make[2]: *** [scripts/Makefile.build:394:
scripts/dtc/pylibfdt] Error 2
[build 2023-03-15 04:55:01] make[1]: *** [Makefile:2093: scripts_dtc] Error 2
[build 2023-03-15 04:55:01] make[1]: Leaving directory
'/var/lib/laminar/run/buildroot-nitrogen8m_defconfig/1/buildroot/output/build/uboot-custom'
[build 2023-03-15 04:55:01] make: *** [package/pkg-generic.mk:293:
/var/lib/laminar/run/buildroot-nitrogen8m_defconfig/1/buildroot/output/build/uboot-custom/.stamp_built]
Error 2


Full build logs at:
http://toolchain.lug-owl.de/laminar/log/buildroot-nitrogen8m_defconfig/1
http://toolchain.lug-owl.de/laminar/log/buildroot-nitrogen8mm_defconfig/1
http://toolchain.lug-owl.de/laminar/log/buildroot-nitrogen8mn_defconfig/1
http://toolchain.lug-owl.de/laminar/log/buildroot-nitrogen8mp_defconfig/1

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
