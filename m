From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 19 Apr 2020 00:59:02 +0200
Subject: [Buildroot] [PATCH v1 2/6] package/qt5base: drop all legacy gcc
 requierements below 5.0
In-Reply-To: <20200418225906.17514-1-ps.report@gmx.net>
References: <20200418225906.17514-1-ps.report@gmx.net>
Message-ID: <20200418225906.17514-2-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As qt5 requires as minimum gcc 5.0 drop all legacy requierements below.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/qt5/qt5base/Config.in | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index 60a611e292..358a54bc1d 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -233,9 +233,7 @@ config BR2_PACKAGE_QT5BASE_FONTCONFIG
 
 config BR2_PACKAGE_QT5BASE_HARFBUZZ
 	bool "harfbuzz support"
-	select BR2_PACKAGE_HARFBUZZ if \
-		BR2_TOOLCHAIN_HAS_SYNC_4 && \
-		BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+	select BR2_PACKAGE_HARFBUZZ if BR2_TOOLCHAIN_HAS_SYNC_4
 	help
 	  This option enables HarfBuzz support (either system harfbuzz
 	  if the toolchain supports __sync for 4 bytes, or the qt
@@ -273,16 +271,11 @@ config BR2_PACKAGE_QT5BASE_DBUS
 config BR2_PACKAGE_QT5BASE_ICU
 	bool "Enable ICU support"
 	depends on !BR2_BINFMT_FLAT # icu
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # icu
 	select BR2_PACKAGE_ICU
 	help
 	  This option enables ICU support in Qt5. This is for example
 	  needed for Qt5Webkit.
 
-comment "icu support needs a toolchain w/ gcc >= 4.8"
-	depends on !BR2_BINFMT_FLAT
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
-
 config BR2_PACKAGE_QT5BASE_TSLIB
 	bool "Enable Tslib support"
 	select BR2_PACKAGE_TSLIB
-- 
2.26.0
