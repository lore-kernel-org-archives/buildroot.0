From: Adam Duskett <aduskett@gmail.com>
Date: Mon,  6 Feb 2017 15:24:19 -0500
Subject: [Buildroot] [PATCH 06/44] linux-firmware: add yamaha audio devices
	option
In-Reply-To: <20170206202457.31527-1-aduskett@codeblue.com>
References: <20170206202457.31527-1-aduskett@codeblue.com>
Message-ID: <20170206202457.31527-7-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This option enables support for YMF724/740/744/754 Yamaha devices.

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
---
 package/linux-firmware/Config.in         | 5 +++++
 package/linux-firmware/linux-firmware.mk | 8 ++++++++
 2 files changed, 13 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index e995306..d3aca2c 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -40,6 +40,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_SB16
 	help
 	  Firmware files for the Sound blaster 16/AWE CSP
 
+config BR2_PACKAGE_LINUX_FIRMWARE_YAMAHA
+	bool "Yamaha YMF724/740/744/754 audio devices"
+	help
+	  Firmware files for Yamaha YMF724/740/744/754 audio devices.
+
 endmenu # Audio
 
 menu "Video firmware"
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 714f7d5..6568c97 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -49,6 +49,14 @@ LINUX_FIRMWARE_DIRS += sb16
 # which is installed unconditionally
 endif
 
+# Yamaha YMF724/740/744/754 audio devices
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_YAMAHA),y)
+LINUX_FIRMWARE_FILES += yamaha/
+# No license file; the license is listed as
+# Copyright (c) 1997-1999 Yamaha Corporation in the file
+# WHENCE which is installed unconditionally
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_I915),y)
 LINUX_FIRMWARE_DIRS += i915
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.i915
-- 
2.9.3
