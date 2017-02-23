From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 23 Feb 2017 12:37:35 +0200
Subject: [Buildroot] [PATCH] poco: doesn't support openrisc
Message-ID: <22bb5cb1c7427067810ea1b834475fe482c0d799.1487846255.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/5b3/5b3fd6d4a7bdefadba89fdb53de4ba786f4df9e2/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/poco/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/poco/Config.in b/package/poco/Config.in
index dfdc8d17c394..b3b247f906ba 100644
--- a/package/poco/Config.in
+++ b/package/poco/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_POCO
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS # dlopen()
 	depends on !(BR2_arc || BR2_bfin || BR2_microblaze || BR2_mipsel \
-		|| BR2_xtensa)
+		|| BR2_or1k || BR2_xtensa)
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_PCRE
 	help
@@ -65,4 +65,4 @@ comment "poco needs a toolchain w/ wchar, threads, C++, dynamic library"
 	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP \
 		|| !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
 	depends on !(BR2_arc || BR2_bfin || BR2_microblaze || BR2_mipsel \
-		|| BR2_xtensa)
+		|| BR2_or1k || BR2_xtensa)
-- 
2.11.0
