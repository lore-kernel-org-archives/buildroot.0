Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D158C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 28 Jun 2024 12:13:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E1D8405F8;
	Fri, 28 Jun 2024 12:13:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CH9iaGO9X3mv; Fri, 28 Jun 2024 12:13:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 545DB405FB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 545DB405FB;
	Fri, 28 Jun 2024 12:13:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B90821BF41C
 for <buildroot@lists.busybox.net>; Fri, 28 Jun 2024 12:13:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A69C760664
 for <buildroot@lists.busybox.net>; Fri, 28 Jun 2024 12:13:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wEHRPxEqKjej for <buildroot@lists.busybox.net>;
 Fri, 28 Jun 2024 12:13:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=bugzilla@busybox.net;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BFCFF60628
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BFCFF60628
 for <buildroot@uclibc.org>; Fri, 28 Jun 2024 12:13:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id A353383233; Fri, 28 Jun 2024 12:13:43 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Fri, 28 Jun 2024 12:13:43 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2024.05
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: albert.david@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone
Message-ID: <bug-16120-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 16120] New: Unable to get I2C working on
 Raspberry-pi-5
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

https://bugs.busybox.net/show_bug.cgi?id=16120

            Bug ID: 16120
           Summary: Unable to get I2C working on Raspberry-pi-5
           Product: buildroot
           Version: 2024.05
          Hardware: Other
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: albert.david@gmail.com
                CC: buildroot@uclibc.org
  Target Milestone: ---

excuse me for filing this as a bug, but i am not really sure where the issue
is.
here is the problem description:

1) created sdcard.img using make raspberrypi5_defconfig
2) sdcard.img was written to micro-sdcard and able to boot the pi5 board
3) on pi5 console, ls /dev/i2c* did not show anything
4) on a running system, mounted /dev/mmcblk0p1 to /tmp/boot and added following
lines to /tmp/boot/config.txt
dtoverlay=i2c1,pins_2_3,baudrate=1000000
dtparam=i2c_arm=on
5) rebooted the board but /dev/i2c* didnt show anything
6) modified config.txt again with following changes but /dev/i2c* didnt show
up.
dtoverlay=i2c1-pi5
dtparam=i2c_arm=on
7) when booting pi-5 with RaspberryPi-OS and enabling the i2c using sudo
raspi-config shows up three nodes under /dev/i2c*

Any idea what am I missing here? has anyone managed to get i2c working on a
buildroot generated image for pi-5? what changes did u do in your config.txt?
Thanks.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
