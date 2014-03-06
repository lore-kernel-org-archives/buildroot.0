From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Mar 2014 23:01:33 +0100
Subject: [Buildroot] [git commit] fs/initramfs: fix initramfs support
Message-ID: <20140306220159.F36809BDD6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cfd1f70a10da80b78a607b208695218c8396a57d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

On commit a24877586a566e052897e50e6a0c2f53cfb029f TARGETS_ROOTFS was
introduced, however fs/initramfs/initramfs.mk was never updated, hence a
show-targets would be rootfs-initramfs with rootfs-cpio afterwards hence
never rebuilding the kernel with a proper cpio archive since TARGETS is
always before rootfs-* as stated in the commit description.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 fs/initramfs/initramfs.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
