From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 6 Sep 2018 21:59:10 +0200
Subject: [Buildroot] [git commit] qt5location: fix build failure due to
 missing qt5base gui dependency
Message-ID: <20180906195921.2006A82B96@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=695c9696f9b3abab61fbb712fe3d3bdf6dc3c092
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

qt5location fails to build due to missing Qt5 Gui module.
In configure.json features.opengl is referred, but it is available only
if qt5base gui submodule is built.

Add BR2_PACKAGE_QT5BASE_GUI to qt5location Config.in to assure gui
submodule is built before qt5location.

Fixes:
http://autobuild.buildroot.org/results/1e1/1e12a819750c677c9ef204a324c8bf06212e5135/
http://autobuild.buildroot.org/results/223/223ec6565beba1ca73d4ff488296feec53656b40/
http://autobuild.buildroot.org/results/84f/84fe1c84e3537167ee3791e83c9fe2cc2805ccb5/
http://autobuild.buildroot.org/results/9c9/9c96d2106222e623a379f9995bd059725eb27769/
http://autobuild.buildroot.org/results/fa0/fa01513d28d896ca8819966c5b1ed5c35283e92f/
http://autobuild.buildroot.org/results/5d7/5d7333470c31b83c697218382dc77f74af86c666/
http://autobuild.buildroot.org/results/db7/db7b4c61bb41d32e0f7960c194588cd1559ff3f7/
http://autobuild.buildroot.org/results/2b7/2b71f186b8d67c4805393c9c016d641893d46220/
http://autobuild.buildroot.org/results/1e1/1e12a819750c677c9ef204a324c8bf06212e5135/

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
