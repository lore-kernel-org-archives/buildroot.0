Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EC0AC54E60
	for <buildroot@archiver.kernel.org>; Sun, 17 Mar 2024 10:59:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 44BB3403B9;
	Sun, 17 Mar 2024 10:59:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3YNXG3q2tnMm; Sun, 17 Mar 2024 10:59:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B49A403EA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5B49A403EA;
	Sun, 17 Mar 2024 10:59:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1A3E91BF21A
 for <buildroot@lists.busybox.net>; Sun, 17 Mar 2024 10:59:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 125F9403AC
 for <buildroot@lists.busybox.net>; Sun, 17 Mar 2024 10:59:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I5UGrjkt08Cb for <buildroot@lists.busybox.net>;
 Sun, 17 Mar 2024 10:59:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.100;
 helo=smtpdh16-1.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7033E4016D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7033E4016D
Received: from smtpdh16-1.aruba.it (smtpdh16-1.aruba.it [62.149.155.100])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7033E4016D
 for <buildroot@buildroot.org>; Sun, 17 Mar 2024 10:59:04 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id loEIrowheEG7LloEIrBpPK; Sun, 17 Mar 2024 11:59:02 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun, 17 Mar 2024 11:59:01 +0100
Message-Id: <20240317105901.157006-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfADpWXHLfdsn/nlzGM9uGh+nDBmLIEwJukXsjUEii4IT07ltTqRpJ7q4bMbYBRBo6dAYlxqEndImaDNo6gciWVFo0jyF78tCWany3uW8rtr1xutjyBhR
 vR3dJct7uW8/ng82D3RMFH/PbAEj3xa1lxCoq+Z/IZ2FjjyKaBJSsXuxCx6o4mc+YEpOLBWiKQMj7rQTBAmnaczkzdB4l53sjYvC4nQGjeq5dcbFOiWJyH12
 +Yqh/07bLQKQBIeJZz5nNfgEIA0CehD93A+U3qDDyJ00EZo9ZLd7TiW12CUBdJdzP/v+0GoXHJWuQNP0vAI4Hg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1710673142; bh=FMmT0RV9FZ1GTzN92W19PSV3AWgnNSulYegsG/0t72Q=;
 h=From:To:Subject:Date:MIME-Version;
 b=WdjQClRZDJNNJRYrr9AhnRs4n88f8GTqFRQCIA/MbTqdffwU2n/Cq9ulwWdr7aRrJ
 PFMQHlPMRq8CkbfIpwvDMm1YdnztswbiTqUfksq5tZMVtveHJEpkD9W/sflE93Fydt
 0o3tOT1WtylFRO22e7g5XF7L5YlFp+pCM3g8fxdpxW0Wpnas86qNtmEBRc3D52dmJn
 nwrdrmaJdvdyq7HDUtBhZMkTzDg8RlrniNLzqSxH94nlzoKDv/q3uaSy1peMgRzLO4
 988KSrPfJoJEMUe8oRJfYBFyTjLBetDt9wAhY3hy1zarl4YUaMZ29T3TL59cNCH3yl
 pV02RbWFxlKew==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=WdjQClRZ
Subject: [Buildroot] [PATCH] package/libnss: bump version to 3.99
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 51701724ed..8c7c807f79 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_98_RTM/src/SHA256SUMS
-sha256  f549cc33d35c0601674bfacf7c6ad683c187595eb4125b423238d3e9aa4209ce  nss-3.98.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_99_RTM/src/SHA256SUMS
+sha256  5cd5c2c8406a376686e6fa4b9c2de38aa280bea07bf927c0d521ba07c88b09bd  nss-3.99.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 21b1f17b25..0d8b4dc592 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.98
+LIBNSS_VERSION = 3.99
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
