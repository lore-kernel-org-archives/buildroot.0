Return-Path: <SRS0=Fi0H=PA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DF0FC433EF
	for <buildroot@archiver.kernel.org>; Tue, 12 Oct 2021 14:44:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B12760F23
	for <buildroot@archiver.kernel.org>; Tue, 12 Oct 2021 14:44:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0B12760F23
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=buildroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9777860B41;
	Tue, 12 Oct 2021 14:44:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OzTZxCUNGQtI; Tue, 12 Oct 2021 14:44:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0DCB660AE2;
	Tue, 12 Oct 2021 14:44:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 35B801BF681
 for <buildroot@lists.busybox.net>; Tue, 12 Oct 2021 14:43:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2487C60B3C
 for <buildroot@lists.busybox.net>; Tue, 12 Oct 2021 14:43:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KrFQPr8dJu94 for <buildroot@lists.busybox.net>;
 Tue, 12 Oct 2021 14:43:57 +0000 (UTC)
X-Greylist: delayed 00:06:34 by SQLgrey-1.8.0
Received: from mx.msync.work (hh0.msync.work [95.217.35.189])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2EB4460AE2
 for <buildroot@buildroot.org>; Tue, 12 Oct 2021 14:43:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 94C2814D136; Tue, 12 Oct 2021 14:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lexina.in; s=dkim;
 t=1634049440; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=a1zGBCh91chJcpm2YQFmDLOiW6xpW75ELPy/JYCDS8E=;
 b=ONUtLb0Fh8Xzpogi7z1/gt3f1jQZPEO/rC42M7GdeO6UZouwnz4Mv6Ci1yAEfgHoqhydQw
 YEDh3fFYTfpFjvCefq5dFK0QxwLkvs8p6IKym1EAgqKE2UfT3/cG3WKd0Dpu544YyLjegO
 0WVgTTUzopYkwx2EHcitUIB39ahcdDGGZYlIHX+QBEuvtZty8LVYRm1WtRuKVcONsPp4Dq
 x3qt98H8NhVHrrPfNz/1wVfUaT6aywbmeLg1O4J4o05Yr11n2TQheH/GO+ezJkoHYvWuVi
 hV5KQHVLlWAd8oTRnG1gLg/ZhLOWWtxga+vscp9KuAbpJo2pPAZUClIuHxeX8Q==
To: buildroot@buildroot.org
Date: Tue, 12 Oct 2021 17:36:54 +0300
Message-Id: <20211012143653.830644-1-adeep@lexina.in>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH 1/1] package/armbian-firmware: bump to commit
 a1df8ab2ffbac51a8260905dd841bf825cf1bc53
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
From: Vyacheslav Bocharov via buildroot <buildroot@buildroot.org>
Reply-To: Vyacheslav Bocharov <adeep@lexina.in>
Cc: Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update package/armbian-firmware to latest commit.
Add config options for AP6255 and Realtek 8822CS WiFi/BT combo chips.

Signed-off-by: Vyacheslav Bocharov <adeep@lexina.in>
---
 package/armbian-firmware/Config.in            | 10 ++++++++
 .../armbian-firmware/armbian-firmware.hash    |  2 +-
 package/armbian-firmware/armbian-firmware.mk  | 23 ++++++++++++++++++-
 3 files changed, 33 insertions(+), 2 deletions(-)

diff --git a/package/armbian-firmware/Config.in b/package/armbian-firmware/Config.in
index 7c5f6ba193..7fb654b6d5 100644
--- a/package/armbian-firmware/Config.in
+++ b/package/armbian-firmware/Config.in
@@ -18,6 +18,16 @@ config BR2_PACKAGE_ARMBIAN_FIRMWARE_AP6256
 	help
 	  Firmware files for AP6256 WiFi/BT combo chip.
 
+config BR2_PACKAGE_ARMBIAN_FIRMWARE_AP6255
+	bool "AP6255 WiFi/BT"
+	help
+	  Firmware files for AP6255 WiFi/BT combo chip.
+
+config BR2_PACKAGE_ARMBIAN_FIRMWARE_RTL8822CS
+	bool "Realtek 8822CS SDIO WiFi/BT"
+	help
+	  Firmware files for Realtek 8822CS SDIO combo chip.
+
 config BR2_PACKAGE_ARMBIAN_FIRMWARE_XR819
 	bool "XR819 WiFi"
 	help
diff --git a/package/armbian-firmware/armbian-firmware.hash b/package/armbian-firmware/armbian-firmware.hash
index ceefafd97c..16bc1a2978 100644
--- a/package/armbian-firmware/armbian-firmware.hash
+++ b/package/armbian-firmware/armbian-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  a370a6aeb30f12a17f8d47c81a4d81aa822b9408589305a4d6a67d544280520d  armbian-firmware-70a08503ac9e765f5d1ccf4fa3e825db0751e53e-br1.tar.gz
+sha256  2e61dc5e43f6011868417504f6633e6de6c220ee48fba3b58823e4ce33a6b933  armbian-firmware-a1df8ab2ffbac51a8260905dd841bf825cf1bc53-br1.tar.gz
diff --git a/package/armbian-firmware/armbian-firmware.mk b/package/armbian-firmware/armbian-firmware.mk
index 0ed069025d..5974d4428d 100644
--- a/package/armbian-firmware/armbian-firmware.mk
+++ b/package/armbian-firmware/armbian-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ARMBIAN_FIRMWARE_VERSION = 70a08503ac9e765f5d1ccf4fa3e825db0751e53e
+ARMBIAN_FIRMWARE_VERSION = a1df8ab2ffbac51a8260905dd841bf825cf1bc53
 ARMBIAN_FIRMWARE_SITE = https://github.com/armbian/firmware
 ARMBIAN_FIRMWARE_SITE_METHOD = git
 
@@ -21,6 +21,27 @@ ARMBIAN_FIRMWARE_FILES += \
 	brcm/brcmfmac43456-sdio.txt
 endif
 
+# AP6255 WiFi/BT combo firmware
+ifeq ($(BR2_PACKAGE_ARMBIAN_FIRMWARE_AP6255),y)
+ARMBIAN_FIRMWARE_FILES += \
+        BCM4345C0.hcd \
+        fw_bcm43455c0_ag.bin \
+        fw_bcm43455c0_ag_apsta.bin \
+        fw_bcm43455c0_ag_p2p.bin \
+        nvram_ap6255.txt \
+        brcm/brcmfmac43455-sdio.bin \
+        brcm/brcmfmac43455-sdio.clm_blob \
+        brcm/brcmfmac43455-sdio.txt \
+        brcm/config.txt
+endif
+
+# Realtek 8822CS SDIO WiFi/BT combo firmware
+ifeq ($(BR2_PACKAGE_ARMBIAN_FIRMWARE_RTL8822CS),y)
+ARMBIAN_FIRMWARE_FILES += \
+	rtlbt/rtl8822cs_config \
+	rtlbt/rtl8822cs_fw
+endif
+
 # XR819 WiFi firmware
 ifeq ($(BR2_PACKAGE_ARMBIAN_FIRMWARE_XR819),y)
 ARMBIAN_FIRMWARE_FILES += \
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
