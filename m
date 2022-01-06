Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B8A1C433EF
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 17:52:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A73E4291F;
	Thu,  6 Jan 2022 17:52:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mQGBM5YtabWK; Thu,  6 Jan 2022 17:52:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A134B42918;
	Thu,  6 Jan 2022 17:52:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 291091BF2F9
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 17:52:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1696A6FBEF
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 17:52:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3Xog2QtmejFP for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 17:52:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 75D7F60E02
 for <buildroot@uclibc.org>; Thu,  6 Jan 2022 17:52:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 4B2CF8345B; Thu,  6 Jan 2022 17:46:31 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Thu, 06 Jan 2022 17:52:39 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2021.05
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocker
X-Bugzilla-Who: fontaine.fabrice@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-14501-163-Cl8uPPi7Qe@https.bugs.busybox.net/>
In-Reply-To: <bug-14501-163@https.bugs.busybox.net/>
References: <bug-14501-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 14501] lttng-modules v2.11 package fails to build
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

https://bugs.busybox.net/show_bug.cgi?id=14501

--- Comment #4 from Fabrice Fontaine <fontaine.fabrice@gmail.com> ---
From understanding, the issue is raised on kernel >= 5.6 and lttng-modules has
fixed this issue with
https://github.com/lttng/lttng-modules/commit/edfdcb685c3f56dde803244449f79ad7bed03798

But there is a lot of other commits needed to be able to build on newer kernels
so I think that a bump is indeed the best course of action.

You can find a patch here:
https://patchwork.ozlabs.org/project/buildroot/patch/20220106174949.1064731-1-fontaine.fabrice@gmail.com/

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
