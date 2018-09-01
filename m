From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 1 Sep 2018 14:45:22 +0200
Subject: [Buildroot] [git commit] qt5webengine: use QT5WEBENGINE prefix for
 CHROMIUM_LICENSE_FILES variable
Message-ID: <20180901124503.E0425821DA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1098f64d7bdd650d46ee404834fa5087496b86a9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The qt5webengine package currently uses the CHROMIUM_LICENSE_FILES
variable to hold the list of license files for the chromium source
code embedded inside the qt5webengine code.

However, using this variable would clash with a hypothetical
"chromium" package, and anyway violates our rule that all variables of
a package should be prefixed by the package name.

This commit fixes that by adding the QT5WEBENGINE to this variable.

Signed-off-by: Laurent Hartanerot <laurent.hartanerot@atos.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
