Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FF91C74A5B
	for <buildroot@archiver.kernel.org>; Fri, 17 Mar 2023 18:38:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04B1761782;
	Fri, 17 Mar 2023 18:38:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 04B1761782
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OtdAlFAx3KxD; Fri, 17 Mar 2023 18:38:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05A6561787;
	Fri, 17 Mar 2023 18:37:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 05A6561787
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A61301BF421
 for <buildroot@lists.busybox.net>; Fri, 17 Mar 2023 18:37:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7EFCB416D8
 for <buildroot@lists.busybox.net>; Fri, 17 Mar 2023 18:37:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7EFCB416D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 66txPuMvDHMG for <buildroot@lists.busybox.net>;
 Fri, 17 Mar 2023 18:37:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7053A416CA
 for <buildroot@uclibc.org>; Fri, 17 Mar 2023 18:37:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7053A416CA
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 5F406874D1; Fri, 17 Mar 2023 18:37:55 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Fri, 17 Mar 2023 18:37:54 +0000
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
Message-ID: <bug-15451-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 15451] New: pcengines_apu2_defconfig: possibly
 truncated output in
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

https://bugs.busybox.net/show_bug.cgi?id=15451

            Bug ID: 15451
           Summary: pcengines_apu2_defconfig: possibly truncated output in
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

Linux's ./tools/objtool (of the used kernel version) fails to build:

[build 2023-03-15 16:08:35]   /usr/bin/gcc -O2
-I/var/lib/laminar/run/buildroot-pcengines_apu2_defconfig/1/buildroot/output/host/include
-L/var/lib/laminar/run/buildroot-pcengines_apu2_defcon
fig/1/buildroot/output/host/lib
-Wl,-rpath,/var/lib/laminar/run/buildroot-pcengines_apu2_defconfig/1/buildroot/output/host/lib
-Wp,-MD,/var/lib/laminar/run/buildroot-pcengines_apu2_defconfig/
1/buildroot/output/build/linux-5.16/tools/objtool/.check.o.d
-Wp,-MT,/var/lib/laminar/run/buildroot-pcengines_apu2_defconfig/1/buildroot/output/build/linux-5.16/tools/objtool/check.o
-Werror 
-Wbad-function-cast -Wdeclaration-after-statement -Wformat-security
-Wformat-y2k -Winit-self -Wmissing-declarations -Wmissing-prototypes
-Wnested-externs -Wno-system-headers -Wold-style-defin
ition -Wpacked -Wredundant-decls -Wstrict-prototypes -Wswitch-default
-Wswitch-enum -Wundef -Wwrite-strings -Wformat -Wno-type-limits
-Wstrict-aliasing=3 -Wshadow -Wno-switch-default -Wno-swi
tch-enum -Wno-packed -Wno-nested-externs -Wall -Wmissing-prototypes
-Wstrict-prototypes -O2 -fomit-frame-pointer -std=gnu89 -g
-I/var/lib/laminar/run/buildroot-pcengines_apu2_defconfig/1/buil
droot/output/build/linux-5.16/tools/include
-I/var/lib/laminar/run/buildroot-pcengines_apu2_defconfig/1/buildroot/output/build/linux-5.16/tools/arch/x86/include/uapi
-I/var/lib/laminar/run/bu
ildroot-pcengines_apu2_defconfig/1/buildroot/output/build/linux-5.16/tools/arch/x86/include
-I/var/lib/laminar/run/buildroot-pcengines_apu2_defconfig/1/buildroot/output/build/linux-5.16/tools
/objtool/include
-I/var/lib/laminar/run/buildroot-pcengines_apu2_defconfig/1/buildroot/output/build/linux-5.16/tools/objtool/arch/x86/include
-I/var/lib/laminar/run/buildroot-pcengines_apu2_defconfig/1/buildroot/output/host/include
-I/var/lib/laminar/run/buildroot-pcengines_apu2_defconfig/1/buildroot/output/build/linux-5.16/tools/lib
-D"BUILD_STR(s)=#s" -c -o
/var/lib/laminar/run/buildroot-pcengines_apu2_defconfig/1/buildroot/output/build/linux-5.16/tools/objtool/check.o
check.c
[build 2023-03-15 16:08:36] check.c: In function 'validate_call':
[build 2023-03-15 16:08:36] check.c:2836:58: error: '%d' directive output may
be truncated writing between 1 and 10 bytes into a region of size 9
[-Werror=format-truncation=]
[build 2023-03-15 16:08:36]  2836 |                 snprintf(pvname,
sizeof(pvname), "pv_ops[%d]", idx);
[build 2023-03-15 16:08:36]       |                                            
             ^~
[build 2023-03-15 16:08:36] In function 'call_dest_name',
[build 2023-03-15 16:08:36]     inlined from 'call_dest_name' at
check.c:2824:27,
[build 2023-03-15 16:08:36]     inlined from 'validate_call' at check.c:2908:3:
[build 2023-03-15 16:08:36] check.c:2836:50: note: directive argument in the
range [-268435456, 268435455]
[build 2023-03-15 16:08:36]  2836 |                 snprintf(pvname,
sizeof(pvname), "pv_ops[%d]", idx);
[build 2023-03-15 16:08:36]       |                                            
     ^~~~~~~~~~~~
[build 2023-03-15 16:08:36] check.c:2836:17: note: 'snprintf' output between 10
and 19 bytes into a destination of size 16
[build 2023-03-15 16:08:36]  2836 |                 snprintf(pvname,
sizeof(pvname), "pv_ops[%d]", idx);
[build 2023-03-15 16:08:36]       |                
^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
[build 2023-03-15 16:08:36] check.c: In function 'validate_call':
[build 2023-03-15 16:08:36] check.c:2836:58: error: '%d' directive output may
be truncated writing between 1 and 10 bytes into a region of size 9
[-Werror=format-truncation=]
[build 2023-03-15 16:08:36]  2836 |                 snprintf(pvname,
sizeof(pvname), "pv_ops[%d]", idx);
[build 2023-03-15 16:08:36]       |                                            
             ^~
[build 2023-03-15 16:08:36] In function 'call_dest_name',
[build 2023-03-15 16:08:36]     inlined from 'call_dest_name' at
check.c:2824:27,
[build 2023-03-15 16:08:36]     inlined from 'validate_call' at check.c:2920:3:
[build 2023-03-15 16:08:36] check.c:2836:50: note: directive argument in the
range [-268435456, 268435455]
[build 2023-03-15 16:08:36]  2836 |                 snprintf(pvname,
sizeof(pvname), "pv_ops[%d]", idx);
[build 2023-03-15 16:08:36]       |                                            
     ^~~~~~~~~~~~
[build 2023-03-15 16:08:36] check.c:2836:17: note: 'snprintf' output between 10
and 19 bytes into a destination of size 16
[build 2023-03-15 16:08:36]  2836 |                 snprintf(pvname,
sizeof(pvname), "pv_ops[%d]", idx);
[build 2023-03-15 16:08:36]       |                
^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
[build 2023-03-15 16:08:36] check.c: In function 'validate_call':
[build 2023-03-15 16:08:36] check.c:2836:58: error: '%d' directive output may
be truncated writing between 1 and 10 bytes into a region of size 9
[-Werror=format-truncation=]
[build 2023-03-15 16:08:36]  2836 |                 snprintf(pvname,
sizeof(pvname), "pv_ops[%d]", idx);
[build 2023-03-15 16:08:36]       |                                            
             ^~
[build 2023-03-15 16:08:36] In function 'call_dest_name',
[build 2023-03-15 16:08:36]     inlined from 'call_dest_name' at
check.c:2824:27,
[build 2023-03-15 16:08:36]     inlined from 'validate_call' at check.c:2914:3:
[build 2023-03-15 16:08:36] check.c:2836:50: note: directive argument in the
range [-268435456, 268435455]
[build 2023-03-15 16:08:36]  2836 |                 snprintf(pvname,
sizeof(pvname), "pv_ops[%d]", idx);
[build 2023-03-15 16:08:36]       |                                            
     ^~~~~~~~~~~~
[build 2023-03-15 16:08:36] check.c:2836:17: note: 'snprintf' output between 10
and 19 bytes into a destination of size 16
[build 2023-03-15 16:08:36]  2836 |                 snprintf(pvname,
sizeof(pvname), "pv_ops[%d]", idx);
[build 2023-03-15 16:08:36]       |                
^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
[build 2023-03-15 16:08:38] cc1: all warnings being treated as errors
[build 2023-03-15 16:08:38] make[4]: ***
[/var/lib/laminar/run/buildroot-pcengines_apu2_defconfig/1/buildroot/output/build/linux-5.16/tools/build/Makefile.build:97:
/var/lib/laminar/run/buildroot-pcengines_apu2_defconfig/1/buildroot/output/build/linux-5.16/tools/objtool/check.o]
Error 1
[build 2023-03-15 16:08:38] make[3]: *** [Makefile:56:
/var/lib/laminar/run/buildroot-pcengines_apu2_defconfig/1/buildroot/output/build/linux-5.16/tools/objtool/objtool-in.o]
Error 2
[build 2023-03-15 16:08:38] make[2]: *** [Makefile:69: objtool] Error 2
[build 2023-03-15 16:08:38] make[1]: *** [Makefile:1349: tools/objtool] Error 2
[build 2023-03-15 16:08:38] make[1]: Leaving directory
'/var/lib/laminar/run/buildroot-pcengines_apu2_defconfig/1/buildroot/output/build/linux-5.16'
[build 2023-03-15 16:08:38] make: *** [package/pkg-generic.mk:293:
/var/lib/laminar/run/buildroot-pcengines_apu2_defconfig/1/buildroot/output/build/linux-5.16/.stamp_built]
Error 2


I guess that g:82880283d7fcd0a1d20964a56d6d1a5cc0df0713 (upstream Linux tree)
would be a proper fix.

Full build log at
http://toolchain.lug-owl.de/laminar/log/buildroot-pcengines_apu2_defconfig/1

(This is the last ticket. All other configurations were built successfully!)

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
