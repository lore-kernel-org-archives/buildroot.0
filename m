From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 15 Apr 2013 15:11:19 +0200
Subject: [Buildroot] [PATCH 1/2] qt5: factor <pkg>_SITE variable
Message-ID: <1366031480-9458-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Each qt5 package was defining its own QT5<something>_SITE
variable. Unfortunately, the download location has slightly changed
for Qt 5.0.2, so we would have to change it for all packages. Instead,
we factor the <pkg>_SITE variable as QT5_SITE in package/qt5/qt5.mk,
just like we already do for QT5_VERSION.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/qt5.mk                                 |    1 +
 package/qt5/qt5base/qt5base.mk                     |    2 +-
 package/qt5/qt5declarative/qt5declarative.mk       |    2 +-
 .../qt5/qt5graphicaleffects/qt5graphicaleffects.mk |    2 +-
 package/qt5/qt5imageformats/qt5imageformats.mk     |    2 +-
 package/qt5/qt5jsbackend/qt5jsbackend.mk           |    2 +-
 package/qt5/qt5multimedia/qt5multimedia.mk         |    2 +-
 package/qt5/qt5quick1/qt5quick1.mk                 |    2 +-
 package/qt5/qt5script/qt5script.mk                 |    2 +-
 package/qt5/qt5svg/qt5svg.mk                       |    2 +-
 package/qt5/qt5webkit/qt5webkit.mk                 |    2 +-
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk       |    2 +-
 12 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/package/qt5/qt5.mk b/package/qt5/qt5.mk
index 83cc0e1..c6bbbe0 100644
--- a/package/qt5/qt5.mk
+++ b/package/qt5/qt5.mk
@@ -1,4 +1,5 @@
 QT5_VERSION = 5.0.1
+QT5_SITE = http://releases.qt-project.org/qt5/$(QT5_VERSION)/submodules_tar/
 include package/qt5/*/*.mk
 
 define QT5_LA_PRL_FILES_FIXUP
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 303d255..bfc6c91 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -5,7 +5,7 @@
 #############################################################
 
 QT5BASE_VERSION = $(QT5_VERSION)
-QT5BASE_SITE = http://releases.qt-project.org/qt5/$(QT5BASE_VERSION)/submodules_tar/
+QT5BASE_SITE = $(QT5_SITE)
 QT5BASE_SOURCE = qtbase-opensource-src-$(QT5BASE_VERSION).tar.xz
 
 QT5BASE_DEPENDENCIES = host-pkgconf zlib pcre
diff --git a/package/qt5/qt5declarative/qt5declarative.mk b/package/qt5/qt5declarative/qt5declarative.mk
index de20017..e4dd742 100644
--- a/package/qt5/qt5declarative/qt5declarative.mk
+++ b/package/qt5/qt5declarative/qt5declarative.mk
@@ -5,7 +5,7 @@
 #############################################################
 
 QT5DECLARATIVE_VERSION = $(QT5_VERSION)
-QT5DECLARATIVE_SITE = http://releases.qt-project.org/qt5/$(QT5DECLARATIVE_VERSION)/submodules_tar/
+QT5DECLARATIVE_SITE = $(QT5_SITE)
 QT5DECLARATIVE_SOURCE = qtdeclarative-opensource-src-$(QT5DECLARATIVE_VERSION).tar.xz
 QT5DECLARATIVE_DEPENDENCIES = qt5base qt5xmlpatterns qt5jsbackend
 QT5DECLARATIVE_INSTALL_STAGING = YES
diff --git a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
index c4b7231..93aef53 100644
--- a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
+++ b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
@@ -5,7 +5,7 @@
 #############################################################
 
 QT5GRAPHICALEFFECTS_VERSION = $(QT5_VERSION)
-QT5GRAPHICALEFFECTS_SITE = http://releases.qt-project.org/qt5/$(QT5GRAPHICALEFFECTS_VERSION)/submodules_tar/
+QT5GRAPHICALEFFECTS_SITE = $(QT5_SITE)
 QT5GRAPHICALEFFECTS_SOURCE = qtgraphicaleffects-opensource-src-$(QT5GRAPHICALEFFECTS_VERSION).tar.xz
 QT5GRAPHICALEFFECTS_DEPENDENCIES = qt5base qt5declarative
 QT5GRAPHICALEFFECTS_INSTALL_STAGING = YES
diff --git a/package/qt5/qt5imageformats/qt5imageformats.mk b/package/qt5/qt5imageformats/qt5imageformats.mk
index 5130cfb..77dfa8f 100644
--- a/package/qt5/qt5imageformats/qt5imageformats.mk
+++ b/package/qt5/qt5imageformats/qt5imageformats.mk
@@ -5,7 +5,7 @@
 #############################################################
 
 QT5IMAGEFORMATS_VERSION = $(QT5_VERSION)
-QT5IMAGEFORMATS_SITE = http://releases.qt-project.org/qt5/$(QT5IMAGEFORMATS_VERSION)/submodules_tar/
+QT5IMAGEFORMATS_SITE = $(QT5_SITE)
 QT5IMAGEFORMATS_SOURCE = qtimageformats-opensource-src-$(QT5IMAGEFORMATS_VERSION).tar.xz
 QT5IMAGEFORMATS_DEPENDENCIES = qt5base
 QT5IMAGEFORMATS_INSTALL_STAGING = YES
diff --git a/package/qt5/qt5jsbackend/qt5jsbackend.mk b/package/qt5/qt5jsbackend/qt5jsbackend.mk
index bc6a53a..3c3c2c2 100644
--- a/package/qt5/qt5jsbackend/qt5jsbackend.mk
+++ b/package/qt5/qt5jsbackend/qt5jsbackend.mk
@@ -5,7 +5,7 @@
 #############################################################
 
 QT5JSBACKEND_VERSION = $(QT5_VERSION)
-QT5JSBACKEND_SITE = http://releases.qt-project.org/qt5/$(QT5JSBACKEND_VERSION)/submodules_tar/
+QT5JSBACKEND_SITE = $(QT5_SITE)
 QT5JSBACKEND_SOURCE = qtjsbackend-opensource-src-$(QT5JSBACKEND_VERSION).tar.xz
 QT5JSBACKEND_DEPENDENCIES = qt5base
 QT5JSBACKEND_INSTALL_STAGING = YES
diff --git a/package/qt5/qt5multimedia/qt5multimedia.mk b/package/qt5/qt5multimedia/qt5multimedia.mk
index 6725701..b08a9ab 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.mk
+++ b/package/qt5/qt5multimedia/qt5multimedia.mk
@@ -5,7 +5,7 @@
 #############################################################
 
 QT5MULTIMEDIA_VERSION = $(QT5_VERSION)
-QT5MULTIMEDIA_SITE = http://releases.qt-project.org/qt5/$(QT5MULTIMEDIA_VERSION)/submodules_tar/
+QT5MULTIMEDIA_SITE = $(QT5_SITE)
 QT5MULTIMEDIA_SOURCE = qtmultimedia-opensource-src-$(QT5MULTIMEDIA_VERSION).tar.xz
 QT5MULTIMEDIA_DEPENDENCIES = qt5base qt5declarative
 QT5MULTIMEDIA_INSTALL_STAGING = YES
diff --git a/package/qt5/qt5quick1/qt5quick1.mk b/package/qt5/qt5quick1/qt5quick1.mk
index 42b5895..371eb62 100644
--- a/package/qt5/qt5quick1/qt5quick1.mk
+++ b/package/qt5/qt5quick1/qt5quick1.mk
@@ -5,7 +5,7 @@
 #############################################################
 
 QT5QUICK1_VERSION = $(QT5_VERSION)
-QT5QUICK1_SITE = http://releases.qt-project.org/qt5/$(QT5QUICK1_VERSION)/submodules_tar/
+QT5QUICK1_SITE = $(QT5_SITE)
 QT5QUICK1_SOURCE = qtquick1-opensource-src-$(QT5QUICK1_VERSION).tar.xz
 QT5QUICK1_DEPENDENCIES = qt5base qt5xmlpatterns qt5script qt5declarative qt5jsbackend qt5webkit
 QT5QUICK1_INSTALL_STAGING = YES
diff --git a/package/qt5/qt5script/qt5script.mk b/package/qt5/qt5script/qt5script.mk
index ec3359f..a090fda 100644
--- a/package/qt5/qt5script/qt5script.mk
+++ b/package/qt5/qt5script/qt5script.mk
@@ -5,7 +5,7 @@
 #############################################################
 
 QT5SCRIPT_VERSION = $(QT5_VERSION)
-QT5SCRIPT_SITE = http://releases.qt-project.org/qt5/$(QT5SCRIPT_VERSION)/submodules_tar/
+QT5SCRIPT_SITE = $(QT5_SITE)
 QT5SCRIPT_SOURCE = qtscript-opensource-src-$(QT5SCRIPT_VERSION).tar.xz
 QT5SCRIPT_DEPENDENCIES = qt5base
 QT5SCRIPT_INSTALL_STAGING = YES
diff --git a/package/qt5/qt5svg/qt5svg.mk b/package/qt5/qt5svg/qt5svg.mk
index 65fb04b..fdcbfde 100644
--- a/package/qt5/qt5svg/qt5svg.mk
+++ b/package/qt5/qt5svg/qt5svg.mk
@@ -5,7 +5,7 @@
 #############################################################
 
 QT5SVG_VERSION = $(QT5_VERSION)
-QT5SVG_SITE = http://releases.qt-project.org/qt5/$(QT5SVG_VERSION)/submodules_tar/
+QT5SVG_SITE = $(QT5_SITE)
 QT5SVG_SOURCE = qtsvg-opensource-src-$(QT5SVG_VERSION).tar.xz
 QT5SVG_DEPENDENCIES = qt5base
 QT5SVG_INSTALL_STAGING = YES
diff --git a/package/qt5/qt5webkit/qt5webkit.mk b/package/qt5/qt5webkit/qt5webkit.mk
index d577cf8..7366a30 100644
--- a/package/qt5/qt5webkit/qt5webkit.mk
+++ b/package/qt5/qt5webkit/qt5webkit.mk
@@ -5,7 +5,7 @@
 #############################################################
 
 QT5WEBKIT_VERSION = $(QT5_VERSION)
-QT5WEBKIT_SITE = http://releases.qt-project.org/qt5/$(QT5WEBKIT_VERSION)/submodules_tar/
+QT5WEBKIT_SITE = $(QT5_SITE)
 QT5WEBKIT_SOURCE = qtwebkit-opensource-src-$(QT5WEBKIT_VERSION).tar.xz
 QT5WEBKIT_DEPENDENCIES = qt5base sqlite host-ruby host-gperf
 QT5WEBKIT_INSTALL_STAGING = YES
diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
index 3bd6aac..7e2d671 100644
--- a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
+++ b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
@@ -5,7 +5,7 @@
 #############################################################
 
 QT5XMLPATTERNS_VERSION = $(QT5_VERSION)
-QT5XMLPATTERNS_SITE = http://releases.qt-project.org/qt5/$(QT5XMLPATTERNS_VERSION)/submodules_tar/
+QT5XMLPATTERNS_SITE = $(QT5_SITE)
 QT5XMLPATTERNS_SOURCE = qtxmlpatterns-opensource-src-$(QT5XMLPATTERNS_VERSION).tar.xz
 QT5XMLPATTERNS_DEPENDENCIES = qt5base
 QT5XMLPATTERNS_INSTALL_STAGING = YES
-- 
1.7.9.5
