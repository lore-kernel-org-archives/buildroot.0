From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 12 Apr 2013 14:39:04 +0200
Subject: [Buildroot] [git commit] fs/ext2: enclose the ext2 options in
	if...endif
Message-ID: <20130412130254.1D1789B5D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5fbef614802d4de658a387e9306b52f31356db26
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use a 'if...endif' construct instead of repeating the
'depends on' for each symbols.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle <arnout@mind.be>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 fs/ext2/Config.in |    7 +++----
 1 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/fs/ext2/Config.in b/fs/ext2/Config.in
index 2af44a8..cb4beed 100644
--- a/fs/ext2/Config.in
+++ b/fs/ext2/Config.in
@@ -3,25 +3,23 @@ config BR2_TARGET_ROOTFS_EXT2
 	help
 	  Build an ext2 root filesystem
 
+if BR2_TARGET_ROOTFS_EXT2
+
 config BR2_TARGET_ROOTFS_EXT2_BLOCKS
 	int "size in blocks (leave at 0 for auto calculation)"
-	depends on BR2_TARGET_ROOTFS_EXT2
 	default 0
 
 config BR2_TARGET_ROOTFS_EXT2_INODES
 	int "inodes (leave at 0 for auto calculation)"
-	depends on BR2_TARGET_ROOTFS_EXT2
 	default 0
 
 config BR2_TARGET_ROOTFS_EXT2_RESBLKS
 	int "reserved blocks percentage"
-	depends on BR2_TARGET_ROOTFS_EXT2
 	default 0
 
 choice
 	prompt "Compression method"
 	default BR2_TARGET_ROOTFS_EXT2_NONE
-	depends on BR2_TARGET_ROOTFS_EXT2
 	help
 	  Select compressor for ext2 filesystem of the root filesystem
 
@@ -47,3 +45,4 @@ config BR2_TARGET_ROOTFS_EXT2_LZMA
 
 endchoice
 
+endif # BR2_TARGET_ROOTFS_EXT2
