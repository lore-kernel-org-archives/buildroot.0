From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Sep 2014 19:52:19 +0200
Subject: [Buildroot] [git commit] package/linux-firmware: use the new
	Chelsio cxgb4 firmware
Message-ID: <20140921175639.BA99C9D6E0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8145df654a1a26e3d319cf41c09806f59d6ac334
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix prompt at the same time.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-firmware/Config.in         |    2 +-
 package/linux-firmware/linux-firmware.mk |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 975445a..6c9b04b 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -156,7 +156,7 @@ config BR2_PACKAGE_LINUX_FIRMWARE_BNX2X
 	  Firmware files for Broadcom NetXtreme 10Gb ethernet cards (bnx2x)
 
 config BR2_PACKAGE_LINUX_FIRMWARE_CXGB4
-	bool "Chelsio T4 "
+	bool "Chelsio T4"
 	help
 	  Firmware files for Chelsio T4 1Gb and 10Gb ethernet cards (cxgb4)
 endmenu
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 87738a1..f42709c 100644
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
 
