From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Wed,  5 Sep 2018 10:56:22 +0200
Subject: [Buildroot] [PATCH] qt5location: fix build failure due to missing
 qt5base gui dependency
Message-ID: <20180905085622.89013-1-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

qt5location fails to build due to missing Qt5 Gui module.
In configure.json features.opengl is referred, but it is available only
if qt5base gui submodule is built.

Add BR2_PACKAGE_QT5BASE_GUI to qt5location Config.in to assure gui
submodule is built before qt5location.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 package/qt5/qt5location/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qt5/qt5location/Config.in b/package/qt5/qt5location/Config.in
index e1778182a0..7c39979eff 100644
--- a/package/qt5/qt5location/Config.in
+++ b/package/qt5/qt5location/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_QT5LOCATION
 	bool "qt5location"
 	select BR2_PACKAGE_QT5BASE
+	select BR2_PACKAGE_QT5BASE_GUI
 	help
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
-- 
2.17.1
