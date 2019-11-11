From: Jens Kleintje <scooby22@web.de>
Date: Mon, 11 Nov 2019 17:24:09 +0100
Subject: [Buildroot] [PATCH v1 2/2] package/qt5/qt5base: add support for
 gcnano-binaries
In-Reply-To: <20191111162409.24361-1-scooby22@web.de>
References: <20191111162409.24361-1-scooby22@web.de>
Message-ID: <20191111162409.24361-3-scooby22@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jens Kleintje <scooby22@web.de>
---
 package/qt5/qt5base/qt5base.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 15c9650391..1a152be94b 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -78,6 +78,9 @@ endif
 ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_EGL),y)
 QT5BASE_CONFIGURE_OPTS += -gbm
 QT5BASE_DEPENDENCIES += mesa3d
+else ifeq ($(BR2_PACKAGE_GCNANO_BINARIES),y)
+QT5BASE_CONFIGURE_OPTS += -gbm
+QT5BASE_DEPENDENCIES += gcnano-binaries
 else
 QT5BASE_CONFIGURE_OPTS += -no-gbm
 endif
@@ -289,6 +292,9 @@ QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_EGLFS)      += Qt5EglFSDeviceIntegrat
 ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_EGL),y)
 QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_EGLFS)      += Qt5EglFsKmsSupport
 endif
+ifeq ($(BR2_PACKAGE_GCNANO_BINARIES),y)
+QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_EGLFS)      += Qt5EglFsKmsSupport
+endif
 else
 QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_EGLFS)      += Qt5EglDeviceIntegration
 endif
--
2.17.1
