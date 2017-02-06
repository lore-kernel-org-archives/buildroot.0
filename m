From: Adam Duskett <aduskett@gmail.com>
Date: Mon,  6 Feb 2017 15:24:20 -0500
Subject: [Buildroot] [PATCH 07/44] linux-firmware: rename firmware_radeon to
	firmware_ati_radeon
In-Reply-To: <20170206202457.31527-1-aduskett@codeblue.com>
References: <20170206202457.31527-1-aduskett@codeblue.com>
Message-ID: <20170206202457.31527-8-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This change is needed because there is now a amd_radeon option as well.

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
---
 package/linux-firmware/Config.in         | 10 +++++-----
 package/linux-firmware/linux-firmware.mk |  9 ++++++---
 2 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index d3aca2c..1c0ba39 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -49,16 +49,16 @@ endmenu # Audio
 
 menu "Video firmware"
 
+config BR2_PACKAGE_LINUX_FIRMWARE_ATI_RADEON
+	bool "ATI Radeon video card firmware"
+	help
+	  Firmware files for ATI Radeon video cards.
+
 config BR2_PACKAGE_LINUX_FIRMWARE_I915
 	bool "Intel i915 video card firmware"
 	help
 	  Firmware files for the Intel i915 video cards.
 
-config BR2_PACKAGE_LINUX_FIRMWARE_RADEON
-	bool "AMD Radeon video card firmware"
-	help
-	  Firmware files for AMD Radeon video cards.
-
 endmenu # Video
 
 menu "Bluetooth firmware"
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 6568c97..7fa066d 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -57,14 +57,17 @@ LINUX_FIRMWARE_FILES += yamaha/
 # WHENCE which is installed unconditionally
 endif
 
+# ATI Radeon
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_ATI_RADEON),y)
+LINUX_FIRMWARE_DIRS += radeon
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.radeon
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_I915),y)
 LINUX_FIRMWARE_DIRS += i915
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.i915
 endif
 
-ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RADEON),y)
-LINUX_FIRMWARE_DIRS += radeon
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.radeon
 endif
 
 # Intel Wireless Bluetooth
-- 
2.9.3
