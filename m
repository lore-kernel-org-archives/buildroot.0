Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF01BC433EF
	for <buildroot@archiver.kernel.org>; Sun, 21 Nov 2021 11:09:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30FD980E1A;
	Sun, 21 Nov 2021 11:09:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5eZAwlLPN43S; Sun, 21 Nov 2021 11:08:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 934B980DD7;
	Sun, 21 Nov 2021 11:08:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3BDEE1BF2BF
 for <buildroot@lists.busybox.net>; Sun, 21 Nov 2021 11:08:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 29125401C1
 for <buildroot@lists.busybox.net>; Sun, 21 Nov 2021 11:08:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id thaOqrelI19x for <buildroot@lists.busybox.net>;
 Sun, 21 Nov 2021 11:08:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 630CC400C9
 for <buildroot@uclibc.org>; Sun, 21 Nov 2021 11:08:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 28B238B2CA; Sun, 21 Nov 2021 11:04:34 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Sun, 21 Nov 2021 11:08:56 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stsp2@yandex.ru
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-14351-163-AzC1uYx1e4@https.bugs.busybox.net/>
In-Reply-To: <bug-14351-163@https.bugs.busybox.net/>
References: <bug-14351-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 14351] needs to mount sysfs before mount -a
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

https://bugs.busybox.net/show_bug.cgi?id=14351

--- Comment #3 from stsp <stsp2@yandex.ru> ---
(In reply to Fabrice Fontaine from comment #2)

Applying 0002-libblkid-don-t-mark-cache-as-probed-if-sys-not-available.patch
using patch: 
patching file libblkid/src/devname.c
Hunk #1 succeeded at 456 (offset 27 lines).
Hunk #2 succeeded at 562 with fuzz 1 (offset 27 lines).
Hunk #3 succeeded at 583 (offset 29 lines).
Hunk #4 succeeded at 608 (offset 29 lines).
Hunk #5 succeeded at 626 (offset 29 lines).

... is what I see when rebuilding util-linux.
I would rather suggest to update
entire util-linux from git, or, better yet,
just mount /sys by hands, the same
way you already do for /proc.

But other than that - yes, the patched
buildroot works as expected, thanks!

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
