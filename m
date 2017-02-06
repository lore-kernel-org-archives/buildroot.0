From: Adam Duskett <aduskett@gmail.com>
Date: Mon,  6 Feb 2017 15:24:40 -0500
Subject: [Buildroot] [PATCH 27/44] linux-firmware: add netxen gigabit
	ethernet option
In-Reply-To: <20170206202457.31527-1-aduskett@codeblue.com>
References: <20170206202457.31527-1-aduskett@codeblue.com>
Message-ID: <20170206202457.31527-28-aduskett@codeblue.com>
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
index f88009d..ee8254f 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -400,6 +400,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_MYRICOM
 	help
 	  Firmware files for MyriCOM Gigabit Ethernet
 
+config BR2_PACKAGE_LINUX_FIRMWARE_NETXEN
+	bool "NetXen Multi port (1/10) Gigabit Ethernet NIC"
+	help
+	  Firmware files for the NetXen Multi port (1/10) Gigabit Ethernet NIC
+
 config BR2_PACKAGE_LINUX_FIRMWARE_RTL_8169
 	bool "Realtek 8169"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index c5eceed..f61ce60 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -506,6 +506,12 @@ LINUX_FIRMWARE_DIRS += myricom/
 # which is installed unconditionally
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_NETXEN),y)
+LINUX_FIRMWARE_FILES += phanfw.bin/
+# No license file; the license is in the file WHENCE
+# which is installed unconditionally
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RTL_8169),y)
 LINUX_FIRMWARE_FILES += \
 	rtl_nic/rtl8105e-1.fw \
-- 
2.9.3
