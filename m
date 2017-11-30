From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Nov 2017 15:50:38 +0100
Subject: [Buildroot] [git commit] fs/iso9660: don't pollute $(BUILD_DIR)
 with temp dir
Message-ID: <20171201205341.EA9FB80FC6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=76ff49300923f239e8912d1fd107763c5e5886ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use the newly-introdued $(FS_DIR) location to store temporary files.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 fs/iso9660/iso9660.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/iso9660/iso9660.mk b/fs/iso9660/iso9660.mk
index d49d593..c2de271 100644
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
