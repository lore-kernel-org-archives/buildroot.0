Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79FD3C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:13:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 960B170B80;
	Fri, 28 Feb 2025 17:13:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 34rwAt59-O8x; Fri, 28 Feb 2025 17:13:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 66E1870B89
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66E1870B89;
	Fri, 28 Feb 2025 17:13:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 12CFE1DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:44:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4223B42F4E
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S-avBqsot7KQ for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C0B542FC8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6C0B542FC8
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5F08D85E25; Fri, 28 Feb 2025 16:30:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 4 Feb 2025 18:09:49 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 668b21db586dd131db9c342a9ffe6e2c90413bd6
X-Git-Newrev: ceb4cc30da8e143f9c3d25dfe4456237f8ab1274
X-Patchwork-Hint: ignore
Message-Id: <20250228163032.5F08D85E25@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/nxp-bt-wifi-firmware:
 new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8866150255840279836=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8866150255840279836==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=ceb4cc30da8e143f9c3d25dfe4456237f8ab1274
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This package provides firmwares for NXP WiFi + Bluetooth chipsets.
It is named "nxp-bt-wifi-firmware" so that it is not confused with the
package firmware-imx.

Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 package/nxp-bt-wifi-firmware/Config.in             | 75 ++++++++++++++++++++++
 .../nxp-bt-wifi-firmware/nxp-bt-wifi-firmware.hash |  3 +
 .../nxp-bt-wifi-firmware/nxp-bt-wifi-firmware.mk   | 33 ++++++++++
 5 files changed, 113 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 731f2a5d17..909de4a871 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2947,6 +2947,7 @@ F:	package/ripgrep/
 N:	Sébastien Szymanski <sebastien.szymanski@armadeus.com>
 F:	board/armadeus/
 F:	configs/armadeus*
+F:	package/nxp-bt-wifi-firmware/
 F:	package/mmc-utils/
 F:	package/python-flask-jsonrpc/
 F:	package/python-flask-login/
diff --git a/package/Config.in b/package/Config.in
index bc77878b08..c2d1693b46 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -446,6 +446,7 @@ menu "Firmware"
 	source "package/brcmfmac_sdio-firmware-rpi/Config.in"
 	source "package/linux-firmware/Config.in"
 	source "package/murata-cyw-fw/Config.in"
+	source "package/nxp-bt-wifi-firmware/Config.in"
 	source "package/odroidc2-firmware/Config.in"
 	source "package/panel-mipi-dbi-firmware/Config.in"
 	source "package/qcom-db410c-firmware/Config.in"
diff --git a/package/nxp-bt-wifi-firmware/Config.in b/package/nxp-bt-wifi-firmware/Config.in
new file mode 100644
index 0000000000..c707cd05cd
--- /dev/null
+++ b/package/nxp-bt-wifi-firmware/Config.in
@@ -0,0 +1,75 @@
+config BR2_PACKAGE_NXP_BT_WIFI_FIRMWARE
+	bool "nxp-bt-wifi-firmware"
+	help
+	  Firmwares for NXP Bluetooth / WiFi chipsets based modules
+
+	  https://github.com/nxp-imx/imx-firmware
+
+if BR2_PACKAGE_NXP_BT_WIFI_FIRMWARE
+
+config BR2_PACKAGE_NXP_BT_WIFI_FIRMWARE_8801
+	bool "8801 (SD)"
+	help
+	  NXP 8801 module firmware files.
+
+config BR2_PACKAGE_NXP_BT_WIFI_FIRMWARE_8987
+	bool "8987 (SD)"
+	help
+	  NXP 8987 module firmware files.
+
+config BR2_PACKAGE_NXP_BT_WIFI_FIRMWARE_8997
+	bool "8997"
+	help
+	  NXP 8997 module firmware files.
+
+if BR2_PACKAGE_NXP_BT_WIFI_FIRMWARE_8997
+
+choice
+	prompt "8997 WiFi interface"
+
+config BR2_PACKAGE_NXP_BT_WIFI_FIRMWARE_8997_SD
+	bool "SD"
+
+config BR2_PACKAGE_NXP_BT_WIFI_FIRMWARE_8997_PCIE
+	bool "PCIe"
+
+endchoice
+
+endif
+
+config BR2_PACKAGE_NXP_BT_WIFI_FIRMWARE_9098
+	bool "9098"
+	help
+	  NXP 9098 module firmware files.
+
+if BR2_PACKAGE_NXP_BT_WIFI_FIRMWARE_9098
+
+choice
+	prompt "9098 WiFi interface"
+
+config BR2_PACKAGE_NXP_BT_WIFI_FIRMWARE_9098_SD
+	bool "SD"
+
+config BR2_PACKAGE_NXP_BT_WIFI_FIRMWARE_9098_PCIE
+	bool "PCIe"
+
+endchoice
+
+endif
+
+config BR2_PACKAGE_NXP_BT_WIFI_FIRMWARE_IW416
+	bool "IW416 (SD)"
+	help
+	  NXP IW416 module firmware files.
+
+config BR2_PACKAGE_NXP_BT_WIFI_FIRMWARE_IW610
+	bool "IW610 (SD)"
+	help
+	  NXP IW610 module firmware files.
+
+config BR2_PACKAGE_NXP_BT_WIFI_FIRMWARE_IW612
+	bool "IW612 (SD)"
+	help
+	  NXP IW612 module firmware files.
+
+endif
diff --git a/package/nxp-bt-wifi-firmware/nxp-bt-wifi-firmware.hash b/package/nxp-bt-wifi-firmware/nxp-bt-wifi-firmware.hash
new file mode 100644
index 0000000000..60e1be03da
--- /dev/null
+++ b/package/nxp-bt-wifi-firmware/nxp-bt-wifi-firmware.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  444351eba2669772a0f62aadbff92b46adb370dcd5228f12e4f5ae2b58554951  nxp-bt-wifi-firmware-lf-6.6.52_2.2.0.tar.gz
+sha256  601fa790c5b4d03579bd182fb4d65a6f329a32faf49db22f98e4608221e861f7  LICENSE.txt
diff --git a/package/nxp-bt-wifi-firmware/nxp-bt-wifi-firmware.mk b/package/nxp-bt-wifi-firmware/nxp-bt-wifi-firmware.mk
new file mode 100644
index 0000000000..f0440ce32a
--- /dev/null
+++ b/package/nxp-bt-wifi-firmware/nxp-bt-wifi-firmware.mk
@@ -0,0 +1,33 @@
+################################################################################
+#
+# nxp-bt-wifi-firmware
+#
+################################################################################
+
+NXP_BT_WIFI_FIRMWARE_VERSION = lf-6.6.52_2.2.0
+NXP_BT_WIFI_FIRMWARE_SITE = $(call github,nxp-imx,imx-firmware,$(NXP_BT_WIFI_FIRMWARE_VERSION))
+NXP_BT_WIFI_FIRMWARE_LICENSE = NXP Software License Agreement
+NXP_BT_WIFI_FIRMWARE_LICENSE_FILES = LICENSE.txt
+NXP_BT_WIFI_FIRMWARE_REDISTRIBUTE = NO
+
+NXP_BT_WIFI_FIRMWARE_FILES_$(BR2_PACKAGE_NXP_BT_WIFI_FIRMWARE_8801) += FwImage_8801_SD
+NXP_BT_WIFI_FIRMWARE_FILES_$(BR2_PACKAGE_NXP_BT_WIFI_FIRMWARE_8987) += FwImage_8987
+NXP_BT_WIFI_FIRMWARE_FILES_$(BR2_PACKAGE_NXP_BT_WIFI_FIRMWARE_8997_SD) += FwImage_8997_SD
+NXP_BT_WIFI_FIRMWARE_FILES_$(BR2_PACKAGE_NXP_BT_WIFI_FIRMWARE_8997_PCIE) += FwImage_8997
+NXP_BT_WIFI_FIRMWARE_FILES_$(BR2_PACKAGE_NXP_BT_WIFI_FIRMWARE_9098_SD) += FwImage_9098_SD
+NXP_BT_WIFI_FIRMWARE_FILES_$(BR2_PACKAGE_NXP_BT_WIFI_FIRMWARE_9098_PCIE) += FwImage_9098_PCIE
+NXP_BT_WIFI_FIRMWARE_FILES_$(BR2_PACKAGE_NXP_BT_WIFI_FIRMWARE_IW416) += FwImage_IW416_SD
+NXP_BT_WIFI_FIRMWARE_FILES_$(BR2_PACKAGE_NXP_BT_WIFI_FIRMWARE_IW610) += FwImage_IW610_SD
+NXP_BT_WIFI_FIRMWARE_FILES_$(BR2_PACKAGE_NXP_BT_WIFI_FIRMWARE_IW612) += FwImage_IW612_SD
+
+define NXP_BT_WIFI_FIRMWARE_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0644 -D $(@D)/nxp/wifi_mod_para.conf \
+		$(TARGET_DIR)/lib/firmware/nxp/wifi_mod_para.conf
+	$(INSTALL) -m 0644 -D $(@D)/nxp/mfguart/helper_uart_3000000.bin \
+		$(TARGET_DIR)/lib/firmware/nxp/helper_uart_3000000.bin
+	$(foreach f,$(NXP_BT_WIFI_FIRMWARE_FILES_y), \
+		$(INSTALL) -m 0644 -D $(@D)/nxp/$(f)/* $(TARGET_DIR)/lib/firmware/nxp/
+	)
+endef
+
+$(eval $(generic-package))

--===============8866150255840279836==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8866150255840279836==--
