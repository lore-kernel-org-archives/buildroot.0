From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Feb 2020 23:55:45 +0100
Subject: [Buildroot] [git commit] package/gst1-plugins-good: drop
 QT5_VERSION_LATEST logic
Message-ID: <20200309140908.52B9F81268@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dad59b831e13c2a932a2e877f05b515637cb2183
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that the version selection has been removed.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-plugins-good/Config.in | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-good/Config.in b/package/gstreamer1/gst1-plugins-good/Config.in
index c8bf58bb89..20aebc473e 100644
--- a/package/gstreamer1/gst1-plugins-good/Config.in
+++ b/package/gstreamer1/gst1-plugins-good/Config.in
@@ -279,7 +279,6 @@ config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_QMLGL
 	bool "qmlgl (qt5)"
 	depends on BR2_PACKAGE_QT5
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE # qt5declarative
-	depends on BR2_PACKAGE_QT5_GL_AVAILABLE || BR2_PACKAGE_QT5_VERSION_LATEST # qt5declarative-quick
 	select BR2_PACKAGE_QT5BASE_WIDGETS
 	select BR2_PACKAGE_QT5DECLARATIVE
 	select BR2_PACKAGE_QT5DECLARATIVE_QUICK
@@ -287,11 +286,6 @@ config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_QMLGL
 	help
 	  QT5 plugin which includes elements qmlglsrc and qmlglsink
 
-comment "qmlgl (qt5) plugin needs an OpenGL-capable Qt5 backend"
-	depends on BR2_PACKAGE_QT5
-	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
-	depends on !BR2_PACKAGE_QT5_GL_AVAILABLE && !BR2_PACKAGE_QT5_VERSION_LATEST
-
 config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_SHOUT2
 	bool "shout2"
 	select BR2_PACKAGE_LIBSHOUT
