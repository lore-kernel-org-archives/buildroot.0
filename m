From: Adam Duskett <aduskett@gmail.com>
Date: Mon,  6 Feb 2017 15:24:18 -0500
Subject: [Buildroot] [PATCH 05/44] linux-firmware: add soundblaster 16 option
In-Reply-To: <20170206202457.31527-1-aduskett@codeblue.com>
References: <20170206202457.31527-1-aduskett@codeblue.com>
Message-ID: <20170206202457.31527-6-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
---
 package/linux-firmware/Config.in         | 5 +++++
 package/linux-firmware/linux-firmware.mk | 7 +++++++
 2 files changed, 12 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 410a02d..e995306 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -35,6 +35,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_MASTRO3
 	help
 	  Firmware files for ESS Allegro Maestro3 audio device.
 
+config BR2_PACKAGE_LINUX_FIRMWARE_SB16
+	bool "Sound blaster 16/AWE CSP support"
+	help
+	  Firmware files for the Sound blaster 16/AWE CSP
+
 endmenu # Audio
 
 menu "Video firmware"
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 44de36d..714f7d5 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -42,6 +42,13 @@ LINUX_FIRMWARE_DIRS += ess/
 # which is installed unconditionally
 endif
 
+# Sound blaster 16/AWE CSP support
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_SB16),y)
+LINUX_FIRMWARE_DIRS += sb16
+# No license file; the license is in the file WHENCE
+# which is installed unconditionally
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_I915),y)
 LINUX_FIRMWARE_DIRS += i915
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.i915
-- 
2.9.3
