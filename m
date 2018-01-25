From: Carlos Santos <casantos@datacom.ind.br>
Date: Thu, 25 Jan 2018 14:21:19 -0200
Subject: [Buildroot] [PATCH 1/3] linux-firmware: fix cxgb4 firmware
 installation
Message-ID: <20180125162121.21737-1-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It was updated to revision 1.16.45.0 in a commit before the one
currently referenced by LINUX_FIRMWARE_VERSION.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
 package/linux-firmware/linux-firmware.mk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index d238abe9ea..3d18c6fc34 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -324,14 +324,14 @@ LINUX_FIRMWARE_FILES += bnx2x/*
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_CXGB4_T4),y)
-# cxgb4/t4fw.bin is a symlink to cxgb4/t4fw-1.16.26.0.bin
-LINUX_FIRMWARE_FILES += cxgb4/t4fw-1.16.26.0.bin cxgb4/t4fw.bin
+# cxgb4/t4fw.bin is a symlink to cxgb4/t4fw-1.16.45.0.bin
+LINUX_FIRMWARE_FILES += cxgb4/t4fw-1.16.45.0.bin cxgb4/t4fw.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.chelsio_firmware
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_CXGB4_T5),y)
-# cxgb4/t5fw.bin is a symlink to cxgb4/t5fw-1.16.26.0.bin
-LINUX_FIRMWARE_FILES += cxgb4/t5fw-1.16.26.0.bin cxgb4/t5fw.bin
+# cxgb4/t5fw.bin is a symlink to cxgb4/t5fw-1.16.45.0.bin
+LINUX_FIRMWARE_FILES += cxgb4/t5fw-1.16.45.0.bin cxgb4/t5fw.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.chelsio_firmware
 endif
 
-- 
2.14.3
