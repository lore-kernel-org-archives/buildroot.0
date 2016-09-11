From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Sep 2016 15:35:54 +0200
Subject: [Buildroot] [git commit] linux-firmware: add bluetooth firmware for
	intel chips
Message-ID: <20160911133605.1A83981913@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6a35b6e3a56bbc5eed8eab9896be431bdf81e5e1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It probably makes no sense to try split them up by model since there
aren't that big.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-firmware/Config.in         | 10 ++++++++++
 package/linux-firmware/linux-firmware.mk |  6 ++++++
 2 files changed, 16 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index f56f31d..79af71e 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -26,6 +26,16 @@ config BR2_PACKAGE_LINUX_FIRMWARE_RADEON
 
 endmenu # Video
 
+menu "Bluetooth firmware"
+
+config BR2_PACKAGE_LINUX_FIRMWARE_IBT
+	bool "Intel Wireless Bluetooth"
+	help
+	  Firmware files for Intel 3160/7260/7265/8260/8265 Wireless
+	  bluetooth support.
+
+endmenu # Bluetooth
+
 menu "WiFi firmware"
 
 config BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_6002
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 1401848..5c80c1e 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -19,6 +19,12 @@ LINUX_FIRMWARE_DIRS += radeon
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.radeon
 endif
 
+# Intel Wireless Bluetooth
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IBT),y)
+LINUX_FIRMWARE_FILES += intel/ibt-*
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.ibt_firmware
+endif
+
 # rt2501/rt61
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT61),y)
 LINUX_FIRMWARE_FILES += rt2561.bin rt2561s.bin rt2661.bin
