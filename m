From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 15 Apr 2020 09:36:56 -0300
Subject: [Buildroot] [PATCH 2/2] fs/ext2: Pass a default string to
 filesystem label
In-Reply-To: <20200415123656.13298-1-festevam@gmail.com>
References: <20200415123656.13298-1-festevam@gmail.com>
Message-ID: <20200415123656.13298-2-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently the volume-label for the root filesystem partition is a string
wit the following pattern: ad09a287-46a9-4790-ba97-fbbb549e5e96.

Specify the volume-label as "rootfs" to make it easier to identify it. 

Suggested-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
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
-- 
2.17.1
