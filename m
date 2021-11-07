Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5E79C433EF
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:40:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CC9E61881
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:40:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2CC9E61881
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 017DC6066B;
	Sun,  7 Nov 2021 02:40:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RV0HJ77vl1Er; Sun,  7 Nov 2021 02:40:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76AC660620;
	Sun,  7 Nov 2021 02:40:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BCEE01BF4DB
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:40:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BA16B60620
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:40:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8fH4MEKoDLMs for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 02:40:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0872.aruba.it (smtpcmd0872.aruba.it [62.149.156.72])
 by smtp3.osuosl.org (Postfix) with ESMTP id 69AD9605F5
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 02:40:51 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jY6zmunw8Ff01jY6zmqTVS; Sun, 07 Nov 2021 03:40:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636252850; bh=nbI5h1XjjPjoS3WGkMihWt7gM7QbwYdIG/UV8t6VOsY=;
 h=From:To:Subject:Date:MIME-Version;
 b=Y0UKVLs3IVydvh/u6d1JsUfpy3//bEndTCx+JjoeR3cwEsS+egVcdsMq50S92Kt7w
 3ECjhlbp06urwx6bszlPIBHvkJD+9j2pFgld9sODgc0zZGFhBnln/jvlnmZ7sIGE8R
 +NYzKVDjpdFZ5zy3G4D+3x3Zg30frknMakg6tHykArNBSXRXtgY7cGxBF19eQAUYEz
 s71woV2jME/f0iXTf1IGx/vB9kWQTBCXxKfX9j8XNjxD6nv5yebXX65T5rifcW0AFV
 JfsaC7Er7sygl6Ja3KjrYOtUmAwCPGESkGIZmT4PDjwBm57RnpjJyHpSdE8t+B+KHE
 FF/sSqKkRJxFQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 03:40:48 +0100
Message-Id: <20211107024048.3060908-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfAr/X2eEb002SoaTS3Hnc4WOHvtl4SKfwqxewJdV6c7c/TDJ4OLQU4z1OpUjGAAiEMasBmTM1Sv6tGzDUj0DXDLM1y6Jggn17TSOLCcR2iGYwQVUVJ5X
 FTCadOqhcrWIHmykvaa7a4kmj0Q6hTgXknusPDhJAERTij2BqyDU8l4dSHB0UwUv8UZTwkB3Q/pbriGAWfiYn9/3SM/aSKwT8+1xBQk/KJP2DrsTrpj/VDy9
 c3btz/UuvE4MWaZUd/pdQM9glnVs+E7X6owsEdI0v0g=
Subject: [Buildroot] [PATCH 045/102] board/licheepi/genimage.cfg: beautify
 file
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
 board/licheepi/genimage.cfg | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/board/licheepi/genimage.cfg b/board/licheepi/genimage.cfg
index 0d8540f2a0..8dcb2e708e 100644
--- a/board/licheepi/genimage.cfg
+++ b/board/licheepi/genimage.cfg
@@ -7,6 +7,7 @@ image boot.vfat {
 			"boot.scr"
 		}
 	}
+
 	size = 8M
 }
 
@@ -17,8 +18,8 @@ image sdcard.img {
 	partition u-boot {
 		in-partition-table = "no"
 		image = "u-boot-sunxi-with-spl.bin"
-		offset = 8192
-		size = 516096 # 512KB - 8192
+		offset = 8K
+		size = 504K # 512KB - 8KB
 	}
 
 	partition boot {
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
