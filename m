Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 377BFC678D5
	for <buildroot@archiver.kernel.org>; Tue,  7 Mar 2023 21:36:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCF994179C;
	Tue,  7 Mar 2023 21:36:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BCF994179C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zy72oZgi5pl4; Tue,  7 Mar 2023 21:36:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4BFC4176F;
	Tue,  7 Mar 2023 21:36:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4BFC4176F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6E54C1BF3B0
 for <buildroot@lists.busybox.net>; Tue,  7 Mar 2023 21:36:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5532A610EC
 for <buildroot@lists.busybox.net>; Tue,  7 Mar 2023 21:36:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5532A610EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZUtFxoWAxVmN for <buildroot@lists.busybox.net>;
 Tue,  7 Mar 2023 21:36:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8D61F610D5
 for <buildroot@uclibc.org>; Tue,  7 Mar 2023 21:36:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D61F610D5
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 7A3F684493; Tue,  7 Mar 2023 21:36:53 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Tue, 07 Mar 2023 21:36:53 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: minor
X-Bugzilla-Who: jbittner.br.bugs@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-15366-163-EOb73IflOu@https.bugs.busybox.net/>
In-Reply-To: <bug-15366-163@https.bugs.busybox.net/>
References: <bug-15366-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 15366] xscreensaver needs util-linux dependency
 for per-package build
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

https://bugs.busybox.net/show_bug.cgi?id=15366

--- Comment #2 from Jonathan Bittner <jbittner.br.bugs@gmail.com> ---
Created attachment 9526
  --> https://bugs.busybox.net/attachment.cgi?id=9526&action=edit
sample defconfig

I did a sample build using a modified stock defconfig and was able to reproduce
the error.  Building against systemd instead of BusyBox-init does not cause
issues.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
