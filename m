From: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Mon, 20 Apr 2020 17:10:24 +0200
Subject: [Buildroot] [PATCH] package/qt5/Config.in: fix typo
Message-ID: <20200420151024.41482-1-b.bilas@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There is no BR2_TOOLCHAIN_GCC_AT_LEAST_5_0 option
but BR2_TOOLCHAIN_GCC_AT_LEAST_5.

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
---
 package/qt5/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index cd9c93735d..c716919476 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -16,14 +16,14 @@ comment "Qt5 needs a toolchain w/ gcc >= 5.0, wchar, NPTL, C++, dynamic library"
 	depends on !BR2_arc
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_5_0
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_5
 
 menuconfig BR2_PACKAGE_QT5
 	bool "Qt5"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5_0 # C++11, GCC_BUG_57694
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++11, GCC_BUG_57694
 	depends on !BR2_ARM_CPU_ARMV4 # needs ARMv5+
 	# no built-in double-conversion support
 	depends on !BR2_arc
-- 
2.26.1
