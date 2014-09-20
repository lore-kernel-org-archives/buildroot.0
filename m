From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 20 Sep 2014 22:55:07 +0200
Subject: [Buildroot] [PATCH 09/15 v2] package/linux-firmware: use the new
	Chelsio cxgb4 firmware
In-Reply-To: <cover.1411246411.git.yann.morin.1998@free.fr>
References: <cover.1411246411.git.yann.morin.1998@free.fr>
Message-ID: <2127e852a30c1e0f2fd94276707227623921df75.1411246412.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix prompt at the same time.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/linux-firmware/Config.in         | 2 +-
 package/linux-firmware/linux-firmware.mk | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index ced990a..1cc9a05 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -167,7 +167,7 @@ config BR2_PACKAGE_LINUX_FIRMWARE_BNX2X
 	  Firmware files for Broadcom NetXtreme 10Gb ethernet cards (bnx2x)
 
 config BR2_PACKAGE_LINUX_FIRMWARE_CXGB4
-	bool "Chelsio T4 "
+	bool "Chelsio T4"
 	help
 	  Firmware files for Chelsio T4 1Gb and 10Gb ethernet cards (cxgb4)
 endmenu
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index db5588f..43f3821 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -181,8 +181,8 @@ LINUX_FIRMWARE_FILES += \
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_CXGB4),y)
-# cxgb4/t4fw.bin is a symlink to cxgb4/t4fw-1.9.23.0.bin
-LINUX_FIRMWARE_FILES += cxgb4/t4fw-1.9.23.0.bin cxgb4/t4fw.bin
+# cxgb4/t4fw.bin is a symlink to cxgb4/t4fw-1.11.27.0.bin
+LINUX_FIRMWARE_FILES += cxgb4/t4fw-1.11.27.0.bin cxgb4/t4fw.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.chelsio_firmware
 endif
 
-- 
1.9.1
