From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 10 Mar 2017 23:15:47 +0100
Subject: [Buildroot] [PATCH v1 2/2] qt5base: install libQt5EglFsKmsSupport
In-Reply-To: <20170310221547.32158-1-ps.report@gmx.net>
References: <20170310221547.32158-1-ps.report@gmx.net>
Message-ID: <20170310221547.32158-2-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

According to src/plugins/platforms/eglfs/deviceintegration/deviceintegration.pro
depends on eglfs_gbm which depends according to src/gui/configure.json
on features.eglfs and features.gbm and features.kms, so dependency
on BR2_PACKAGE_MESA3D_OPENGL_EGL which enables mesa3d gbm support
should be sufficient.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/qt5/qt5base/qt5base.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 7a335736d..102034890 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -200,6 +200,9 @@ QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_XML)        += Qt5Xml
 QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_OPENGL_LIB) += Qt5OpenGL
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_EGLFS)      += Qt5EglFSDeviceIntegration
+ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_EGL),y)
+QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_EGLFS)      += Qt5EglFsKmsSupport
+endif
 else
 QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_EGLFS)      += Qt5EglDeviceIntegration
 endif
-- 
2.11.0
