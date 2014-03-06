From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  6 Mar 2014 17:55:34 -0300
Subject: [Buildroot] [PATCH 1/2] fs/initramfs: fix initramfs support
Message-ID: <1394139335-28476-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On commit a24877586a566e052897e50e6a0c2f53cfb029f TARGETS_ROOTFS was
introduced, however fs/initramfs/initramfs.mk was never updated, hence a
show-targets would be rootfs-initramfs with rootfs-cpio afterwards hence
never rebuilding the kernel with a proper cpio archive since TARGETS is
always before rootfs-* as stated in the commit description.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 fs/initramfs/initramfs.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/initramfs/initramfs.mk b/fs/initramfs/initramfs.mk
index 7820d65..5d3ea89 100644
--- a/fs/initramfs/initramfs.mk
+++ b/fs/initramfs/initramfs.mk
@@ -18,5 +18,5 @@ rootfs-initramfs-show-depends:
 	@echo $(ROOTFS_INITRAMFS_DEPENDENCIES)
 
 ifeq ($(BR2_TARGET_ROOTFS_INITRAMFS),y)
-TARGETS += rootfs-initramfs
+TARGETS_ROOTFS += rootfs-initramfs
 endif
-- 
1.8.3.2
