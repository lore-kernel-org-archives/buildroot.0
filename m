Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63745C433F5
	for <buildroot@archiver.kernel.org>; Thu, 16 Dec 2021 17:41:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 15C90415A7;
	Thu, 16 Dec 2021 17:41:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qKePQ2Fnn5kj; Thu, 16 Dec 2021 17:41:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81B04410E8;
	Thu, 16 Dec 2021 17:41:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 914CC1BF3AE
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 17:41:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7E86B4014B
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 17:41:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FIDz2MtqhZjC for <buildroot@lists.busybox.net>;
 Thu, 16 Dec 2021 17:41:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A6B4640102
 for <buildroot@uclibc.org>; Thu, 16 Dec 2021 17:41:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 4D8648010B; Thu, 16 Dec 2021 17:36:21 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Thu, 16 Dec 2021 17:41:41 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2021.08.2
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: wojciech.ziniewicz@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-14461-163-RcOO6t0HqO@https.bugs.busybox.net/>
In-Reply-To: <bug-14461-163@https.bugs.busybox.net/>
References: <bug-14461-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 14461] Qt5webenegine does not build due to
 fontconfig/freetype dependency problem
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

https://bugs.busybox.net/show_bug.cgi?id=14461

--- Comment #2 from Wojciech Ziniewicz <wojciech.ziniewicz@gmail.com> ---
Hello Peter - thank you for the response. I think it still leads me to nowwhere
but your memory of the issues is impressive.

[1] describes a problem that looks similar but it refers to problem with
stdlib.h while I'm having a problem with pkg-config / freetype
[2] the problem from this one was already patched and I confirmed I'm using a
patched version with QMAKE_ISYSTEM set to blank string
[3] this problem is _exactly_ what I'm seeing but still - the fix is in the
main branch and I also explicitly added the `BR2_PACKAGE_QT5BASE_FONTCONFIG` in
addition to the fact that qt5webengine requires is as a dependency itself now
[4] this is exeactly what I've done (actually my change is unnecessary as these
dependencies are automatically sucked in after the changes)

So basically even after I explicitly add the deps for fontconfig, I still get
the error.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
