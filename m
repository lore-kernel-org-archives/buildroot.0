From: =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>
Date: Thu, 30 Jul 2015 16:47:31 +0200
Subject: [Buildroot] [PATCH 2/2] fs/iso9660: install Isolinux comboot modules
In-Reply-To: <1438267651-16818-1-git-send-email-nrubinstein@aldebaran.com>
References: <1438267651-16818-1-git-send-email-nrubinstein@aldebaran.com>
Message-ID: <1438267651-16818-2-git-send-email-nrubinstein@aldebaran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This installs every module selected by the BR2_TARGET_SYSLINUX_C32.
This is useful when using a custom Isolinux configuration file that may use
comboot modules.

Signed-off-by: No? Rubinstein <nrubinstein@aldebaran.com>
---
 fs/iso9660/iso9660.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/iso9660/iso9660.mk b/fs/iso9660/iso9660.mk
index 9100547..cdafd4c 100644
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
-- 
2.1.4
