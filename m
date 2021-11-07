Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DEF8C433EF
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:49:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CAE6C61884
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:49:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CAE6C61884
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A463A80CDD;
	Sun,  7 Nov 2021 02:49:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cit7fRABvkQd; Sun,  7 Nov 2021 02:49:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1112A80C69;
	Sun,  7 Nov 2021 02:49:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 604791BF4DB
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:45:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 50A9E60620
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:45:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vRtr0jRc8g-u for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 02:45:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14162.aruba.it (smtpcmd14162.aruba.it [62.149.156.162])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8A68F605F5
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 02:45:15 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jY9bmqwt8rIRljYBHmR7p9; Sun, 07 Nov 2021 03:45:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636253115; bh=Lt2wWeuwFabD1XPPIHOYcFYYOBes2g1hHjeco+aqO4k=;
 h=From:To:Subject:Date:MIME-Version;
 b=YWlLDyzh189epNOs70pj9SdvD+IyH0BYndqlQ3CoTNbK4/gya1yTiuCITq824dPBj
 EtkZvuetKiX6QHHvGWxJR7vJzpTPP7mG+h6TQWS5ypgKbDVSskZ+487w3Z9FkrrOK/
 Kl3DxdQz4zewSa1YwMhulREf8sdaoNTqykfwBw2A50WXWKLIqGEwVxFygoP+Vetev0
 Q1DYkoxgsIBV7z7xktMV/YUoshvheufPedB3XiPOkWi51SmwZgj6PWSYf8Cn5+1dI8
 fweNXnHa+m0OT7aPjwwj6XI59h4Th2wJ5NNosCa3st1JsGTHgJ7ZhIGUz/DksvWuxt
 s/H4cFMVEKqEw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 03:43:14 +0100
Message-Id: <20211107024330.3061378-27-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211107024330.3061378-1-giulio.benetti@benettiengineering.com>
References: <20211107024330.3061378-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfB5WdLruppgZor19Sse1J2jp1i6oGq7IUTDa2VuJkIJQhAgzpLJO2a++1GkLB+VQ4roPxDwq3GSySrgVQlDpJlvdPhUUxld303uGXopKWw4ri1OoaweN
 i3N5Iz05a+vocL3ugaZ21zRAj5Qer2zfCDRD3Vt/VN4EzyLCmDuIETmc4hu8txVNP55i17F428B4+NDSQ0Tlfn3xkINmHlgsNOW1xttL9tEynQU5dr55Tt7y
 4r39PYndsgRse5qwm20g8KWd5Ly/+ignrZvFE8jIy1o=
Subject: [Buildroot] [PATCH 086/102]
 board/raspberrypi/genimage-raspberrypi3.cfg: beautify file
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
 board/raspberrypi/genimage-raspberrypi3.cfg | 53 +++++++++++----------
 1 file changed, 27 insertions(+), 26 deletions(-)

diff --git a/board/raspberrypi/genimage-raspberrypi3.cfg b/board/raspberrypi/genimage-raspberrypi3.cfg
index 0a547241f4..a617823379 100644
--- a/board/raspberrypi/genimage-raspberrypi3.cfg
+++ b/board/raspberrypi/genimage-raspberrypi3.cfg
@@ -1,33 +1,34 @@
 image boot.vfat {
-  vfat {
-    files = {
-      "bcm2710-rpi-3-b.dtb",
-      "bcm2710-rpi-3-b-plus.dtb",
-      "bcm2710-rpi-cm3.dtb",
-      "rpi-firmware/bootcode.bin",
-      "rpi-firmware/cmdline.txt",
-      "rpi-firmware/config.txt",
-      "rpi-firmware/fixup.dat",
-      "rpi-firmware/start.elf",
-      "rpi-firmware/overlays",
-      "zImage"
-    }
-  }
-  size = 32M
+	vfat {
+		files = {
+			"bcm2710-rpi-3-b.dtb",
+			"bcm2710-rpi-3-b-plus.dtb",
+			"bcm2710-rpi-cm3.dtb",
+			"rpi-firmware/bootcode.bin",
+			"rpi-firmware/cmdline.txt",
+			"rpi-firmware/config.txt",
+			"rpi-firmware/fixup.dat",
+			"rpi-firmware/start.elf",
+			"rpi-firmware/overlays",
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
