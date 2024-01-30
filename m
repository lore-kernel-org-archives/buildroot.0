Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63507C47DDF
	for <buildroot@archiver.kernel.org>; Tue, 30 Jan 2024 11:05:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F10F64012B;
	Tue, 30 Jan 2024 11:05:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F10F64012B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4rvdKJvV57Do; Tue, 30 Jan 2024 11:05:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C36E040377;
	Tue, 30 Jan 2024 11:05:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C36E040377
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9F6601BF681
 for <buildroot@lists.busybox.net>; Tue, 30 Jan 2024 11:05:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 77DF26106E
 for <buildroot@lists.busybox.net>; Tue, 30 Jan 2024 11:05:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 77DF26106E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bFUhxcBbC_Wc for <buildroot@lists.busybox.net>;
 Tue, 30 Jan 2024 11:05:09 +0000 (UTC)
Received: from smtpcmd14162.aruba.it (smtpcmd14162.aruba.it [62.149.156.162])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A948361055
 for <buildroot@buildroot.org>; Tue, 30 Jan 2024 11:05:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A948361055
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id UlvNrUeImDtMOUlvOrahqz; Tue, 30 Jan 2024 12:05:06 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 30 Jan 2024 12:05:04 +0100
Message-Id: <20240130110504.559989-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfDP2NjvofWs+k5XLJ557WZBk/4ai/HulFU0fVxz0TDFRK3+0GJ7sLe9+F4nj7zqybwXjuPdDf7YrwBAgsPHmzSCcH953/WkRZCF23N7dj4ArGllsp5st
 R3QRxUPMuTe9ukZQYuAGHZG7djuBPHisuedvq6prtvh0fPCNhECQWQInFJ8gCW/5VMtIA/596pKkwtu4AWi8uObBGpyOhbWQnmvJ0TOVOTzVhSFcJJBQiDYv
 17t2+xm1SRpCTT97JSthiFtipz6vkc4hLXmHBHWSmbI=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1706612706; bh=7BV83t9aYZEtT3+SLNcX9kbTYjIxLZhmbZpXmQ9iFsM=;
 h=From:To:Subject:Date:MIME-Version;
 b=VR2UcH8GzaRgTzmRBdKNEE68tdLZtYVpPawckTHKsBId7tUUyt2G6s/Jo28xypRDp
 YgjZJousWNosv4bDdI3fL/TzGgufGyBZy3oNPbfvQCQVphl6GtsS0Xpq/bTZTeIPOV
 xuaFUg1knFGVJcalsEo1iyELZbbha7jXo3p7rq+V1aWSnk5AL3/q6dkw0IT4WQ1jN6
 eH2q9ZE1TZHxmTztkcmOL9fxrINU7xKLbHSMZ9EV1Q7Pshz9c84DSCkGhB0aUcCjPN
 l6T58+vGoRuzPDtEx2gZMgWEQJgjDwkOT30/2r1Bar1BgIC0AwymRK/0L8qa9XDooa
 3RoJCythYLxDQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=VR2UcH8G
Subject: [Buildroot] [PATCH v2] package/esp-hosted: bump version to
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

* support Linux 6.8
* support ESP32 and ESP32C6 Targets

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
V1->V2:
* drop local patches since they have been upstreamed
* update commit log since Linux 6.8 is supported
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
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
