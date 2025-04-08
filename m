Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ECD8C36010
	for <buildroot@archiver.kernel.org>; Tue,  8 Apr 2025 19:48:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 64502611AF;
	Tue,  8 Apr 2025 19:48:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fu7W462gecvu; Tue,  8 Apr 2025 19:48:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7FC9B6116D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7FC9B6116D;
	Tue,  8 Apr 2025 19:48:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A29EDDA
 for <buildroot@buildroot.org>; Tue,  8 Apr 2025 19:48:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 943B140531
 for <buildroot@buildroot.org>; Tue,  8 Apr 2025 19:48:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dM1uottoE_YQ for <buildroot@buildroot.org>;
 Tue,  8 Apr 2025 19:48:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.221;
 helo=smtpcmd01-s.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D588040580
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D588040580
Received: from smtpcmd01-s.aruba.it (smtpcmd01-s.aruba.it [62.149.158.221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D588040580
 for <buildroot@buildroot.org>; Tue,  8 Apr 2025 19:48:12 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id 2EvYuQLmHRBkH2EvZumOB8; Tue, 08 Apr 2025 21:48:09 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Tue,  8 Apr 2025 21:48:08 +0200
Message-Id: <20250408194808.53576-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfKggk/BjsXHvBdyjoAibg89ApB4gHjvR9kLyr83zokauaWOH0NqAAp1XA9lDLI8evpbsi0GYt0gCiLS2mtFd7xskVjmTWqaGVz1FUdT+ckwPz2PeutMV
 h53WVxzv+2S7rz+X/NG5I9LwmqPoBUj1PMIBPfnSUmzl5yjUurLCJvyirkxpghLp0senCo4XpRCyx8KSf4k5xPoRO3SX3CEd7Jd0n69QvLyKtfj6ifHZEZfb
 48ydRZoxR3875uLG01VltmQmn4Df0xOdt+kP1ltRJa8=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1744141689; bh=OZ1QkNIvwI2NukYLSJmpdsQASbSDZc5CPPq+Em1RDww=;
 h=From:To:Subject:Date:MIME-Version;
 b=iIvhB6mQAtEHfEdj2PxZ/fJhBFWseu1cLQ6vmYbonRpb1nWMGF9yoZ4fQGbkD40Vt
 CcfrrDOKEWmf6twL2p5TscLznPiQZp/jt4m3Hr10baH5Jjoea65eJ869FL1lH4YzR4
 FEgknE+FNGmZNyMzycDEM/myATALXWUE/67k++Oz983RaBSvTv5Zi6dEt/WapFg1MK
 6NCD7R4xBeeiNAZTCQU7BLk0ju+Fcyi8O9Cmey19Fw5uZ2n+WWl2/XYID3IgAb5tLt
 kHiBKf4NIYMdBcHjkj3fblf+GbCZ0cwhB7j9xl6rwHRuSJfEWZagIbe5JoyRgjh/d1
 E1qQJP9nmvK0g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=temperror header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=iIvhB6mQ
Subject: [Buildroot] [PATCH] package/esp-hosted: bump to version 2025-04-08
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

This version add support for esp32c5 and local patch has been committed so
drop it.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/esp-hosted/0001-Fix-Linux-6.13.patch | 35 --------------------
 package/esp-hosted/esp-hosted.hash           |  2 +-
 package/esp-hosted/esp-hosted.mk             |  2 +-
 3 files changed, 2 insertions(+), 37 deletions(-)
 delete mode 100644 package/esp-hosted/0001-Fix-Linux-6.13.patch

diff --git a/package/esp-hosted/0001-Fix-Linux-6.13.patch b/package/esp-hosted/0001-Fix-Linux-6.13.patch
deleted file mode 100644
index 98f86e8a8f..0000000000
--- a/package/esp-hosted/0001-Fix-Linux-6.13.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From f41f4a55e7787c9517ca6ac72f83dc244b4011e4 Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Date: Sat, 5 Apr 2025 00:35:23 +0200
-Subject: [PATCH] Fix Linux 6.13
-
-With Linux commit:
-https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=0809a9ccac4a2ffdfd1561bb551aec6099775545
-spi_alloc_master() has been renamed to spi_alloc_host() so let's rename it
-accordingly checking for Linux version 6.13.0.
-
-Upstream: https://github.com/espressif/esp-hosted/pull/589
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- esp_hosted_ng/host/spi/esp_spi.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/esp_hosted_ng/host/spi/esp_spi.c b/esp_hosted_ng/host/spi/esp_spi.c
-index 51df26d8d7..fc63487821 100644
---- a/esp_hosted_ng/host/spi/esp_spi.c
-+++ b/esp_hosted_ng/host/spi/esp_spi.c
-@@ -394,7 +394,11 @@ static struct spi_controller *spi_busnum_to_master(u16 bus_num)
- 	pdev->num_resources = 0;
- 	platform_device_add(pdev);
- 
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 13, 0))
-+	master = spi_alloc_host(&pdev->dev, sizeof(void *));
-+#else
- 	master = spi_alloc_master(&pdev->dev, sizeof(void *));
-+#endif
- 	if (!master) {
- 		pr_err("Error: failed to allocate SPI master device\n");
- 		platform_device_del(pdev);
--- 
-2.39.5
-
diff --git a/package/esp-hosted/esp-hosted.hash b/package/esp-hosted/esp-hosted.hash
index ac0164c38c..8de3c00190 100644
--- a/package/esp-hosted/esp-hosted.hash
+++ b/package/esp-hosted/esp-hosted.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  7fd95a9b47c203a8bd0fdcab21f15c9d4cf1cad936f0206a94da0d932dd42206  esp-hosted-927a34f99724bb744efaf865a7c75cc1615f59a2.tar.gz
+sha256  66c07e2f69d8a10fb111b6df27fbe3558734d660207a54391c46eea3e12b29ee  esp-hosted-9a2312b0b2630e41bacb3091faaba489cb43b0ab.tar.gz
 sha256  ed57d96d27be775b22f9571d3724ef84e0d0b8f24b805ec7f87a32189de19a9c  LICENSE
diff --git a/package/esp-hosted/esp-hosted.mk b/package/esp-hosted/esp-hosted.mk
index f4382e7fee..4c249eec46 100644
--- a/package/esp-hosted/esp-hosted.mk
+++ b/package/esp-hosted/esp-hosted.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ESP_HOSTED_VERSION = 927a34f99724bb744efaf865a7c75cc1615f59a2
+ESP_HOSTED_VERSION = 9a2312b0b2630e41bacb3091faaba489cb43b0ab
 ESP_HOSTED_SITE = $(call github,espressif,esp-hosted,$(ESP_HOSTED_VERSION))
 ESP_HOSTED_DEPENDENCIES = linux
 ESP_HOSTED_LICENSE = GPL-2.0
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
