From: Adam Duskett <aduskett@gmail.com>
Date: Mon,  6 Feb 2017 15:24:15 -0500
Subject: [Buildroot] [PATCH 02/44] linux-firmware: add emi 2|6m option
In-Reply-To: <20170206202457.31527-1-aduskett@codeblue.com>
References: <20170206202457.31527-1-aduskett@codeblue.com>
Message-ID: <20170206202457.31527-3-aduskett@codeblue.com>
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
index 6d8cb34..87fdd38 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -15,6 +15,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_EMI_26_USB
 	help
 	  Firmware files for EMI 2|6 USB Audio interface.
 
+config BR2_PACKAGE_LINUX_FIRMWARE_EMI_26M_USB
+	bool "EMI 2|6m USB Audio interface"
+	help
+	  Firmware files for EMI 2|6m USB Audio interface.
+	    
 config BR2_PACKAGE_LINUX_FIRMWARE_INTEL_SST_DSP
 	bool "Intel SST DSP"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 2fd1ca3..67152e1 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -15,6 +15,13 @@ LINUX_FIRMWARE_DIRS += emi26
 # which is installed unconditionally
 endif
 
+# EMI 2|6m USB Audio interface
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_EMI_26M_USB),y)
+LINUX_FIRMWARE_DIRS += emi62
+# No license file; the license is in the file WHENCE
+# which is installed unconditionally
+endif
+
 # Intel SST DSP
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_INTEL_SST_DSP),y)
 LINUX_FIRMWARE_FILES += intel/fw_sst_0f28.bin-48kHz_i2s_master
-- 
2.9.3
