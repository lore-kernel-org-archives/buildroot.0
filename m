Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47C5AC433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 13:25:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E60DA8497A;
	Sun, 24 Jul 2022 13:25:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E60DA8497A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uHeK-sIln8e2; Sun, 24 Jul 2022 13:25:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ECBCC8496E;
	Sun, 24 Jul 2022 13:25:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECBCC8496E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C533D1BF488
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 13:25:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9EF2660E05
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 13:25:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9EF2660E05
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tJ1GtAiT4MkD for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 13:25:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id ED12560767
 for <buildroot@uclibc.org>; Sun, 24 Jul 2022 13:25:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED12560767
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id BB12980F48; Sun, 24 Jul 2022 13:11:31 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Sun, 24 Jul 2022 13:25:10 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2021.02.1
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: romain.naour@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-13796-163-QulYj1ncJM@https.bugs.busybox.net/>
In-Reply-To: <bug-13796-163@https.bugs.busybox.net/>
References: <bug-13796-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 13796] Problems compiling package gst-plugins-good
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

https://bugs.busybox.net/show_bug.cgi?id=13796

--- Comment #2 from romain.naour@gmail.com ---
Hello,

This issue can still be reproduced from Buildroot master branch.

Khronos headers are the same since 10 years:

https://github.com/raspberrypi/userland/tree/master/interface/khronos/include/GLES2

In 2014, mesa3d updated Khronos headers to revision 24614 where GLsync moved
from gl2ext.h to gl2.h.

https://gitlab.freedesktop.org/mesa/mesa/-/commit/117d8ce27b7929c42f46f818ac038580877b3086

https://gitlab.freedesktop.org/mesa/mesa/-/commit/d519ebb34cd21cfc13987f2038d7a2ec353a5cfd

I guess it's not only a GLsync issue but a too old khronos headers.

Best regards,
Romain

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
