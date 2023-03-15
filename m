Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B487FC61DA4
	for <buildroot@archiver.kernel.org>; Wed, 15 Mar 2023 20:56:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4229C4053E;
	Wed, 15 Mar 2023 20:56:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4229C4053E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gnWWTL3mqwYn; Wed, 15 Mar 2023 20:56:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7F3B340459;
	Wed, 15 Mar 2023 20:56:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F3B340459
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D9B121BF41C
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 20:56:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B4B6340459
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 20:56:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B4B6340459
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TV4jJu6OKwoc for <buildroot@lists.busybox.net>;
 Wed, 15 Mar 2023 20:56:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C4D984053E
 for <buildroot@uclibc.org>; Wed, 15 Mar 2023 20:56:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C4D984053E
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id B3BB185D50; Wed, 15 Mar 2023 20:56:04 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Wed, 15 Mar 2023 20:56:04 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-15396-163-PvGhmdsDpS@https.bugs.busybox.net/>
In-Reply-To: <bug-15396-163@https.bugs.busybox.net/>
References: <bug-15396-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 15396] Document build dependencies
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

https://bugs.busybox.net/show_bug.cgi?id=15396

--- Comment #3 from Jan-Benedict Glaw <jbglaw@lug-owl.de> ---
Hi Thomas!

As I read through your comment again, you're running your CI builds on the
Gitlab.com platform? Or on a self-hosted system?

If it's self-hosted, you can easily change configuration to allow for longer
running jobs. All CI testing I do is strictly non-parallel (to allow to diff
log files), so it takes its time (eg. right now, a build for
qemu_aarch64_sbsa_defconfig is already running for 7h 50m right now), though
I'm not using Gitlab, but Laminar (self-hosted in my basement.) On my hardware,
I guess (don't have numbers yet) an average buildroot build will take 4.5h,
times 280 builds, resulting in some 75k build minutes just for one complete
run. That's already quite more than Gitlab.com's "Ultimate" plan. :/

While I currently pay for electricity myself, let me know if I'd do helpful
work in that area in the long run. As I do Buildroot builds only as a side
project (my main target for http://toolchain.lug-owl.de/ is to keep GCC running
for VAX, keep NetBSD for VAX alive), even running a small RasPi cluster as
build nodes would probably beneficial. It wouldn't be _fast_ either, but it
could properly build all configurations and start from the beginning once a
complete round is finished.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
