From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Dec 2013 21:41:03 +0100
Subject: [Buildroot] [git commit] qt5quick1: add missing comment for
	toolchain option dependencies
Message-ID: <20131219204307.0B7869C0E8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9235bb17a68c7950d01255d53e6460d0b3ffacad
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5quick1/Config.in |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/qt5/qt5quick1/Config.in b/package/qt5/qt5quick1/Config.in
index 9cb97a6..594b4f6 100644
--- a/package/qt5/qt5quick1/Config.in
+++ b/package/qt5/qt5quick1/Config.in
@@ -20,6 +20,7 @@ config BR2_PACKAGE_QT5QUICK1
 
 	  http://qt-project.org
 
-comment "qt5quick1 requires an OpenGL-capable backend"
-	depends on (!BR2_PACKAGE_HAS_OPENGL_EGL || !BR2_PACKAGE_HAS_OPENGL_ES) && \
-		BR2_PACKAGE_QT5JSBACKEND_AVAILABLE
+comment "qt5quick1 needs a toolchain w/ dynamic library and an OpenGL-capable backend"
+	depends on BR2_PACKAGE_QT5JSBACKEND_AVAILABLE
+	depends on !BR2_PACKAGE_HAS_OPENGL_EGL || !BR2_PACKAGE_HAS_OPENGL_ES || \
+		BR2_PREFER_STATIC_LIB
