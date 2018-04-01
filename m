From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun,  1 Apr 2018 02:08:20 -0300
Subject: [Buildroot] [PATCH v2 07/37] fs/*/*.mk: fix code style
In-Reply-To: <20180401050850.5701-1-ricardo.martincoski@gmail.com>
References: <20180401050850.5701-1-ricardo.martincoski@gmail.com>
Message-ID: <20180401050850.5701-8-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The header of the initramfs.mk file fits in one line, so rearrange it.
Remove consecutive empty line.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
Changes v1 -> v2:
  - no changes
---
 fs/initramfs/initramfs.mk | 3 +--
 fs/iso9660/iso9660.mk     | 1 -
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/fs/initramfs/initramfs.mk b/fs/initramfs/initramfs.mk
index b8dee18ec5..c751093214 100644
--- a/fs/initramfs/initramfs.mk
+++ b/fs/initramfs/initramfs.mk
@@ -1,7 +1,6 @@
 ################################################################################
 #
-# Build a kernel with an integrated initial ramdisk
-# filesystem based on cpio.
+# Build a kernel with an integrated initial ramdisk filesystem based on cpio.
 #
 ################################################################################
 
diff --git a/fs/iso9660/iso9660.mk b/fs/iso9660/iso9660.mk
index b33cf4cd8a..a129655ce3 100644
--- a/fs/iso9660/iso9660.mk
+++ b/fs/iso9660/iso9660.mk
@@ -128,7 +128,6 @@ ROOTFS_ISO9660_PRE_GEN_HOOKS += ROOTFS_ISO9660_DISABLE_EXTERNAL_INITRD
 
 endif # ROOTFS_ISO9660_USE_INITRD
 
-
 define ROOTFS_ISO9660_CMD
 	$(HOST_DIR)/bin/genisoimage -J -R -b $(ROOTFS_ISO9660_BOOT_IMAGE) \
 		-no-emul-boot -boot-load-size 4 -boot-info-table \
-- 
2.14.1
