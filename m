From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Jan 2017 22:16:44 +1100
Subject: [Buildroot] [git commit] linux-firmware: add option for Intel i915
	video cards firmware
Message-ID: <20170119111714.C112E80163@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bf80b60d0ac29f803a269445f6933970a9685600
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
[Thomas: preserve alphabetic ordering.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-firmware/Config.in         | 5 +++++
 package/linux-firmware/linux-firmware.mk | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 23738ce..e9a4dfb 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -19,6 +19,11 @@ endmenu # Audio
 
 menu "Video firmware"
 
+config BR2_PACKAGE_LINUX_FIRMWARE_I915
+	bool "Intel i915 video card firmware"
+	help
+	  Firmware files for the Intel i915 video cards.
+
 config BR2_PACKAGE_LINUX_FIRMWARE_RADEON
 	bool "AMD Radeon video card firmware"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 535b69a..0afb931 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -14,6 +14,11 @@ LINUX_FIRMWARE_FILES += intel/fw_sst_0f28.bin-48kHz_i2s_master
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.fw_sst_0f28
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_I915),y)
+LINUX_FIRMWARE_DIRS += i915
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.i915
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RADEON),y)
 LINUX_FIRMWARE_DIRS += radeon
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.radeon
