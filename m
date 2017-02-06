From: Adam Duskett <aduskett@gmail.com>
Date: Mon,  6 Feb 2017 15:24:42 -0500
Subject: [Buildroot] [PATCH 29/44] linux-firmware: add sxg alacritech isnic
	option
In-Reply-To: <20170206202457.31527-1-aduskett@codeblue.com>
References: <20170206202457.31527-1-aduskett@codeblue.com>
Message-ID: <20170206202457.31527-30-aduskett@codeblue.com>
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
index 2747a33..8ea536b 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -415,6 +415,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_SLICOSS_ISNIC
 	help
 	  Firmware files for slicoss Alacritech IS-NIC products
 
+config BR2_PACKAGE_LINUX_FIRMWARE_SGX_ISNIC
+	bool "sxg - Alacritech IS-NIC products"
+	help
+	  Firmware files for sxg Alacritech IS-NIC products
+	  
 endmenu
 
 menu "DVB firmware"
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index c3d6273..1e80f12 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -539,6 +539,12 @@ LINUX_FIRMWARE_DIRS += slicoss/
 # which is installed unconditionally
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_SGX_ISNIC),y)
+LINUX_FIRMWARE_DIRS += sxg/
+# No license file; the license is in the file WHENCE
+# which is installed unconditionally
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_XCx000),y)
 LINUX_FIRMWARE_FILES += \
 	dvb-fe-xc4000-1.4.1.fw \
-- 
2.9.3
