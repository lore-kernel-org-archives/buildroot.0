From: Baruch Siach <baruch@tkos.co.il>
Date: Sun,  1 Mar 2015 22:47:36 +0200
Subject: [Buildroot] [PATCH] gnupg2: needs dynamic library support
Message-ID: <6844339e2113d5b84495cff8f41d794ef0b02182.1425242856.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/d2f/d2fc4cfb0c42d352d1119d8196d6df5fc2ab4be2/
http://autobuild.buildroot.net/results/4ff/4ff76c7da4c50f10d2194a1c50c6c10adaf6f8b6/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/gnupg2/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/gnupg2/Config.in b/package/gnupg2/Config.in
index d24eaaee1f84..e246fd79e30b 100644
--- a/package/gnupg2/Config.in
+++ b/package/gnupg2/Config.in
@@ -1,3 +1,7 @@
+comment "gnupg2 needs a toolchain w/ dynamic library"
+	depends on BR2_USE_MMU
+	depends on BR2_STATIC_LIBS
+
 config BR2_PACKAGE_GNUPG2
 	bool "gnupg2"
 	select BR2_PACKAGE_ZLIB
@@ -9,6 +13,7 @@ config BR2_PACKAGE_GNUPG2
 	select BR2_PACKAGE_LIBPTHSEM_COMPAT
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	depends on BR2_USE_MMU # libassuan
+	depends on !BR2_STATIC_LIBS
 	help
 	  GnuPG is the GNU project's complete and free implementation
 	  of the OpenPGP standard as defined by RFC4880. GnuPG allows
-- 
2.1.4
