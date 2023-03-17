Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6879C6FD1D
	for <buildroot@archiver.kernel.org>; Fri, 17 Mar 2023 17:12:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5AE5E61AF8;
	Fri, 17 Mar 2023 17:12:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5AE5E61AF8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gclnl40GJvkZ; Fri, 17 Mar 2023 17:12:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 647B261AED;
	Fri, 17 Mar 2023 17:12:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 647B261AED
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 472BB1BF3F0
 for <buildroot@lists.busybox.net>; Fri, 17 Mar 2023 17:12:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 21BE7400F6
 for <buildroot@lists.busybox.net>; Fri, 17 Mar 2023 17:12:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 21BE7400F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zce9Jj9dw88o for <buildroot@lists.busybox.net>;
 Fri, 17 Mar 2023 17:12:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 22D7440025
 for <buildroot@uclibc.org>; Fri, 17 Mar 2023 17:12:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 22D7440025
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 0E25C87501; Fri, 17 Mar 2023 17:12:26 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Fri, 17 Mar 2023 17:12:25 +0000
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
Message-ID: <bug-15446-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 15446] New: snps_arc700_axs101_defconfig;
 msort.c:200: Error: opcode 'dmb' not supported for target arc700
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

https://bugs.busybox.net/show_bug.cgi?id=15446

            Bug ID: 15446
           Summary: snps_arc700_axs101_defconfig; msort.c:200: Error:
                    opcode 'dmb' not supported for target arc700
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

While building the snps_arc700_axs101_defconfig sample configuration, the ARC
assembler is missing some option to choose a proper CPU, or the compiler
generates code for some other CPU variant:

[build 2023-03-16 13:30:45]
/var/lib/laminar/run/buildroot-snps_arc700_axs101_defconfig/1/buildroot/output/host/bin/arc-buildroot-linux-gnu-gcc
msort.c -c -std=gnu11 -fgnu89-inline  -Os -fno-
lto -Wall -Wwrite-strings -Wundef -fmerge-all-constants -frounding-math
-fno-stack-protector -fno-common -Wstrict-prototypes -Wold-style-definition
-fmath-errno    -fpie -fexceptions  -ftls-m
odel=initial-exec      -I../include
-I/var/lib/laminar/run/buildroot-snps_arc700_axs101_defconfig/1/buildroot/output/build/glibc-2.36-81-g4f4d7a13edfd2fdc57c9d76e1fd6d017fb47550c/build/stdlib
 
-I/var/lib/laminar/run/buildroot-snps_arc700_axs101_defconfig/1/buildroot/output/build/glibc-2.36-81-g4f4d7a13edfd2fdc57c9d76e1fd6d017fb47550c/build
 -I../sysdeps/unix/sysv/linux/arc  -I../
sysdeps/arc/nptl  -I../sysdeps/unix/sysv/linux/generic/wordsize-32 
-I../sysdeps/unix/sysv/linux/generic  -I../sysdeps/unix/sysv/linux/include
-I../sysdeps/unix/sysv/linux  -I../sysdeps/nptl 
 -I../sysdeps/pthread  -I../sysdeps/gnu  -I../sysdeps/unix/inet 
-I../sysdeps/unix/sysv  -I../sysdeps/unix  -I../sysdeps/posix 
-I../sysdeps/arc/nofpu  -I../sysdeps/ieee754/soft-fp  -I../sysd
eps/arc  -I../sysdeps/wordsize-32  -I../sysdeps/ieee754/flt-32 
-I../sysdeps/ieee754/dbl-64  -I../sysdeps/ieee754  -I../sysdeps/generic  -I..
-I../libio -I. -nostdinc -isystem /var/lib/lamina
r/run/buildroot-snps_arc700_axs101_defconfig/1/buildroot/output/host/lib/gcc/arc-buildroot-linux-gnu/10.2.0/include
-isystem /var/lib/laminar/run/buildroot-snps_arc700_axs101_defconfig/1/buil
droot/output/host/lib/gcc/arc-buildroot-linux-gnu/10.2.0/include-fixed -isystem
/var/lib/laminar/run/buildroot-snps_arc700_axs101_defconfig/1/buildroot/output/host/arc-buildroot-linux-gnu/sys
root/usr/include -D_LIBC_REENTRANT -include
/var/lib/laminar/run/buildroot-snps_arc700_axs101_defconfig/1/buildroot/output/build/glibc-2.36-81-g4f4d7a13edfd2fdc57c9d76e1fd6d017fb47550c/build/
libc-modules.h -DMODULE_NAME=libc -include ../include/libc-symbols.h  -DPIC    
-DTOP_NAMESPACE=glibc -o
/var/lib/laminar/run/buildroot-snps_arc700_axs101_defconfig/1/buildroot/output/build/g
libc-2.36-81-g4f4d7a13edfd2fdc57c9d76e1fd6d017fb47550c/build/stdlib/msort.o -MD
-MP -MF
/var/lib/laminar/run/buildroot-snps_arc700_axs101_defconfig/1/buildroot/output/build/glibc-2.36-81-g4f4
d7a13edfd2fdc57c9d76e1fd6d017fb47550c/build/stdlib/msort.o.dt -MT
/var/lib/laminar/run/buildroot-snps_arc700_axs101_defconfig/1/buildroot/output/build/glibc-2.36-81-g4f4d7a13edfd2fdc57c9d76e1
fd6d017fb47550c/build/stdlib/msort.o
[build 2023-03-16 13:30:46] msort.c: Assembler messages:
[build 2023-03-16 13:30:46] msort.c:200: Error: opcode 'dmb' not supported for
target arc700
[build 2023-03-16 13:30:46] make[3]: *** [../o-iterator.mk:9:
/var/lib/laminar/run/buildroot-snps_arc700_axs101_defconfig/1/buildroot/output/build/glibc-2.36-81-g4f4d7a13edfd2fdc57c9d76e1fd6d
017fb47550c/build/stdlib/msort.o] Error 1
[build 2023-03-16 13:30:46] make[3]: Leaving directory
'/var/lib/laminar/run/buildroot-snps_arc700_axs101_defconfig/1/buildroot/output/build/glibc-2.36-81-g4f4d7a13edfd2fdc57c9d76e1fd6d017fb47550c/stdlib'
[build 2023-03-16 13:30:46] make[2]: *** [Makefile:484: stdlib/subdir_lib]
Error 2
[build 2023-03-16 13:30:46] make[2]: Leaving directory
'/var/lib/laminar/run/buildroot-snps_arc700_axs101_defconfig/1/buildroot/output/build/glibc-2.36-81-g4f4d7a13edfd2fdc57c9d76e1fd6d017fb47550c'
[build 2023-03-16 13:30:46] make[1]: *** [Makefile:9: all] Error 2
[build 2023-03-16 13:30:46] make[1]: Leaving directory
'/var/lib/laminar/run/buildroot-snps_arc700_axs101_defconfig/1/buildroot/output/build/glibc-2.36-81-g4f4d7a13edfd2fdc57c9d76e1fd6d017fb47550c/build'
[build 2023-03-16 13:30:46] make: *** [package/pkg-generic.mk:293:
/var/lib/laminar/run/buildroot-snps_arc700_axs101_defconfig/1/buildroot/output/build/glibc-2.36-81-g4f4d7a13edfd2fdc57c9d76e1fd6d017fb47550c/.stamp_built]
Error 2


Full build log at
http://toolchain.lug-owl.de/laminar/log/buildroot-snps_arc700_axs101_defconfig/1

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
