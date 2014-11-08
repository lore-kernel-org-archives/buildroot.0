From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  8 Nov 2014 16:29:46 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/cramfs: Needs zlib
Message-ID: <1415460586-14317-1-git-send-email-bernd.kuhls@t-online.de>
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
v2: Changed "depends on" to "select"

 package/cramfs/Config.in |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/cramfs/Config.in b/package/cramfs/Config.in
index daf6e6d..b2a0c6c 100644
--- a/package/cramfs/Config.in
+++ b/package/cramfs/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_CRAMFS
 	bool "cramfs"
+	select BR2_PACKAGE_ZLIB
 	help
 	  cramfs is a compressed read-only filesystem. This package
 	  contains the tools to generate and check a cramfs filesystem.
-- 
1.7.10.4
