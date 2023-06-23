Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0320EB64DD
	for <buildroot@archiver.kernel.org>; Fri, 23 Jun 2023 15:09:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 83DE860F94;
	Fri, 23 Jun 2023 15:09:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 83DE860F94
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G3PJ-Y0kOmTv; Fri, 23 Jun 2023 15:09:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE32960F34;
	Fri, 23 Jun 2023 15:09:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE32960F34
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E258C1BF33B
 for <buildroot@lists.busybox.net>; Fri, 23 Jun 2023 15:09:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BA28341F1B
 for <buildroot@lists.busybox.net>; Fri, 23 Jun 2023 15:09:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA28341F1B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zZIfz29B3bvm for <buildroot@lists.busybox.net>;
 Fri, 23 Jun 2023 15:09:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D19EF41F16
 for <buildroot@uclibc.org>; Fri, 23 Jun 2023 15:09:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D19EF41F16
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id BA5788419E; Fri, 23 Jun 2023 15:09:24 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Fri, 23 Jun 2023 15:09:24 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2023.05
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: info@hifiberry.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone
Message-ID: <bug-15664-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 15664] New: Can't compile mesa3d with v3d driver
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

https://bugs.busybox.net/show_bug.cgi?id=15664

            Bug ID: 15664
           Summary: Can't compile mesa3d with v3d driver
           Product: buildroot
           Version: 2023.05
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: critical
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: info@hifiberry.com
                CC: buildroot@uclibc.org
  Target Milestone: ---

To reproduce:

make raspberrypi4_defconfig
make menuconfig
 - Select mesa3d and "Gallium v3d driver"

make clean
make

breaks with

Program decode.py found: YES
(/home/m/buildroot-2023.05/output/build/mesa3d-23.1.0/src/compiler/isaspec/decode.py)
Program encode.py found: YES
(/home/m/buildroot-2023.05/output/build/mesa3d-23.1.0/src/compiler/isaspec/encode.py)
Run-time dependency v3dv3 found: NO (tried pkgconfig and cmake)
Run-time dependency simpenrose found: NO (tried pkgconfig and cmake)

output/build/mesa3d-23.1.0/src/gallium/drivers/vc4/meson.build:87:16: ERROR:
Trying to compare values of different types (UserFeatureOption, str) using !=.
This was deprecated and undefined behavior previously and is as of 0.60.0 a
hard error.

A full log can be found at
/home/m/buildroot-2023.05/output/build/mesa3d-23.1.0/build/meson-logs/meson-log.txt
make[1]: *** [package/pkg-generic.mk:283:
/home/m/buildroot-2023.05/output/build/mesa3d-23.1.0/.stamp_configured] Error 1
make: *** [Makefile:82: _all] Error 2

Same config is working fine of 2023.02 buildroot release

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
