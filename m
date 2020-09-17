From: Tian Yuanhao <tianyuanhao@aliyun.com>
Date: Thu, 17 Sep 2020 12:43:25 +0800
Subject: [Buildroot] [PATCH 1/1] package/armbian-firmware: bump version to
 70a0850
Message-ID: <1600317805.28526.3.camel@aliyun.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add an option for AP6256, which is used on ROCK Pi 4.

Signed-off-by: Tian Yuanhao <tianyuanhao@aliyun.com>
---
?package/armbian-firmware/Config.in?????????????|??5 +++++
?package/armbian-firmware/armbian-firmware.hash |??2 +-
?package/armbian-firmware/armbian-firmware.mk???| 10 +++++++++-
?3 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/package/armbian-firmware/Config.in b/package/armbian-firmware/Config.in
index 761c316..25221fd 100644
--- a/package/armbian-firmware/Config.in
+++ b/package/armbian-firmware/Config.in
@@ -18,4 +18,9 @@ config BR2_PACKAGE_ARMBIAN_FIRMWARE_AP6212
?	help
?	??Firmware files for AP6212 WiFi/BT combo chip.
?
+config BR2_PACKAGE_ARMBIAN_FIRMWARE_AP6256
+	bool "AP6256 WiFi/BT"
+	help
+	??Firmware files for AP6256 WiFi/BT combo chip.
+
?endif
diff --git a/package/armbian-firmware/armbian-firmware.hash b/package/armbian-firmware/armbian-firmware.hash
index 0f3858d..edbc9c8 100644
--- a/package/armbian-firmware/armbian-firmware.hash
+++ b/package/armbian-firmware/armbian-firmware.hash
@@ -1,2 +1,2 @@
?# Locally calculated
-sha256 876958ce6ba8a4a01a424f2b4455208b7a989eaba96015649c774340553f0c35 armbian-firmware-455d6b6701178dafe7fd0168eb4a4ef78a8d24a3.tar.gz
+sha256??975bc377728496006f058317cccc88e2d3c4ab172ee3df08cfd085cf13221752??armbian-firmware-70a08503ac9e765f5d1ccf4fa3e825db0751e53e.tar.gz
diff --git a/package/armbian-firmware/armbian-firmware.mk b/package/armbian-firmware/armbian-firmware.mk
index 77e5185..7311674 100644
--- a/package/armbian-firmware/armbian-firmware.mk
+++ b/package/armbian-firmware/armbian-firmware.mk
@@ -4,7 +4,7 @@
?#
?################################################################################
?
-ARMBIAN_FIRMWARE_VERSION = 455d6b6701178dafe7fd0168eb4a4ef78a8d24a3
+ARMBIAN_FIRMWARE_VERSION = 70a08503ac9e765f5d1ccf4fa3e825db0751e53e
?ARMBIAN_FIRMWARE_SITE = https://github.com/armbian/firmware
?ARMBIAN_FIRMWARE_SITE_METHOD = git
?
@@ -21,6 +21,14 @@ ifeq ($(BR2_PACKAGE_ARMBIAN_FIRMWARE_AP6212),y)
?ARMBIAN_FIRMWARE_DIRS += ap6212
?endif
?
+# AP6256 WiFi/BT combo firmware
+ifeq ($(BR2_PACKAGE_ARMBIAN_FIRMWARE_AP6256),y)
+ARMBIAN_FIRMWARE_FILES += \
+	brcm/BCM4345C5.hcd \
+	brcm/brcmfmac43456-sdio.bin \
+	brcm/brcmfmac43456-sdio.txt
+endif
+
?ifneq ($(ARMBIAN_FIRMWARE_FILES),)
?define ARMBIAN_FIRMWARE_INSTALL_FILES
?	cd $(@D) && \
--?
2.7.4
