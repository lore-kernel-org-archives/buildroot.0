Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA7C6C433F5
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:49:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 738D3611C0
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:49:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 738D3611C0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5216D6066F;
	Sun,  7 Nov 2021 02:49:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M8cFz4DT7WuF; Sun,  7 Nov 2021 02:49:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8770A60620;
	Sun,  7 Nov 2021 02:49:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AD6811BF4DB
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:45:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9C8C04022C
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:45:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6pQOb_U02qGG for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 02:45:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14162.aruba.it (smtpcmd14162.aruba.it [62.149.156.162])
 by smtp2.osuosl.org (Postfix) with ESMTP id 98597400EA
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 02:45:16 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jY9bmqwt8rIRljYBImR7pq; Sun, 07 Nov 2021 03:45:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636253116; bh=u0MCqyuRyMI2WP1YV8jyp+OaE0FFB56sthh/snHm45w=;
 h=From:To:Subject:Date:MIME-Version;
 b=PVXQh0TCp+/QjWq6zo3o7DS7WBmVLQBCJQNCfjwD6MRXIvU3v2ipXqatomjJbihqX
 u0Esxv33ATs1IEoCSD/Wm8p3Nz6Kdx3PdFdJEqi5BUOqNhg7GEb/KK1Ciwm8p4O32d
 sS/bsXfv7vKRf/gm4L1nAr1NhwHFa/AQx/XMLN/nOkpPf+WERicv0e9oHRwc10ohna
 QRKUBQc0f0DHnOTV76SKSeJo64yBJlxmdgVg39zKESUL7SktDa4ls0/K43VJRxZhfW
 fTPx0jCkcSHC7GlzS5sBD9ABrCU9TJaAcOhqyp0avvL+nNgRVnYJGJbXHuyhA//wr4
 4SjxNnXpvwMmw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 03:43:15 +0100
Message-Id: <20211107024330.3061378-28-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211107024330.3061378-1-giulio.benetti@benettiengineering.com>
References: <20211107024330.3061378-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfNyigo+w2aM2LHd36JDtaciszP5sbnRIWZcwxaganUN2T6qXlZMTj7QKhVdIwNh0hUwMfTlDSl6Xc/BhqNmVo+7ivGCuofjt1h2C2WiKy+Jyl62vpMzz
 uV7/JNFzxY1aMcPKJWY3Gf4ksTKr+uDFFH0HavqG/zFTbO4rreSf5O1Fjpj7zZpA+CeA5Oi5PO3nHNyio3prxRNlNhLTupNVvnVFXeieM8njIW0CVC/M9yyx
 gCoK7hQS3q+2ib+8URUeme7d/Z64vPeAFvLdOGpOhrg=
Subject: [Buildroot] [PATCH 087/102]
 board/raspberrypi/genimage-raspberrypi4-64.cfg: beautify file
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
 .../raspberrypi/genimage-raspberrypi4-64.cfg  | 47 ++++++++++---------
 1 file changed, 24 insertions(+), 23 deletions(-)

diff --git a/board/raspberrypi/genimage-raspberrypi4-64.cfg b/board/raspberrypi/genimage-raspberrypi4-64.cfg
index 3c480e98f0..3ae938db20 100644
--- a/board/raspberrypi/genimage-raspberrypi4-64.cfg
+++ b/board/raspberrypi/genimage-raspberrypi4-64.cfg
@@ -1,30 +1,31 @@
 image boot.vfat {
-  vfat {
-    files = {
-      "bcm2711-rpi-4-b.dtb",
-      "rpi-firmware/cmdline.txt",
-      "rpi-firmware/config.txt",
-      "rpi-firmware/fixup4.dat",
-      "rpi-firmware/start4.elf",
-      "rpi-firmware/overlays",
-      "Image"
-    }
-  }
-  size = 32M
+	vfat {
+		files = {
+			"bcm2711-rpi-4-b.dtb",
+			"rpi-firmware/cmdline.txt",
+			"rpi-firmware/config.txt",
+			"rpi-firmware/fixup4.dat",
+			"rpi-firmware/start4.elf",
+			"rpi-firmware/overlays",
+			"Image"
+		}
+	}
+
+	size = 32M
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
