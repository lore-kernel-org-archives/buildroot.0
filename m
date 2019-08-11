From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 11 Aug 2019 22:47:35 +0200
Subject: [Buildroot] [git commit] package/openbox: needs gcc >= 4.8
Message-ID: <20190811210019.A7BEF81336@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8f9502a0bfb1205ca675071bb673f94245be3309
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Due to the harfbuzz bump to version 2.5.2 we need gcc >= 4.8.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/openbox/Config.in | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/openbox/Config.in b/package/openbox/Config.in
index 3ddd376803..fe6e886865 100644
--- a/package/openbox/Config.in
+++ b/package/openbox/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_OPENBOX
 	depends on BR2_USE_MMU # glib2
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # pango -> harfbuzz
 	depends on BR2_INSTALL_LIBSTDCPP # pango -> freetype
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBXML2
@@ -19,9 +20,10 @@ config BR2_PACKAGE_OPENBOX
 
 	  http://openbox.org
 
-comment "openbox needs a toolchain w/ C++, threads, wchar"
+comment "openbox needs a toolchain w/ C++, threads, wchar, gcc >= 4.8"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || \
 		!BR2_INSTALL_LIBSTDCPP
 	depends on BR2_PACKAGE_XORG7
