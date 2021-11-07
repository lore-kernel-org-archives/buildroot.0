Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1CD9C433F5
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:51:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 850FD61881
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:51:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 850FD61881
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62ACF6066C;
	Sun,  7 Nov 2021 02:51:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zqlebmecwD5L; Sun,  7 Nov 2021 02:51:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A74D060670;
	Sun,  7 Nov 2021 02:51:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 177501BF4DB
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:45:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B2E9E402C6
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:45:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I8ay9oJJE9ZW for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 02:45:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14162.aruba.it (smtpcmd14162.aruba.it [62.149.156.162])
 by smtp4.osuosl.org (Postfix) with ESMTP id DF18F402B3
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 02:45:24 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jY9bmqwt8rIRljYBQmR7tr; Sun, 07 Nov 2021 03:45:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636253124; bh=/3jyO8YJXHlPq+1LVF7dYSG2fXN0WiSAFN3xFoOSp/w=;
 h=From:To:Subject:Date:MIME-Version;
 b=ha9ZtEJmcjuV2Y6he7HU5LIfln2IWtPt6ocI7Y+3g2dhsVtDJ6xyGHaqUKwvtPszY
 EoXK1yKwo+HzPlNI8K3XigpK5PtI7dTNbmAzZPZ5xk2yvWs0bHx6spH4kp1ZjEAGGB
 QxZlHEN9x/+EmKKqIpTK3uDhYorD0hYoLV4Rh8ufK4csebj3Z4RCJMgPRL08wrHN3p
 jzSvdM3JEOTfydvkPXLQN0UWPO8Fe7ncONiE+mSCn1ZHSEcV3BFRLutWeXg/p43l0z
 DzPtPe3R6ygg+Ihai3tlB4RFBR02q0YXd1iJvRDbqp6TP4NPnEvcizMWgTJB5/W2wo
 fAgttzQJLNKAg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 03:43:24 +0100
Message-Id: <20211107024330.3061378-37-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211107024330.3061378-1-giulio.benetti@benettiengineering.com>
References: <20211107024330.3061378-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfJ4LgeG2AZRlbmlEyEjveNIPPS5emfZxNH7jNpRK4tGLQmKYQSh35RS9IeADJzazM4cZtjjkunM56uIdvDCRwc+6/EOP19cy9lTUUqWfLnJ3fohL6tyS
 hRPdH5bpEmGcXIN+iCEbOHwH5e9el7u1SPgmjY3enKpUdnaXz3lAalA8DA9rsntdyZHP5Ew4t5i9rYq2X/xUqby6gRwl59AtFZERP4KzSPdGFmpUpOFH0ijP
 xq9LhDepQPaPibKxvN8gI8286CnwLDOzkkP8vpDcm74=
Subject: [Buildroot] [PATCH 096/102] board/synopsys/hsdk/genimage.cfg:
 beautify file
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
 board/synopsys/hsdk/genimage.cfg | 42 +++++++++++++++++---------------
 1 file changed, 22 insertions(+), 20 deletions(-)

diff --git a/board/synopsys/hsdk/genimage.cfg b/board/synopsys/hsdk/genimage.cfg
index 9103b20299..b5d702d553 100644
--- a/board/synopsys/hsdk/genimage.cfg
+++ b/board/synopsys/hsdk/genimage.cfg
@@ -1,27 +1,29 @@
 image boot.vfat {
-  vfat {
-    files = {
-      "uImage"
-    }
-    file uboot.env {
-      image = "uboot-env.bin"
-    }
-  }
-  size = 20M
+	vfat {
+		files = {
+			"uImage"
+		}
+
+		file uboot.env {
+			image = "uboot-env.bin"
+		}
+	}
+
+	size = 20M
 }
 
 image sdcard.img {
-  hdimage {
-  }
+	hdimage {
+	}
 
-  partition boot {
-    partition-type = 0xC
-    bootable = "true"
-    image = "boot.vfat"
-  }
+	partition boot {
+		partition-type = 0xC
+		bootable = "true"
+		image = "boot.vfat"
+	}
 
-  partition rootfs {
-    partition-type = 0x83
-    image = "rootfs.ext4"
-  }
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+	}
 }
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
