From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 25 Feb 2014 21:10:28 +0100
Subject: [Buildroot] [git commit] cppdb: not available for static builds
Message-ID: <20140225201108.99DBA9BA89@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=78c3a32c756a55d47367dbf8ab9f9223cba130bc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/cdc/cdc522c2cddb10a5c38239fcbea604bfa5a49045/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cppdb/Config.in |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

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
