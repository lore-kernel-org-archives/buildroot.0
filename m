Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B89FCC433EF
	for <buildroot@archiver.kernel.org>; Wed,  1 Dec 2021 11:01:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BE5C819F5;
	Wed,  1 Dec 2021 11:01:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J75jDli3fjJu; Wed,  1 Dec 2021 11:01:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9CEFC819C8;
	Wed,  1 Dec 2021 11:01:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1FE661BF296
 for <buildroot@lists.busybox.net>; Wed,  1 Dec 2021 11:01:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0F27A60653
 for <buildroot@lists.busybox.net>; Wed,  1 Dec 2021 11:01:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4PPuaINDVqFJ for <buildroot@lists.busybox.net>;
 Wed,  1 Dec 2021 11:01:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0C3EC605A3
 for <buildroot@uclibc.org>; Wed,  1 Dec 2021 11:00:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id CA37586BAA; Wed,  1 Dec 2021 10:56:14 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Wed, 01 Dec 2021 11:00:59 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: zeno.endemann@kdab.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone
Message-ID: <bug-14406-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 14406] New: Support LPDDR4 variant i.MX8MN EVK
 board
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

https://bugs.busybox.net/show_bug.cgi?id=14406

            Bug ID: 14406
           Summary: Support LPDDR4 variant i.MX8MN EVK board
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: zeno.endemann@kdab.com
                CC: buildroot@uclibc.org
  Target Milestone: ---

The existing freescale_imx8mnevk_defconfig builds an image for the DDR4 variant
of the dev board. This seems weird, as the LPDDR4 variant appears to be the
more common one (this is what I got when ordering the dev board from
www.nxp.com), and in the yocto layer the "default" config refers to the LPDDR4
variant as well (and one has to explicitly specify the DDR4 variant). 

At the very least it would be nice if the board/freescale/imx8mnevk/readme.txt
could document what needs to be changed for the LPDDR4 variant. Even better
would be another defconfig. To be more in line with yocto it possibly might be
good to make the freescale_imx8mnevk_defconfig build the LPDDR4 variant, and
have a freescale_imx8mnevk_ddr4_defconfig.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
