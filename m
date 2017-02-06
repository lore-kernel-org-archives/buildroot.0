From: Adam Duskett <aduskett@gmail.com>
Date: Mon,  6 Feb 2017 15:24:14 -0500
Subject: [Buildroot] [PATCH 01/44] linux-firmware: add emi 2|6 usb audio
	option
In-Reply-To: <20170206202457.31527-1-aduskett@codeblue.com>
References: <20170206202457.31527-1-aduskett@codeblue.com>
Message-ID: <20170206202457.31527-2-aduskett@codeblue.com>
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
index e9a4dfb..6d8cb34 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -10,6 +10,11 @@ if BR2_PACKAGE_LINUX_FIRMWARE
 
 menu "Audio firmware"
 
+config BR2_PACKAGE_LINUX_FIRMWARE_EMI_26_USB
+	bool "EMI 2|6 USB Audio interface"
+	help
+	  Firmware files for EMI 2|6 USB Audio interface.
+
 config BR2_PACKAGE_LINUX_FIRMWARE_INTEL_SST_DSP
 	bool "Intel SST DSP"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 7706bd5..2fd1ca3 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -8,6 +8,13 @@ LINUX_FIRMWARE_VERSION = 6d3bc8886517d171068fd1263176b8b5c51df204
 LINUX_FIRMWARE_SITE = http://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git
 LINUX_FIRMWARE_SITE_METHOD = git
 
+# EMI 2|6 USB Audio interface
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_EMI_26_USB),y)
+LINUX_FIRMWARE_DIRS += emi26
+# No license file; the license is in the file WHENCE
+# which is installed unconditionally
+endif
+
 # Intel SST DSP
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_INTEL_SST_DSP),y)
 LINUX_FIRMWARE_FILES += intel/fw_sst_0f28.bin-48kHz_i2s_master
-- 
2.9.3
