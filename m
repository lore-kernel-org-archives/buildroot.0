From: =?UTF-8?q?Fatih=20A=C5=9F=C4=B1c=C4=B1?= <fatih.asici@gmail.com>
Date: Fri, 13 Jun 2014 16:38:12 +0300
Subject: [Buildroot] [PATCH] qt5: fix legal info
Message-ID: <1402666692-9805-1-git-send-email-fatih.asici@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fatih A??c? <fatih.asici@gmail.com>
---
 package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk | 4 +---
 package/qt5/qt5multimedia/qt5multimedia.mk             | 4 +---
 package/qt5/qt5svg/qt5svg.mk                           | 3 +--
 package/qt5/qt5webkit/qt5webkit.mk                     | 8 +++-----
 4 files changed, 6 insertions(+), 13 deletions(-)

diff --git a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
index 036cf21..2c3f66a 100644
--- a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
+++ b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
@@ -12,9 +12,7 @@ QT5GRAPHICALEFFECTS_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
 QT5GRAPHICALEFFECTS_LICENSE = LGPLv2.1 or GPLv3.0
-# Here we would like to get license files from qt5base, but qt5base
-# may not be extracted at the time we get the legal-info for
-# qt5script.
+QT5GRAPHICALEFFECTS_LICENSE_FILES = LICENSE.GPL LICENSE.LGPL LGPL_EXCEPTION.txt
 else
 QT5GRAPHICALEFFECTS_LICENSE = Commercial license
 QT5GRAPHICALEFFECTS_REDISTRIBUTE = NO
diff --git a/package/qt5/qt5multimedia/qt5multimedia.mk b/package/qt5/qt5multimedia/qt5multimedia.mk
index e7ac562..5eef543 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.mk
+++ b/package/qt5/qt5multimedia/qt5multimedia.mk
@@ -12,9 +12,7 @@ QT5MULTIMEDIA_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
 QT5MULTIMEDIA_LICENSE = LGPLv2.1 or GPLv3.0
-# Here we would like to get license files from qt5base, but qt5base
-# may not be extracted at the time we get the legal-info for
-# qt5script.
+QT5MULTIMEDIA_LICENSE_FILES = LICENSE.GPL LICENSE.LGPL LGPL_EXCEPTION.txt
 else
 QT5MULTIMEDIA_LICENSE = Commercial license
 QT5MULTIMEDIA_REDISTRIBUTE = NO
diff --git a/package/qt5/qt5svg/qt5svg.mk b/package/qt5/qt5svg/qt5svg.mk
index da981f4..a768acb 100644
--- a/package/qt5/qt5svg/qt5svg.mk
+++ b/package/qt5/qt5svg/qt5svg.mk
@@ -12,8 +12,7 @@ QT5SVG_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
 QT5SVG_LICENSE = LGPLv2.1 or GPLv3.0
-# Here we would like to get license files from qt5base, but qt5base
-# may not be extracted at the time we get the legal-info for qt5svg.
+QT5SVG_LICENSE_FILES = LICENSE.GPL LICENSE.LGPL LGPL_EXCEPTION.txt
 else
 QT5SVG_LICENSE = Commercial license
 QT5SVG_REDISTRIBUTE = NO
diff --git a/package/qt5/qt5webkit/qt5webkit.mk b/package/qt5/qt5webkit/qt5webkit.mk
index 33b775d..08c30be 100644
--- a/package/qt5/qt5webkit/qt5webkit.mk
+++ b/package/qt5/qt5webkit/qt5webkit.mk
@@ -11,14 +11,12 @@ QT5WEBKIT_DEPENDENCIES = qt5base sqlite host-ruby host-gperf host-bison host-fle
 QT5WEBKIT_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
-QT5WEBKIT_LICENSE = LGPLv2.1 or GPLv3.0
-# Here we would like to get license files from qt5base, but qt5base
-# may not be extracted at the time we get the legal-info for
-# qt5script.
+QT5WEBKIT_LICENSE = LGPLv2+, MIT
 else
-QT5WEBKIT_LICENSE = Commercial license
+QT5WEBKIT_LICENSE = LGPLv2+, MIT, Commercial license
 QT5WEBKIT_REDISTRIBUTE = NO
 endif
+QT5WEBKIT_LICENSE_FILES = Source/WebCore/LICENSE-LGPL-2 Source/WebCore/LICENSE-LGPL-2.1 Source/WebKit/LICENSE
 
 ifeq ($(BR2_PACKAGE_QT5BASE_XCB),y)
 QT5WEBKIT_DEPENDENCIES += xlib_libXext xlib_libXrender
-- 
1.9.1
