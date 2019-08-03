From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  3 Aug 2019 21:14:43 +0200
Subject: [Buildroot] [PATCH 05/23] package/pinentry: pinentry-gtk2 needs gcc
 >= 4.8
In-Reply-To: <20190803191501.5412-1-bernd.kuhls@t-online.de>
References: <20190803191501.5412-1-bernd.kuhls@t-online.de>
Message-ID: <20190803191501.5412-6-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Due to the harfbuzz bump to version 2.5.2 pinentry-gtk2 needs gcc >=
4.8.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/pinentry/Config.in | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/pinentry/Config.in b/package/pinentry/Config.in
index 22bc2bb43d..518e3ad37f 100644
--- a/package/pinentry/Config.in
+++ b/package/pinentry/Config.in
@@ -30,15 +30,17 @@ config BR2_PACKAGE_PINENTRY_GTK2
 	depends on BR2_USE_MMU
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libgtk2 -> pango -> harfbuzz
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # libgtk2 -> pango -> harfbuzz
 	select BR2_PACKAGE_LIBGTK2
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
 	  The pinentry-gtk2 tool
 
-comment "pinentry-gtk2 needs X and a toolchain w/ wchar, threads, C++"
+comment "pinentry-gtk2 needs X and a toolchain w/ wchar, threads, C++, gcc >= 4.8"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_PACKAGE_XORG7 || !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || \
 		!BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_PINENTRY_QT5
-- 
2.20.1
