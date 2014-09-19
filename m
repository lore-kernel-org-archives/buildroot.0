From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 19 Sep 2014 23:14:57 +0200
Subject: [Buildroot] [PATCH 07/14] package/linux-firmware: add option to
	install Chelsio cxgb4 T5
In-Reply-To: <cover.1411161197.git.yann.morin.1998@free.fr>
References: <cover.1411161197.git.yann.morin.1998@free.fr>
Message-ID: <7f6f6ba163f838a1dc540fc30626d1d0ca42c43e.1411161197.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/linux-firmware/Config.in         | 8 +++++++-
 package/linux-firmware/linux-firmware.mk | 8 +++++++-
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 220c794..a068acb 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -159,10 +159,16 @@ config BR2_PACKAGE_LINUX_FIRMWARE_BNX2X
 	help
 	  Firmware files for Broadcom NetXtreme 10Gb ethernet cards (bnx2x)
 
-config BR2_PACKAGE_LINUX_FIRMWARE_CXGB4
+config BR2_PACKAGE_LINUX_FIRMWARE_CXGB4_T4
 	bool "Chelsio T4"
 	help
 	  Firmware files for Chelsio T4 1Gb and 10Gb ethernet cards (cxgb4)
+
+config BR2_PACKAGE_LINUX_FIRMWARE_CXGB4_T5
+	bool "Chelsio T5"
+	help
+	  Firmware files for Chelsio T5 1Gb and 10Gb ethernet cards (cxgb4)
+
 endmenu
 
 menu "DVB firmware"
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 031b829..9febad4 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -179,12 +179,18 @@ LINUX_FIRMWARE_FILES += \
 # which is installed unconditionally
 endif
 
-ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_CXGB4),y)
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_CXGB4_T4),y)
 # cxgb4/t4fw.bin is a symlink to cxgb4/t4fw-1.11.27.0.bin
 LINUX_FIRMWARE_FILES += cxgb4/t4fw-1.11.27.0.bin cxgb4/t4fw.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.chelsio_firmware
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_CXGB4_T5),y)
+# cxgb4/t5fw.bin is a symlink to cxgb4/t5fw-1.11.27.0.bin
+LINUX_FIRMWARE_FILES += cxgb4/t5fw-1.11.27.0.bin cxgb4/t5fw.bin
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.chelsio_firmware
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_XC5000),y)
 LINUX_FIRMWARE_FILES += dvb-fe-xc5000-1.6.114.fw
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.xc5000
-- 
1.9.1
