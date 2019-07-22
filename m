From: Petr Vorel <petr.vorel@gmail.com>
Date: Mon, 22 Jul 2019 07:16:26 +0200
Subject: [Buildroot] [PATCH 1/2] system: add default to
 BR2_ROOTFS_DEVICE_TABLE_SUPPORTS_EXTENDED_ATTRIBUTES
Message-ID: <20190722051627.12993-1-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Enable BR2_ROOTFS_DEVICE_TABLE_SUPPORTS_EXTENDED_ATTRIBUTES if none
of non-supported rootfs is selected.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Hi,

not sure about cloop, cpio, tar, ubi.

Kind regards,
Petr

 system/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/system/Config.in b/system/Config.in
index af7d8566d3..842e745cd3 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -196,6 +196,7 @@ config BR2_ROOTFS_STATIC_DEVICE_TABLE
 
 config BR2_ROOTFS_DEVICE_TABLE_SUPPORTS_EXTENDED_ATTRIBUTES
 	bool "support extended attributes in device tables"
+	default y if !BR2_TARGET_ROOTFS_AXFS && !BR2_TARGET_ROOTFS_CRAMFS && !BR2_TARGET_ROOTFS_ISO9660 && !BR2_TARGET_ROOTFS_ROMFS && !BR2_TARGET_ROOTFS_YAFFS2
 	help
 	  Support extended attributes handling in device tables
 
-- 
2.20.1
