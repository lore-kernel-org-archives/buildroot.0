From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 8 Nov 2018 21:06:27 +0100
Subject: [Buildroot] [git commit] fs/f2fs: clarify help messages
Message-ID: <20181108200409.476C3817B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c3159a2d14420f323d1fb309ba4be91d233f7735
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For BR2_TARGET_ROOTFS_F2FS_COLD_FILES clarify that extension list must
be a coma separated.

For BR2_TARGET_ROOTFS_F2FS_OVERPROVISION clarify that the default
overprovision ratio is autocalculated according to the partition size.

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 fs/f2fs/Config.in | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/Config.in b/fs/f2fs/Config.in
index 32d86d8ce3..57473fdc43 100644
--- a/fs/f2fs/Config.in
+++ b/fs/f2fs/Config.in
@@ -21,9 +21,10 @@ config BR2_TARGET_ROOTFS_F2FS_SIZE
 config BR2_TARGET_ROOTFS_F2FS_COLD_FILES
 	string "extension list for cold files"
 	help
-	  Specify a file extension list in order f2fs to treat them as
-	  cold files. The default list includes most of multimedia
-	  file extensions such as jpg, gif, mpeg, mkv, and so on.
+	  Specify a comma separated file extension list in order f2fs
+	  to treat them as cold files. The default list includes most
+	  of multimedia file extensions such as jpg, gif, mpeg, mkv,
+	  and so on.
 
 config BR2_TARGET_ROOTFS_F2FS_OVERPROVISION
 	int "overprovision ratio"
@@ -33,8 +34,8 @@ config BR2_TARGET_ROOTFS_F2FS_OVERPROVISION
 	  area. This area is hidden to users, and utilized by F2FS
 	  cleaner.
 
-	  Leave at 0 to use the default overprovision ratio of
-	  mkfs.f2fs.
+	  Leave at 0 for autocalculation according to the partition
+	  size.
 
 config BR2_TARGET_ROOTFS_F2FS_DISCARD
 	bool "discard policy"
