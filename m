From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 5 Nov 2010 00:02:04 +0100
Subject: [Buildroot] [git commit master 1/1] Remove INITRAMFS_TARGET variable
Message-ID: <20101104230330.8B5F08DB53@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=2e869a7c0508f3dda96ed69f79c79c89ea4e6a5d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This used to be needed when the filesystem code was rewritten, but not
the Linux compilation code. Now that the Linux compilation code has
been rewritten, the mechanism to ensure that initramfs gets built
*before* the kernel so that it can be integrated is different, and
this INITRAMFS_TARGET variable is no longer used.

See f507921d391bb2578261a9e45c003e72302dc67a for details.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 fs/initramfs/initramfs.mk |    6 ------
 1 files changed, 0 insertions(+), 6 deletions(-)

diff --git a/fs/initramfs/initramfs.mk b/fs/initramfs/initramfs.mk
index 30969a4..dd6aa94 100644
--- a/fs/initramfs/initramfs.mk
+++ b/fs/initramfs/initramfs.mk
@@ -6,12 +6,6 @@
 #
 #############################################################
 
-ifeq ($(BR2_TARGET_ROOTFS_INITRAMFS),y)
-INITRAMFS_TARGET:=initramfs-root
-else
-INITRAMFS_TARGET:= #nothing
-endif
-
 define ROOTFS_INITRAMFS_INIT_SYMLINK
 	if [ ! -e $(TARGET_DIR)/init ]; then \
 		ln -s sbin/init $(TARGET_DIR)/init; \
-- 
1.7.1
