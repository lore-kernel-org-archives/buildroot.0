From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:56:43 -0000
Subject: [Buildroot] [git commit branch/next] fs/iso9660: change the name of
	the tmp dir to be consistent
Message-ID: <20150808105631.C0DDD7FC31@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4d1a9d8cd8f4722ecb059552ebb837eef53f7a95
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Currently, the generated rootfs will be called rootfs.iso9660, but the
temporary directory we create while building it is called
rootfs-iso9660.tmp. They are in different directories so it's not so
obvious, but still to be consistent it's better to call the temp dir
rootfs.iso9660.tmp.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 fs/iso9660/iso9660.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
