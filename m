From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  9 Jun 2019 00:12:10 +0200
Subject: [Buildroot] [PATCH 1/1] package/poppler: needs dynamic library
Message-ID: <20190608221210.30875-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/e409863724005a0c182476612187a322a16a7db8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/poppler/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/poppler/Config.in b/package/poppler/Config.in
index 3fa244fbae..6ff6215e29 100644
--- a/package/poppler/Config.in
+++ b/package/poppler/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_POPPLER
 	bool "poppler"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++14, constexpr
 	select BR2_PACKAGE_FONTCONFIG
 	help
@@ -28,6 +29,6 @@ config BR2_PACKAGE_POPPLER_UTILS
 
 endif
 
-comment "poppler needs a toolchain w/ C++, threads, gcc >= 5"
+comment "poppler needs a toolchain w/ C++, threads, dynamic library, gcc >= 5"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_5
+		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_5
-- 
2.20.1
