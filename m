Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEB65C4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 10:37:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93AAD4180B;
	Mon,  5 Feb 2024 10:37:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93AAD4180B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OMMp34FuFHeR; Mon,  5 Feb 2024 10:37:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C6F74417F7;
	Mon,  5 Feb 2024 10:37:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6F74417F7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D46B41BF404
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:37:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AC9C1417F7
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:37:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC9C1417F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hwm2ymTLFn5c for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 10:37:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AB0B4417A1
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 10:37:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB0B4417A1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 96BE186ABF; Mon,  5 Feb 2024 10:37:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 11:37:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 035b4ee8a9ccacfa20c483595acaa65a1af4ad8f
X-Git-Newrev: 40e36cadf7e17a33408c35f078824109b34f7677
X-Patchwork-Hint: ignore
Message-Id: <20240205103709.96BE186ABF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/esp-hosted: bump version to
 2024-01-30
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=40e36cadf7e17a33408c35f078824109b34f7677
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

* support Linux 6.8
* support ESP32 and ESP32C6 Targets

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/esp-hosted/Config.in       | 14 ++++++++++++++
 package/esp-hosted/esp-hosted.hash |  2 +-
 package/esp-hosted/esp-hosted.mk   |  8 +++++++-
 3 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/package/esp-hosted/Config.in b/package/esp-hosted/Config.in
index 42e1afa8c5..5abab73b57 100644
--- a/package/esp-hosted/Config.in
+++ b/package/esp-hosted/Config.in
@@ -28,4 +28,18 @@ config BR2_PACKAGE_ESP_HOSTED_SPI
 
 endchoice
 
+choice
+	prompt "Target"
+	default BR2_PACKAGE_ESP_HOSTED_TARGET_ESP32
+	help
+	  Select which SoC Target driver is used for
+
+config BR2_PACKAGE_ESP_HOSTED_TARGET_ESP32
+	bool "ESP32"
+
+config BR2_PACKAGE_ESP_HOSTED_TARGET_ESP32C6
+	bool "ESP32C6"
+
+endchoice
+
 endif
diff --git a/package/esp-hosted/esp-hosted.hash b/package/esp-hosted/esp-hosted.hash
index b129bb42f9..ff0839076e 100644
--- a/package/esp-hosted/esp-hosted.hash
+++ b/package/esp-hosted/esp-hosted.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6e023c26355643f2aaf6d79d5910f64c49ea638063235d519075629643518a71  esp-hosted-ce3c50a33fa4bc562a1b6cbcee292c1ae0b0a404.tar.gz
+sha256  1c4df08132d5204a01adc2797e8f6f6d7ff945609b288cfe2dc2ea50789e8af4  esp-hosted-6a25417fc880fd744b3b0d93c11659c3e7d86384.tar.gz
 sha256  ed57d96d27be775b22f9571d3724ef84e0d0b8f24b805ec7f87a32189de19a9c  LICENSE
diff --git a/package/esp-hosted/esp-hosted.mk b/package/esp-hosted/esp-hosted.mk
index 578108c91d..cc61e39b36 100644
--- a/package/esp-hosted/esp-hosted.mk
+++ b/package/esp-hosted/esp-hosted.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ESP_HOSTED_VERSION = ce3c50a33fa4bc562a1b6cbcee292c1ae0b0a404
+ESP_HOSTED_VERSION = 6a25417fc880fd744b3b0d93c11659c3e7d86384
 ESP_HOSTED_SITE = $(call github,espressif,esp-hosted,$(ESP_HOSTED_VERSION))
 ESP_HOSTED_DEPENDENCIES = linux
 ESP_HOSTED_LICENSE = GPL-2.0
@@ -28,5 +28,11 @@ else
 ESP_HOSTED_MODULE_MAKE_OPTS = target=sdio
 endif
 
+ifeq ($(BR2_PACKAGE_ESP_HOSTED_TARGET_ESP32),y)
+ESP_HOSTED_MODULE_MAKE_OPTS += ESP_SLAVE=CONFIG_TARGET_ESP32=y
+else
+ESP_HOSTED_MODULE_MAKE_OPTS += ESP_SLAVE=CONFIG_TARGET_ESP32C6=y
+endif
+
 $(eval $(kernel-module))
 $(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
