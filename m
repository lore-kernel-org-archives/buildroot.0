From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 13 Mar 2013 10:15:48 +0200
Subject: [Buildroot] [PATCH 1/2] poco: needs threads
Message-ID: <00f6f81991bf095cfd67cff42e32a4881435236b.1363162371.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/98f8ae541939bd7b44601d3ee039bbc84becea84.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/poco/Config.in |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/poco/Config.in b/package/poco/Config.in
index 20a8f2d..b823071 100644
--- a/package/poco/Config.in
+++ b/package/poco/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_POCO
 	bool "poco"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_PCRE
 	help
@@ -57,5 +58,6 @@ config BR2_PACKAGE_POCO_DATA_MYSQL
 
 endif # BR2_PACKAGE_POCO
 
-comment "poco requires a toolchain with WCHAR and C++ support"
-	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP
+comment "poco requires a toolchain with WCHAR, threads, and C++ support"
+	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP \
+		|| !BR2_TOOLCHAIN_HAS_THREADS
-- 
1.7.10.4
