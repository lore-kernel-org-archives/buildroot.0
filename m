From: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Date: Tue, 11 Aug 2015 17:01:01 -0400
Subject: [Buildroot] [PATCH] fs: iso9660: change boot menu entry text
Message-ID: <1439326861-11486-1-git-send-email-vivien.didelot@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Replace Grub-specific "menu.lst" with "menu config" in the
BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU Kconfig entry text.

Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
---
 fs/iso9660/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/iso9660/Config.in b/fs/iso9660/Config.in
index 7e1ddd6..bab9eec 100644
--- a/fs/iso9660/Config.in
+++ b/fs/iso9660/Config.in
@@ -47,7 +47,7 @@ config BR2_TARGET_ROOTFS_ISO9660_ISOLINUX
 endchoice
 
 config BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU
-	string "Boot menu.lst file"
+	string "Boot menu config file"
 	default "fs/iso9660/menu.lst" if BR2_TARGET_ROOTFS_ISO9660_GRUB
 	default "fs/iso9660/grub.cfg" if BR2_TARGET_ROOTFS_ISO9660_GRUB2
 	default "fs/iso9660/isolinux.cfg" if BR2_TARGET_ROOTFS_ISO9660_ISOLINUX
-- 
2.5.0
