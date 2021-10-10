Return-Path: <SRS0=K+5a=O6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B707C433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 10:04:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30F2560F92
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 10:04:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 30F2560F92
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F06B96079D;
	Sun, 10 Oct 2021 10:04:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zpTvD4vOIkwe; Sun, 10 Oct 2021 10:04:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63A9560775;
	Sun, 10 Oct 2021 10:04:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F2FE11BF476
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 10:03:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E1BAC60775
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 10:03:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3mWcam6-Dkm4 for <buildroot@lists.busybox.net>;
 Sun, 10 Oct 2021 10:03:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 433A1605CC
 for <buildroot@buildroot.org>; Sun, 10 Oct 2021 10:03:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 60ACF94EB4; Sun, 10 Oct 2021 10:01:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 10 Oct 2021 10:18:26 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: f58c498450b221c07eb3f67e5f080d6ac2209e62
X-Git-Newrev: bc67998293958b11b19b89dfd1e978d3176dc420
X-Patchwork-Hint: ignore
Message-Id: <20211010100106.60ACF94EB4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] DEVELOPERS: adopt
 package/libite
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

commit: https://git.buildroot.net/buildroot/commit/?id=bc67998293958b11b19b89dfd1e978d3176dc420
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

Since I'm the upstream maintainer and we use it for $DAYJOB, I'll adopt.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 96db7735f7ade4ee68ee73157500b4b8b739f53d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index c07a455bba..0c4b76e84f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1299,6 +1299,7 @@ F:	package/rtty/
 N:	Joachim Wiberg <troglobit@gmail.com>
 F:	configs/globalscale_espressobin_defconfig
 F:	board/globalscale/espressobin/
+F:	package/libite/
 F:	package/mg/
 F:	package/netcalc/
 F:	package/ssdp-responder/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
