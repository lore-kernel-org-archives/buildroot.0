From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  9 Jun 2015 00:21:38 +0200
Subject: [Buildroot] [PATCHv2 05/15] fs/iso9660: change the location of the
	splash image
In-Reply-To: <1433802108-14351-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1433802108-14351-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1433802108-14351-6-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to simplify the introduction of the support for using ISO9660
as the real root filesystem, this commit changes the location of the
grub splash image. This makes it match where the splash image is
located in $(TARGET_DIR), so that regardless of whether the
initrd/initramfs solution or the real iso9660 filesystem solution are
used, the splash image is installed at the same location.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Samuel Martin <s.martin49@gmail.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 fs/iso9660/iso9660.mk | 2 +-
 fs/iso9660/menu.lst   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/iso9660/iso9660.mk b/fs/iso9660/iso9660.mk
index 54b1653..b3e6b9d 100644
--- a/fs/iso9660/iso9660.mk
+++ b/fs/iso9660/iso9660.mk
@@ -12,7 +12,7 @@ ROOTFS_ISO9660_DEPENDENCIES = grub host-cdrkit host-fakeroot linux rootfs-cpio
 ifeq ($(BR2_TARGET_GRUB_SPLASH),y)
 define ROOTFS_ISO9660_SPLASHSCREEN
 	$(INSTALL) -D -m 0644 boot/grub/splash.xpm.gz \
-		$(ROOTFS_ISO9660_TARGET_DIR)/splash.xpm.gz
+		$(ROOTFS_ISO9660_TARGET_DIR)/boot/grub/splash.xpm.gz
 endef
 else
 define ROOTFS_ISO9660_SPLASHSCREEN
diff --git a/fs/iso9660/menu.lst b/fs/iso9660/menu.lst
index c0bbff6..fd5c76a 100644
--- a/fs/iso9660/menu.lst
+++ b/fs/iso9660/menu.lst
@@ -5,7 +5,7 @@ timeout		10
 color 		cyan/blue white/blue
 
 # Gets enabled/disabled depending on Grub support for splashimage
-splashimage	/splash.xpm.gz
+splashimage	/boot/grub/splash.xpm.gz
 
 # Used when a splashimage is enabled
 foreground 	000000
-- 
2.1.0
