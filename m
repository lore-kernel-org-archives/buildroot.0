From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 13 Sep 2017 12:18:23 +0200
Subject: [Buildroot] [PATCH 1/1] package/librsync: not available in static
	builds
Message-ID: <20170913101823.12808-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream only support shared builds:
https://github.com/librsync/librsync/blob/master/CMakeLists.txt#L319

Fixes
http://autobuild.buildroot.net/results/4b8/4b8db2d520373d0c9127e0d7695b5aeda6925dc5/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/librsync/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/librsync/Config.in b/package/librsync/Config.in
index 652f0cb276..6957ddcc0e 100644
--- a/package/librsync/Config.in
+++ b/package/librsync/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBRSYNC
 	bool "librsync"
+	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_BZIP2
 	select BR2_PACKAGE_POPT
@@ -9,3 +10,6 @@ config BR2_PACKAGE_LIBRSYNC
 	  rsync utility and is used in rproxy.
 
 	  https://github.com/librsync/librsync
+
+comment "librsync needs a toolchain w/ dynamic library support"
+	depends on BR2_STATIC_LIBS
-- 
2.11.0
