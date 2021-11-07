Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34943C433F5
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:44:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE93F6187C
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:44:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EE93F6187C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7C71401D0;
	Sun,  7 Nov 2021 02:44:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vTKyXlxF1Vva; Sun,  7 Nov 2021 02:44:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 23A1A402D2;
	Sun,  7 Nov 2021 02:44:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 032231BF4DB
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:43:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E6A7A81C2F
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:43:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yw3T_tOPwILU for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 02:43:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0872.aruba.it (smtpcmd0872.aruba.it [62.149.156.72])
 by smtp1.osuosl.org (Postfix) with ESMTP id 23DC581B48
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 02:43:00 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jY8ymuoy4Ff01jY96mqU6i; Sun, 07 Nov 2021 03:43:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636252980; bh=8Rfu17UaCFYoS6sQ9V3O7YSI76phwnkj4rq2T/IgpVw=;
 h=From:To:Subject:Date:MIME-Version;
 b=GRYVzOPgtizY5R8ZEyrRQgpSgsVQqpbt/HKe9X/FY77yqUS5cDQ3hjBJun+coSZIK
 9VwbEZ0YxrOdvN2JmBsZO8uYTseAvkAu0l4qO4Yd9pCVu34kL0DH2RnTwozjIQptN4
 Bd7ZsF1LPMK6ik+U5HhIzVa35/jjd+Iu7XsjrvMGs1A05p2JDt4zKw+V/OSGJUg6/V
 uPB6sK1hEkb+8pzJshLmqQvLepcDJUXioVHEKCHnvzLsjn/rSdkceM1FnpEM7+gvG6
 h4uBmnHfno2CMMbWWVG3Zdr3l0BPlj13qhuTlPxSMphfrs0xo7CPLb8HMsEtI1296V
 xJAF6JcHiodtQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 03:42:49 +0100
Message-Id: <20211107024250.3061287-8-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211107024250.3061287-1-giulio.benetti@benettiengineering.com>
References: <20211107024250.3061287-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfEhOhs+vGdulAIm/kRPHAGbbyXkrgRIWxdx7p1RAI1UJUTA0aNDShnXoiiKtbZmANOXOKbz86n4M0W6qrEzQ3qb6B980MuC9r2pU/zvzXhPjYHR4sLaR
 uzcdAhLUCe8VBCujriQx+gSHhLm/HfvwZhTwwTvTX/C4hW/XK3o12pwRV6EQWKGsIaD1TFjW3RMVpJSQ732pjK2dloLJDtVPULhJsu115g4iEX9UoQ14sQXP
 Ip03kegUKUrwH8kTMCMtO9kxPiIHD23XOdd3Wd3QCFc=
Subject: [Buildroot] [PATCH 058/102]
 board/orangepi/orangepi-one/genimage.cfg: beautify file
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Beatify this genimage .cfg file to have consistency with all genimage .cfg
files in Buildroot.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 board/orangepi/orangepi-one/genimage.cfg | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/board/orangepi/orangepi-one/genimage.cfg b/board/orangepi/orangepi-one/genimage.cfg
index 4640ff2b13..2a14dcdec2 100644
--- a/board/orangepi/orangepi-one/genimage.cfg
+++ b/board/orangepi/orangepi-one/genimage.cfg
@@ -8,6 +8,7 @@ image boot.vfat {
 			"boot.scr"
 		}
 	}
+
 	size = 10M
 }
 
@@ -18,8 +19,8 @@ image sdcard.img {
 	partition u-boot {
 		in-partition-table = "no"
 		image = "u-boot-sunxi-with-spl.bin"
-		offset = 8192
-		size = 1040384 # 1MB - 8192
+		offset = 8K
+		size = 1016K # 1MB - 8KB
 	}
 
 	partition boot {
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
