From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  4 Nov 2010 17:21:28 +0100
Subject: [Buildroot] [PATCH 1/1] Remove INITRAMFS_TARGET variable
In-Reply-To: <cover.1288887683.git.thomas.petazzoni@free-electrons.com>
References: <cover.1288887683.git.thomas.petazzoni@free-electrons.com>
Message-ID: <ba1423a20cd11aadc3ab175bf5710a1a763bf544.1288887683.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This used to be needed when the filesystem code was rewritten, but not
the Linux compilation code. Now that the Linux compilation code has
been rewritten, the mechanism to ensure that initramfs gets built
*before* the kernel so that it can be integrated is different, and
this INITRAMFS_TARGET variable is no longer used.

See f507921d391bb2578261a9e45c003e72302dc67a for details.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
1.7.0.4
