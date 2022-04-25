Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 352CAC433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Apr 2022 20:09:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DFFBB824E2;
	Mon, 25 Apr 2022 20:09:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BjwWh7J5_aES; Mon, 25 Apr 2022 20:09:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE31981BB0;
	Mon, 25 Apr 2022 20:09:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 29CC81BF989
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 20:09:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 270C04159D
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 20:09:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SGO8tLuQTVhG for <buildroot@lists.busybox.net>;
 Mon, 25 Apr 2022 20:09:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 27F7F4091D
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 20:09:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id E1635843C6; Mon, 25 Apr 2022 19:58:46 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 25 Apr 2022 21:51:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e83eca44966a4fa3111407eea09273d71f20ac38
X-Git-Newrev: 7663482d22d1fc69ede0617845085420143bbad0
X-Patchwork-Hint: ignore
Message-Id: <20220425195846.E1635843C6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wilc1000-firmware: bump to 15.6
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7663482d22d1fc69ede0617845085420143bbad0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Supports both WILC1000 (Wi-Fi only) and WILC3000 (Wi-Fi/BLE) hardware.

To support WILC3000 this commit adds a separate config option,
the original config option from this package is still valid.
This will be refactored in a follow-up commit.

There is now a license file.

Signed-off-by: Kris Bahnsen <kris@embeddedTS.com>
[Arnout: keep license as PROPRIETARY and add license file hash]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/wilc1000-firmware/Config.in              | 27 ++++++++++++++++++++--
 package/wilc1000-firmware/wilc1000-firmware.hash |  3 ++-
 package/wilc1000-firmware/wilc1000-firmware.mk   | 29 ++++++++++++++++--------
 3 files changed, 47 insertions(+), 12 deletions(-)

diff --git a/package/wilc1000-firmware/Config.in b/package/wilc1000-firmware/Config.in
index df8a7a6b60..0734c7ad99 100644
--- a/package/wilc1000-firmware/Config.in
+++ b/package/wilc1000-firmware/Config.in
@@ -1,6 +1,29 @@
 config BR2_PACKAGE_WILC1000_FIRMWARE
 	bool "wilc1000-firmware"
 	help
-	  Firmware for Atmel Wilc1000 wireless device
+	  Firmware for Microchip WILC1000 wireless device
 
-	  https://github.com/linux4sc/wireless-firmware.git
+	  These binary blobs are provided directly from Microchip.
+	  Ideally, the firmware version should match driver version.
+	  Generally, the latest firmware would be acceptible regardless
+	  of driver version.
+
+	  These will be installed to /lib/firmware/mchp/
+
+	  https://github.com/linux4wilc/firmware
+
+if BR2_PACKAGE_WILC1000_FIRMWARE
+config BR2_PACKAGE_WILC3000_FIRMWARE
+	bool "wilc3000-firmware"
+	help
+	  Firmware for Microchip WILC3000 wireless device
+
+	  These binary blobs are provided directly from Microchip.
+	  Ideally, the firmware version should match driver version.
+	  Generally, the latest firmware would be acceptible regardless
+	  of driver version.
+
+	  These will be installed to /lib/firmware/mchp/
+
+	  https://github.com/linux4wilc/firmware
+endif
diff --git a/package/wilc1000-firmware/wilc1000-firmware.hash b/package/wilc1000-firmware/wilc1000-firmware.hash
index 5344efe517..ef82dcdc45 100644
--- a/package/wilc1000-firmware/wilc1000-firmware.hash
+++ b/package/wilc1000-firmware/wilc1000-firmware.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 a2e7a327dd545ba2051946f7613005cbde88fdd952afb8eecdd1dacda7e767d2  v14.1_Firmware.zip
+sha256  29bb5739136cdb4088cb52af59badce05cc7e562bca40e9f29fef7f8f7c19cb8  wilc1000-firmware-wilc_linux_15_6.tar.gz
+sha256  71355eee947a312594dbdaac039827544f93d23949b65c356b7b0ce09e2600fb  LICENSE.wilc_fw
diff --git a/package/wilc1000-firmware/wilc1000-firmware.mk b/package/wilc1000-firmware/wilc1000-firmware.mk
index 6f504d67a0..a071272129 100644
--- a/package/wilc1000-firmware/wilc1000-firmware.mk
+++ b/package/wilc1000-firmware/wilc1000-firmware.mk
@@ -4,21 +4,32 @@
 #
 ################################################################################
 
-WILC1000_FIRMWARE_VERSION = 14.1
-WILC1000_FIRMWARE_SITE = https://github.com/linux4sc/wireless-firmware/archive
-WILC1000_FIRMWARE_SOURCE = v$(WILC1000_FIRMWARE_VERSION)_Firmware.zip
+WILC1000_FIRMWARE_VERSION = wilc_linux_15_6
+WILC1000_FIRMWARE_SITE = $(call github,linux4wilc,firmware,$(WILC1000_FIRMWARE_VERSION))
 
 WILC1000_FIRMWARE_LICENSE = PROPRIETARY
+WILC1000_FIRMWARE_LICENSE_FILES = LICENSE.wilc_fw
 
-define WILC1000_FIRMWARE_EXTRACT_CMDS
-	$(UNZIP) -d $(BUILD_DIR) $(WILC1000_FIRMWARE_DL_DIR)/$(WILC1000_FIRMWARE_SOURCE)
-	mv $(BUILD_DIR)/wireless-firmware-$(WILC1000_FIRMWARE_VERSION)_Firmware/* $(@D)
-	rmdir $(BUILD_DIR)/wireless-firmware-$(WILC1000_FIRMWARE_VERSION)_Firmware
+ifeq ($(BR2_PACKAGE_WILC1000_FIRMWARE),y)
+WILC1000_FIRMWARE_FILES += \
+	wilc1000_wifi_firmware.bin
+endif
+
+ifeq ($(BR2_PACKAGE_WILC3000_FIRMWARE),y)
+WILC1000_FIRMWARE_FILES += \
+	wilc3000_ble_firmware.bin \
+	wilc3000_wifi_firmware.bin
+endif
+
+define WILC1000_FIRMWARE_INSTALL_FILES
+	cd $(@D) && \
+		$(TAR) cf install.tar $(sort $(WILC1000_FIRMWARE_FILES)) && \
+		$(TAR) xf install.tar -C $(TARGET_DIR)/lib/firmware/mchp
 endef
 
 define WILC1000_FIRMWARE_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 0644 $(@D)/wilc1003_firmware.bin \
-		$(TARGET_DIR)/lib/firmware/atmel/wilc1003_firmware.bin
+	$(INSTALL) -d -m 0755 $(TARGET_DIR)/lib/firmware/mchp/
+	$(WILC1000_FIRMWARE_INSTALL_FILES)
 endef
 
 $(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
