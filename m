From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Jun 2014 18:52:44 +0200
Subject: [Buildroot] [git commit] qt5: fix legal info
Message-ID: <20140614165249.B5AC99CFBB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5e27a98b4d177f338500ebcb426232a17f695799
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fatih A????c?? <fatih.asici@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../qt5/qt5graphicaleffects/qt5graphicaleffects.mk |    4 +---
 package/qt5/qt5multimedia/qt5multimedia.mk         |    4 +---
 package/qt5/qt5svg/qt5svg.mk                       |    3 +--
 package/qt5/qt5webkit/qt5webkit.mk                 |    8 +++-----
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
