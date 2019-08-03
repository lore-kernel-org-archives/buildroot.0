From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  3 Aug 2019 21:14:53 +0200
Subject: [Buildroot] [PATCH 15/23] package/enlightenment: needs gcc >= 4.8
In-Reply-To: <20190803191501.5412-1-bernd.kuhls@t-online.de>
References: <20190803191501.5412-1-bernd.kuhls@t-online.de>
Message-ID: <20190803191501.5412-16-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Due to the harfbuzz bump to version 2.5.2 we need gcc >= 4.8.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/enlightenment/Config.in | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/enlightenment/Config.in b/package/enlightenment/Config.in
index d1dee25f86..2cd6512e1e 100644
--- a/package/enlightenment/Config.in
+++ b/package/enlightenment/Config.in
@@ -13,6 +13,7 @@ config BR2_PACKAGE_ENLIGHTENMENT
 	depends on BR2_PACKAGE_XORG7
 	# libevas-generic-loaders-svg -> librsvg -> pango -> harfbuzz
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 	select BR2_PACKAGE_EFL_X_XLIB
 	select BR2_PACKAGE_EFL_EEZE
 	select BR2_PACKAGE_EFL_JPEG # needed at runtime by enlightenment_start
@@ -28,8 +29,9 @@ config BR2_PACKAGE_ENLIGHTENMENT
 
 	  http://www.enlightenment.org/
 
-comment "enlightenment needs udev /dev management and a toolchain w/ wchar, C++, threads"
+comment "enlightenment needs udev /dev management and a toolchain w/ wchar, C++, threads, gcc >= 4.8"
 	depends on BR2_PACKAGE_EFL && BR2_PACKAGE_XORG7 && BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || \
 		!BR2_PACKAGE_HAS_UDEV
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-- 
2.20.1
