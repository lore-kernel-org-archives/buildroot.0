From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 10 Jun 2017 11:15:13 +0200
Subject: [Buildroot] [PATCH 4/4] package/qt5/qt5webkit: needs host gcc >=
	4.8 for icu support
In-Reply-To: <20170610091513.29031-1-bernd.kuhls@t-online.de>
References: <20170610091513.29031-1-bernd.kuhls@t-online.de>
Message-ID: <20170610091513.29031-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/qt5/qt5webkit/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/qt5/qt5webkit/Config.in b/package/qt5/qt5webkit/Config.in
index cef7532e7..a1ff265d4 100644
--- a/package/qt5/qt5webkit/Config.in
+++ b/package/qt5/qt5webkit/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_QT5WEBKIT
 	bool "qt5webkit"
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
+	depends on BR2_HOST_GCC_AT_LEAST_4_8 # icu
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # icu
 	depends on !BR2_BINFMT_FLAT # icu
 	# assumes a FPU is available on MIPS
@@ -27,8 +28,9 @@ config BR2_PACKAGE_QT5WEBKIT
 
 	  http://doc.qt.io/archives/qt-5.5/qtwebkit-index.html
 
-comment "qt5webkit needs a toolchain w/ dynamic library, gcc >= 4.8"
-	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+comment "qt5webkit needs a toolchain w/ dynamic library, gcc >= 4.8, host gcc >= 4.8"
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 \
+		!BR2_HOST_GCC_AT_LEAST_4_8
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
 	depends on !BR2_BINFMT_FLAT
 	depends on !BR2_MIPS_SOFT_FLOAT
-- 
2.11.0
