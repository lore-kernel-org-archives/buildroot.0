From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 28 Oct 2017 09:11:25 +0200
Subject: [Buildroot] [git commit] qt5wayland: fix config option indentation
Message-ID: <20171028121025.736C681102@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f2b022893fd612f57171f79c3604582ea831dd2b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reorganize so the optional composer option for the qt5wayland package shows up
as an indented option.

Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
