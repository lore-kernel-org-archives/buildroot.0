From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Apr 2017 19:31:52 +0200
Subject: [Buildroot] [git commit] fs/ext2: ensure -b option is always set
	for mke2img
Message-ID: <20170430173247.CD3A3800BC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=84e1e3881222b59c5af7cb8de566746cac2eb67b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J Evans <g4@novadsp.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 fs/ext2/ext2.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/fs/ext2/ext2.mk b/fs/ext2/ext2.mk
index 30f1d17..9d3e8fd 100644
--- a/fs/ext2/ext2.mk
+++ b/fs/ext2/ext2.mk
@@ -6,9 +6,7 @@
 
 EXT2_OPTS = -G $(BR2_TARGET_ROOTFS_EXT2_GEN) -R $(BR2_TARGET_ROOTFS_EXT2_REV)
 
-ifneq ($(strip $(BR2_TARGET_ROOTFS_EXT2_BLOCKS)),0)
 EXT2_OPTS += -b $(BR2_TARGET_ROOTFS_EXT2_BLOCKS)
-endif
 
 ifneq ($(strip $(BR2_TARGET_ROOTFS_EXT2_INODES)),0)
 EXT2_OPTS += -i $(BR2_TARGET_ROOTFS_EXT2_INODES)
