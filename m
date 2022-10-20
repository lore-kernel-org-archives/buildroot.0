Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8678EC433FE
	for <buildroot@archiver.kernel.org>; Thu, 20 Oct 2022 10:27:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E7EC940526;
	Thu, 20 Oct 2022 10:27:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E7EC940526
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CXX9LwSmnERa; Thu, 20 Oct 2022 10:27:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1D7FF404A0;
	Thu, 20 Oct 2022 10:27:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D7FF404A0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A43E11BF955
 for <buildroot@lists.busybox.net>; Thu, 20 Oct 2022 10:27:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8CA6740494
 for <buildroot@lists.busybox.net>; Thu, 20 Oct 2022 10:27:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8CA6740494
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K76kGPHSv8xo for <buildroot@lists.busybox.net>;
 Thu, 20 Oct 2022 10:27:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF5A7403BE
 for <buildroot@uclibc.org>; Thu, 20 Oct 2022 10:27:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF5A7403BE
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id B8D4286EC9; Thu, 20 Oct 2022 10:27:24 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Thu, 20 Oct 2022 10:27:23 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Outdated package
X-Bugzilla-Version: 2022.02.6
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alirezatm@ymail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone
Message-ID: <bug-15071-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 15071] New: RTL8723BS library is outdated
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

https://bugs.busybox.net/show_bug.cgi?id=15071

            Bug ID: 15071
           Summary: RTL8723BS library is outdated
           Product: buildroot
           Version: 2022.02.6
          Hardware: Other
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Outdated package
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: alirezatm@ymail.com
                CC: buildroot@uclibc.org
  Target Milestone: ---

Good day, It seems that the RTL8723BS library in the buildroot settings
accessible by "make menuconfig" and "make linux-menunconfig" is outdated and
hasn't been updated for a long time

In the "~/buildroot-2022.02.6/package/rtl8723bs/rtl8723bs.mk" file, I saw this
line: 
RTL8723BS_SITE = $(call github,hadess,rtl8723bs,$(RTL8723BS_VERSION))
which means that it's fetching the library from
https://github.com/hadess/rtl8723bs which as you can see is not being updated
anymore and is extremely outdated. For example it doesn't respect the changes
to the timer done in the 4.15 kernel

I tried lowering my linux kernel version in the "make menuconfig" settings as a
compromise but this library still won't compile. Tried and failed with kernel
versions 4.11, 4.12 and 4.14

The kernel itself seems to have an up-to-date driver for it
(https://github.com/torvalds/linux/tree/master/drivers/staging/rtl8723bs) but I
don't think we can access it via buildroot

Is there any chance to fix this library? Thanks
I've attached my .config file if it helps

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
