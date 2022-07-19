Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35D21C43334
	for <buildroot@archiver.kernel.org>; Tue, 19 Jul 2022 03:28:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 728DD40901;
	Tue, 19 Jul 2022 03:28:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 728DD40901
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sSRvsMXHUQ3O; Tue, 19 Jul 2022 03:27:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4687D408F0;
	Tue, 19 Jul 2022 03:27:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4687D408F0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8C1AE1BF418
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 03:27:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 73E53408F0
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 03:27:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73E53408F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XHNS4TGAEf2i for <buildroot@lists.busybox.net>;
 Tue, 19 Jul 2022 03:27:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 74C65408ED
 for <buildroot@uclibc.org>; Tue, 19 Jul 2022 03:27:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 74C65408ED
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 960D381201; Tue, 19 Jul 2022 03:14:28 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Tue, 19 Jul 2022 03:27:55 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2022.02.3
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: tgeh23@qq.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: 2022.02
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-14916-163-ZryHoFMy9s@https.bugs.busybox.net/>
In-Reply-To: <bug-14916-163@https.bugs.busybox.net/>
References: <bug-14916-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 14916] build buildroot with glibc and linux kernel
 5.4, start with qemu will cause error: "FATAL: kernel too old"
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

https://bugs.busybox.net/show_bug.cgi?id=14916

--- Comment #3 from Fugui Liu <tgeh23@qq.com> ---
(In reply to Thomas Petazzoni from comment #1)

The solution I want is to be able to set the minior version when we `make
xxconfig`.

(In reply to Yann E. MORIN from comment #2)

I tested multi combinations.
1. buildroot-2022.02.3 with glibc 2.34 linux kernel 5.4/5.15
2. buildroot-2020.08 with glibc 2.31 linux kernle 5.4/5.7
All throw error: FATAL: kernel too old

If I modify buildroot's .config `BR2_TOOLCHAIN_HEADERS_AT_LEAST` to `5.4.0`,
everything is ok.

You can try to build and start.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
