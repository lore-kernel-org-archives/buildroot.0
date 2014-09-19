From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 19 Sep 2014 23:14:56 +0200
Subject: [Buildroot] [PATCH 06/14] package/linux-firmware: use the new
	Chelsio cxgb4 firmware
In-Reply-To: <cover.1411161197.git.yann.morin.1998@free.fr>
References: <cover.1411161197.git.yann.morin.1998@free.fr>
Message-ID: <c987296e7aae06eac35f18bee41dff3dd54d0bbf.1411161197.git.yann.morin.1998@free.fr>
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
index 21d2d5d..220c794 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -160,7 +160,7 @@ config BR2_PACKAGE_LINUX_FIRMWARE_BNX2X
 	  Firmware files for Broadcom NetXtreme 10Gb ethernet cards (bnx2x)
 
 config BR2_PACKAGE_LINUX_FIRMWARE_CXGB4
-	bool "Chelsio T4 "
+	bool "Chelsio T4"
 	help
 	  Firmware files for Chelsio T4 1Gb and 10Gb ethernet cards (cxgb4)
 endmenu
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index f2c2e3a..031b829 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -180,8 +180,8 @@ LINUX_FIRMWARE_FILES += \
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
