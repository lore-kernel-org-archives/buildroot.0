From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Aug 2015 21:42:51 +0200
Subject: [Buildroot] [git commit] fs: iso9660: change boot menu entry text
Message-ID: <20150818194318.209DA81D58@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7a691d08e397f212b2d1adfabaee6b0b3eeefac6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Replace Grub-specific "menu.lst" with "menu config" in the
BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU Kconfig entry text, and mention
missing grub.cfg for Grub 2.

Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 fs/iso9660/Config.in |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

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
