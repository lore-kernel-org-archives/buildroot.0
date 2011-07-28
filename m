From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 28 Jul 2011 15:35:55 +0200
Subject: [Buildroot] [git commit] e2fsprogs: simplify Config.in
Message-ID: <20110728133942.798528B532@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=bf102241678a7993cce7b028125400962e1974e8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

No need for 'depends on' for all individual options when they already
are in a conditional section.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/e2fsprogs/Config.in |   18 ------------------
 1 files changed, 0 insertions(+), 18 deletions(-)

diff --git a/package/e2fsprogs/Config.in b/package/e2fsprogs/Config.in
index 2bb92d9..3060719 100644
--- a/package/e2fsprogs/Config.in
+++ b/package/e2fsprogs/Config.in
@@ -16,79 +16,64 @@ if BR2_PACKAGE_E2FSPROGS_UTILS
 config BR2_PACKAGE_E2FSPROGS_BADBLOCKS
 	bool "badblocks"
 	default y
-	depends on BR2_PACKAGE_E2FSPROGS
 
 config BR2_PACKAGE_E2FSPROGS_BLKID
 	bool "blkid"
 	default y
-	depends on BR2_PACKAGE_E2FSPROGS
 	select BR2_PACKAGE_E2FSPROGS_LIBBLKID
 
 config BR2_PACKAGE_E2FSPROGS_CHATTR
 	bool "chattr"
 	default y
-	depends on BR2_PACKAGE_E2FSPROGS
 
 config BR2_PACKAGE_E2FSPROGS_DUMPE2FS
 	bool "dumpe2fs"
 	default y
-	depends on BR2_PACKAGE_E2FSPROGS
 	select BR2_PACKAGE_E2FSPROGS_LIBUUID
 
 config BR2_PACKAGE_E2FSPROGS_E2FREEFRAG
 	bool "e2freefrag"
 	default y
-	depends on BR2_PACKAGE_E2FSPROGS
-
 
 config BR2_PACKAGE_E2FSPROGS_E2FSCK
 	bool "e2fsck"
 	default y
-	depends on BR2_PACKAGE_E2FSPROGS
 	select BR2_PACKAGE_E2FSPROGS_LIBBLKID
 
 config BR2_PACKAGE_E2FSPROGS_E2LABEL
 	bool "e2label"
 	default y
-	depends on BR2_PACKAGE_E2FSPROGS
 	select BR2_PACKAGE_E2FSPROGS_LIBBLKID
 
 config BR2_PACKAGE_E2FSPROGS_E2UNDO
 	bool "e2undo"
 	default y
-	depends on BR2_PACKAGE_E2FSPROGS
 
 config BR2_PACKAGE_E2FSPROGS_FILEFRAG
 	bool "filefrag"
 	default y
-	depends on BR2_PACKAGE_E2FSPROGS
 
 config BR2_PACKAGE_E2FSPROGS_FINDFS
 	bool "findfs"
 	default y
-	depends on BR2_PACKAGE_E2FSPROGS
 	select BR2_PACKAGE_E2FSPROGS_E2LABEL
 
 config BR2_PACKAGE_E2FSPROGS_FSCK
 	bool "fsck"
 	default y
-	depends on BR2_PACKAGE_E2FSPROGS
 	select BR2_PACKAGE_E2FSPROGS_LIBBLKID
 
 config BR2_PACKAGE_E2FSPROGS_LOGSAVE
 	bool "logsave"
 	default y
-	depends on BR2_PACKAGE_E2FSPROGS
 
 config BR2_PACKAGE_E2FSPROGS_LSATTR
 	bool "lsattr"
 	default y
-	depends on BR2_PACKAGE_E2FSPROGS
 
 config BR2_PACKAGE_E2FSPROGS_MKE2FS
 	bool "mke2fs"
 	default y
-	depends on BR2_PACKAGE_E2FSPROGS
 	select BR2_PACKAGE_E2FSPROGS_LIBBLKID
 
 config BR2_PACKAGE_E2FSPROGS_MKLOSTFOUND
@@ -99,19 +84,16 @@ config BR2_PACKAGE_E2FSPROGS_MKLOSTFOUND
 config BR2_PACKAGE_E2FSPROGS_TUNE2FS
 	bool "tune2fs"
 	default y
-	depends on BR2_PACKAGE_E2FSPROGS
 	select BR2_PACKAGE_E2FSPROGS_E2LABEL
 
 config BR2_PACKAGE_E2FSPROGS_UUIDGEN
 	bool "uuidgen"
 	default y
-	depends on BR2_PACKAGE_E2FSPROGS
 	select BR2_PACKAGE_E2FSPROGS_LIBUUID
 
 config BR2_PACKAGE_E2FSPROGS_UUIDD
 	bool "uuidd"
 	default y
-	depends on BR2_PACKAGE_E2FSPROGS
 	select BR2_PACKAGE_E2FSPROGS_LIBUUID
 	help
 	  The uuidd daemon from the e2fsprogs suite
-- 
1.7.3.4
