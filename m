From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Mar 2013 23:37:06 +0100
Subject: [Buildroot] [PATCH 1/5] fs/ext2: enclose the ext2 options in
	if...endif
In-Reply-To: <cover.1363559530.git.yann.morin.1998@free.fr>
References: <cover.1363559530.git.yann.morin.1998@free.fr>
Message-ID: <bf68d00471e52cf85b52f28cbc127e95657683be.1363559530.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use a 'if...endif' construct instead of repeating the
'depends on' for each symbols.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle <arnout@mind.be>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
-- 
1.7.2.5
