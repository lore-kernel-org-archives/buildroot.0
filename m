From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 19 Apr 2020 00:59:06 +0200
Subject: [Buildroot] [PATCH v1 6/6] package/qt-webkit-kiosk: drop all legacy
 gcc requierements below 5.0
In-Reply-To: <20200418225906.17514-1-ps.report@gmx.net>
References: <20200418225906.17514-1-ps.report@gmx.net>
Message-ID: <20200418225906.17514-6-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As qt5 requires as minimum gcc 5.0 drop all legacy requierements below.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/qt-webkit-kiosk/Config.in | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/qt-webkit-kiosk/Config.in b/package/qt-webkit-kiosk/Config.in
index 46688a227b..b620154ed1 100644
--- a/package/qt-webkit-kiosk/Config.in
+++ b/package/qt-webkit-kiosk/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_QT_WEBKIT_KIOSK
 	depends on BR2_PACKAGE_QT5
 	depends on !BR2_STATIC_LIBS # qt5webkit
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE # qt5webkit
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # qt5webkit -> icu
 	depends on !BR2_BINFMT_FLAT # qt5webkit -> icu
 	depends on !BR2_MIPS_SOFT_FLOAT # qt5webkit
 	select BR2_PACKAGE_OPENSSL
@@ -25,8 +24,8 @@ config BR2_PACKAGE_QT_WEBKIT_KIOSK_SOUNDS
 
 endif
 
-comment "qt-webkit-kiosk needs a toolchain w/ dynamic library, gcc >= 4.8"
-	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+comment "qt-webkit-kiosk needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
 	depends on !BR2_BINFMT_FLAT
 	depends on !BR2_MIPS_SOFT_FLOAT
-- 
2.26.0
