From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 16 Dec 2013 06:59:08 +0200
Subject: [Buildroot] [PATCH] poco: disable on avr32
Message-ID: <e86b4785a2d4bde4a11300526d017f4b5602459e.1387169948.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/8695f8d4412c78d9d58518d73d55ab490f2a6dc7/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/poco/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/poco/Config.in b/package/poco/Config.in
index 11f70e5..342fd6c 100644
--- a/package/poco/Config.in
+++ b/package/poco/Config.in
@@ -3,7 +3,8 @@ config BR2_PACKAGE_POCO
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on !(BR2_arc || BR2_bfin || BR2_microblaze || BR2_mipsel || BR2_xtensa)
+	depends on !(BR2_arc || BR2_bfin || BR2_microblaze || BR2_mipsel \
+		|| BR2_xtensa || BR2_avr32)
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_PCRE
 	help
@@ -62,4 +63,5 @@ endif # BR2_PACKAGE_POCO
 comment "poco needs a toolchain w/ wchar, threads, C++"
 	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP \
 		|| !BR2_TOOLCHAIN_HAS_THREADS
-	depends on !(BR2_arc || BR2_bfin || BR2_microblaze || BR2_mipsel || BR2_xtensa)
+	depends on !(BR2_arc || BR2_bfin || BR2_microblaze || BR2_mipsel \
+		|| BR2_xtensa || BR2_avr32)
-- 
1.8.5.1
