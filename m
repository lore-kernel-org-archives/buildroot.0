From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 14 Mar 2017 00:15:24 +0100
Subject: [Buildroot] [git commit branch/2017.02.x] qt5base: install
	libQt5EglFsKmsSupport
Message-ID: <20170313233002.8D8D17FDC7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a3d83660c5352249d8da2bab8520442d13a06cec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

According to src/plugins/platforms/eglfs/deviceintegration/deviceintegration.pro
depends on eglfs_gbm which depends according to src/gui/configure.json
on features.eglfs and features.gbm and features.kms, so dependency
on BR2_PACKAGE_MESA3D_OPENGL_EGL which enables mesa3d gbm support
should be sufficient.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 5efe07f9af53c0cf0795d316cb84d58e530a9619)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5base/qt5base.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 7a33573..1020348 100644
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
