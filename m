From: Adam Duskett <aduskett@gmail.com>
Date: Mon,  6 Feb 2017 15:24:21 -0500
Subject: [Buildroot] [PATCH 08/44] linux-firmware: add amd radeon option
In-Reply-To: <20170206202457.31527-1-aduskett@codeblue.com>
References: <20170206202457.31527-1-aduskett@codeblue.com>
Message-ID: <20170206202457.31527-9-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
---
 package/linux-firmware/Config.in         | 5 +++++
 package/linux-firmware/linux-firmware.mk | 6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 1c0ba39..48c5963 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -49,6 +49,11 @@ endmenu # Audio
 
 menu "Video firmware"
 
+config BR2_PACKAGE_LINUX_FIRMWARE_AMD_RADEON
+	bool "AMD Radeon video card firmware"
+	help
+	  Firmware files for AMD Radeon video cards.
+  
 config BR2_PACKAGE_LINUX_FIRMWARE_ATI_RADEON
 	bool "ATI Radeon video card firmware"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 7fa066d..b3ba1b0 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -57,6 +57,12 @@ LINUX_FIRMWARE_FILES += yamaha/
 # WHENCE which is installed unconditionally
 endif
 
+# AMD Radeon
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_AMD_RADEON),y)
+LINUX_FIRMWARE_DIRS += amdgpu
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.amdgpu
+endif
+
 # ATI Radeon
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_ATI_RADEON),y)
 LINUX_FIRMWARE_DIRS += radeon
-- 
2.9.3
