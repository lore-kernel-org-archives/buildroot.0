From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 19 Apr 2010 11:05:30 +0200
Subject: [Buildroot] [git commit master] fs/ext2: fix typo
Message-ID: <20100419090622.1D4118B6C9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=7b7e1bc3fb490f7fb1f71b1df9a887ab30da0bbd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

BR2_TARGET_ROOTFS_EXT2_RESBLKS is an int, so test against 0 rather than
the empty string - Otherwise the test is always true and a -m option
without arguments is added to the argument list, causing genext2fs to
get confused.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 fs/ext2/ext2.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/fs/ext2/ext2.mk b/fs/ext2/ext2.mk
index 68b3b81..f3d3ff9 100644
--- a/fs/ext2/ext2.mk
+++ b/fs/ext2/ext2.mk
@@ -18,7 +18,7 @@ ifneq ($(strip $(BR2_TARGET_ROOTFS_EXT2_INODES)),0)
 EXT2_OPTS += -N $(BR2_TARGET_ROOTFS_EXT2_INODES)
 endif
 
-ifneq ($(strip $(BR2_TARGET_ROOTFS_EXT2_RESBLKS)),)
+ifneq ($(strip $(BR2_TARGET_ROOTFS_EXT2_RESBLKS)),0)
 EXT2_OPTS += -m $(BR2_TARGET_ROOTFS_EXT2_RESBLKS)
 endif
 
-- 
1.6.3.3
