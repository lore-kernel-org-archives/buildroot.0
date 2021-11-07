Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A789C433F5
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:48:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6C3361353
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:48:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C6C3361353
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A3BD780C50;
	Sun,  7 Nov 2021 02:48:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AuV-24sSnmuG; Sun,  7 Nov 2021 02:48:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B7A280BD2;
	Sun,  7 Nov 2021 02:48:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9CE351BF4DB
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:44:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 997AB4022C
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:44:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y9OjcP4yDFRE for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 02:44:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14162.aruba.it (smtpcmd14162.aruba.it [62.149.156.162])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9AE8D400EA
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 02:44:34 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jY9bmqwt8rIRljYAcmR7Z6; Sun, 07 Nov 2021 03:44:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636253074; bh=ooWW7cZN3iU4X9xHxJBb/++lo4wZPY2WTJdvkkH2I50=;
 h=From:To:Subject:Date:MIME-Version;
 b=GaESQZbrhyJbCz92VtTrTOE1dMWugpn1St6aiiF2gwZqtgNQuj52Voo77xPDITmWx
 JTD7Z761V3EwtThH3/+AfWW04HKFTXUvYMj0UfBMPV3Wz0j6Ev/3KQgR8kCOJkfu6c
 5OsUoHH09Mq2vNVUXyuX6VakgJolQcAN4suGBopf7D+m+Bha5W/uvNgBlADBrLwL45
 R2RO++aM4Dgg/yfu97+Y5+kGinzWl4EeezFr1LaHUcXxEJFWfbwVM8rvsGEl4NtLcb
 CyT7op8g+L+R9ghS5Uh/mV7uFBFrmiEndbToQRFcR2n+Y1zjoFBEDUWUYmYQ3CED6J
 3qA4xMSWUuvaQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 03:43:09 +0100
Message-Id: <20211107024330.3061378-22-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211107024330.3061378-1-giulio.benetti@benettiengineering.com>
References: <20211107024330.3061378-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfCffX/IFQTu+kiZy5r0g4dwYImiXqja+HBCk8LrbckecTQa0mDutVH8yu7eS0YorxYWJ4k45VyvhHuMAoHEVuG9LT9+NE25IEwlRf7Iy/Zhjoqsz91j1
 9vtapmwGhSAOjkz7vvH8MisYed9ET5/OIhSXd8iiDogquuCGidvFFw4mP3nj+aALkG9i91bBI1/jrOEHABZW7sWd8B2G6fDsEiS2emT2kqVqBY7nJmfPAgTS
 t68d8+Rtu2FGayzU44P3gh/Yi0NiLiVUsCdVY0QaFt0=
Subject: [Buildroot] [PATCH 081/102]
 board/raspberrypi/genimage-raspberrypi.cfg: beautify file
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
 board/raspberrypi/genimage-raspberrypi.cfg | 51 +++++++++++-----------
 1 file changed, 26 insertions(+), 25 deletions(-)

diff --git a/board/raspberrypi/genimage-raspberrypi.cfg b/board/raspberrypi/genimage-raspberrypi.cfg
index bd5166a0f3..04be16cce6 100644
--- a/board/raspberrypi/genimage-raspberrypi.cfg
+++ b/board/raspberrypi/genimage-raspberrypi.cfg
@@ -1,32 +1,33 @@
 image boot.vfat {
-  vfat {
-    files = {
-      "bcm2708-rpi-b.dtb",
-      "bcm2708-rpi-b-plus.dtb",
-      "bcm2708-rpi-cm.dtb",
-      "rpi-firmware/bootcode.bin",
-      "rpi-firmware/cmdline.txt",
-      "rpi-firmware/config.txt",
-      "rpi-firmware/fixup.dat",
-      "rpi-firmware/start.elf",
-      "zImage"
-    }
-  }
-  size = 32M
+	vfat {
+		files = {
+			"bcm2708-rpi-b.dtb",
+			"bcm2708-rpi-b-plus.dtb",
+			"bcm2708-rpi-cm.dtb",
+			"rpi-firmware/bootcode.bin",
+			"rpi-firmware/cmdline.txt",
+			"rpi-firmware/config.txt",
+			"rpi-firmware/fixup.dat",
+			"rpi-firmware/start.elf",
+			"zImage"
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
