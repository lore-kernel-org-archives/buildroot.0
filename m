Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F07EC433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Apr 2022 20:09:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D72FF82864;
	Mon, 25 Apr 2022 20:09:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qsdzk9Mtb_Pd; Mon, 25 Apr 2022 20:09:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D49BC814B8;
	Mon, 25 Apr 2022 20:09:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E7EA61BF2AB
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 20:09:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E43724014E
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 20:09:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V0VHThn1J2ZC for <buildroot@lists.busybox.net>;
 Mon, 25 Apr 2022 20:09:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 339334014D
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 20:09:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id F1509843C9; Mon, 25 Apr 2022 19:58:46 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 25 Apr 2022 21:53:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7663482d22d1fc69ede0617845085420143bbad0
X-Git-Newrev: 244f607f4c4a2e0609d1fb8e8b62c4ae751b8136
X-Patchwork-Hint: ignore
Message-Id: <20220425195846.F1509843C9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wilc-firmware: rename from
 wilc1000-firmware
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

commit: https://git.buildroot.net/buildroot/commit/?id=244f607f4c4a2e0609d1fb8e8b62c4ae751b8136
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Separates out WILC1000 and WILC3000 in to individual config options
since in reality only one or the other set would be needed.

Signed-off-by: Kris Bahnsen <kris@embeddedTS.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS                                         |  5 ++++-
 package/Config.in                                  |  2 +-
 .../{wilc1000-firmware => wilc-firmware}/Config.in |  9 +++++++--
 .../wilc-firmware.hash}                            |  2 +-
 .../wilc-firmware.mk}                              | 22 +++++++++++-----------
 5 files changed, 24 insertions(+), 16 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 1bb90f8f33..ff9f787e9c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1662,6 +1662,9 @@ F:	board/octavo/osd32mp1-red/
 F:	configs/octavo_osd32mp1_brk_defconfig
 F:	configs/octavo_osd32mp1_red_defconfig
 
+N:	Kris Bahnsen <kris@embeddedTS.com>
+F:	package/wilc-firmware/
+
 N:	Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
 F:	package/bcusdk/
 F:	package/libpthsem/
@@ -1759,7 +1762,7 @@ F:	package/python-json-schema-validator/
 F:	package/python-keyring/
 F:	package/python-simplejson/
 F:	package/python-versiontools/
-F:	package/wilc1000-firmware/
+F:	package/wilc-firmware/
 
 N:	Maeva Manuel <maeva.manuel@oss.nxp.com>
 F:	board/freescale/imx8qmmek/
diff --git a/package/Config.in b/package/Config.in
index bee1590e85..7d03bc51d7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -432,7 +432,7 @@ menu "Firmware"
 	source "package/sunxi-boards/Config.in"
 	source "package/ts4900-fpga/Config.in"
 	source "package/ux500-firmware/Config.in"
-	source "package/wilc1000-firmware/Config.in"
+	source "package/wilc-firmware/Config.in"
 	source "package/wilink-bt-firmware/Config.in"
 	source "package/zd1211-firmware/Config.in"
 endmenu
diff --git a/package/wilc1000-firmware/Config.in b/package/wilc-firmware/Config.in
similarity index 82%
rename from package/wilc1000-firmware/Config.in
rename to package/wilc-firmware/Config.in
index 0734c7ad99..72a9c73206 100644
--- a/package/wilc1000-firmware/Config.in
+++ b/package/wilc-firmware/Config.in
@@ -1,5 +1,11 @@
+config BR2_PACKAGE_WILC_FIRMWARE
+	bool
+	help
+	  Provider package for WILC1000_FIRMWARE & WILC3000_FIRMWARE
+
 config BR2_PACKAGE_WILC1000_FIRMWARE
 	bool "wilc1000-firmware"
+	select BR2_PACKAGE_WILC_FIRMWARE
 	help
 	  Firmware for Microchip WILC1000 wireless device
 
@@ -12,9 +18,9 @@ config BR2_PACKAGE_WILC1000_FIRMWARE
 
 	  https://github.com/linux4wilc/firmware
 
-if BR2_PACKAGE_WILC1000_FIRMWARE
 config BR2_PACKAGE_WILC3000_FIRMWARE
 	bool "wilc3000-firmware"
+	select BR2_PACKAGE_WILC_FIRMWARE
 	help
 	  Firmware for Microchip WILC3000 wireless device
 
@@ -26,4 +32,3 @@ config BR2_PACKAGE_WILC3000_FIRMWARE
 	  These will be installed to /lib/firmware/mchp/
 
 	  https://github.com/linux4wilc/firmware
-endif
diff --git a/package/wilc1000-firmware/wilc1000-firmware.hash b/package/wilc-firmware/wilc-firmware.hash
similarity index 77%
rename from package/wilc1000-firmware/wilc1000-firmware.hash
rename to package/wilc-firmware/wilc-firmware.hash
index ef82dcdc45..874766aec0 100644
--- a/package/wilc1000-firmware/wilc1000-firmware.hash
+++ b/package/wilc-firmware/wilc-firmware.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  29bb5739136cdb4088cb52af59badce05cc7e562bca40e9f29fef7f8f7c19cb8  wilc1000-firmware-wilc_linux_15_6.tar.gz
+sha256  29bb5739136cdb4088cb52af59badce05cc7e562bca40e9f29fef7f8f7c19cb8  wilc-firmware-wilc_linux_15_6.tar.gz
 sha256  71355eee947a312594dbdaac039827544f93d23949b65c356b7b0ce09e2600fb  LICENSE.wilc_fw
diff --git a/package/wilc1000-firmware/wilc1000-firmware.mk b/package/wilc-firmware/wilc-firmware.mk
similarity index 51%
rename from package/wilc1000-firmware/wilc1000-firmware.mk
rename to package/wilc-firmware/wilc-firmware.mk
index a071272129..1a7ceca18e 100644
--- a/package/wilc1000-firmware/wilc1000-firmware.mk
+++ b/package/wilc-firmware/wilc-firmware.mk
@@ -1,35 +1,35 @@
 ################################################################################
 #
-# wilc1000-firmware
+# wilc-firmware
 #
 ################################################################################
 
-WILC1000_FIRMWARE_VERSION = wilc_linux_15_6
-WILC1000_FIRMWARE_SITE = $(call github,linux4wilc,firmware,$(WILC1000_FIRMWARE_VERSION))
+WILC_FIRMWARE_VERSION = wilc_linux_15_6
+WILC_FIRMWARE_SITE = $(call github,linux4wilc,firmware,$(WILC_FIRMWARE_VERSION))
 
-WILC1000_FIRMWARE_LICENSE = PROPRIETARY
-WILC1000_FIRMWARE_LICENSE_FILES = LICENSE.wilc_fw
+WILC_FIRMWARE_LICENSE = PROPRIETARY
+WILC_FIRMWARE_LICENSE_FILES = LICENSE.wilc_fw
 
 ifeq ($(BR2_PACKAGE_WILC1000_FIRMWARE),y)
-WILC1000_FIRMWARE_FILES += \
+WILC_FIRMWARE_FILES += \
 	wilc1000_wifi_firmware.bin
 endif
 
 ifeq ($(BR2_PACKAGE_WILC3000_FIRMWARE),y)
-WILC1000_FIRMWARE_FILES += \
+WILC_FIRMWARE_FILES += \
 	wilc3000_ble_firmware.bin \
 	wilc3000_wifi_firmware.bin
 endif
 
-define WILC1000_FIRMWARE_INSTALL_FILES
+define WILC_FIRMWARE_INSTALL_FILES
 	cd $(@D) && \
-		$(TAR) cf install.tar $(sort $(WILC1000_FIRMWARE_FILES)) && \
+		$(TAR) cf install.tar $(sort $(WILC_FIRMWARE_FILES)) && \
 		$(TAR) xf install.tar -C $(TARGET_DIR)/lib/firmware/mchp
 endef
 
-define WILC1000_FIRMWARE_INSTALL_TARGET_CMDS
+define WILC_FIRMWARE_INSTALL_TARGET_CMDS
 	$(INSTALL) -d -m 0755 $(TARGET_DIR)/lib/firmware/mchp/
-	$(WILC1000_FIRMWARE_INSTALL_FILES)
+	$(WILC_FIRMWARE_INSTALL_FILES)
 endef
 
 $(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
