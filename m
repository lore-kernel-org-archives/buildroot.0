Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67654C36002
	for <buildroot@archiver.kernel.org>; Wed,  9 Apr 2025 20:07:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CFF3412B0;
	Wed,  9 Apr 2025 20:07:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9W75_Gky8-aW; Wed,  9 Apr 2025 20:07:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3FF9F411D7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3FF9F411D7;
	Wed,  9 Apr 2025 20:07:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 97DEED6
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 20:07:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 93E1361102
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 20:07:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gRvmSMfFgZiF for <buildroot@buildroot.org>;
 Wed,  9 Apr 2025 20:07:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D9BEA610DC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D9BEA610DC
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 20:07:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D30B583F6C; Wed,  9 Apr 2025 20:07:42 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 9 Apr 2025 21:54:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2c18a7d235dda7a91604c19fdba8d57de4fadd71
X-Git-Newrev: e40db2ac5526574df66407236bf771755abe9f8a
X-Patchwork-Hint: ignore
Message-Id: <20250409200742.D30B583F6C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/esp-hosted: bump to version
 2025-04-08
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e40db2ac5526574df66407236bf771755abe9f8a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This version add support for esp32c5 and local patch has been committed so
drop it.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/esp-hosted/0001-Fix-Linux-6.13.patch | 35 ----------------------------
 package/esp-hosted/esp-hosted.hash           |  2 +-
 package/esp-hosted/esp-hosted.mk             |  2 +-
 3 files changed, 2 insertions(+), 37 deletions(-)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
