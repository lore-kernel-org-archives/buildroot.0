From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 19 Sep 2013 00:18:28 +0200
Subject: [Buildroot] [git commit] qt5base: set eglfs platform hook for imx6
Message-ID: <20130918222318.DB2A89B737@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3577ca6af2597db4defda8db03e2fffb174d3fdc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fatih A????c?? <fatih.asici@gmail.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/qt5/qt5base/qt5base.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

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
