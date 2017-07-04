From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Jul 2017 08:46:23 +0200
Subject: [Buildroot] [git commit] fs/ext2: always pass the number of inodes
Message-ID: <20170704064312.D062480811@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ef975b50636726e9bde28b0baa7a8715cbe971c0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

... since zero also means auto for the mke2img script, now.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 fs/ext2/ext2.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/ext2/ext2.mk b/fs/ext2/ext2.mk
index 9d3e8fd..3fc12d7 100644
--- a/fs/ext2/ext2.mk
+++ b/fs/ext2/ext2.mk
@@ -8,9 +8,8 @@ EXT2_OPTS = -G $(BR2_TARGET_ROOTFS_EXT2_GEN) -R $(BR2_TARGET_ROOTFS_EXT2_REV)
 
 EXT2_OPTS += -b $(BR2_TARGET_ROOTFS_EXT2_BLOCKS)
 
-ifneq ($(strip $(BR2_TARGET_ROOTFS_EXT2_INODES)),0)
 EXT2_OPTS += -i $(BR2_TARGET_ROOTFS_EXT2_INODES)
-endif
+
 EXT2_OPTS += -I $(BR2_TARGET_ROOTFS_EXT2_EXTRA_INODES)
 
 ifneq ($(strip $(BR2_TARGET_ROOTFS_EXT2_RESBLKS)),0)
