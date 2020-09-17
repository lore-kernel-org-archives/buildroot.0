From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 17 Sep 2020 21:35:32 +0200
Subject: [Buildroot] [git commit] package/armbian-firmware: add option to
 install AP6256 firmware
Message-ID: <20200917193048.9233E7FBE9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f319d2f12a233344fe6b2a04c1a58a4943d5b58b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This WiFi/BT chip is used on ROCK Pi 4.

Signed-off-by: Tian Yuanhao <tianyuanhao@aliyun.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/armbian-firmware/Config.in           | 5 +++++
 package/armbian-firmware/armbian-firmware.mk | 8 ++++++++
 2 files changed, 13 insertions(+)

diff --git a/package/armbian-firmware/Config.in b/package/armbian-firmware/Config.in
index f042c076d5..7c5f6ba193 100644
--- a/package/armbian-firmware/Config.in
+++ b/package/armbian-firmware/Config.in
@@ -13,6 +13,11 @@ config BR2_PACKAGE_ARMBIAN_FIRMWARE_AP6212
 	help
 	  Firmware files for AP6212 WiFi/BT combo chip.
 
+config BR2_PACKAGE_ARMBIAN_FIRMWARE_AP6256
+	bool "AP6256 WiFi/BT"
+	help
+	  Firmware files for AP6256 WiFi/BT combo chip.
+
 config BR2_PACKAGE_ARMBIAN_FIRMWARE_XR819
 	bool "XR819 WiFi"
 	help
diff --git a/package/armbian-firmware/armbian-firmware.mk b/package/armbian-firmware/armbian-firmware.mk
index d9b0690351..0ed069025d 100644
--- a/package/armbian-firmware/armbian-firmware.mk
+++ b/package/armbian-firmware/armbian-firmware.mk
@@ -13,6 +13,14 @@ ifeq ($(BR2_PACKAGE_ARMBIAN_FIRMWARE_AP6212),y)
 ARMBIAN_FIRMWARE_DIRS += ap6212
 endif
 
+# AP6256 WiFi/BT combo firmware
+ifeq ($(BR2_PACKAGE_ARMBIAN_FIRMWARE_AP6256),y)
+ARMBIAN_FIRMWARE_FILES += \
+	brcm/BCM4345C5.hcd \
+	brcm/brcmfmac43456-sdio.bin \
+	brcm/brcmfmac43456-sdio.txt
+endif
+
 # XR819 WiFi firmware
 ifeq ($(BR2_PACKAGE_ARMBIAN_FIRMWARE_XR819),y)
 ARMBIAN_FIRMWARE_FILES += \
