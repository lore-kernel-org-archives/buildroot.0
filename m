From: Joshua Henderson <joshua.henderson@microchip.com>
Date: Wed, 25 Oct 2017 08:50:57 -0700
Subject: [Buildroot] [PATCH] qt5wayland: fix config option indentation
Message-ID: <1508946657-25626-1-git-send-email-joshua.henderson@microchip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Reorganize so the optional composer option for the qt5wayland package shows up
as an indented option.

Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>
---
 package/qt5/qt5wayland/Config.in | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/qt5/qt5wayland/Config.in b/package/qt5/qt5wayland/Config.in
index 82110cc..0182d3c 100644
--- a/package/qt5/qt5wayland/Config.in
+++ b/package/qt5/qt5wayland/Config.in
@@ -1,3 +1,7 @@
+comment "qt5wayland needs an OpenGL-capable backend"
+	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
+	depends on !BR2_PACKAGE_QT5_GL_AVAILABLE
+
 config BR2_PACKAGE_QT5WAYLAND
 	bool "qt5wayland"
 	depends on BR2_PACKAGE_QT5_GL_AVAILABLE
@@ -12,10 +16,6 @@ config BR2_PACKAGE_QT5WAYLAND
 
 	  http://qt.io
 
-comment "qt5wayland needs an OpenGL-capable backend"
-	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
-	depends on !BR2_PACKAGE_QT5_GL_AVAILABLE
-
 if BR2_PACKAGE_QT5WAYLAND
 
 config BR2_PACKAGE_QT5WAYLAND_COMPOSITOR
-- 
2.7.4
