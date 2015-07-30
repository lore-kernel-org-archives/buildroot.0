From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Jul 2015 23:31:26 +0200
Subject: [Buildroot] [git commit] fs/iso9660: install Isolinux comboot
	modules
Message-ID: <20150730213131.7223A81D78@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8fb2b4c9daf00bcba3d6626f19c21f52675ce6b0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This installs every module selected by the BR2_TARGET_SYSLINUX_C32.
This is useful when using a custom Isolinux configuration file that may use
comboot modules.

Signed-off-by: No?? Rubinstein <nrubinstein@aldebaran.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 fs/iso9660/iso9660.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/iso9660/iso9660.mk b/fs/iso9660/iso9660.mk
index d836194..32d79d7 100644
--- a/fs/iso9660/iso9660.mk
+++ b/fs/iso9660/iso9660.mk
@@ -68,8 +68,8 @@ ROOTFS_ISO9660_BOOTLOADER_CONFIG_PATH = \
 	$(ROOTFS_ISO9660_TARGET_DIR)/isolinux/isolinux.cfg
 ROOTFS_ISO9660_BOOT_IMAGE = isolinux/isolinux.bin
 define ROOTFS_ISO9660_INSTALL_BOOTLOADER
-	$(INSTALL) -D -m 0644 $(BINARIES_DIR)/syslinux/isolinux.bin \
-		$(ROOTFS_ISO9660_TARGET_DIR)/isolinux/isolinux.bin
+	$(INSTALL) -D -m 0644 $(BINARIES_DIR)/syslinux/* \
+		$(ROOTFS_ISO9660_TARGET_DIR)/isolinux/
 	$(INSTALL) -D -m 0644 $(HOST_DIR)/usr/share/syslinux/ldlinux.c32 \
 		$(ROOTFS_ISO9660_TARGET_DIR)/isolinux/ldlinux.c32
 endef
