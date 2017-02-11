From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Feb 2017 15:19:08 +0100
Subject: [Buildroot] [git commit] qt5: Rename version variable to include
	_PACKAGE_
Message-ID: <20170211142003.4A477820F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=49a33d3a229571e22ab783cbb1e5cace06ad7b99
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libv4l/libv4l.mk                               |  2 +-
 package/qt5/Config.in                                  |  4 ++--
 package/qt5/qt5.mk                                     |  2 +-
 package/qt5/qt5base/qt5base.mk                         | 10 +++++-----
 package/qt5/qt5connectivity/qt5connectivity.mk         |  2 +-
 package/qt5/qt5declarative/qt5declarative.mk           |  2 +-
 package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk |  2 +-
 package/qt5/qt5imageformats/qt5imageformats.mk         |  2 +-
 package/qt5/qt5location/qt5location.mk                 |  2 +-
 package/qt5/qt5multimedia/qt5multimedia.mk             |  2 +-
 package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk     |  2 +-
 package/qt5/qt5sensors/qt5sensors.mk                   |  2 +-
 package/qt5/qt5serialport/qt5serialport.mk             |  2 +-
 package/qt5/qt5svg/qt5svg.mk                           |  2 +-
 package/qt5/qt5tools/qt5tools.mk                       |  2 +-
 package/qt5/qt5webchannel/qt5webchannel.mk             |  2 +-
 package/qt5/qt5websockets/qt5websockets.mk             |  2 +-
 package/qt5/qt5x11extras/qt5x11extras.mk               |  2 +-
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk           |  2 +-
 19 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
index 90ff045..4fec14f 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -67,7 +67,7 @@ LIBV4L_CONF_ENV += \
 	ac_cv_prog_RCC=$(HOST_DIR)/usr/bin/rcc \
 	ac_cv_prog_UIC=$(HOST_DIR)/usr/bin/uic
 # qt5 needs c++11 (since qt-5.7)
-ifeq ($(BR2_QT5_VERSION_LATEST),y)
+ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 LIBV4L_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
 endif
 else ifeq ($(BR2_PACKAGE_QT_OPENGL_GL_DESKTOP),y)
diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index df6ce4d..b3cb2ad 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -34,7 +34,7 @@ if BR2_PACKAGE_QT5
 choice
 	prompt "Qt5 version"
 
-config BR2_QT5_VERSION_LATEST
+config BR2_PACKAGE_QT5_VERSION_LATEST
 	bool "Latest (5.8)"
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	depends on BR2_HOST_GCC_AT_LEAST_4_8 # C++11
@@ -45,7 +45,7 @@ config BR2_QT5_VERSION_LATEST
 comment "Latest Qt version needs host/toolchain w/ gcc >= 4.8"
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || !BR2_HOST_GCC_AT_LEAST_4_8
 
-config BR2_QT5_VERSION_5_6
+config BR2_PACKAGE_QT5_VERSION_5_6
 	bool "LTS (5.6)"
 	help
 	  This option builds Qt 5.6, which is licensed under
diff --git a/package/qt5/qt5.mk b/package/qt5/qt5.mk
index 9e20902..9e77ce3 100644
--- a/package/qt5/qt5.mk
+++ b/package/qt5/qt5.mk
@@ -1,4 +1,4 @@
-ifeq ($(BR2_QT5_VERSION_LATEST),y)
+ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5_VERSION_MAJOR = 5.8
 QT5_VERSION = $(QT5_VERSION_MAJOR).0
 QT5_SITE = http://download.qt.io/official_releases/qt/$(QT5_VERSION_MAJOR)/$(QT5_VERSION)/submodules
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 2cf0331..09bf5cf 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -43,13 +43,13 @@ else
 QT5BASE_CONFIGURE_OPTS += -release
 endif
 
-ifeq ($(BR2_QT5_VERSION_5_6),y)
+ifeq ($(BR2_PACKAGE_QT5_VERSION_5_6),y)
 QT5BASE_CONFIGURE_OPTS += -largefile
 endif
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
 QT5BASE_CONFIGURE_OPTS += -opensource -confirm-license
-ifeq ($(BR2_QT5_VERSION_LATEST),y)
+ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5BASE_LICENSE = GPLv2+ or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
 QT5BASE_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
 else
@@ -166,7 +166,7 @@ QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_ICU),icu)
 
 QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_EXAMPLES),-make,-nomake) examples
 
-ifeq ($(BR2_QT5_VERSION_5_6),y)
+ifeq ($(BR2_PACKAGE_QT5_VERSION_5_6),y)
 # gstreamer 0.10 support is broken in qt5multimedia
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE),y)
 QT5BASE_CONFIGURE_OPTS += -gstreamer 1.0
@@ -192,7 +192,7 @@ QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_SQL)        += Qt5Sql
 QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_TEST)       += Qt5Test
 QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_XML)        += Qt5Xml
 QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_OPENGL_LIB) += Qt5OpenGL
-ifeq ($(BR2_QT5_VERSION_LATEST),y)
+ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_EGLFS)      += Qt5EglFSDeviceIntegration
 else
 QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_EGLFS)      += Qt5EglDeviceIntegration
@@ -262,7 +262,7 @@ define QT5BASE_INSTALL_TARGET_PLUGINS
 	fi
 endef
 
-ifeq ($(BR2_QT5_VERSION_5_6),y)
+ifeq ($(BR2_PACKAGE_QT5_VERSION_5_6),y)
 define QT5BASE_INSTALL_TARGET_FONTS
 	if [ -d $(STAGING_DIR)/usr/lib/fonts/ ] ; then \
 		mkdir -p $(TARGET_DIR)/usr/lib/fonts ; \
diff --git a/package/qt5/qt5connectivity/qt5connectivity.mk b/package/qt5/qt5connectivity/qt5connectivity.mk
index e8136c4..f00dcb2 100644
--- a/package/qt5/qt5connectivity/qt5connectivity.mk
+++ b/package/qt5/qt5connectivity/qt5connectivity.mk
@@ -11,7 +11,7 @@ QT5CONNECTIVITY_DEPENDENCIES = qt5base
 QT5CONNECTIVITY_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
-ifeq ($(BR2_QT5_VERSION_LATEST),y)
+ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5CONNECTIVITY_LICENSE = GPLv2+ or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
 QT5CONNECTIVITY_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
 else
diff --git a/package/qt5/qt5declarative/qt5declarative.mk b/package/qt5/qt5declarative/qt5declarative.mk
index 5512baa..fb546bd 100644
--- a/package/qt5/qt5declarative/qt5declarative.mk
+++ b/package/qt5/qt5declarative/qt5declarative.mk
@@ -11,7 +11,7 @@ QT5DECLARATIVE_DEPENDENCIES = qt5base qt5xmlpatterns
 QT5DECLARATIVE_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
-ifeq ($(BR2_QT5_VERSION_LATEST),y)
+ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5DECLARATIVE_LICENSE = GPLv2+ or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
 QT5DECLARATIVE_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
 else
diff --git a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
index 88abb0c..aef69eb 100644
--- a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
+++ b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
@@ -11,7 +11,7 @@ QT5GRAPHICALEFFECTS_DEPENDENCIES = qt5base qt5declarative
 QT5GRAPHICALEFFECTS_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
-ifeq ($(BR2_QT5_VERSION_LATEST),y)
+ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5GRAPHICALEFFECTS_LICENSE = GPLv2+ or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
 QT5GRAPHICALEFFECTS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
 else
diff --git a/package/qt5/qt5imageformats/qt5imageformats.mk b/package/qt5/qt5imageformats/qt5imageformats.mk
index 0aa3971..d764925 100644
--- a/package/qt5/qt5imageformats/qt5imageformats.mk
+++ b/package/qt5/qt5imageformats/qt5imageformats.mk
@@ -11,7 +11,7 @@ QT5IMAGEFORMATS_DEPENDENCIES = qt5base
 QT5IMAGEFORMATS_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
-ifeq ($(BR2_QT5_VERSION_LATEST),y)
+ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5IMAGEFORMATS_LICENSE = GPLv2+ or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
 QT5IMAGEFORMATS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
 else
diff --git a/package/qt5/qt5location/qt5location.mk b/package/qt5/qt5location/qt5location.mk
index 460a4a4..dbdc645 100644
--- a/package/qt5/qt5location/qt5location.mk
+++ b/package/qt5/qt5location/qt5location.mk
@@ -11,7 +11,7 @@ QT5LOCATION_DEPENDENCIES = qt5base
 QT5LOCATION_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
-ifeq ($(BR2_QT5_VERSION_LATEST),y)
+ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5LOCATION_LICENSE = GPLv2+ or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
 QT5LOCATION_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
 else
diff --git a/package/qt5/qt5multimedia/qt5multimedia.mk b/package/qt5/qt5multimedia/qt5multimedia.mk
index d2e0ff4..fccdd5d 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.mk
+++ b/package/qt5/qt5multimedia/qt5multimedia.mk
@@ -11,7 +11,7 @@ QT5MULTIMEDIA_DEPENDENCIES = qt5base
 QT5MULTIMEDIA_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
-ifeq ($(BR2_QT5_VERSION_LATEST),y)
+ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5MULTIMEDIA_LICENSE = GPLv2+ or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
 QT5MULTIMEDIA_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
 else
diff --git a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk
index d412f69..f6aca2c 100644
--- a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk
+++ b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk
@@ -36,7 +36,7 @@ define QT5QUICKCONTROLS2_INSTALL_TARGET_EXAMPLES
 endef
 endif
 
-ifeq ($(BR2_QT5_VERSION_LATEST),y)
+ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 define QT5QUICKCONTROLS2_INSTALL_TARGET_CMDS
 	cp -dpf $(STAGING_DIR)/usr/lib/libQt5QuickTemplates2.so.* $(TARGET_DIR)/usr/lib
 	cp -dpf $(STAGING_DIR)/usr/lib/libQt5QuickControls2.so.* $(TARGET_DIR)/usr/lib
diff --git a/package/qt5/qt5sensors/qt5sensors.mk b/package/qt5/qt5sensors/qt5sensors.mk
index 98c20ca..fb9ef32 100644
--- a/package/qt5/qt5sensors/qt5sensors.mk
+++ b/package/qt5/qt5sensors/qt5sensors.mk
@@ -11,7 +11,7 @@ QT5SENSORS_DEPENDENCIES = qt5base
 QT5SENSORS_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
-ifeq ($(BR2_QT5_VERSION_LATEST),y)
+ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5SENSORS_LICENSE = GPLv2+ or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
 QT5SENSORS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
 else
diff --git a/package/qt5/qt5serialport/qt5serialport.mk b/package/qt5/qt5serialport/qt5serialport.mk
index 7ae7168..4fbca9e 100644
--- a/package/qt5/qt5serialport/qt5serialport.mk
+++ b/package/qt5/qt5serialport/qt5serialport.mk
@@ -11,7 +11,7 @@ QT5SERIALPORT_DEPENDENCIES = qt5base
 QT5SERIALPORT_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
-ifeq ($(BR2_QT5_VERSION_LATEST),y)
+ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5SERIALPORT_LICENSE = GPLv2+ or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
 QT5SERIALPORT_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
 else
diff --git a/package/qt5/qt5svg/qt5svg.mk b/package/qt5/qt5svg/qt5svg.mk
index c21c3e8..08821e4 100644
--- a/package/qt5/qt5svg/qt5svg.mk
+++ b/package/qt5/qt5svg/qt5svg.mk
@@ -11,7 +11,7 @@ QT5SVG_DEPENDENCIES = qt5base
 QT5SVG_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
-ifeq ($(BR2_QT5_VERSION_LATEST),y)
+ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5SVG_LICENSE = GPLv2+ or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
 QT5SVG_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPLv3 LICENSE.LGPLv3 LICENSE.FDL
 else
diff --git a/package/qt5/qt5tools/qt5tools.mk b/package/qt5/qt5tools/qt5tools.mk
index e74911c..0395f96 100644
--- a/package/qt5/qt5tools/qt5tools.mk
+++ b/package/qt5/qt5tools/qt5tools.mk
@@ -20,7 +20,7 @@ QT5TOOLS_DEPENDENCIES += qt5declarative
 endif
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
-ifeq ($(BR2_QT5_VERSION_LATEST),y)
+ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5TOOLS_LICENSE = GPLv2+ or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
 QT5TOOLS_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPLv3 LICENSE.LGPLv3 LICENSE.FDL
 else
diff --git a/package/qt5/qt5webchannel/qt5webchannel.mk b/package/qt5/qt5webchannel/qt5webchannel.mk
index f5ccb20..9522a74 100644
--- a/package/qt5/qt5webchannel/qt5webchannel.mk
+++ b/package/qt5/qt5webchannel/qt5webchannel.mk
@@ -11,7 +11,7 @@ QT5WEBCHANNEL_DEPENDENCIES = qt5base qt5websockets
 QT5WEBCHANNEL_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
-ifeq ($(BR2_QT5_VERSION_LATEST),y)
+ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5WEBCHANNEL_LICENSE = GPLv2+ or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
 QT5WEBCHANNEL_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
 else
diff --git a/package/qt5/qt5websockets/qt5websockets.mk b/package/qt5/qt5websockets/qt5websockets.mk
index 1794036..975ea64 100644
--- a/package/qt5/qt5websockets/qt5websockets.mk
+++ b/package/qt5/qt5websockets/qt5websockets.mk
@@ -11,7 +11,7 @@ QT5WEBSOCKETS_DEPENDENCIES = qt5base
 QT5WEBSOCKETS_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
-ifeq ($(BR2_QT5_VERSION_LATEST),y)
+ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5WEBSOCKETS_LICENSE = GPLv2+ or LGPLv3, GPLv3 with exception(tools)
 QT5WEBSOCKETS_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3
 else
diff --git a/package/qt5/qt5x11extras/qt5x11extras.mk b/package/qt5/qt5x11extras/qt5x11extras.mk
index 0ac0108..996056b 100644
--- a/package/qt5/qt5x11extras/qt5x11extras.mk
+++ b/package/qt5/qt5x11extras/qt5x11extras.mk
@@ -11,7 +11,7 @@ QT5X11EXTRAS_DEPENDENCIES = qt5base
 QT5X11EXTRAS_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
-ifeq ($(BR2_QT5_VERSION_LATEST),y)
+ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5X11EXTRAS_LICENSE = GPLv2+ or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
 QT5X11EXTRAS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
 else
diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
index 661c62d..e5981af 100644
--- a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
+++ b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
@@ -11,7 +11,7 @@ QT5XMLPATTERNS_DEPENDENCIES = qt5base
 QT5XMLPATTERNS_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
-ifeq ($(BR2_QT5_VERSION_LATEST),y)
+ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5XMLPATTERNS_LICENSE = GPLv2+ or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
 QT5XMLPATTERNS_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
 else
