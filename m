From: Wolfgang Grandegger <wg@grandegger.com>
Date: Wed, 18 Jan 2017 17:24:23 +0100
Subject: [Buildroot] [PATCH] linux-firmware: add option for Intel i915 video
 cards firmware
Message-ID: <38042b78-d281-d26a-11f8-fbb33ca2d80a@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
---
 package/linux-firmware/Config.in         | 5 +++++
 package/linux-firmware/linux-firmware.mk | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 23738ce..dee891f 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -24,6 +24,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_RADEON
 	help
 	  Firmware files for AMD Radeon video cards.
 
+config BR2_PACKAGE_LINUX_FIRMWARE_I915
+       bool "Intel i915 video card firmware"
+       help
+         Firmware files for the Intel i915 video cards.
+
 endmenu # Video
 
 menu "Bluetooth firmware"
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 535b69a..5712215 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -19,6 +19,11 @@ LINUX_FIRMWARE_DIRS += radeon
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.radeon
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_I915),y)
+LINUX_FIRMWARE_DIRS += i915
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.i915
+endif
+
 # Intel Wireless Bluetooth
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IBT),y)
 LINUX_FIRMWARE_FILES += intel/ibt-*
-- 
1.9.1
