From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Mar 2014 17:04:49 +0100
Subject: [Buildroot] [git commit] qt5 packages: set correct PATH when
	running qmake
Message-ID: <20140326160936.71F999C3AF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b923fdffdd77bccef2822748a2adcb9a04a1f1fa
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The qmake step of qt5 packages may attempt to run pkg-config. If qmake is
executed in an environment where the buildroot host directory is not in
PATH, pkg-config from the build machine may be used (/usr/bin/pkg-config).
This causes qt5 package compilation to fail on machines that do not have
pkg-config installed.
Refer to mailing list thread [1] for a specific error case.

This patch prepends TARGET_MAKE_ENV (which sets PATH) to the qmake call.

Reported-by: Marco Trapanese <marcotrapanese@gmail.com>
Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

[1] http://lists.busybox.net/pipermail/buildroot/2014-March/092283.html
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5connectivity/qt5connectivity.mk     |    2 +-
 package/qt5/qt5declarative/qt5declarative.mk       |    2 +-
 .../qt5/qt5graphicaleffects/qt5graphicaleffects.mk |    2 +-
 package/qt5/qt5imageformats/qt5imageformats.mk     |    2 +-
 package/qt5/qt5multimedia/qt5multimedia.mk         |    2 +-
 package/qt5/qt5quick1/qt5quick1.mk                 |    2 +-
 package/qt5/qt5quickcontrols/qt5quickcontrols.mk   |    2 +-
 package/qt5/qt5script/qt5script.mk                 |    2 +-
 package/qt5/qt5sensors/qt5sensors.mk               |    2 +-
 package/qt5/qt5serialport/qt5serialport.mk         |    2 +-
 package/qt5/qt5svg/qt5svg.mk                       |    2 +-
 package/qt5/qt5x11extras/qt5x11extras.mk           |    2 +-
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk       |    2 +-
 13 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/package/qt5/qt5connectivity/qt5connectivity.mk b/package/qt5/qt5connectivity/qt5connectivity.mk
index 2be51d5..214d536 100644
--- a/package/qt5/qt5connectivity/qt5connectivity.mk
+++ b/package/qt5/qt5connectivity/qt5connectivity.mk
@@ -23,7 +23,7 @@ QT5CONNECTIVITY_DEPENDENCIES += qt5declarative
 endif
 
 define QT5CONNECTIVITY_CONFIGURE_CMDS
-	(cd $(@D); $(HOST_DIR)/usr/bin/qmake)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
 endef
 
 define QT5CONNECTIVITY_BUILD_CMDS
diff --git a/package/qt5/qt5declarative/qt5declarative.mk b/package/qt5/qt5declarative/qt5declarative.mk
index 6eb803a..472d092 100644
--- a/package/qt5/qt5declarative/qt5declarative.mk
+++ b/package/qt5/qt5declarative/qt5declarative.mk
@@ -19,7 +19,7 @@ QT5DECLARATIVE_REDISTRIBUTE = NO
 endif
 
 define QT5DECLARATIVE_CONFIGURE_CMDS
-	(cd $(@D); $(HOST_DIR)/usr/bin/qmake)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
 endef
 
 define QT5DECLARATIVE_BUILD_CMDS
diff --git a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
index 1e492c9..036cf21 100644
--- a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
+++ b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
@@ -21,7 +21,7 @@ QT5GRAPHICALEFFECTS_REDISTRIBUTE = NO
 endif
 
 define QT5GRAPHICALEFFECTS_CONFIGURE_CMDS
-	(cd $(@D); $(HOST_DIR)/usr/bin/qmake)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
 endef
 
 define QT5GRAPHICALEFFECTS_BUILD_CMDS
diff --git a/package/qt5/qt5imageformats/qt5imageformats.mk b/package/qt5/qt5imageformats/qt5imageformats.mk
index 52192c6..c4049c7 100644
--- a/package/qt5/qt5imageformats/qt5imageformats.mk
+++ b/package/qt5/qt5imageformats/qt5imageformats.mk
@@ -19,7 +19,7 @@ QT5IMAGEFORMATS_REDISTRIBUTE = NO
 endif
 
 define QT5IMAGEFORMATS_CONFIGURE_CMDS
-	(cd $(@D); $(HOST_DIR)/usr/bin/qmake)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
 endef
 
 define QT5IMAGEFORMATS_BUILD_CMDS
diff --git a/package/qt5/qt5multimedia/qt5multimedia.mk b/package/qt5/qt5multimedia/qt5multimedia.mk
index 5256920..e7ac562 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.mk
+++ b/package/qt5/qt5multimedia/qt5multimedia.mk
@@ -25,7 +25,7 @@ QT5MULTIMEDIA_DEPENDENCIES += gst-plugins-base
 endif
 
 define QT5MULTIMEDIA_CONFIGURE_CMDS
-	(cd $(@D); $(HOST_DIR)/usr/bin/qmake)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
 endef
 
 define QT5MULTIMEDIA_BUILD_CMDS
diff --git a/package/qt5/qt5quick1/qt5quick1.mk b/package/qt5/qt5quick1/qt5quick1.mk
index 4cc011a..624b130 100644
--- a/package/qt5/qt5quick1/qt5quick1.mk
+++ b/package/qt5/qt5quick1/qt5quick1.mk
@@ -20,7 +20,7 @@ QT5QUICK1_REDISTRIBUTE = NO
 endif
 
 define QT5QUICK1_CONFIGURE_CMDS
-	(cd $(@D); $(HOST_DIR)/usr/bin/qmake)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
 endef
 
 define QT5QUICK1_BUILD_CMDS
diff --git a/package/qt5/qt5quickcontrols/qt5quickcontrols.mk b/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
index f9008b4..5f284fb 100644
--- a/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
+++ b/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
@@ -19,7 +19,7 @@ QT5QUICKCONTROLS_REDISTRIBUTE = NO
 endif
 
 define QT5QUICKCONTROLS_CONFIGURE_CMDS
-	(cd $(@D); $(HOST_DIR)/usr/bin/qmake)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
 endef
 
 define QT5QUICKCONTROLS_BUILD_CMDS
diff --git a/package/qt5/qt5script/qt5script.mk b/package/qt5/qt5script/qt5script.mk
index e62e0ac..a80995c 100644
--- a/package/qt5/qt5script/qt5script.mk
+++ b/package/qt5/qt5script/qt5script.mk
@@ -19,7 +19,7 @@ QT5SCRIPT_REDISTRIBUTE = NO
 endif
 
 define QT5SCRIPT_CONFIGURE_CMDS
-	(cd $(@D); $(HOST_DIR)/usr/bin/qmake)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
 endef
 
 define QT5SCRIPT_BUILD_CMDS
diff --git a/package/qt5/qt5sensors/qt5sensors.mk b/package/qt5/qt5sensors/qt5sensors.mk
index 21ec36c..1b03293 100644
--- a/package/qt5/qt5sensors/qt5sensors.mk
+++ b/package/qt5/qt5sensors/qt5sensors.mk
@@ -23,7 +23,7 @@ QT5SENSORS_DEPENDENCIES += qt5declarative
 endif
 
 define QT5SENSORS_CONFIGURE_CMDS
-	(cd $(@D); $(HOST_DIR)/usr/bin/qmake)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
 endef
 
 define QT5SENSORS_BUILD_CMDS
diff --git a/package/qt5/qt5serialport/qt5serialport.mk b/package/qt5/qt5serialport/qt5serialport.mk
index 0328ef8..719b647 100644
--- a/package/qt5/qt5serialport/qt5serialport.mk
+++ b/package/qt5/qt5serialport/qt5serialport.mk
@@ -19,7 +19,7 @@ QT5SERIALPORT_REDISTRIBUTE = NO
 endif
 
 define QT5SERIALPORT_CONFIGURE_CMDS
-	(cd $(@D); $(HOST_DIR)/usr/bin/qmake)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
 endef
 
 define QT5SERIALPORT_BUILD_CMDS
diff --git a/package/qt5/qt5svg/qt5svg.mk b/package/qt5/qt5svg/qt5svg.mk
index 2ff7fc8..da981f4 100644
--- a/package/qt5/qt5svg/qt5svg.mk
+++ b/package/qt5/qt5svg/qt5svg.mk
@@ -20,7 +20,7 @@ QT5SVG_REDISTRIBUTE = NO
 endif
 
 define QT5SVG_CONFIGURE_CMDS
-	(cd $(@D); $(HOST_DIR)/usr/bin/qmake)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
 endef
 
 define QT5SVG_BUILD_CMDS
diff --git a/package/qt5/qt5x11extras/qt5x11extras.mk b/package/qt5/qt5x11extras/qt5x11extras.mk
index 237fe32..fc4beda 100644
--- a/package/qt5/qt5x11extras/qt5x11extras.mk
+++ b/package/qt5/qt5x11extras/qt5x11extras.mk
@@ -19,7 +19,7 @@ QT5X11EXTRAS_REDISTRIBUTE = NO
 endif
 
 define QT5X11EXTRAS_CONFIGURE_CMDS
-	(cd $(@D); $(HOST_DIR)/usr/bin/qmake)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
 endef
 
 define QT5X11EXTRAS_BUILD_CMDS
diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
index 6f4fdc8..b0d0b06 100644
--- a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
+++ b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
@@ -19,7 +19,7 @@ QT5XMLPATTERNS_REDISTRIBUTE = NO
 endif
 
 define QT5XMLPATTERNS_CONFIGURE_CMDS
-	(cd $(@D); $(HOST_DIR)/usr/bin/qmake)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
 endef
 
 define QT5XMLPATTERNS_BUILD_CMDS
