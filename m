From: Adam Duskett <aduskett@gmail.com>
Date: Mon,  6 Feb 2017 15:24:25 -0500
Subject: [Buildroot] [PATCH 12/44] linux-firmware: add samsung mfc video
	encoder/decoder option
In-Reply-To: <20170206202457.31527-1-aduskett@codeblue.com>
References: <20170206202457.31527-1-aduskett@codeblue.com>
Message-ID: <20170206202457.31527-13-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
---
 package/linux-firmware/Config.in         |  5 +++++
 package/linux-firmware/linux-firmware.mk | 21 +++++++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 0d6ff51..0bc6d77 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -83,6 +83,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_GO7007
 	help
 	  Firmware files for the GO7007 MPEG-4 encoder.
 
+config BR2_PACKAGE_LINUX_FIRMWARE_SAMSUNG_MFC
+	bool "Samsung MFC video encoder/decoder driver"
+	help
+	  Firmware files for the Samsung MFC video encoder/decoder.
+
 endmenu # Video encoder
 
 menu "Bluetooth firmware"
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index b471bd4..bdeabfa 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -57,6 +57,27 @@ LINUX_FIRMWARE_FILES += yamaha/
 # WHENCE which is installed unconditionally
 endif
 
+# Go7007 Mpeg4 encoder
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_GO7007),y)
+LINUX_FIRMWARE_DIRS += go7007
+LINUX_FIRMWARE_FILES += \
+	s2250.fw \
+	s2250_loader.fw
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.go7007
+endif
+
+# Samsung MFC video encoder/decoder
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_SAMSUNG_MFC),y)
+LINUX_FIRMWARE_FILES += \
+	s5p-mfc.fw \
+	s5p-mfc-v6.fw \
+	s5p-mfc-v6-v2.fw \
+	s5p-mfc-v7.fw \
+	s5p-mfc-v8.fw
+# No license file; the license is in the file WHENCE
+# which is installed unconditionally
+endif
+
 # AMD Radeon
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_AMD_RADEON),y)
 LINUX_FIRMWARE_DIRS += amdgpu
-- 
2.9.3
