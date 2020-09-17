From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 17 Sep 2020 21:32:48 +0200
Subject: [Buildroot] [git commit] package/armbian-firmware: fix alphabetic
 ordering of options
Message-ID: <20200917193048.8638B7FBE9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f497ed5eeaabde9daf8b08a32177b2b87b062580
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/armbian-firmware/Config.in           | 10 +++++-----
 package/armbian-firmware/armbian-firmware.mk | 10 +++++-----
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/package/armbian-firmware/Config.in b/package/armbian-firmware/Config.in
index 761c316612..f042c076d5 100644
--- a/package/armbian-firmware/Config.in
+++ b/package/armbian-firmware/Config.in
@@ -8,14 +8,14 @@ config BR2_PACKAGE_ARMBIAN_FIRMWARE
 
 if BR2_PACKAGE_ARMBIAN_FIRMWARE
 
-config BR2_PACKAGE_ARMBIAN_FIRMWARE_XR819
-	bool "XR819 WiFi"
-	help
-	  Firmware files for XR819 WiFi SDIO chip.
-
 config BR2_PACKAGE_ARMBIAN_FIRMWARE_AP6212
 	bool "AP6212 WiFi/BT"
 	help
 	  Firmware files for AP6212 WiFi/BT combo chip.
 
+config BR2_PACKAGE_ARMBIAN_FIRMWARE_XR819
+	bool "XR819 WiFi"
+	help
+	  Firmware files for XR819 WiFi SDIO chip.
+
 endif
diff --git a/package/armbian-firmware/armbian-firmware.mk b/package/armbian-firmware/armbian-firmware.mk
index 36b0450037..d9b0690351 100644
--- a/package/armbian-firmware/armbian-firmware.mk
+++ b/package/armbian-firmware/armbian-firmware.mk
@@ -8,6 +8,11 @@ ARMBIAN_FIRMWARE_VERSION = 70a08503ac9e765f5d1ccf4fa3e825db0751e53e
 ARMBIAN_FIRMWARE_SITE = https://github.com/armbian/firmware
 ARMBIAN_FIRMWARE_SITE_METHOD = git
 
+# AP6212 WiFi/BT combo firmware
+ifeq ($(BR2_PACKAGE_ARMBIAN_FIRMWARE_AP6212),y)
+ARMBIAN_FIRMWARE_DIRS += ap6212
+endif
+
 # XR819 WiFi firmware
 ifeq ($(BR2_PACKAGE_ARMBIAN_FIRMWARE_XR819),y)
 ARMBIAN_FIRMWARE_FILES += \
@@ -16,11 +21,6 @@ ARMBIAN_FIRMWARE_FILES += \
 	xr819/sdd_xr819.bin
 endif
 
-# AP6212 WiFi/BT combo firmware
-ifeq ($(BR2_PACKAGE_ARMBIAN_FIRMWARE_AP6212),y)
-ARMBIAN_FIRMWARE_DIRS += ap6212
-endif
-
 ifneq ($(ARMBIAN_FIRMWARE_FILES),)
 define ARMBIAN_FIRMWARE_INSTALL_FILES
 	cd $(@D) && \
