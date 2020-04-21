From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 21 Apr 2020 19:26:32 +0200
Subject: [Buildroot] [PATCH 1/1] package/midori: needs gcc >= 7
Message-ID: <20200421172632.4124853-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit ec1ff802df9a0f17dd2b734ba536a5e206aa5aa4 forgot to propagate
gcc >= 7 dependency to midori

Fixes:
 - http://autobuild.buildroot.org/results/736a99dcaa72fba3f06775d08c4395f506fce944

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/midori/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/midori/Config.in b/package/midori/Config.in
index 64139ce49e..089f36ced8 100644
--- a/package/midori/Config.in
+++ b/package/midori/Config.in
@@ -1,7 +1,7 @@
-comment "midori needs libgtk3 and a glibc toolchain w/ C++, gcc >= 6"
+comment "midori needs libgtk3 and a glibc toolchain w/ C++, gcc >= 7"
 	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_PACKAGE_LIBGTK3 || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_6 || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
 		!BR2_TOOLCHAIN_USES_GLIBC
 
 config BR2_PACKAGE_MIDORI
@@ -9,7 +9,7 @@ config BR2_PACKAGE_MIDORI
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt, gcr, gnupg2
 	depends on BR2_PACKAGE_LIBGTK3
 	depends on BR2_INSTALL_LIBSTDCPP # webkitgtk
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_6 # webkitgtk
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # webkitgtk
 	depends on BR2_TOOLCHAIN_USES_GLIBC # webkitgtk
 	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
 	# GCR can only be used with the X11 backend
-- 
2.25.1
