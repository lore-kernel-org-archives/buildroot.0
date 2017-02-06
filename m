From: Adam Duskett <aduskett@gmail.com>
Date: Mon,  6 Feb 2017 15:24:16 -0500
Subject: [Buildroot] [PATCH 03/44] linux-firmware: add korg121 audio device
	option
In-Reply-To: <20170206202457.31527-1-aduskett@codeblue.com>
References: <20170206202457.31527-1-aduskett@codeblue.com>
Message-ID: <20170206202457.31527-4-aduskett@codeblue.com>
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
index 87fdd38..2b53280 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -25,6 +25,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_INTEL_SST_DSP
 	help
 	  Firmware files for Intel Baytrail SST DSP audio.
 
+config BR2_PACKAGE_LINUX_FIRMWARE_KORG1212
+	bool "Korg 1212 IO audio device"
+	help
+	  Firmware files for Korg 1212 IO audio device.
+
 endmenu # Audio
 
 menu "Video firmware"
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 67152e1..03eea82 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -28,6 +28,13 @@ LINUX_FIRMWARE_FILES += intel/fw_sst_0f28.bin-48kHz_i2s_master
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.fw_sst_0f28
 endif
 
+# Korg 1212 audio device
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_KORG1212),y)
+LINUX_FIRMWARE_FILES += korg/
+# No license file; the license is in the file WHENCE
+# which is installed unconditionally
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_I915),y)
 LINUX_FIRMWARE_DIRS += i915
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.i915
-- 
2.9.3
