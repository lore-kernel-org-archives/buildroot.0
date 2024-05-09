Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 499BDC10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 22:11:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CBC2240725;
	Thu,  9 May 2024 22:11:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 748uQe9hCW4j; Thu,  9 May 2024 22:11:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 956A44080A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 956A44080A;
	Thu,  9 May 2024 22:11:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 06A321BF48B
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 22:11:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E7C976068C
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 22:11:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cqISk-x4YaAD for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 22:11:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=bugzilla@busybox.net;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E0F460682
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E0F460682
 for <buildroot@uclibc.org>; Thu,  9 May 2024 22:11:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 055938692F; Thu,  9 May 2024 22:11:50 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Thu, 09 May 2024 22:11:49 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2024.02.1
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lists1@afach.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone
Message-ID: <bug-16060-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 16060] New: For Raspberry Pi 4, 64-bit,
 OpenSSH password authentication doesn't work for root
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

https://bugs.busybox.net/show_bug.cgi?id=16060

            Bug ID: 16060
           Summary: For Raspberry Pi 4, 64-bit, OpenSSH password
                    authentication doesn't work for root
           Product: buildroot
           Version: 2024.02.1
          Hardware: Other
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: lists1@afach.de
                CC: buildroot@uclibc.org
  Target Milestone: ---

Hello everyone

I'm new to buildroot. I tried the 32-bit version (armv7) with that Raspberry Pi
4 machine. All went well. I used it for a while, all good.

The configuration I used is basic, starting from `make raspberrypi4_defconfig`,
the only things I changed were the root password + installed OpenSSH from the
packages in `make menuconfig`, followed by `make all`. 

I realized I needed aarch64 architecture. I wiped the directory, extracted the
tar, and started over. I followed the same steps, but starting with `make
raspberrypi4_64_defconfig`, adding OpenSSH and setting the root password (same
password from before), followed by `make all`. Flashed the imaged to an sd
card, booted, all good.

Then, I tried to login with ssh, and I always got that the password is
incorrect. I confirmed multiple times that the password is correct. No use.

I'm no pro, so I don't know how to use serial port or fancy stuff like that. I
took the sd card out, mounted it, and added my ssh public key to
authiorized_keys of root. Put back the sd card, and ssh then worked fine. I
logged in.

Then, once I was in, I kept trying to login with the password, never worked.
Loopback didn't work either. I changed the password multiple times. I tried
many things, including manually putting the password in /etc/shadow, and
running `passwd`, and confirming that the password in /etc/shadow is changing,
but no use. I think it may be a bug in the build process, but I can't be sure.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
