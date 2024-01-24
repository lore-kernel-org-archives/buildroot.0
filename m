Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFFCFC47422
	for <buildroot@archiver.kernel.org>; Wed, 24 Jan 2024 03:26:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 252776148E;
	Wed, 24 Jan 2024 03:26:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 252776148E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zmPot8xs1QJT; Wed, 24 Jan 2024 03:26:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76B4761466;
	Wed, 24 Jan 2024 03:26:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 76B4761466
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 42A631BF315
 for <buildroot@lists.busybox.net>; Wed, 24 Jan 2024 03:26:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2873584EC3
 for <buildroot@lists.busybox.net>; Wed, 24 Jan 2024 03:26:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2873584EC3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gqRr4FQ5htTm for <buildroot@lists.busybox.net>;
 Wed, 24 Jan 2024 03:26:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7040684EBF
 for <buildroot@uclibc.org>; Wed, 24 Jan 2024 03:26:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7040684EBF
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 5AAAC85FEF; Wed, 24 Jan 2024 03:26:00 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Wed, 24 Jan 2024 03:25:59 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2016.11
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: drawbook.productions@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: WONTFIX
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: drawbook.productions@gmail.com
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: resolution bug_status assigned_to
Message-ID: <bug-10096-163-0AcdzjPHq0@https.bugs.busybox.net/>
In-Reply-To: <bug-10096-163@https.bugs.busybox.net/>
References: <bug-10096-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 10096] SH4 toolchain does not build Linux kernel
 magicpanelr2_defconfig
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

https://bugs.busybox.net/show_bug.cgi?id=10096

Kieran Weaver <drawbook.productions@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |WONTFIX
             Status|NEW                         |RESOLVED
           Assignee|unassigned@buildroot.uclibc |drawbook.productions@gmail.
                   |.org                        |com

--- Comment #2 from Kieran Weaver <drawbook.productions@gmail.com> ---
Reproduced on the current buildroot git head.

From linux commit ded5431ff311d963888ac951131a04fe7633aa79:

"""
From ded5431ff311d963888ac951131a04fe7633aa79 Mon Sep 17 00:00:00 2001
From: Markus Brunner <super.firetwister@gmail.com>
Date: Wed, 12 Sep 2007 11:54:58 +0900
Subject: sh: Magic Panel R2 board support.

This adds support for the SH7720 (SH3-DSP) based Magic Panel R2
board.
"""

The Magic Panel R2 is a SH3 board, not a SH4 board, it's not supported by
buildroot.

The root cause is that the SH3-DSP scheduler code saves and loads the SH3 DSP
registers via inline ASM, and mixing SH3-DSP code with SH4-FPU code isn't
supported.

Marking as RESOLVED/WONTFIX

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
