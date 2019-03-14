From: Andreas Naumann <anaumann@ultratronik.de>
Date: Thu, 14 Mar 2019 10:40:16 +0100
Subject: [Buildroot] [PATCH v2 05/13] qt5: Use qmake via QT5_QMAKE variable
In-Reply-To: <20190314094024.1961-1-anaumann@ultratronik.de>
References: <20190314094024.1961-1-anaumann@ultratronik.de>
Message-ID: <20190314094024.1961-6-anaumann@ultratronik.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

... in order to consistently use qmake with infrastructure specific settings.

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
---
 package/python-sip/python-sip.mk                       | 2 +-
 package/qt5/qt53d/qt53d.mk                             | 2 +-
 package/qt5/qt5canvas3d/qt5canvas3d.mk                 | 2 +-
 package/qt5/qt5charts/qt5charts.mk                     | 2 +-
 package/qt5/qt5connectivity/qt5connectivity.mk         | 2 +-
 package/qt5/qt5declarative/qt5declarative.mk           | 2 +-
 package/qt5/qt5enginio/qt5enginio.mk                   | 2 +-
 package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk | 2 +-
 package/qt5/qt5imageformats/qt5imageformats.mk         | 2 +-
 package/qt5/qt5location/qt5location.mk                 | 2 +-
 package/qt5/qt5multimedia/qt5multimedia.mk             | 2 +-
 package/qt5/qt5quickcontrols/qt5quickcontrols.mk       | 2 +-
 package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk     | 2 +-
 package/qt5/qt5script/qt5script.mk                     | 2 +-
 package/qt5/qt5scxml/qt5scxml.mk                       | 2 +-
 package/qt5/qt5sensors/qt5sensors.mk                   | 2 +-
 package/qt5/qt5serialbus/qt5serialbus.mk               | 2 +-
 package/qt5/qt5serialport/qt5serialport.mk             | 2 +-
 package/qt5/qt5svg/qt5svg.mk                           | 2 +-
 package/qt5/qt5tools/qt5tools.mk                       | 2 +-
 package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk   | 2 +-
 package/qt5/qt5wayland/qt5wayland.mk                   | 2 +-
 package/qt5/qt5webchannel/qt5webchannel.mk             | 2 +-
 package/qt5/qt5webengine/qt5webengine.mk               | 2 +-
 package/qt5/qt5webkit-examples/qt5webkit-examples.mk   | 2 +-
 package/qt5/qt5webkit/qt5webkit.mk                     | 2 +-
 package/qt5/qt5websockets/qt5websockets.mk             | 2 +-
 package/qt5/qt5x11extras/qt5x11extras.mk               | 2 +-
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk           | 2 +-
 package/qt5cinex/qt5cinex.mk                           | 2 +-
 30 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/package/python-sip/python-sip.mk b/package/python-sip/python-sip.mk
index 69019f5f19..3e4f2545e7 100644
--- a/package/python-sip/python-sip.mk
+++ b/package/python-sip/python-sip.mk
@@ -46,7 +46,7 @@ define PYTHON_SIP_CONFIGURE_CMDS
 			--sipdir $(TARGET_DIR)/usr/share/sip \
 			--sysroot $(STAGING_DIR)/usr \
 			--use-qmake && \
-		$(HOST_DIR)/bin/qmake)
+		$(QT5_QMAKE))
 endef
 
 define PYTHON_SIP_BUILD_CMDS
diff --git a/package/qt5/qt53d/qt53d.mk b/package/qt5/qt53d/qt53d.mk
index f8d9916b70..53bf3d8e43 100644
--- a/package/qt5/qt53d/qt53d.mk
+++ b/package/qt5/qt53d/qt53d.mk
@@ -18,7 +18,7 @@ QT53D_LICENSE = GPL-2.0 or GPL-3.0 or LGPL-3.0
 QT53D_LICENSE_FILES = LICENSE.GPL LICENSE.GPLv3 LICENSE.LGPLv3
 
 define QT53D_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE))
 endef
 
 define QT53D_BUILD_CMDS
diff --git a/package/qt5/qt5canvas3d/qt5canvas3d.mk b/package/qt5/qt5canvas3d/qt5canvas3d.mk
index 05ea03d365..3ea9afb928 100644
--- a/package/qt5/qt5canvas3d/qt5canvas3d.mk
+++ b/package/qt5/qt5canvas3d/qt5canvas3d.mk
@@ -19,7 +19,7 @@ QT5CANVAS3D_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv3
 endif
 
 define QT5CANVAS3D_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE))
 endef
 
 define QT5CANVAS3D_BUILD_CMDS
diff --git a/package/qt5/qt5charts/qt5charts.mk b/package/qt5/qt5charts/qt5charts.mk
index 0d8db66dc4..cbb92e5f12 100644
--- a/package/qt5/qt5charts/qt5charts.mk
+++ b/package/qt5/qt5charts/qt5charts.mk
@@ -25,7 +25,7 @@ QT5CHARTS_DEPENDENCIES += qt5declarative
 endif
 
 define QT5CHARTS_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE))
 endef
 
 define QT5CHARTS_BUILD_CMDS
diff --git a/package/qt5/qt5connectivity/qt5connectivity.mk b/package/qt5/qt5connectivity/qt5connectivity.mk
index fb034d7b7c..549f2e16fa 100644
--- a/package/qt5/qt5connectivity/qt5connectivity.mk
+++ b/package/qt5/qt5connectivity/qt5connectivity.mk
@@ -27,7 +27,7 @@ QT5CONNECTIVITY_DEPENDENCIES += $(if $(BR2_PACKAGE_BLUEZ5_UTILS),bluez5_utils)
 QT5CONNECTIVITY_DEPENDENCIES += $(if $(BR2_PACKAGE_NEARD),neard)
 
 define QT5CONNECTIVITY_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE))
 endef
 
 define QT5CONNECTIVITY_BUILD_CMDS
diff --git a/package/qt5/qt5declarative/qt5declarative.mk b/package/qt5/qt5declarative/qt5declarative.mk
index c617fe9bed..9099ff7cc7 100644
--- a/package/qt5/qt5declarative/qt5declarative.mk
+++ b/package/qt5/qt5declarative/qt5declarative.mk
@@ -19,7 +19,7 @@ QT5DECLARATIVE_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt
 endif
 
 define QT5DECLARATIVE_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE))
 endef
 
 define QT5DECLARATIVE_BUILD_CMDS
diff --git a/package/qt5/qt5enginio/qt5enginio.mk b/package/qt5/qt5enginio/qt5enginio.mk
index 1015044264..968c47e283 100644
--- a/package/qt5/qt5enginio/qt5enginio.mk
+++ b/package/qt5/qt5enginio/qt5enginio.mk
@@ -23,7 +23,7 @@ QT5ENGINIO_DEPENDENCIES += qt5declarative
 endif
 
 define QT5ENGINIO_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE))
 endef
 
 define QT5ENGINIO_BUILD_CMDS
diff --git a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
index f399787d8f..6fed650248 100644
--- a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
+++ b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
@@ -19,7 +19,7 @@ QT5GRAPHICALEFFECTS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv21
 endif
 
 define QT5GRAPHICALEFFECTS_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE))
 endef
 
 define QT5GRAPHICALEFFECTS_BUILD_CMDS
diff --git a/package/qt5/qt5imageformats/qt5imageformats.mk b/package/qt5/qt5imageformats/qt5imageformats.mk
index a7db819268..6ec9c8eaa1 100644
--- a/package/qt5/qt5imageformats/qt5imageformats.mk
+++ b/package/qt5/qt5imageformats/qt5imageformats.mk
@@ -19,7 +19,7 @@ QT5IMAGEFORMATS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv21 LGPL
 endif
 
 define QT5IMAGEFORMATS_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE))
 endef
 
 define QT5IMAGEFORMATS_BUILD_CMDS
diff --git a/package/qt5/qt5location/qt5location.mk b/package/qt5/qt5location/qt5location.mk
index 9b0813e9ad..8911ca0b22 100644
--- a/package/qt5/qt5location/qt5location.mk
+++ b/package/qt5/qt5location/qt5location.mk
@@ -23,7 +23,7 @@ QT5LOCATION_DEPENDENCIES += qt5declarative
 endif
 
 define QT5LOCATION_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE))
 endef
 
 define QT5LOCATION_BUILD_CMDS
diff --git a/package/qt5/qt5multimedia/qt5multimedia.mk b/package/qt5/qt5multimedia/qt5multimedia.mk
index 7f2197e770..5d92fb9e62 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.mk
+++ b/package/qt5/qt5multimedia/qt5multimedia.mk
@@ -35,7 +35,7 @@ QT5MULTIMEDIA_DEPENDENCIES += alsa-lib
 endif
 
 define QT5MULTIMEDIA_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE))
 endef
 
 define QT5MULTIMEDIA_BUILD_CMDS
diff --git a/package/qt5/qt5quickcontrols/qt5quickcontrols.mk b/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
index faa109bc6f..1c152636a9 100644
--- a/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
+++ b/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
@@ -19,7 +19,7 @@ QT5QUICKCONTROLS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv3 LICE
 endif
 
 define QT5QUICKCONTROLS_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE))
 endef
 
 define QT5QUICKCONTROLS_BUILD_CMDS
diff --git a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk
index 950153ae4b..b7e28330a3 100644
--- a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk
+++ b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk
@@ -14,7 +14,7 @@ QT5QUICKCONTROLS2_LICENSE = GPL-3.0 or LGPL-3.0, GFDL-1.3 (docs)
 QT5QUICKCONTROLS2_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv3 LICENSE.FDL
 
 define QT5QUICKCONTROLS2_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE))
 endef
 
 define QT5QUICKCONTROLS2_BUILD_CMDS
diff --git a/package/qt5/qt5script/qt5script.mk b/package/qt5/qt5script/qt5script.mk
index 9f2bd55324..698fa75a9f 100644
--- a/package/qt5/qt5script/qt5script.mk
+++ b/package/qt5/qt5script/qt5script.mk
@@ -28,7 +28,7 @@ QT5SCRIPT_LICENSE_FILES += \
 	src/3rdparty/javascriptcore/JavaScriptCore/pcre/COPYING
 
 define QT5SCRIPT_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE))
 endef
 
 define QT5SCRIPT_BUILD_CMDS
diff --git a/package/qt5/qt5scxml/qt5scxml.mk b/package/qt5/qt5scxml/qt5scxml.mk
index ad0d17502f..6f8b85972e 100644
--- a/package/qt5/qt5scxml/qt5scxml.mk
+++ b/package/qt5/qt5scxml/qt5scxml.mk
@@ -17,7 +17,7 @@ QT5SCXML_LICENSE := $(QT5SCXML_LICENSE), BSD-3-Clause (examples)
 endif
 
 define QT5SCXML_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE))
 endef
 
 define QT5SCXML_BUILD_CMDS
diff --git a/package/qt5/qt5sensors/qt5sensors.mk b/package/qt5/qt5sensors/qt5sensors.mk
index baabc053fc..0dd499211d 100644
--- a/package/qt5/qt5sensors/qt5sensors.mk
+++ b/package/qt5/qt5sensors/qt5sensors.mk
@@ -23,7 +23,7 @@ QT5SENSORS_DEPENDENCIES += qt5declarative
 endif
 
 define QT5SENSORS_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE))
 endef
 
 define QT5SENSORS_BUILD_CMDS
diff --git a/package/qt5/qt5serialbus/qt5serialbus.mk b/package/qt5/qt5serialbus/qt5serialbus.mk
index 68b622dde1..7e972e2b47 100644
--- a/package/qt5/qt5serialbus/qt5serialbus.mk
+++ b/package/qt5/qt5serialbus/qt5serialbus.mk
@@ -14,7 +14,7 @@ QT5SERIALBUS_LICENSE = GPL-2.0 or GPL-3.0 or LGPL-3.0, GFDL-1.3 (docs)
 QT5SERIALBUS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv3 LICENSE.FDL
 
 define QT5SERIALBUS_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE))
 endef
 
 define QT5SERIALBUS_BUILD_CMDS
diff --git a/package/qt5/qt5serialport/qt5serialport.mk b/package/qt5/qt5serialport/qt5serialport.mk
index d0cf7f13a4..b6cfbbefbf 100644
--- a/package/qt5/qt5serialport/qt5serialport.mk
+++ b/package/qt5/qt5serialport/qt5serialport.mk
@@ -19,7 +19,7 @@ QT5SERIALPORT_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_E
 endif
 
 define QT5SERIALPORT_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE))
 endef
 
 define QT5SERIALPORT_BUILD_CMDS
diff --git a/package/qt5/qt5svg/qt5svg.mk b/package/qt5/qt5svg/qt5svg.mk
index a51063a489..e9250179dc 100644
--- a/package/qt5/qt5svg/qt5svg.mk
+++ b/package/qt5/qt5svg/qt5svg.mk
@@ -19,7 +19,7 @@ QT5SVG_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.
 endif
 
 define QT5SVG_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE))
 endef
 
 define QT5SVG_BUILD_CMDS
diff --git a/package/qt5/qt5tools/qt5tools.mk b/package/qt5/qt5tools/qt5tools.mk
index a972756d3a..64b4620143 100644
--- a/package/qt5/qt5tools/qt5tools.mk
+++ b/package/qt5/qt5tools/qt5tools.mk
@@ -49,7 +49,7 @@ QT5TOOLS_BUILD_DIRS_$(BR2_PACKAGE_QT5TOOLS_QTPLUGININFO) += qtplugininfo
 QT5TOOLS_INSTALL_TARGET_$(BR2_PACKAGE_QT5TOOLS_QTPLUGININFO) += qtplugininfo
 
 define QT5TOOLS_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE))
 endef
 
 define QT5TOOLS_BUILD_CMDS
diff --git a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
index 8377e1d8b8..0970a90d4a 100644
--- a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
+++ b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
@@ -55,7 +55,7 @@ QT5VIRTUALKEYBOARD_QMAKEFLAGS += CONFIG+=arrow-key-navigation
 endif
 
 define QT5VIRTUALKEYBOARD_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake $(QT5VIRTUALKEYBOARD_QMAKEFLAGS))
+	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE) $(QT5VIRTUALKEYBOARD_QMAKEFLAGS))
 endef
 
 define QT5VIRTUALKEYBOARD_BUILD_CMDS
diff --git a/package/qt5/qt5wayland/qt5wayland.mk b/package/qt5/qt5wayland/qt5wayland.mk
index 4ab73aa249..854b28c481 100644
--- a/package/qt5/qt5wayland/qt5wayland.mk
+++ b/package/qt5/qt5wayland/qt5wayland.mk
@@ -31,7 +31,7 @@ QT5WAYLAND_QMAKEFLAGS += CONFIG+=wayland-compositor
 endif
 
 define QT5WAYLAND_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake $(QT5WAYLAND_QMAKEFLAGS))
+	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE) $(QT5WAYLAND_QMAKEFLAGS))
 endef
 
 define QT5WAYLAND_BUILD_CMDS
diff --git a/package/qt5/qt5webchannel/qt5webchannel.mk b/package/qt5/qt5webchannel/qt5webchannel.mk
index b0103549bf..9abd9a20a5 100644
--- a/package/qt5/qt5webchannel/qt5webchannel.mk
+++ b/package/qt5/qt5webchannel/qt5webchannel.mk
@@ -26,7 +26,7 @@ QT5WEBCHANNEL_DEPENDENCIES += qt5declarative
 endif
 
 define QT5WEBCHANNEL_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE))
 endef
 
 define QT5WEBCHANNEL_BUILD_CMDS
diff --git a/package/qt5/qt5webengine/qt5webengine.mk b/package/qt5/qt5webengine/qt5webengine.mk
index 4b95020c2b..a50f3dae61 100644
--- a/package/qt5/qt5webengine/qt5webengine.mk
+++ b/package/qt5/qt5webengine/qt5webengine.mk
@@ -64,7 +64,7 @@ QT5WEBENGINE_ENV += GN_PKG_CONFIG_HOST=$(@D)/host-bin/host-pkg-config
 endif
 
 define QT5WEBENGINE_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5WEBENGINE_ENV) $(HOST_DIR)/bin/qmake $(QT5WEBENGINE_QMAKEFLAGS))
+	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5WEBENGINE_ENV) $(QT5_QMAKE) $(QT5WEBENGINE_QMAKEFLAGS))
 endef
 
 define QT5WEBENGINE_BUILD_CMDS
diff --git a/package/qt5/qt5webkit-examples/qt5webkit-examples.mk b/package/qt5/qt5webkit-examples/qt5webkit-examples.mk
index 7e041a5c75..37e7f28657 100644
--- a/package/qt5/qt5webkit-examples/qt5webkit-examples.mk
+++ b/package/qt5/qt5webkit-examples/qt5webkit-examples.mk
@@ -27,7 +27,7 @@ QT5WEBKIT_EXAMPLES_DEPENDENCIES += qt5xmlpatterns
 endif
 
 define QT5WEBKIT_EXAMPLES_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE))
 endef
 
 define QT5WEBKIT_EXAMPLES_BUILD_CMDS
diff --git a/package/qt5/qt5webkit/qt5webkit.mk b/package/qt5/qt5webkit/qt5webkit.mk
index 367bcd9f42..735aa9f0df 100644
--- a/package/qt5/qt5webkit/qt5webkit.mk
+++ b/package/qt5/qt5webkit/qt5webkit.mk
@@ -45,7 +45,7 @@ endef
 QT5WEBKIT_PRE_CONFIGURE_HOOKS += QT5WEBKIT_PYTHON2_SYMLINK
 
 define QT5WEBKIT_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5WEBKIT_ENV) $(HOST_DIR)/bin/qmake WEBKIT_CONFIG+=use_system_leveldb)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5WEBKIT_ENV) $(QT5_QMAKE) WEBKIT_CONFIG+=use_system_leveldb)
 endef
 
 define QT5WEBKIT_BUILD_CMDS
diff --git a/package/qt5/qt5websockets/qt5websockets.mk b/package/qt5/qt5websockets/qt5websockets.mk
index d15c9f4353..d418d7c05c 100644
--- a/package/qt5/qt5websockets/qt5websockets.mk
+++ b/package/qt5/qt5websockets/qt5websockets.mk
@@ -26,7 +26,7 @@ QT5WEBSOCKETS_DEPENDENCIES += qt5declarative
 endif
 
 define QT5WEBSOCKETS_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE))
 endef
 
 define QT5WEBSOCKETS_BUILD_CMDS
diff --git a/package/qt5/qt5x11extras/qt5x11extras.mk b/package/qt5/qt5x11extras/qt5x11extras.mk
index 075fbf2850..62ae68a29a 100644
--- a/package/qt5/qt5x11extras/qt5x11extras.mk
+++ b/package/qt5/qt5x11extras/qt5x11extras.mk
@@ -19,7 +19,7 @@ QT5X11EXTRAS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EX
 endif
 
 define QT5X11EXTRAS_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE))
 endef
 
 define QT5X11EXTRAS_BUILD_CMDS
diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
index 16233cf1ac..0677d8a72f 100644
--- a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
+++ b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
@@ -22,7 +22,7 @@ QT5XMLPATTERNS_LICENSE := $(QT5XMLPATTERNS_LICENSE), BSD-3-Clause (examples)
 endif
 
 define QT5XMLPATTERNS_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE))
 endef
 
 define QT5XMLPATTERNS_BUILD_CMDS
diff --git a/package/qt5cinex/qt5cinex.mk b/package/qt5cinex/qt5cinex.mk
index 89c38ee3f5..ea8fbb7651 100644
--- a/package/qt5cinex/qt5cinex.mk
+++ b/package/qt5cinex/qt5cinex.mk
@@ -18,7 +18,7 @@ QT5CINEX_LICENSE = CC-BY-3.0
 QT5CINEX_LICENSE_FILES = README
 
 define QT5CINEX_CONFIGURE_CMDS
-	cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake
+	cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE)
 endef
 
 define QT5CINEX_BUILD_CMDS
-- 
2.21.0
