Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38762CE7A88
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 18:08:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8F04408C7;
	Sun, 24 Sep 2023 18:08:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8F04408C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4EBA5U7A0grv; Sun, 24 Sep 2023 18:08:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0916F408B0;
	Sun, 24 Sep 2023 18:08:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0916F408B0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DAFF71BF337
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 18:08:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BA5BA60A65
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 18:08:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA5BA60A65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q_-sMsZ5cQsw for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 18:08:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0713C607DE
 for <buildroot@uclibc.org>; Sun, 24 Sep 2023 18:08:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0713C607DE
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id E894C811E8; Sun, 24 Sep 2023 18:08:30 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Sun, 24 Sep 2023 18:08:30 +0000
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
Message-ID: <bug-15799-163-L1rURuQ5Rv@https.bugs.busybox.net/>
In-Reply-To: <bug-15799-163@https.bugs.busybox.net/>
References: <bug-15799-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 15799] freescale_imx8mmevk_defconfig,
 freescale_imx8mnevk_defconfig, freescale_imx8mpevk_defconfig,
 freescale_imx8mqevk_defconfig: error: array subscript 0 is outside array
 bounds of 'uint32_t[0]'
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

https://bugs.busybox.net/show_bug.cgi?id=15799

--- Comment #1 from Jan-Benedict Glaw <jbglaw@lug-owl.de> ---
The same issue also shows up for

imx8mmpico_defconfig
(http://toolchain.lug-owl.de/laminar/jobs/buildroot-imx8mmpico_defconfig/6)
imx8mpico_defconfig
(http://toolchain.lug-owl.de/laminar/jobs/buildroot-imx8mpico_defconfig/6)
imx8mqevk_defconfig
(http://toolchain.lug-owl.de/laminar/jobs/buildroot-imx8mqevk_defconfig/6)
kontron_pitx_imx8m_defconfig
(http://toolchain.lug-owl.de/laminar/jobs/buildroot-kontron_pitx_imx8m_defconfig/6)

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
