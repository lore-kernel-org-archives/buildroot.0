From: Akihiko Odaki <akihiko.odaki.4i@stu.hosei.ac.jp>
Date: Fri,  8 Jul 2016 09:07:36 +0900
Subject: [Buildroot] qt5base: don't enable KMS if it doesn't have udev
Message-ID: <20160708000736.2329-1-akihiko.odaki.4i@stu.hosei.ac.jp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index bf541b0..60b4e94 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -30,8 +30,11 @@ QT5BASE_CONFIGURE_OPTS += \
 
 # Uses libgbm from mesa3d
 ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_EGL),y)
-QT5BASE_CONFIGURE_OPTS += -kms -gbm
+QT5BASE_CONFIGURE_OPTS += -gbm
 QT5BASE_DEPENDENCIES += mesa3d
+ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
+QT5BASE_CONFIGURE_OPTS += -kms
+endif
 else
 QT5BASE_CONFIGURE_OPTS += -no-kms
 endif
