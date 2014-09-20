From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 20 Sep 2014 22:55:13 +0200
Subject: [Buildroot] [PATCH 15/15 v2] package/linux-firmware: add option for
	Intel SST DSP (Baytrail audio)
In-Reply-To: <cover.1411246411.git.yann.morin.1998@free.fr>
References: <cover.1411246411.git.yann.morin.1998@free.fr>
Message-ID: <7358165cfe8ee1f05f64eec392031c5628b8a4ac.1411246412.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We introduce the new "Audio" firmware category for the firmware.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/linux-firmware/Config.in         | 9 +++++++++
 package/linux-firmware/linux-firmware.mk | 6 ++++++
 2 files changed, 15 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 3bcc982..cd35dcc 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -8,6 +8,15 @@ config BR2_PACKAGE_LINUX_FIRMWARE
 
 if BR2_PACKAGE_LINUX_FIRMWARE
 
+menu "Audio firmware"
+
+config BR2_PACKAGE_LINUX_FIRMWARE_INTEL_SST_DSP
+	bool "Intel SST DSP"
+	help
+	  Firmware files for Intel Baytrail SST DSP audio.
+
+endmenu # Audio
+
 menu "WiFi firmware"
 
 config BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_7010
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 9645db6..4303985 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -8,6 +8,12 @@ LINUX_FIRMWARE_VERSION = f66291398181d24856fd2d19454d246199abd5ea
 LINUX_FIRMWARE_SITE = http://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git
 LINUX_FIRMWARE_SITE_METHOD = git
 
+# Intel SST DSP
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_INTEL_SST_DSP),y)
+LINUX_FIRMWARE_FILES += intel/fw_sst_0f28.bin-48kHz_i2s_master
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.fw_sst_0f28
+endif
+
 # rt2501/rt61
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT61),y)
 LINUX_FIRMWARE_FILES += rt2561.bin rt2561s.bin rt2661.bin
-- 
1.9.1
