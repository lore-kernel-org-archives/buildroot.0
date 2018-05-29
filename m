From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 29 May 2018 19:19:29 +0200
Subject: [Buildroot] [PATCH 1/1] log4cplus: needs gcc >= 4.8
Message-ID: <20180529171929.9326-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

log4cplus needs std::map::emplace

Fixes:
 - http://autobuild.buildroot.net/results/ef0d8d7fae835ff555202f6de320945226ec00bf

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/log4cplus/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/log4cplus/Config.in b/package/log4cplus/Config.in
index fd224dd270..cd5476a086 100644
--- a/package/log4cplus/Config.in
+++ b/package/log4cplus/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_LOG4CPLUS
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::future
 	help
 	  log4cplus is a simple to use C++ logging API providing
@@ -13,9 +13,9 @@ config BR2_PACKAGE_LOG4CPLUS
 
 	  http://sourceforge.net/projects/log4cplus
 
-comment "log4cplus needs a toolchain w/ C++, wchar, threads, gcc >= 4.7"
+comment "log4cplus needs a toolchain w/ C++, wchar, threads, gcc >= 4.8"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
+		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 
 comment "log4cplus needs a toolchain not affected by GCC bug 64735"
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
-- 
2.14.1
