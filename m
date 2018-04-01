From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun,  1 Apr 2018 02:08:36 -0300
Subject: [Buildroot] [PATCH v2 23/37] fs/*/Config.in: fix attributes order
In-Reply-To: <20180401050850.5701-1-ricardo.martincoski@gmail.com>
References: <20180401050850.5701-1-ricardo.martincoski@gmail.com>
Message-ID: <20180401050850.5701-24-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

... to follow the convention: type, default, depends on, select, help.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
Changes v1 -> v2:
  - no changes
---
 fs/jffs2/Config.in | 6 +++---
 fs/tar/Config.in   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/jffs2/Config.in b/fs/jffs2/Config.in
index f1703f4edd..208cabaa52 100644
--- a/fs/jffs2/Config.in
+++ b/fs/jffs2/Config.in
@@ -38,8 +38,8 @@ endchoice
 
 config BR2_TARGET_ROOTFS_JFFS2_CUSTOM_EBSIZE
 	hex "Erase block size"
-	depends on BR2_TARGET_ROOTFS_JFFS2_CUSTOM
 	default 0x20000
+	depends on BR2_TARGET_ROOTFS_JFFS2_CUSTOM
 	help
 	  Set to erase size of memory
 
@@ -68,8 +68,8 @@ config BR2_TARGET_ROOTFS_JFFS2_PAD
 
 config BR2_TARGET_ROOTFS_JFFS2_PADSIZE
 	hex "Pad output size (0x0 = to end of EB)"
-	depends on BR2_TARGET_ROOTFS_JFFS2_PAD
 	default 0x0
+	depends on BR2_TARGET_ROOTFS_JFFS2_PAD
 	help
 	  Set to 0x0 to pad to end of erase block.
 
@@ -100,8 +100,8 @@ config BR2_TARGET_ROOTFS_JFFS2_USE_CUSTOM_PAGESIZE
 
 config BR2_TARGET_ROOTFS_JFFS2_CUSTOM_PAGESIZE
 	hex "Virtual memory page size"
-	depends on BR2_TARGET_ROOTFS_JFFS2_USE_CUSTOM_PAGESIZE
 	default 0x1000
+	depends on BR2_TARGET_ROOTFS_JFFS2_USE_CUSTOM_PAGESIZE
 	help
 	  Set to virtual memory page size of target system (in bytes).  This value
 	  should match the virtual page size in Linux (i.e. this should have the
diff --git a/fs/tar/Config.in b/fs/tar/Config.in
index 2116edf143..a4e375c68b 100644
--- a/fs/tar/Config.in
+++ b/fs/tar/Config.in
@@ -50,8 +50,8 @@ endchoice
 
 config BR2_TARGET_ROOTFS_TAR_OPTIONS
 	string "other random options to pass to tar"
-	depends on BR2_TARGET_ROOTFS_TAR
 	default ""
+	depends on BR2_TARGET_ROOTFS_TAR
 	help
 	  Any other flags you want to pass to tar
 	  Refer to tar --help for details
-- 
2.14.1
