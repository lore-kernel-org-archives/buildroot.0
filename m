Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1971CE7A89
	for <buildroot@archiver.kernel.org>; Sat, 23 Sep 2023 22:45:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A0B081EE9;
	Sat, 23 Sep 2023 22:45:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A0B081EE9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id spP52-rSC0MW; Sat, 23 Sep 2023 22:45:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9714881EFA;
	Sat, 23 Sep 2023 22:45:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9714881EFA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9A2181BF86C
 for <buildroot@lists.busybox.net>; Sat, 23 Sep 2023 22:45:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 79956417B6
 for <buildroot@lists.busybox.net>; Sat, 23 Sep 2023 22:45:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79956417B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id runZMw6QWk5e for <buildroot@lists.busybox.net>;
 Sat, 23 Sep 2023 22:45:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0E27C41751
 for <buildroot@uclibc.org>; Sat, 23 Sep 2023 22:45:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E27C41751
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id EC636872F6; Sat, 23 Sep 2023 22:45:31 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Sat, 23 Sep 2023 22:45:31 +0000
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
Message-ID: <bug-15799-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 15799] New: freescale_imx8mmevk_defconfig,
 freescale_imx8mnevk_defconfig, freescale_imx8mpevk_defconfig,
 freescale_imx8mqevk_defconfig: error: array subscript 0 is outside array
 bounds of 'uint32_t[0]'
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

https://bugs.busybox.net/show_bug.cgi?id=15799

            Bug ID: 15799
           Summary: freescale_imx8mmevk_defconfig,
                    freescale_imx8mnevk_defconfig,
                    freescale_imx8mpevk_defconfig,
                    freescale_imx8mqevk_defconfig: error: array subscript
                    0 is outside array bounds of 'uint32_t[0]'
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

For some freescale defconfigs (as of ab4f3fafaa839593b3efd9ea12c8ee5d9340cdeb),
we run into array bounds warnings (-> errors) in arm-trusted-firmware-custom:

[build 2023-09-23 17:51:47]   CC      plat/imx/imx8m/hab.c
[build 2023-09-23 17:51:47] plat/imx/imx8m/hab.c: In function
'imx_hab_handler':
[build 2023-09-23 17:51:47] plat/imx/imx8m/hab.c:65:57: error: array subscript
0 is outside array bounds of 'uint32_t[0]' {aka 'unsigned int[]'}
[-Werror=array-bounds]
[build 2023-09-23 17:51:47]    65 | #define HAB_RVT_CHECK_TARGET_ARM64     
((unsigned long)*(uint32_t *)(HAB_RVT_BASE + 0x18))
[build 2023-09-23 17:51:47]       |                                            
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
[build 2023-09-23 17:51:47] plat/imx/imx8m/hab.c:76:59: note: in expansion of
macro 'HAB_RVT_CHECK_TARGET_ARM64'
[build 2023-09-23 17:51:47]    76 | #define hab_rvt_check_target_p
((hab_rvt_check_target_t *)HAB_RVT_CHECK_TARGET_ARM64)
[build 2023-09-23 17:51:47]       |                                            
              ^~~~~~~~~~~~~~~~~~~~~~~~~~
[build 2023-09-23 17:51:47] plat/imx/imx8m/hab.c:114:40: note: in expansion of
macro 'hab_rvt_check_target_p'
[build 2023-09-23 17:51:47]   114 |                 hab_rvt_check_target =
hab_rvt_check_target_p;
[build 2023-09-23 17:51:47]       |                                       
^~~~~~~~~~~~~~~~~~~~~~
[build 2023-09-23 17:51:47] plat/imx/imx8m/hab.c:69:57: error: array subscript
0 is outside array bounds of 'uint32_t[0]' {aka 'unsigned int[]'}
[-Werror=array-bounds]
[build 2023-09-23 17:51:47]    69 | #define HAB_RVT_FAILSAFE_ARM64         
((unsigned long)*(uint32_t *)(HAB_RVT_BASE + 0x50))
[build 2023-09-23 17:51:47]       |                                            
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
[build 2023-09-23 17:51:47] plat/imx/imx8m/hab.c:77:51: note: in expansion of
macro 'HAB_RVT_FAILSAFE_ARM64'
[build 2023-09-23 17:51:47]    77 | #define hab_rvt_failsafe_p
((hab_rvt_failsafe_t *)HAB_RVT_FAILSAFE_ARM64)
[build 2023-09-23 17:51:47]       |                                            
      ^~~~~~~~~~~~~~~~~~~~~~
[build 2023-09-23 17:51:47] plat/imx/imx8m/hab.c:110:36: note: in expansion of
macro 'hab_rvt_failsafe_p'
[build 2023-09-23 17:51:47]   110 |                 hab_rvt_failsafe =
hab_rvt_failsafe_p;
[build 2023-09-23 17:51:47]       |                                   
^~~~~~~~~~~~~~~~~~
[build 2023-09-23 17:51:47] plat/imx/imx8m/hab.c:68:65: error: array subscript
0 is outside array bounds of 'uint32_t[0]' {aka 'unsigned int[]'}
[-Werror=array-bounds]
[build 2023-09-23 17:51:47]    68 | #define HAB_RVT_REPORT_STATUS_ARM64        
    ((unsigned long)*(uint32_t *)(HAB_RVT_BASE + 0x48))
[build 2023-09-23 17:51:47]       |                                            
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
[build 2023-09-23 17:51:47] plat/imx/imx8m/hab.c:75:61: note: in expansion of
macro 'HAB_RVT_REPORT_STATUS_ARM64'
[build 2023-09-23 17:51:47]    75 | #define hab_rvt_report_status_p
((hab_rvt_report_status_t *)HAB_RVT_REPORT_STATUS_ARM64)
[build 2023-09-23 17:51:47]       |                                            
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~
[build 2023-09-23 17:51:47] plat/imx/imx8m/hab.c:107:41: note: in expansion of
macro 'hab_rvt_report_status_p'
[build 2023-09-23 17:51:47]   107 |                 hab_rvt_report_status =
hab_rvt_report_status_p;
[build 2023-09-23 17:51:47]       |                                        
^~~~~~~~~~~~~~~~~~~~~~~
[build 2023-09-23 17:51:47] plat/imx/imx8m/hab.c:67:65: error: array subscript
0 is outside array bounds of 'uint32_t[0]' {aka 'unsigned int[]'}
[-Werror=array-bounds]
[build 2023-09-23 17:51:47]    67 | #define HAB_RVT_REPORT_EVENT_ARM64         
    ((unsigned long)*(uint32_t *)(HAB_RVT_BASE + 0x40))
[build 2023-09-23 17:51:47]       |                                            
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
[build 2023-09-23 17:51:47] plat/imx/imx8m/hab.c:74:59: note: in expansion of
macro 'HAB_RVT_REPORT_EVENT_ARM64'
[build 2023-09-23 17:51:47]    74 | #define hab_rvt_report_event_p
((hab_rvt_report_event_t *)HAB_RVT_REPORT_EVENT_ARM64)
[build 2023-09-23 17:51:47]       |                                            
              ^~~~~~~~~~~~~~~~~~~~~~~~~~
[build 2023-09-23 17:51:47] plat/imx/imx8m/hab.c:104:40: note: in expansion of
macro 'hab_rvt_report_event_p'
[build 2023-09-23 17:51:47]   104 |                 hab_rvt_report_event =
hab_rvt_report_event_p;
[build 2023-09-23 17:51:47]       |                                       
^~~~~~~~~~~~~~~~~~~~~~
[build 2023-09-23 17:51:47] plat/imx/imx8m/hab.c:64:65: error: array subscript
0 is outside array bounds of 'uint32_t[0]' {aka 'unsigned int[]'}
[-Werror=array-bounds]
[build 2023-09-23 17:51:47]    64 | #define HAB_RVT_EXIT_ARM64                 
    ((unsigned long)*(uint32_t *)(HAB_RVT_BASE + 0x10))
[build 2023-09-23 17:51:47]       |                                            
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
[build 2023-09-23 17:51:47] plat/imx/imx8m/hab.c:73:43: note: in expansion of
macro 'HAB_RVT_EXIT_ARM64'
[build 2023-09-23 17:51:47]    73 | #define hab_rvt_exit_p ((hab_rvt_exit_t
*)HAB_RVT_EXIT_ARM64)
[build 2023-09-23 17:51:47]       |                                          
^~~~~~~~~~~~~~~~~~
[build 2023-09-23 17:51:47] plat/imx/imx8m/hab.c:101:32: note: in expansion of
macro 'hab_rvt_exit_p'
[build 2023-09-23 17:51:47]   101 |                 hab_rvt_exit =
hab_rvt_exit_p;
[build 2023-09-23 17:51:47]       |                               
^~~~~~~~~~~~~~
[build 2023-09-23 17:51:47] plat/imx/imx8m/hab.c:63:65: error: array subscript
0 is outside array bounds of 'uint32_t[0]' {aka 'unsigned int[]'}
[-Werror=array-bounds]
[build 2023-09-23 17:51:47]    63 | #define HAB_RVT_ENTRY_ARM64                
    ((unsigned long)*(uint32_t *)(HAB_RVT_BASE + 0x08))
[build 2023-09-23 17:51:47]       |                                            
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
[build 2023-09-23 17:51:47] plat/imx/imx8m/hab.c:72:45: note: in expansion of
macro 'HAB_RVT_ENTRY_ARM64'
[build 2023-09-23 17:51:47]    72 | #define hab_rvt_entry_p ((hab_rvt_entry_t
*)HAB_RVT_ENTRY_ARM64)
[build 2023-09-23 17:51:47]       |                                            
^~~~~~~~~~~~~~~~~~~
[build 2023-09-23 17:51:47] plat/imx/imx8m/hab.c:98:33: note: in expansion of
macro 'hab_rvt_entry_p'
[build 2023-09-23 17:51:47]    98 |                 hab_rvt_entry =
hab_rvt_entry_p;
[build 2023-09-23 17:51:47]       |                                
^~~~~~~~~~~~~~~
[build 2023-09-23 17:51:47] plat/imx/imx8m/hab.c:66:65: error: array subscript
0 is outside array bounds of 'uint32_t[0]' {aka 'unsigned int[]'}
[-Werror=array-bounds]
[build 2023-09-23 17:51:47]    66 | #define HAB_RVT_AUTHENTICATE_IMAGE_ARM64   
    ((unsigned long)*(uint32_t *)(HAB_RVT_BASE + 0x20))
[build 2023-09-23 17:51:47]       |                                            
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
[build 2023-09-23 17:51:47] plat/imx/imx8m/hab.c:71:71: note: in expansion of
macro 'HAB_RVT_AUTHENTICATE_IMAGE_ARM64'
[build 2023-09-23 17:51:47]    71 | #define hab_rvt_authenticate_image_p
((hab_rvt_authenticate_image_t *)HAB_RVT_AUTHENTICATE_IMAGE_ARM64)
[build 2023-09-23 17:51:47]       |                                            
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
[build 2023-09-23 17:51:47] plat/imx/imx8m/hab.c:95:46: note: in expansion of
macro 'hab_rvt_authenticate_image_p'
[build 2023-09-23 17:51:47]    95 |                 hab_rvt_authenticate_image
= hab_rvt_authenticate_image_p;
[build 2023-09-23 17:51:47]       |                                            
 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
[build 2023-09-23 17:51:47] cc1: all warnings being treated as errors
[build 2023-09-23 17:51:47] make[1]: *** [Makefile:1104:
/var/lib/laminar/run/buildroot-freescale_imx8mnevk_defconfig/6/buildroot/output/build/arm-trusted-firmware-custom/build/imx8mn/release/bl31/hab.o]
Error 1
[build 2023-09-23 17:51:47] make[1]: Leaving directory
'/var/lib/laminar/run/buildroot-freescale_imx8mnevk_defconfig/6/buildroot/output/build/arm-trusted-firmware-custom'
[build 2023-09-23 17:51:47] make: *** [package/pkg-generic.mk:293:
/var/lib/laminar/run/buildroot-freescale_imx8mnevk_defconfig/6/buildroot/output/build/arm-trusted-firmware-custom/.stamp_built]
Error 2

(Build logs are at
http://toolchain.lug-owl.de/laminar/jobs/buildroot-freescale_imx8mmevk_defconfig/6,
http://toolchain.lug-owl.de/laminar/jobs/buildroot-freescale_imx8mnevk_defconfig/6,
http://toolchain.lug-owl.de/laminar/jobs/buildroot-freescale_imx8mpevk_defconfig/6
and
http://toolchain.lug-owl.de/laminar/jobs/buildroot-freescale_imx8mqevk_defconfig/6)

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
