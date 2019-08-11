From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 11 Aug 2019 23:02:42 +0200
Subject: [Buildroot] [git commit] package/libgtk2: needs gcc >= 4.8
Message-ID: <20190811210020.1A3C48154E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ebffec95c00c428852773e42cc7965517045cdb0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Due to the harfbuzz bump to version 2.5.2 we need gcc >= 4.8.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libgtk2/Config.in | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/libgtk2/Config.in b/package/libgtk2/Config.in
index aa297d71ef..7c5762a585 100644
--- a/package/libgtk2/Config.in
+++ b/package/libgtk2/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_LIBGTK2
 	depends on BR2_USE_MMU # glib2
 	depends on BR2_INSTALL_LIBSTDCPP # pango
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # pango -> harfbuzz
 	select BR2_PACKAGE_ATK
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_CAIRO_PS
@@ -33,9 +34,10 @@ config BR2_PACKAGE_LIBGTK2_DEMO
 
 endif
 
-comment "libgtk2 needs a toolchain w/ wchar, threads, C++"
+comment "libgtk2 needs a toolchain w/ wchar, threads, C++, gcc >= 4.8"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_PACKAGE_XORG7
 	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || \
 		!BR2_TOOLCHAIN_HAS_THREADS
