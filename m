From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  3 Aug 2019 21:14:56 +0200
Subject: [Buildroot] [PATCH 18/23] package/librsvg: needs gcc >= 4.8
In-Reply-To: <20190803191501.5412-1-bernd.kuhls@t-online.de>
References: <20190803191501.5412-1-bernd.kuhls@t-online.de>
Message-ID: <20190803191501.5412-19-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Due to the harfbuzz bump to version 2.5.2 we need gcc >= 4.8.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/librsvg/Config.in | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/librsvg/Config.in b/package/librsvg/Config.in
index ffb0287dbd..735bf61259 100644
--- a/package/librsvg/Config.in
+++ b/package/librsvg/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_LIBRSVG
 	depends on BR2_USE_MMU # glib2
 	depends on BR2_INSTALL_LIBSTDCPP # pango
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # pango -> harfbuzz
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_CAIRO_PNG
 	select BR2_PACKAGE_GDK_PIXBUF
@@ -18,7 +19,9 @@ config BR2_PACKAGE_LIBRSVG
 
 	  https://wiki.gnome.org/Projects/LibRsvg
 
-comment "librsvg needs a toolchain w/ wchar, threads, C++"
+comment "librsvg needs a toolchain w/ wchar, threads, C++, gcc >= 4.8"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || \
+		!BR2_INSTALL_LIBSTDCPP
-- 
2.20.1
