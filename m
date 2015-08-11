From: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Date: Tue, 11 Aug 2015 17:23:50 -0400
Subject: [Buildroot] [PATCH v2] fs: iso9660: change boot menu entry text
Message-ID: <1439328230-17550-1-git-send-email-vivien.didelot@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Replace Grub-specific "menu.lst" with "menu config" in the
BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU Kconfig entry text, and mention
missing grub.cfg for Grub 2.

Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
---
 fs/iso9660/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/iso9660/Config.in b/fs/iso9660/Config.in
index 7e1ddd6..2482e44 100644
--- a/fs/iso9660/Config.in
+++ b/fs/iso9660/Config.in
@@ -47,13 +47,14 @@ config BR2_TARGET_ROOTFS_ISO9660_ISOLINUX
 endchoice
 
 config BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU
-	string "Boot menu.lst file"
+	string "Boot menu config file"
 	default "fs/iso9660/menu.lst" if BR2_TARGET_ROOTFS_ISO9660_GRUB
 	default "fs/iso9660/grub.cfg" if BR2_TARGET_ROOTFS_ISO9660_GRUB2
 	default "fs/iso9660/isolinux.cfg" if BR2_TARGET_ROOTFS_ISO9660_ISOLINUX
 	help
 	  Use this option to provide a custom bootloader configuration
-	  file (menu.lst for Grub, isolinux.cfg for isolinux).
+	  file (menu.lst for Grub, grub.cfg for Grub 2, isolinux.cfg for
+	  isolinux).
 
 	  Note that the strings __KERNEL_PATH__ and __INITRD_PATH__
 	  will automatically be replaced by the path to the kernel and
-- 
2.5.0
