From: Andreas Naumann <anaumann@ultratronik.de>
Date: Mon, 17 Feb 2020 22:23:45 +0100
Subject: [Buildroot] [PATCH v6 23/28] package/qt5webengine: add libXdamage
 as XCB dependency
In-Reply-To: <20200217212350.29750-1-anaumann@ultratronik.de>
References: <20200217212350.29750-1-anaumann@ultratronik.de>
Message-ID: <20200217212350.29750-24-anaumann@ultratronik.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes a build failure.

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
---
 package/qt5/qt5webengine/Config.in       | 1 +
 package/qt5/qt5webengine/qt5webengine.mk | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/qt5/qt5webengine/Config.in b/package/qt5/qt5webengine/Config.in
index 0e776ecb61..f98530fa4d 100644
--- a/package/qt5/qt5webengine/Config.in
+++ b/package/qt5/qt5webengine/Config.in
@@ -59,6 +59,7 @@ config BR2_PACKAGE_QT5WEBENGINE
 	select BR2_PACKAGE_XLIB_LIBXRANDR if BR2_PACKAGE_QT5BASE_XCB
 	select BR2_PACKAGE_XLIB_LIBXSCRNSAVER if BR2_PACKAGE_QT5BASE_XCB
 	select BR2_PACKAGE_XLIB_LIBXTST if BR2_PACKAGE_QT5BASE_XCB
+	select BR2_PACKAGE_XLIB_LIBXDAMAGE if BR2_PACKAGE_QT5BASE_XCB
 	help
 	  The Qt WebEngine module provides a web browser engine that
 	  makes it easy to embed content from the World Wide Web into
diff --git a/package/qt5/qt5webengine/qt5webengine.mk b/package/qt5/qt5webengine/qt5webengine.mk
index 798b777df0..cd7a0ba81c 100644
--- a/package/qt5/qt5webengine/qt5webengine.mk
+++ b/package/qt5/qt5webengine/qt5webengine.mk
@@ -23,7 +23,7 @@ QT5WEBENGINE_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT \
 
 ifeq ($(BR2_PACKAGE_QT5BASE_XCB),y)
 QT5WEBENGINE_DEPENDENCIES += xlib_libXScrnSaver xlib_libXcomposite \
-	xlib_libXcursor xlib_libXi xlib_libXrandr xlib_libXtst
+	xlib_libXcursor xlib_libXi xlib_libXrandr xlib_libXtst xlib_libXdamage
 endif
 
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
-- 
2.25.0
