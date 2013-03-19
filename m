From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Mar 2013 20:29:53 +0100
Subject: [Buildroot] [PATCH v4 20/21] qt5webkit: add EGL dir to includepath
In-Reply-To: <1363721394-14973-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1363721394-14973-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1363721394-14973-21-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Floris Bos <bos@je-eigen-domein.nl>

Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../qt5/qt5webkit/qt5webkit-egl-includepath.patch  |   40 ++++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 package/qt5/qt5webkit/qt5webkit-egl-includepath.patch

diff --git a/package/qt5/qt5webkit/qt5webkit-egl-includepath.patch b/package/qt5/qt5webkit/qt5webkit-egl-includepath.patch
new file mode 100644
index 0000000..de5bcff
--- /dev/null
+++ b/package/qt5/qt5webkit/qt5webkit-egl-includepath.patch
@@ -0,0 +1,40 @@
+From d6b1b33a12c0cf6c52667afafe34e58a7b00d0d8 Mon Sep 17 00:00:00 2001
+From: Floris Bos <bos@je-eigen-domein.nl>
+Date: Thu, 7 Mar 2013 19:25:17 +0100
+Subject: [PATCH] Webcore: add EGL and OpenGL (ES) INCDIR to INCLUDEPATH
+
+When building with 3D graphics support enabled, add the
+OpenGL (ES) and EGL include directories to the include path.
+
+Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
+---
+ Source/WebCore/Target.pri |    4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/Source/WebCore/Target.pri b/Source/WebCore/Target.pri
+index 2669748..421a849 100644
+--- a/Source/WebCore/Target.pri
++++ b/Source/WebCore/Target.pri
+@@ -3992,15 +3992,19 @@ use?(3D_GRAPHICS) {
+ 
+     contains(QT_CONFIG, opengl) | contains(QT_CONFIG, opengles2) {
+         !contains(QT_CONFIG, opengles2) {
++            INCLUDEPATH += $$QMAKE_INCDIR_OPENGL
+             SOURCES += \
+                platform/graphics/opengl/GraphicsContext3DOpenGL.cpp \
+                platform/graphics/opengl/Extensions3DOpenGL.cpp
+         } else {
++            INCLUDEPATH += $$QMAKE_INCDIR_OPENGL_ES2
+             SOURCES += \
+                platform/graphics/opengl/GraphicsContext3DOpenGLES.cpp \
+                platform/graphics/opengl/Extensions3DOpenGLES.cpp
+         }
+ 
++        !isEmpty(QMAKE_INCDIR_EGL): INCLUDEPATH += $$QMAKE_INCDIR_EGL
++
+         HEADERS += platform/graphics/opengl/Extensions3DOpenGL.h
+ 
+         SOURCES += \
+-- 
+1.7.10.4
+
-- 
1.7.9.5
