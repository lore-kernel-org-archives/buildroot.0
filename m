From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 20 Sep 2014 22:55:08 +0200
Subject: [Buildroot] [PATCH 10/15 v2] package/linux-firmware: add option for
	Chelsio cxgb4 T5
In-Reply-To: <cover.1411246411.git.yann.morin.1998@free.fr>
References: <cover.1411246411.git.yann.morin.1998@free.fr>
Message-ID: <29c7d55429066500c79483cafae81bc098a5f534.1411246412.git.yann.morin.1998@free.fr>
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
index 1cc9a05..56045a8 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -166,10 +166,16 @@ config BR2_PACKAGE_LINUX_FIRMWARE_BNX2X
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
index 43f3821..9826de5 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -180,12 +180,18 @@ LINUX_FIRMWARE_FILES += \
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
