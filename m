From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu,  2 Aug 2018 20:32:02 +0200
Subject: [Buildroot] [PATCH 1/1] package/aircrack-ng: needs dynamic library
 support
Message-ID: <20180802183202.8930-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/611/61170d12811c70037ee875434a295ac35a2a5c50/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/aircrack-ng/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/aircrack-ng/Config.in b/package/aircrack-ng/Config.in
index 9e691e7f89..f3e2bc4ef1 100644
--- a/package/aircrack-ng/Config.in
+++ b/package/aircrack-ng/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_AIRCRACK_NG
 	depends on BR2_USE_MMU # uses fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_STATIC_LIBS # dlfcn.h
 	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_LIBGCRYPT
 	help
 	  A set of tools for auditing wireless networks
@@ -12,6 +13,7 @@ config BR2_PACKAGE_AIRCRACK_NG
 
 	  http://www.aircrack-ng.org/
 
-comment "aircrack-ng needs a toolchain w/ threads, C++"
+comment "aircrack-ng needs a toolchain w/ dynamic library, threads, C++"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS \
+		|| !BR2_INSTALL_LIBSTDCPP
-- 
2.18.0
