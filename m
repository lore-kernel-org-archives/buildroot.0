From: Laurent Hartanerot <laurent.hartanerot@gmail.com>
Date: Thu, 30 Aug 2018 12:07:03 +0200
Subject: [Buildroot] [PATCH v3 3/3] qt5webengine: Rename internal variable
 to qt5webengine
In-Reply-To: <20180829063034.10766-1-laurent.hartanerot@gmail.com>
References: <20180829063034.10766-1-laurent.hartanerot@gmail.com>
Message-ID: <20180830100703.11153-1-laurent.hartanerot@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Laurent Hartanerot <laurent.hartanerot@atos.net>

Signed-off-by: Laurent Hartanerot <laurent.hartanerot@atos.net>
---
 package/qt5/qt5webengine/chromium-latest.inc | 2 +-
 package/qt5/qt5webengine/chromium-lts.inc    | 2 +-
 package/qt5/qt5webengine/qt5webengine.mk     | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/qt5/qt5webengine/chromium-latest.inc b/package/qt5/qt5webengine/chromium-latest.inc
index 3e98052b38..671b2383a3 100644
--- a/package/qt5/qt5webengine/chromium-latest.inc
+++ b/package/qt5/qt5webengine/chromium-latest.inc
@@ -1,4 +1,4 @@
-CHROMIUM_LICENSE_FILES = \
+QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/url/third_party/mozilla/LICENSE.txt \
 	src/3rdparty/chromium/tools/symsrc/COPYING-pefile \
 	src/3rdparty/chromium/tools/win/ChromeDebug/ChromeDebug/LICENSE \
diff --git a/package/qt5/qt5webengine/chromium-lts.inc b/package/qt5/qt5webengine/chromium-lts.inc
index bff7931656..d45e9692de 100644
--- a/package/qt5/qt5webengine/chromium-lts.inc
+++ b/package/qt5/qt5webengine/chromium-lts.inc
@@ -1,4 +1,4 @@
-CHROMIUM_LICENSE_FILES = \
+QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/url/third_party/mozilla/LICENSE.txt \
 	src/3rdparty/chromium/sdch/open-vcdiff/COPYING \
 	src/3rdparty/chromium/tools/gyp/LICENSE \
diff --git a/package/qt5/qt5webengine/qt5webengine.mk b/package/qt5/qt5webengine/qt5webengine.mk
index c4ae961126..a3cfcec26e 100644
--- a/package/qt5/qt5webengine/qt5webengine.mk
+++ b/package/qt5/qt5webengine/qt5webengine.mk
@@ -19,7 +19,7 @@ include package/qt5/qt5webengine/chromium-lts.inc
 endif
 QT5WEBENGINE_LICENSE = GPL-2.0 or LGPL-3.0 or GPL-3.0 or GPL-3.0 with exception
 QT5WEBENGINE_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT \
-	LICENSE.GPLv3 LICENSE.LGPL3 $(CHROMIUM_LICENSE_FILES)
+	LICENSE.GPLv3 LICENSE.LGPL3 $(QT5WEBENGINE_CHROMIUM_LICENSE_FILES)
 
 ifeq ($(BR2_PACKAGE_QT5BASE_XCB),y)
 QT5WEBENGINE_DEPENDENCIES += xlib_libXScrnSaver xlib_libXcomposite \
-- 
2.11.0
