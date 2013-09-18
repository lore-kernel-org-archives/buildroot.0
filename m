From: =?UTF-8?q?Fatih=20A=C5=9F=C4=B1c=C4=B1?= <fatih.asici@gmail.com>
Date: Wed, 18 Sep 2013 08:17:09 +0300
Subject: [Buildroot] [PATCH] qt5base: set eglfs platform hook for imx6
Message-ID: <1379481429-14687-1-git-send-email-fatih.asici@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fatih A??c? <fatih.asici@gmail.com>
---
 package/qt5/qt5base/qt5base.mk |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 1686dad..ddc5574 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -98,6 +98,10 @@ endif
 ifeq ($(BR2_PACKAGE_QT5BASE_EGLFS),y)
 QT5BASE_CONFIGURE_OPTS += -opengl es2 -eglfs
 QT5BASE_DEPENDENCIES   += libgles libegl
+ifeq ($(BR2_PACKAGE_GPU_VIV_BIN_MX6Q),y)
+QT5BASE_EGLFS_PLATFORM_HOOKS_SOURCES = \
+	$(@D)/mkspecs/devices/linux-imx6-g++/qeglfshooks_imx6.cpp
+endif
 ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
 QT5BASE_EGLFS_PLATFORM_HOOKS_SOURCES = \
 	$(@D)/mkspecs/devices/linux-rasp-pi-g++/qeglfshooks_pi.cpp
-- 
1.7.10.4
