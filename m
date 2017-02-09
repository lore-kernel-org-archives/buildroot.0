From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Feb 2017 22:16:18 +0100
Subject: [Buildroot] [git commit] package/qt5: remove menu comment about
	deprecated modules
Message-ID: <20170209211643.1F8E882140@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=00487cc56c4dc1d284f3501eaa555ad0b9ec96a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As now the Qt version is configurable to simplify the menu display
logic we remove the menu comment about deprecated modules and
indicate it in the relevant modules' help text instead, and also
mention in the help text if a package's tech preview status has been
changed between Qt 5.6 and Qt 5.8

Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/Config.in                   | 7 +++----
 package/qt5/qt53d/Config.in             | 4 ++++
 package/qt5/qt5enginio/Config.in        | 3 +++
 package/qt5/qt5quickcontrols2/Config.in | 3 +++
 package/qt5/qt5serialbus/Config.in      | 3 +++
 5 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index c3560c3..df6ce4d 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -58,23 +58,22 @@ source "package/qt5/qt5base/Config.in"
 source "package/qt5/qt5canvas3d/Config.in"
 source "package/qt5/qt5connectivity/Config.in"
 source "package/qt5/qt5declarative/Config.in"
+source "package/qt5/qt5enginio/Config.in"
 source "package/qt5/qt5graphicaleffects/Config.in"
 source "package/qt5/qt5imageformats/Config.in"
 source "package/qt5/qt5location/Config.in"
 source "package/qt5/qt5multimedia/Config.in"
 source "package/qt5/qt5quickcontrols/Config.in"
 source "package/qt5/qt5quickcontrols2/Config.in"
+source "package/qt5/qt5script/Config.in"
 source "package/qt5/qt5sensors/Config.in"
 source "package/qt5/qt5serialbus/Config.in"
 source "package/qt5/qt5serialport/Config.in"
 source "package/qt5/qt5svg/Config.in"
 source "package/qt5/qt5tools/Config.in"
 source "package/qt5/qt5webchannel/Config.in"
+source "package/qt5/qt5webkit/Config.in"
 source "package/qt5/qt5websockets/Config.in"
 source "package/qt5/qt5x11extras/Config.in"
 source "package/qt5/qt5xmlpatterns/Config.in"
-comment "legacy compatibility"
-source "package/qt5/qt5enginio/Config.in"
-source "package/qt5/qt5script/Config.in"
-source "package/qt5/qt5webkit/Config.in"
 endif
diff --git a/package/qt5/qt53d/Config.in b/package/qt5/qt53d/Config.in
index ff50204..27f27a8 100644
--- a/package/qt5/qt53d/Config.in
+++ b/package/qt5/qt53d/Config.in
@@ -12,6 +12,10 @@ config BR2_PACKAGE_QT53D
 
 	  This package corresponds to the qt53d module.
 
+
+	  This module was in tech preview in Qt 5.6, and promoted
+	  to a core module in Qt 5.7.0.
+
 	  Enable the assimp package to gain the assimp sceneparser plugin.
 
 	  http://doc.qt.io/qt-5/qt3d-index.html
diff --git a/package/qt5/qt5enginio/Config.in b/package/qt5/qt5enginio/Config.in
index fcb866c..dba75e2 100644
--- a/package/qt5/qt5enginio/Config.in
+++ b/package/qt5/qt5enginio/Config.in
@@ -10,4 +10,7 @@ config BR2_PACKAGE_QT5ENGINIO
 
 	  This package corresponds to the qt5enginio module.
 
+	  This package has been tagged as deprecated since version
+	  5.6 and not recommended for new design.
+
 	  http://qt.io
diff --git a/package/qt5/qt5quickcontrols2/Config.in b/package/qt5/qt5quickcontrols2/Config.in
index 1e57674..d2267cb 100644
--- a/package/qt5/qt5quickcontrols2/Config.in
+++ b/package/qt5/qt5quickcontrols2/Config.in
@@ -10,6 +10,9 @@ config BR2_PACKAGE_QT5QUICKCONTROLS2
 
 	  This package corresponds to the qt5quickcontrols2 module.
 
+	  This module was in tech preview in Qt 5.6, and promoted
+	  to a core module in Qt 5.7.0.
+
 	  http://qt.io
 
 comment "qt5quickcontrols2 needs an OpenGL-capable backend"
diff --git a/package/qt5/qt5serialbus/Config.in b/package/qt5/qt5serialbus/Config.in
index f5b713d..3960ada 100644
--- a/package/qt5/qt5serialbus/Config.in
+++ b/package/qt5/qt5serialbus/Config.in
@@ -9,6 +9,9 @@ config BR2_PACKAGE_QT5SERIALBUS
 
 	  This package corresponds to the qt5serialbus module.
 
+	  This module was in tech preview in Qt 5.6, and promoted
+	  to a core module in Qt 5.8.0.
+
 	  http://qt.io
 
 comment "qt5serialbus needs headers >= 3.6"
