From: =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?= <salvador.joseluis@gmail.com>
Date: Sun, 10 Jan 2021 05:38:31 +0100
Subject: [Buildroot] [PATCH 1/1] fs/cpio: add zstd as compression option
Message-ID: <20210110043831.22754-1-salvador.joseluis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

U-Boot mkimage zstd is available since v2020.10:
https://gitlab.denx.de/u-boot/u-boot/-/commit/26073f9ed3ab0aaf3c2a2b433fecb30a95a067d6

Signed-off-by: Jos? Luis Salvador Rufo <salvador.joseluis@gmail.com>
---
 fs/cpio/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/fs/cpio/Config.in b/fs/cpio/Config.in
index 83a7fa5824..c1151a2881 100644
--- a/fs/cpio/Config.in
+++ b/fs/cpio/Config.in
@@ -51,6 +51,11 @@ config BR2_TARGET_ROOTFS_CPIO_XZ
 	help
 	  Do compress the cpio filesystem with xz.
 
+config BR2_TARGET_ROOTFS_CPIO_ZSTD
+	bool "zstd"
+	help
+	  Do compress the cpio filesystem with zstd.
+
 endchoice
 
 config BR2_TARGET_ROOTFS_CPIO_UIMAGE
-- 
2.30.0
