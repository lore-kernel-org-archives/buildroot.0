Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 730BFEE57DF
	for <buildroot@archiver.kernel.org>; Mon, 11 Sep 2023 06:26:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4C0940953;
	Mon, 11 Sep 2023 06:26:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4C0940953
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z3GDEhQDchlm; Mon, 11 Sep 2023 06:26:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC4A840967;
	Mon, 11 Sep 2023 06:26:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC4A840967
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6CE9A1BF5A5
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 06:26:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5317D60E25
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 06:26:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5317D60E25
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C5rVK2fZwtDp for <buildroot@lists.busybox.net>;
 Mon, 11 Sep 2023 06:26:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1A5BA60C28
 for <buildroot@uclibc.org>; Mon, 11 Sep 2023 06:26:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A5BA60C28
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 06C8B86528; Mon, 11 Sep 2023 06:26:32 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Mon, 11 Sep 2023 06:26:31 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2023.08
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jose@source.parts
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone attachments.created
Message-ID: <bug-15766-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 15766] New: BR2_PACKAGE_WESTON_XWAYLAND -- 12.0.1
 -- fails to build::missing dependencies
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

https://bugs.busybox.net/show_bug.cgi?id=15766

            Bug ID: 15766
           Summary: BR2_PACKAGE_WESTON_XWAYLAND -- 12.0.1 -- fails to
                    build::missing dependencies
           Product: buildroot
           Version: 2023.08
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: jose@source.parts
                CC: buildroot@uclibc.org
  Target Milestone: ---

Created attachment 9640
  --> https://bugs.busybox.net/attachment.cgi?id=9640&action=edit
proposed preview patch, will not be able to be applied directly to mainline!

Hello,

This is my first time submitting a bug report for buildroot.
I have a few more on the way with patches in tow including this one.

Problem:
Weston 12.0.1 fails to build when BR2_PACKAGE_WESTON_XWAYLAND is selected.
Despite proper dependencies being listed in Defconfig. 

Reason for failure:
Config.in for BR2_PACKAGE_WESTON_XWAYLAND does not select BR2_PACKAGE_XCB_UTIL
and BR2_PACKAGE_XCB_UTIL_CURSOR. Additionally, weston.mk does not list xcb-util
and xcb-util-cursor for dependencies of BR2_PACKAGE_WESTON_XWAYLAND.

Error Log Snippet:
"""
>>> weston 12.0.1 Configuring
...
...
Run-time dependency xcb-cursor found: NO (tried pkgconfig and cmake)

output/build/weston-12.0.1/tests/meson.build:317:2: ERROR: Problem encountered:
xcb and xcb-cursor required for running xwayland tests
"""

Relevant DefConfig Snippet:
"""
BR2_PACKAGE_XCB_UTIL=y
BR2_PACKAGE_XCB_UTIL_CURSOR=y
BR2_PACKAGE_XCB_UTIL_IMAGE=y
BR2_PACKAGE_XCB_UTIL_RENDERUTIL=y
...
BR2_PACKAGE_WESTON=y
BR2_PACKAGE_WESTON_DEFAULT_WAYLAND=y
BR2_PACKAGE_WESTON_XWAYLAND=y
"""

Fix/Solution:
(See preview patch attached. Will not directly apply, will be sending a proper
patch to the mailing list within the next day or so.)

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
