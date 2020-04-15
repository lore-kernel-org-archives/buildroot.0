From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 15 Apr 2020 22:49:26 +0200
Subject: [Buildroot] [git commit] fs/ext2: pass a default string to
 filesystem label
Message-ID: <20200415203641.5F9E68ED90@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5631c3802458c3fc6ce87a9d8c20dbe7fbf1e3d5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently the volume-label for the root filesystem partition is a string
wit the following pattern: ad09a287-46a9-4790-ba97-fbbb549e5e96.

Specify the volume-label as "rootfs" to make it easier to identify it.

Suggested-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
Tested-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 fs/ext2/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/ext2/Config.in b/fs/ext2/Config.in
index 74bacc1141..333ead95fe 100644
--- a/fs/ext2/Config.in
+++ b/fs/ext2/Config.in
@@ -43,6 +43,7 @@ config BR2_TARGET_ROOTFS_EXT2_REV
 
 config BR2_TARGET_ROOTFS_EXT2_LABEL
 	string "filesystem label"
+	default "rootfs"
 
 config BR2_TARGET_ROOTFS_EXT2_SIZE
 	string "exact size"
