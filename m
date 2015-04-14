From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Apr 2015 10:12:32 +0200
Subject: [Buildroot] [git commit] fs: declare phony targets as such
Message-ID: <20150414081954.CF0337F9E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2aef771f6e05d3fd1ea59c2faab986eaa55f28f7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit improves the filesystem handling code to declare its
various targets as PHONY when appropriate.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 fs/common.mk              |    2 ++
 fs/ext2/ext2.mk           |    2 ++
 fs/initramfs/initramfs.mk |    2 ++
 fs/iso9660/iso9660.mk     |    2 ++
 4 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/fs/common.mk b/fs/common.mk
index 5d07f00..cac127f 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -102,6 +102,8 @@ rootfs-$(1)-show-depends:
 
 rootfs-$(1): $$(BINARIES_DIR)/rootfs.$(1) $$(ROOTFS_$(2)_POST_TARGETS)
 
+.PHONY: rootfs-$(1) rootfs-$(1)-show-depends
+
 ifeq ($$(BR2_TARGET_ROOTFS_$(2)),y)
 TARGETS_ROOTFS += rootfs-$(1)
 endif
diff --git a/fs/ext2/ext2.mk b/fs/ext2/ext2.mk
index 1cac72e..cab66a5 100644
--- a/fs/ext2/ext2.mk
+++ b/fs/ext2/ext2.mk
@@ -35,6 +35,8 @@ endef
 rootfs-ext2-symlink:
 	ln -sf rootfs.ext2$(ROOTFS_EXT2_COMPRESS_EXT) $(BINARIES_DIR)/rootfs.ext$(BR2_TARGET_ROOTFS_EXT2_GEN)$(ROOTFS_EXT2_COMPRESS_EXT)
 
+.PHONY: rootfs-ext2-symlink
+
 ifneq ($(BR2_TARGET_ROOTFS_EXT2_GEN),2)
 ROOTFS_EXT2_POST_TARGETS += rootfs-ext2-symlink
 endif
diff --git a/fs/initramfs/initramfs.mk b/fs/initramfs/initramfs.mk
index 308924d..db50812 100644
--- a/fs/initramfs/initramfs.mk
+++ b/fs/initramfs/initramfs.mk
@@ -17,6 +17,8 @@ rootfs-initramfs: $(ROOTFS_INITRAMFS_DEPENDENCIES) $(ROOTFS_INITRAMFS_POST_TARGE
 rootfs-initramfs-show-depends:
 	@echo $(ROOTFS_INITRAMFS_DEPENDENCIES)
 
+.PHONY: rootfs-initramfs rootfs-initramfs-show-depends
+
 ifeq ($(BR2_TARGET_ROOTFS_INITRAMFS),y)
 TARGETS_ROOTFS += rootfs-initramfs
 endif
diff --git a/fs/iso9660/iso9660.mk b/fs/iso9660/iso9660.mk
index 5b44ba4..4ccfce9 100644
--- a/fs/iso9660/iso9660.mk
+++ b/fs/iso9660/iso9660.mk
@@ -48,6 +48,8 @@ rootfs-iso9660: $(BINARIES_DIR)/rootfs.iso9660
 rootfs-iso9660-show-depends:
 	@echo $(ROOTFS_ISO9660_DEPENDENCIES)
 
+.PHONY: rootfs-iso9660 rootfs-iso9660-show-depends
+
 ################################################################################
 #
 # Toplevel Makefile options
