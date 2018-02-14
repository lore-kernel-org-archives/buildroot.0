From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 14 Feb 2018 21:24:10 +0100
Subject: [Buildroot] [git commit] qt5: fetch sources using https URLs
Message-ID: <20180214202447.5EDB188781@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=298b8a38dd752c12437611c92e722400de93bf9c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Ga??l PORTAY <gael.portay@savoirfairelinux.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt5/qt5.mk                                   | 2 +-
 package/qt5/qt5webkit-examples/qt5webkit-examples.mk | 4 ++--
 package/qt5/qt5webkit/qt5webkit.mk                   | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/qt5/qt5.mk b/package/qt5/qt5.mk
index 7a6e1d7cfe..f2d60add41 100644
--- a/package/qt5/qt5.mk
+++ b/package/qt5/qt5.mk
@@ -11,7 +11,7 @@ else
 QT5_VERSION_MAJOR = 5.6
 QT5_VERSION = $(QT5_VERSION_MAJOR).3
 endif
-QT5_SITE = http://download.qt.io/official_releases/qt/$(QT5_VERSION_MAJOR)/$(QT5_VERSION)/submodules
+QT5_SITE = https://download.qt.io/official_releases/qt/$(QT5_VERSION_MAJOR)/$(QT5_VERSION)/submodules
 
 include $(sort $(wildcard package/qt5/*/*.mk))
 
diff --git a/package/qt5/qt5webkit-examples/qt5webkit-examples.mk b/package/qt5/qt5webkit-examples/qt5webkit-examples.mk
index f81e994dc5..4c01d8318a 100644
--- a/package/qt5/qt5webkit-examples/qt5webkit-examples.mk
+++ b/package/qt5/qt5webkit-examples/qt5webkit-examples.mk
@@ -7,10 +7,10 @@
 # no 5.9.2 package available, fall back to 5.9.1 version
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5WEBKIT_EXAMPLES_VERSION = 5.9.1
-QT5WEBKIT_EXAMPLES_SITE = http://download.qt.io/official_releases/qt/5.9/5.9.1/submodules
+QT5WEBKIT_EXAMPLES_SITE = https://download.qt.io/official_releases/qt/5.9/5.9.1/submodules
 else
 QT5WEBKIT_EXAMPLES_VERSION = $(QT5_VERSION)
-QT5WEBKIT_EXAMPLES_SITE = http://download.qt.io/community_releases/5.6/$(QT5_VERSION)
+QT5WEBKIT_EXAMPLES_SITE = https://download.qt.io/community_releases/5.6/$(QT5_VERSION)
 endif
 
 QT5WEBKIT_EXAMPLES_SOURCE = qtwebkit-examples-opensource-src-$(QT5WEBKIT_VERSION).tar.xz
diff --git a/package/qt5/qt5webkit/qt5webkit.mk b/package/qt5/qt5webkit/qt5webkit.mk
index 7925b114e6..e8d368fb01 100644
--- a/package/qt5/qt5webkit/qt5webkit.mk
+++ b/package/qt5/qt5webkit/qt5webkit.mk
@@ -7,10 +7,10 @@
 # no 5.9.2 package available, fall back to 5.9.1 version
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5WEBKIT_VERSION = 5.9.1
-QT5WEBKIT_SITE = http://download.qt.io/official_releases/qt/5.9/5.9.1/submodules
+QT5WEBKIT_SITE = https://download.qt.io/official_releases/qt/5.9/5.9.1/submodules
 else
 QT5WEBKIT_VERSION = $(QT5_VERSION)
-QT5WEBKIT_SITE = http://download.qt.io/community_releases/5.6/$(QT5_VERSION)
+QT5WEBKIT_SITE = https://download.qt.io/community_releases/5.6/$(QT5_VERSION)
 endif
 
 QT5WEBKIT_SOURCE = qtwebkit-opensource-src-$(QT5WEBKIT_VERSION).tar.xz
