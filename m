Return-Path: <SRS0=Tewt=OQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91F23C433F5
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 21:45:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B0C661041
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 21:45:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2B0C661041
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07739402E0;
	Sun, 26 Sep 2021 21:45:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MvpdQdQmd-xF; Sun, 26 Sep 2021 21:45:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5780D40328;
	Sun, 26 Sep 2021 21:45:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2E98A1BF370
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 21:44:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4D7C3402D3
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 21:44:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ach_psYHqMRp for <buildroot@lists.busybox.net>;
 Sun, 26 Sep 2021 21:44:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 44E8140312
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 21:44:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id A0CE18D308; Sun, 26 Sep 2021 21:42:29 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 26 Sep 2021 23:37:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ca6a2907c27c8171336643d1ab41bd5c34ee3794
X-Git-Newrev: a95c353a46247db036862ad839c095ca9ae4f690
X-Patchwork-Hint: ignore
Message-Id: <20210926214229.A0CE18D308@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/dependencies: don't check for
 `which'
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a95c353a46247db036862ad839c095ca9ae4f690
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It's requirement has been removed in previous commit.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/dependencies/dependencies.sh | 2 --
 1 file changed, 2 deletions(-)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index c5dcb86231..a3e0b3ecc4 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -65,8 +65,6 @@ check_prog_host()
 	fi
 }
 
-# Verify that which is installed
-check_prog_host "which"
 # Verify that sed is installed
 check_prog_host "sed"
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
