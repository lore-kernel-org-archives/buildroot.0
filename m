From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 13 Mar 2013 23:06:44 +0100
Subject: [Buildroot] [git commit] poco: needs threads
Message-ID: <20130313221242.CEA999B084@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=55700e9871d6f74c280aaf399a7b3d91252640ba
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/98f8ae541939bd7b44601d3ee039bbc84becea84.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/poco/Config.in |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

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
