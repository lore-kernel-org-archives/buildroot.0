From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 13 Jul 2015 22:52:28 +0200
Subject: [Buildroot] [PATCH] fs/iso9660: change the name of the tmp dir to
	be consistent
Message-ID: <1436820748-30551-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, the generated rootfs will be called rootfs.iso9660, but the
temporary directory we create while building it is called
rootfs-iso9660.tmp. They are in different directories so it's not so
obvious, but still to be consistent it's better to call the temp dir
rootfs.iso9660.tmp.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 fs/iso9660/iso9660.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/iso9660/iso9660.mk b/fs/iso9660/iso9660.mk
index 6ed979c..d836194 100644
--- a/fs/iso9660/iso9660.mk
+++ b/fs/iso9660/iso9660.mk
@@ -35,7 +35,7 @@ ROOTFS_ISO9660_USE_INITRD = YES
 endif
 
 ifeq ($(ROOTFS_ISO9660_USE_INITRD),YES)
-ROOTFS_ISO9660_TARGET_DIR = $(BUILD_DIR)/rootfs-iso9660.tmp
+ROOTFS_ISO9660_TARGET_DIR = $(BUILD_DIR)/rootfs.iso9660.tmp
 define ROOTFS_ISO9660_CREATE_TEMPDIR
 	$(RM) -rf $(ROOTFS_ISO9660_TARGET_DIR)
 	mkdir -p $(ROOTFS_ISO9660_TARGET_DIR)
-- 
2.1.4
