From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 13 Apr 2014 15:56:09 +0300
Subject: [Buildroot] [PATCH] cppcms: needs threads
Message-ID: <2c80a1abb28e32dc06c2756beba597a30f2afc1b.1397393769.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/d61/d618de68c8a50a932e85bdefb23c40e86790dc6c/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/cppcms/Config.in | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/cppcms/Config.in b/package/cppcms/Config.in
index 418146a7fcf0..bfbb2031f8dc 100644
--- a/package/cppcms/Config.in
+++ b/package/cppcms/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_CPPCMS
 	select BR2_PACKAGE_PCRE
 	select BR2_PACKAGE_LIBGCRYPT
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  CppCMS is a Free High Performance Web Development Framework
 	  (not a CMS) aimed for Rapid Web Application Development. It
@@ -25,18 +26,17 @@ config BR2_PACKAGE_CPPCMS_ICU
 	depends on !BR2_arc # icu -> atomic builtins
 	depends on !BR2_BINFMT_FLAT # icu
 	depends on BR2_USE_WCHAR # icu
-	depends on BR2_TOOLCHAIN_HAS_THREADS # icu
 	select BR2_PACKAGE_ICU
 	help
 	  Using ICU allows advanced localization features into CppCMS,
 	  in another hand ICU is heavier than iconv.
 
-comment "icu support needs a toolchain w/ wchar, threads"
+comment "icu support needs a toolchain w/ wchar"
 	depends on !BR2_arc
 	depends on !BR2_BINFMT_FLAT
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_USE_WCHAR
 
 endif
 
-comment "cppcms needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "cppcms needs a toolchain w/ C++, threads"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
-- 
1.9.1
