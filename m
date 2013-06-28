From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 28 Jun 2013 14:34:18 +0200
Subject: [Buildroot] [git commit] qt5: add _LICENSE_FILES where applicable
Message-ID: <20130628123728.2E0BA9B281@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6488d59a884ff75623f6eec75708980675336fd3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some (but not all) of the qt5 module tarballs contain license files, so
let's reference them.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/qt5/qt5declarative/qt5declarative.mk   |    4 +---
 package/qt5/qt5imageformats/qt5imageformats.mk |    3 +--
 package/qt5/qt5jsbackend/qt5jsbackend.mk       |    4 +---
 package/qt5/qt5quick1/qt5quick1.mk             |    4 +---
 package/qt5/qt5script/qt5script.mk             |    4 +---
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk   |    4 +---
 6 files changed, 6 insertions(+), 17 deletions(-)

diff --git a/package/qt5/qt5declarative/qt5declarative.mk b/package/qt5/qt5declarative/qt5declarative.mk
index 83810ad..603c0e7 100644
--- a/package/qt5/qt5declarative/qt5declarative.mk
+++ b/package/qt5/qt5declarative/qt5declarative.mk
@@ -13,9 +13,7 @@ QT5DECLARATIVE_INSTALL_STAGING = YES
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
 QT5DECLARATIVE_CONFIGURE_OPTS += -opensource -confirm-license
 QT5DECLARATIVE_LICENSE = LGPLv2.1 or GPLv3.0
-# Here we would like to get license files from qt5base, but qt5base
-# may not be extracted at the time we get the legal-info for
-# qt5script.
+QT5DECLARATIVE_LICENSE_FILES = LICENSE.GPL LICENSE.LGPL LGPL_EXCEPTION.txt
 else
 QT5DECLARATIVE_LICENSE = Commercial license
 QT5DECLARATIVE_REDISTRIBUTE = NO
diff --git a/package/qt5/qt5imageformats/qt5imageformats.mk b/package/qt5/qt5imageformats/qt5imageformats.mk
index 8aa412d..10d744b 100644
--- a/package/qt5/qt5imageformats/qt5imageformats.mk
+++ b/package/qt5/qt5imageformats/qt5imageformats.mk
@@ -13,8 +13,7 @@ QT5IMAGEFORMATS_INSTALL_STAGING = YES
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
 QT5IMAGEFORMATS_CONFIGURE_OPTS += -opensource -confirm-license
 QT5IMAGEFORMATS_LICENSE = LGPLv2.1 or GPLv3.0
-# Here we would like to get license files from qt5base, but qt5base
-# may not be extracted at the time we get the legal-info for qt5svg.
+QT5IMAGEFORMATS_LICENSE_FILES = LICENSE.GPL LICENSE.LGPL LGPL_EXCEPTION.txt
 else
 QT5IMAGEFORMATS_LICENSE = Commercial license
 QT5IMAGEFORMATS_REDISTRIBUTE = NO
diff --git a/package/qt5/qt5jsbackend/qt5jsbackend.mk b/package/qt5/qt5jsbackend/qt5jsbackend.mk
index 9134579..d065f0b 100644
--- a/package/qt5/qt5jsbackend/qt5jsbackend.mk
+++ b/package/qt5/qt5jsbackend/qt5jsbackend.mk
@@ -13,9 +13,7 @@ QT5JSBACKEND_INSTALL_STAGING = YES
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
 QT5JSBACKEND_CONFIGURE_OPTS += -opensource -confirm-license
 QT5JSBACKEND_LICENSE = LGPLv2.1 or GPLv3.0
-# Here we would like to get license files from qt5base, but qt5base
-# may not be extracted at the time we get the legal-info for
-# qt5script.
+QT5JSBACKEND_LICENSE_FILES = LICENSE.GPL LICENSE.LGPL LGPL_EXCEPTION.txt
 else
 QT5JSBACKEND_LICENSE = Commercial license
 QT5JSBACKEND_REDISTRIBUTE = NO
diff --git a/package/qt5/qt5quick1/qt5quick1.mk b/package/qt5/qt5quick1/qt5quick1.mk
index 83e11c4..9bd36db 100644
--- a/package/qt5/qt5quick1/qt5quick1.mk
+++ b/package/qt5/qt5quick1/qt5quick1.mk
@@ -14,9 +14,7 @@ QT5QUICK1_INSTALL_STAGING = YES
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
 QT5QUICK1_CONFIGURE_OPTS += -opensource -confirm-license
 QT5QUICK1_LICENSE = LGPLv2.1 or GPLv3.0
-# Here we would like to get license files from qt5base, but qt5base
-# may not be extracted at the time we get the legal-info for
-# qt5script.
+QT5QUICK1_LICENSE_FILES = LICENSE.GPL LICENSE.LGPL LGPL_EXCEPTION.txt
 else
 QT5QUICK1_LICENSE = Commercial license
 QT5QUICK1_REDISTRIBUTE = NO
diff --git a/package/qt5/qt5script/qt5script.mk b/package/qt5/qt5script/qt5script.mk
index 8687f49..e436474 100644
--- a/package/qt5/qt5script/qt5script.mk
+++ b/package/qt5/qt5script/qt5script.mk
@@ -13,9 +13,7 @@ QT5SCRIPT_INSTALL_STAGING = YES
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
 QT5SCRIPT_CONFIGURE_OPTS += -opensource -confirm-license
 QT5SCRIPT_LICENSE = LGPLv2.1 or GPLv3.0
-# Here we would like to get license files from qt5base, but qt5base
-# may not be extracted at the time we get the legal-info for
-# qt5script.
+QT5SCRIPT_LICENSE_FILES = LICENSE.GPL LICENSE.LGPL LGPL_EXCEPTION.txt
 else
 QT5SCRIPT_LICENSE = Commercial license
 QT5SCRIPT_REDISTRIBUTE = NO
diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
index f92f853..322fd70 100644
--- a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
+++ b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
@@ -13,9 +13,7 @@ QT5XMLPATTERNS_INSTALL_STAGING = YES
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
 QT5XMLPATTERNS_CONFIGURE_OPTS += -opensource -confirm-license
 QT5XMLPATTERNS_LICENSE = LGPLv2.1 or GPLv3.0
-# Here we would like to get license files from qt5base, but qt5base
-# may not be extracted at the time we get the legal-info for
-# qt5script.
+QT5XMLPATTERNS_LICENSE_FILES = LICENSE.GPL LICENSE.LGPL LGPL_EXCEPTION.txt
 else
 QT5XMLPATTERNS_LICENSE = Commercial license
 QT5XMLPATTERNS_REDISTRIBUTE = NO
