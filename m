From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  8 Nov 2014 16:02:16 +0100
Subject: [Buildroot] [PATCH 1/1] package/cramfs: Depends on zlib
Message-ID: <1415458936-2744-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cramfs.mk contains

CRAMFS_DEPENDENCIES = zlib

but this dependency was missing in Config.in.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/cramfs/Config.in |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/cramfs/Config.in b/package/cramfs/Config.in
index daf6e6d..cf3082e 100644
--- a/package/cramfs/Config.in
+++ b/package/cramfs/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_CRAMFS
 	bool "cramfs"
+	depends on BR2_PACKAGE_ZLIB
 	help
 	  cramfs is a compressed read-only filesystem. This package
 	  contains the tools to generate and check a cramfs filesystem.
-- 
1.7.10.4
