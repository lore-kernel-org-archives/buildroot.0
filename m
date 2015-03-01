From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 1 Mar 2015 22:26:12 +0100
Subject: [Buildroot] [git commit] gnupg2: needs dynamic library support
Message-ID: <20150301214633.0B0E7807BD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4ba55e22875d8b6a8ed0e775765eb054650a94e7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/d2f/d2fc4cfb0c42d352d1119d8196d6df5fc2ab4be2/
http://autobuild.buildroot.net/results/4ff/4ff76c7da4c50f10d2194a1c50c6c10adaf6f8b6/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gnupg2/Config.in |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/gnupg2/Config.in b/package/gnupg2/Config.in
index d24eaae..e246fd7 100644
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
