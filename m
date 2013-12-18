From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 18 Dec 2013 21:29:11 +0100
Subject: [Buildroot] [PATCH 3 of 6] qt5quick1: add missing comment for
 toolchain option dependencies
In-Reply-To: <patchbomb.1387398548@argentina>
References: <patchbomb.1387398548@argentina>
Message-ID: <fc59e1c15a0a52599b71.1387398551@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/qt5/qt5quick1/Config.in |  7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/qt5/qt5quick1/Config.in b/package/qt5/qt5quick1/Config.in
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
