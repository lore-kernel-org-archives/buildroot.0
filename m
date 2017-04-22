From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 23 Apr 2017 00:49:14 +0200
Subject: [Buildroot] [PATCH v9 2/7] e2fsprogs: add help text for all config
	options
In-Reply-To: <20170422224919.3257-1-arnout@mind.be>
References: <20170422224919.3257-1-arnout@mind.be>
Message-ID: <20170422224919.3257-3-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <casantos@datacom.ind.br>

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/e2fsprogs/Config.in | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/package/e2fsprogs/Config.in b/package/e2fsprogs/Config.in
index 676327dc2f..23c4db5329 100644
--- a/package/e2fsprogs/Config.in
+++ b/package/e2fsprogs/Config.in
@@ -23,14 +23,20 @@ if BR2_PACKAGE_E2FSPROGS
 
 config BR2_PACKAGE_E2FSPROGS_DEBUGFS
 	bool "debugfs"
+	help
+	  ext2/ext3/ext4 file system debugger
 
 config BR2_PACKAGE_E2FSPROGS_E2IMAGE
 	bool "e2image"
+	help
+	  Save critical ext2/ext3/ext4 filesystem metadata to a file
 
 config BR2_PACKAGE_E2FSPROGS_E4DEFRAG
 	bool "e4defrag"
 	depends on !BR2_nios2 # fallocate not implemented
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC # sync_file_range not impl
+	help
+	  Online defragmenter for ext4 filesystem
 
 comment "e4defrag needs a glibc or musl toolchain"
 	depends on !BR2_nios2
@@ -39,17 +45,24 @@ comment "e4defrag needs a glibc or musl toolchain"
 config BR2_PACKAGE_E2FSPROGS_FSCK
 	bool "fsck"
 	default y
+	help
+	  Check and repair a Linux file system. This is a wrapper around
+	  the filesystem-specific fsck tools.
 
 config BR2_PACKAGE_E2FSPROGS_FUSE2FS
 	bool "fuse2fs"
 	depends on !BR2_STATIC_LIBS # libfuse
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libfuse
 	select BR2_PACKAGE_LIBFUSE
+	help
+	  FUSE file system client for ext2/ext3/ext4 file systems
 
 comment "fuse2fs needs a toolchain w/ threads, dynamic library"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
 
 config BR2_PACKAGE_E2FSPROGS_RESIZE2FS
 	bool "resize2fs"
+	help
+	  ext2/ext3/ext4 file system resizer
 
 endif
-- 
2.11.0
