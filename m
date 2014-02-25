From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 25 Feb 2014 09:34:46 -0300
Subject: [Buildroot] [PATCH] cppdb: not available for static builds
Message-ID: <1393331686-12831-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/cdc/cdc522c2cddb10a5c38239fcbea604bfa5a49045/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/cppdb/Config.in | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/cppdb/Config.in b/package/cppdb/Config.in
index a09151e..120598a 100644
--- a/package/cppdb/Config.in
+++ b/package/cppdb/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_CPPDB
 	bool "cppdb"
+	# dlfcn.h
+	depends on !BR2_PREFER_STATIC_LIB
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	# Can be built without them but it's useless
@@ -11,6 +13,7 @@ config BR2_PACKAGE_CPPDB
 
 	  http://cppcms.com/sql/cppdb/
 
-comment "cppdb needs a toolchain w/ C++, threads"
+comment "cppdb needs a toolchain w/ C++, threads, dynamic library"
 	depends on BR2_PACKAGE_MYSQL || BR2_PACKAGE_SQLITE
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_PREFER_STATIC_LIB
-- 
1.8.3.2
