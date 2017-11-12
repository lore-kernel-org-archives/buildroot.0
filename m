From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Nov 2017 18:45:48 +0100
Subject: [Buildroot] [PATCH 10/14] fs/iso9660: don't pollute $(BUILD_DIR)
 with temp dir
In-Reply-To: <cover.1510508733.git.yann.morin.1998@free.fr>
References: <cover.1510508733.git.yann.morin.1998@free.fr>
Message-ID: <874cbe4206f74a4f0f80009dc71c0529e49ebd01.1510508733.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use the newly-introdued $(FS_DIR) location to store temporary files.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 fs/iso9660/iso9660.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/iso9660/iso9660.mk b/fs/iso9660/iso9660.mk
index d49d593bd6..c2de27101a 100644
--- a/fs/iso9660/iso9660.mk
+++ b/fs/iso9660/iso9660.mk
@@ -35,7 +35,7 @@ ROOTFS_ISO9660_USE_INITRD = YES
 endif
 
 ifeq ($(ROOTFS_ISO9660_USE_INITRD),YES)
-ROOTFS_ISO9660_TARGET_DIR = $(BUILD_DIR)/rootfs.iso9660.tmp
+ROOTFS_ISO9660_TARGET_DIR = $(FS_DIR)/rootfs.iso9660.tmp
 define ROOTFS_ISO9660_CREATE_TEMPDIR
 	$(RM) -rf $(ROOTFS_ISO9660_TARGET_DIR)
 	mkdir -p $(ROOTFS_ISO9660_TARGET_DIR)
-- 
2.11.0
