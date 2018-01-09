From: Joshua Henderson <joshua.henderson@microchip.com>
Date: Mon, 8 Jan 2018 17:18:10 -0700
Subject: [Buildroot] [PATCH] qt5wayland: compositor depends on
 BR2_PACKAGE_QT5BASE_OPENGL
Message-ID: <1515457090-29564-1-git-send-email-joshua.henderson@microchip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When building Qt 5.6.3, the qt5wayland compositor depends on Qt OpenGL support.

Fixes:
      http://autobuild.buildroot.net/results/289d9b73d99e29d61c2df9ce228fed3968d89f5c

Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>
---
 package/qt5/qt5wayland/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/qt5/qt5wayland/Config.in b/package/qt5/qt5wayland/Config.in
index 0182d3c..e201830 100644
--- a/package/qt5/qt5wayland/Config.in
+++ b/package/qt5/qt5wayland/Config.in
@@ -18,8 +18,12 @@ config BR2_PACKAGE_QT5WAYLAND
 
 if BR2_PACKAGE_QT5WAYLAND
 
+comment "qt5wayland compositor needs Qt OpenGL support"
+	depends on !BR2_PACKAGE_QT5BASE_OPENGL && !BR2_PACKAGE_QT5_VERSION_LATEST
+
 config BR2_PACKAGE_QT5WAYLAND_COMPOSITOR
 	bool "Enable compositor (experimental)"
+	depends on BR2_PACKAGE_QT5BASE_OPENGL || BR2_PACKAGE_QT5_VERSION_LATEST
 	help
 	  The compositor API is still experimental, and not built by
 	  default.
-- 
2.7.4
