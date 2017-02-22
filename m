From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 22 Feb 2017 16:36:54 +0000
Subject: [Buildroot] [PATCH] qt5webkit: disable for MIPS soft-float
Message-ID: <20170222163654.305-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It assumes the MIPS target has an FPU and uses FPU assembler
instructions which cause the compilation to fail when building it for
soft-float.

Fixes:
  http://autobuild.buildroot.net/results/f40/f407ca9245e2445619420a9dfd595856729a2b2b/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/qt-webkit-kiosk/Config.in | 1 +
 package/qt5/qt5webkit/Config.in   | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/qt-webkit-kiosk/Config.in b/package/qt-webkit-kiosk/Config.in
index 32952d7..1b0e0de 100644
--- a/package/qt-webkit-kiosk/Config.in
+++ b/package/qt-webkit-kiosk/Config.in
@@ -9,6 +9,7 @@ config BR2_PACKAGE_QT_WEBKIT_KIOSK
 	depends on !BR2_STATIC_LIBS # qt5webkit
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE # qt5webkit
 	depends on !BR2_BINFMT_FLAT # qt5webkit
+	depends on !BR2_MIPS_SOFT_FLOAT # qt5webkit
 	help
 	  Simple kiosk-mode browser powered by Qt5Webkit
 
diff --git a/package/qt5/qt5webkit/Config.in b/package/qt5/qt5webkit/Config.in
index e9c11fb..4613550 100644
--- a/package/qt5/qt5webkit/Config.in
+++ b/package/qt5/qt5webkit/Config.in
@@ -9,6 +9,7 @@ config BR2_PACKAGE_QT5WEBKIT
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
 	depends on !BR2_BINFMT_FLAT # icu
+	depends on !BR2_MIPS_SOFT_FLOAT
 	help
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
-- 
2.10.2
