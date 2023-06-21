Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 820EDEB64D7
	for <buildroot@archiver.kernel.org>; Wed, 21 Jun 2023 13:08:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DBA2F835C4;
	Wed, 21 Jun 2023 13:08:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DBA2F835C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7J7cAziGQstA; Wed, 21 Jun 2023 13:08:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22EB983508;
	Wed, 21 Jun 2023 13:08:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 22EB983508
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E0FAC1BF2B9
 for <buildroot@lists.busybox.net>; Wed, 21 Jun 2023 13:08:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 514DB613CC
 for <buildroot@lists.busybox.net>; Wed, 21 Jun 2023 13:08:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 514DB613CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OZZh5Cvoh_AC for <buildroot@lists.busybox.net>;
 Wed, 21 Jun 2023 13:08:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7B4A6613BE
 for <buildroot@uclibc.org>; Wed, 21 Jun 2023 13:08:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B4A6613BE
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 6822A81F7D; Wed, 21 Jun 2023 13:08:17 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Wed, 21 Jun 2023 13:08:17 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2023.02
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stijn.vermeir+bugzilla@dioss.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: WORKSFORME
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-15461-163-XzFMGQ4Gxg@https.bugs.busybox.net/>
In-Reply-To: <bug-15461-163@https.bugs.busybox.net/>
References: <bug-15461-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 15461] QtVirtualKeyboard segfaults
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

https://bugs.busybox.net/show_bug.cgi?id=15461

--- Comment #7 from stijn.vermeir+bugzilla@dioss.com ---
(In reply to Peter Seiderer from comment #6)
I tried a build today with Qt versions bumped like this:
qtbase            29400a683f96867133b28299c0d0bd6bcf40df35
qtdeclarative     540c4e4a5def8c350a49bb68380b787ae62490c6
qtsvg             7e6a3b38b2e898d90cef68a146cd36fda22e4363
qtvirtualkeyboard 72373522141dd3206183eb5fa56ae1c36a6d4c2b

I got these commit ids from here:
https://invent.kde.org/qt/qt/qt5/-/commit/da2e0a59fa38644a95047fe389d955dc71b31fc8

I was using buildroot 2023.02.2 internal toolchain for this with gcc-12.3.0.

The virtual keyboard still segfaults.

I am also trying with gcc-10 now to see if this fixes the segfault here.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
