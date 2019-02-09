From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  9 Feb 2019 17:28:14 +0100
Subject: [Buildroot] [PATCH 1/1] package/clamav: needs wchar
Message-ID: <20190209162814.19327-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/77c/77cd536a0fab78eabe27e055d28db2da354008d7/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/clamav/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/clamav/Config.in b/package/clamav/Config.in
index 56bf0af38c..2017011b67 100644
--- a/package/clamav/Config.in
+++ b/package/clamav/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_CLAMAV
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_LIBTOOL
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_ZLIB
@@ -12,6 +13,7 @@ config BR2_PACKAGE_CLAMAV
 
 	  http://www.clamav.net
 
-comment "clamav needs a toolchain w/ C++, threads"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+comment "clamav needs a toolchain w/ C++, threads, wchar"
+	depends on !BR2_INSTALL_LIBSTDCPP \
+		|| !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
 	depends on BR2_USE_MMU
-- 
2.20.1
