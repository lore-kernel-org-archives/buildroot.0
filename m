From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Mar 2015 19:33:30 +0200
Subject: [Buildroot] [PATCH 16/35] fs: declare phony targets as such
In-Reply-To: <1427650429-9293-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1427650429-9293-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1427650429-9293-17-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit improves the filesystem handling code to declare its
various targets as PHONY when appropriate.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 fs/common.mk              | 2 ++
 fs/initramfs/initramfs.mk | 2 ++
 fs/iso9660/iso9660.mk     | 2 ++
 3 files changed, 6 insertions(+)

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
-- 
2.1.0
