Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 775D2C77B7C
	for <buildroot@archiver.kernel.org>; Sun, 21 May 2023 19:55:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 01A0860FCB;
	Sun, 21 May 2023 19:55:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 01A0860FCB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uz1CrZBvSrTe; Sun, 21 May 2023 19:55:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1513C60A62;
	Sun, 21 May 2023 19:55:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1513C60A62
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A27F61BF3C1
 for <buildroot@lists.busybox.net>; Sun, 21 May 2023 19:54:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 726F541604
 for <buildroot@lists.busybox.net>; Sun, 21 May 2023 19:54:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 726F541604
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dd-G1QlVLshO for <buildroot@lists.busybox.net>;
 Sun, 21 May 2023 19:54:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3D8AD415E0
 for <buildroot@uclibc.org>; Sun, 21 May 2023 19:54:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D8AD415E0
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 2A28683984; Sun, 21 May 2023 19:54:58 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Sun, 21 May 2023 19:54:57 +0000
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
Message-ID: <bug-15586-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 15586] New: pc_x86_64_bios_defconfig: Does not
 build Linux kernel due to missing header file
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

https://bugs.busybox.net/show_bug.cgi?id=15586

            Bug ID: 15586
           Summary: pc_x86_64_bios_defconfig: Does not build Linux kernel
                    due to missing header file
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

[build 2023-05-21 14:43:31]   /usr/bin/gcc -O2 -isystem
/var/lib/laminar/run/buildroot-pc_x86_64_bios_defconfig/5/buildroot/output/host/include
-L/var/lib/laminar/run/buildroot-pc_x86_64_bios_defconfig/5/buildroot/output/host/lib
-Wl,-rpath,/var/lib/laminar/run/buildroot-pc_x86_64_bios_defconfig/5/buildroot/output/host/lib
-Wp,-MD,/var/lib/laminar/run/buildroot-pc_x86_64_bios_defconfig/5/buildroot/output/build/linux-6.1.24/tools/objtool/arch/x86/.special.o.d
-Wp,-MT,/var/lib/laminar/run/buildroot-pc_x86_64_bios_defconfig/5/buildroot/output/build/linux-6.1.24/tools/objtool/arch/x86/special.o
-Werror -Wbad-function-cast -Wdeclaration-after-statement -Wformat-security
-Wformat-y2k -Winit-self -Wmissing-declarations -Wmissing-prototypes
-Wnested-externs -Wno-system-headers -Wold-style-definition -Wpacked
-Wredundant-decls -Wstrict-prototypes -Wswitch-default -Wswitch-enum -Wundef
-Wwrite-strings -Wformat -Wno-type-limits -Wstrict-aliasing=3 -Wshadow
-Wno-switch-default -Wno-switch-enum -Wno-packed -Wno-nested-externs -Wall
-Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer -std=gnu11
-Wdeclaration-after-statement -g
-I/var/lib/laminar/run/buildroot-pc_x86_64_bios_defconfig/5/buildroot/output/build/linux-6.1.24/tools/include
-I/var/lib/laminar/run/buildroot-pc_x86_64_bios_defconfig/5/buildroot/output/build/linux-6.1.24/tools/arch/x86/include/uapi
-I/var/lib/laminar/run/buildroot-pc_x86_64_bios_defconfig/5/buildroot/output/build/linux-6.1.24/tools/arch/x86/include
-I/var/lib/laminar/run/buildroot-pc_x86_64_bios_defconfig/5/buildroot/output/build/linux-6.1.24/tools/objtool/include
-I/var/lib/laminar/run/buildroot-pc_x86_64_bios_defconfig/5/buildroot/output/build/linux-6.1.24/tools/objtool/arch/x86/include
-DLIBELF_USE_DEPRECATED
-I/var/lib/laminar/run/buildroot-pc_x86_64_bios_defconfig/5/buildroot/output/build/linux-6.1.24/tools/lib
-D"BUILD_STR(s)=#s" -c -o
/var/lib/laminar/run/buildroot-pc_x86_64_bios_defconfig/5/buildroot/output/build/linux-6.1.24/tools/objtool/arch/x86/special.o
arch/x86/special.c
[build 2023-05-21 14:43:31] In file included from
/var/lib/laminar/run/buildroot-pc_x86_64_bios_defconfig/5/buildroot/output/build/linux-6.1.24/tools/objtool/include/objtool/objtool.h:13,
[build 2023-05-21 14:43:31]                  from
/var/lib/laminar/run/buildroot-pc_x86_64_bios_defconfig/5/buildroot/output/build/linux-6.1.24/tools/objtool/include/objtool/arch.h:11,
[build 2023-05-21 14:43:31]                  from
/var/lib/laminar/run/buildroot-pc_x86_64_bios_defconfig/5/buildroot/output/build/linux-6.1.24/tools/objtool/include/objtool/check.h:11,
[build 2023-05-21 14:43:31]                  from
/var/lib/laminar/run/buildroot-pc_x86_64_bios_defconfig/5/buildroot/output/build/linux-6.1.24/tools/objtool/include/objtool/special.h:10,
[build 2023-05-21 14:43:31]                  from arch/x86/special.c:4:
[build 2023-05-21 14:43:31]
/var/lib/laminar/run/buildroot-pc_x86_64_bios_defconfig/5/buildroot/output/build/linux-6.1.24/tools/objtool/include/objtool/elf.h:10:10:
fatal error: gelf.h: No such file or directory
[build 2023-05-21 14:43:31]    10 | #include <gelf.h>
[build 2023-05-21 14:43:31]       |          ^~~~~~~~
[build 2023-05-21 14:43:31] compilation terminated.
[build 2023-05-21 14:43:31] make[5]: ***
[/var/lib/laminar/run/buildroot-pc_x86_64_bios_defconfig/5/buildroot/output/build/linux-6.1.24/tools/build/Makefile.build:97:
/var/lib/laminar/run/buildroot-pc_x86_64_bios_defconfig/5/buildroot/output/build/linux-6.1.24/tools/objtool/arch/x86/special.o]
Error 1
[build 2023-05-21 14:43:31] make[4]: ***
[/var/lib/laminar/run/buildroot-pc_x86_64_bios_defconfig/5/buildroot/output/build/linux-6.1.24/tools/build/Makefile.build:139:
arch/x86] Error 2
[build 2023-05-21 14:43:31] make[3]: *** [Makefile:54:
/var/lib/laminar/run/buildroot-pc_x86_64_bios_defconfig/5/buildroot/output/build/linux-6.1.24/tools/objtool/objtool-in.o]
Error 2
[build 2023-05-21 14:43:31] make[2]: *** [Makefile:73: objtool] Error 2
[build 2023-05-21 14:43:31] make[1]: *** [Makefile:1442: tools/objtool] Error 2
[build 2023-05-21 14:43:31] make[1]: Leaving directory
'/var/lib/laminar/run/buildroot-pc_x86_64_bios_defconfig/5/buildroot/output/build/linux-6.1.24'
[build 2023-05-21 14:43:31] make: *** [package/pkg-generic.mk:293:
/var/lib/laminar/run/buildroot-pc_x86_64_bios_defconfig/5/buildroot/output/build/linux-6.1.24/.stamp_built]
Error 2

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
