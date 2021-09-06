Return-Path: <SRS0=O81Z=N4=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 267C9C433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 13:29:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A914760F45
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 13:29:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A914760F45
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=busybox.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 744A140353;
	Mon,  6 Sep 2021 13:29:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XlGv_JAdda-R; Mon,  6 Sep 2021 13:29:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF1C94040D;
	Mon,  6 Sep 2021 13:29:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AF1F51BF2BA
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 13:29:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 97EAB4040D
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 13:29:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U2pV7Kf9SG3D for <buildroot@lists.busybox.net>;
 Mon,  6 Sep 2021 13:29:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E76C640353
 for <buildroot@uclibc.org>; Mon,  6 Sep 2021 13:29:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 80468874F7; Mon,  6 Sep 2021 13:28:22 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Mon, 06 Sep 2021 13:29:48 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2021.05
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: t.ruschival@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone
Message-ID: <bug-14206-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 14206] New: QT5 touch screen rotation does not
 work since 2021.05
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

https://bugs.busybox.net/show_bug.cgi?id=14206

            Bug ID: 14206
           Summary: QT5 touch screen rotation does not work since 2021.05
           Product: buildroot
           Version: 2021.05
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: t.ruschival@gmail.com
                CC: buildroot@uclibc.org
  Target Milestone: ---

The `rotate` parameter for the touchscreen orientation does not work using
environment variable QT_QPA_EVDEV_TOUCHSCREEN_PARAMETERS in QT5. e.g.
QT_QPA_EVDEV_TOUCHSCREEN_PARAMETERS=/dev/input/touch:rotate=90 has no effect.
No value for rotation (90,180,270) has any effect.

It used to work up until 2021.02 and stopped working since Buildroot 2021.05.

Looking for the cause I found that since 2021.05 libxkbcommon
(BR2_PACKAGE_LIBXKBCOMMON) and libinput (BR2_PACKAGE_LIBINPUT) are selected. In
turn libevdev (BR2_PACKAGE_LIBEVDEV) is selected.
Libinput and libxkbcommon are selected by
BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_GBM.

As a quick check I removed the line 'source "package/kodi/Config.in"' form
package/Config.in and rebuilt all in this case the touch-input rotation works.

Kodi was never selected on the system.  Would it make sense to only select
libinput and libxkbcommon if BR2_PACKAGE_KODI is actually selected?

I guess this affects all applications using QT5 with a rotated touch screen -
can anyone confirm this issue?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
