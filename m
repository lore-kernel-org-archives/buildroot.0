From: Adam Duskett <aduskett@gmail.com>
Date: Mon,  6 Feb 2017 15:24:41 -0500
Subject: [Buildroot] [PATCH 28/44] linux-firmware: add slicoss alacritech
	isnic option
In-Reply-To: <20170206202457.31527-1-aduskett@codeblue.com>
References: <20170206202457.31527-1-aduskett@codeblue.com>
Message-ID: <20170206202457.31527-29-aduskett@codeblue.com>
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
index ee8254f..2747a33 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -410,6 +410,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_RTL_8169
 	help
 	  Firmware files for Realtek 8169 gigabit ethernet cards
 
+config BR2_PACKAGE_LINUX_FIRMWARE_SLICOSS_ISNIC
+	bool "slicoss - Alacritech IS-NIC products"
+	help
+	  Firmware files for slicoss Alacritech IS-NIC products
+
 endmenu
 
 menu "DVB firmware"
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index f61ce60..c3d6273 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -533,6 +533,12 @@ LINUX_FIRMWARE_FILES += \
 	rtl_nic/rtl8411-2.fw
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_SLICOSS_ISNIC),y)
+LINUX_FIRMWARE_DIRS += slicoss/
+# No license file; the license is in the file WHENCE
+# which is installed unconditionally
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_XCx000),y)
 LINUX_FIRMWARE_FILES += \
 	dvb-fe-xc4000-1.4.1.fw \
-- 
2.9.3
