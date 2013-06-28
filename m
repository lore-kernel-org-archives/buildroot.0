From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 28 Jun 2013 11:15:40 +0200
Subject: [Buildroot] [git commit] qt5quick1: doesn't require qt5webkit
Message-ID: <20130628092437.E1EEB9AF77@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4e365f02f37bcb7ed8eeb320c574ab146e0402c7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/qt5/qt5quick1/Config.in    |    1 -
 package/qt5/qt5quick1/qt5quick1.mk |    2 +-
 2 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/package/qt5/qt5quick1/Config.in b/package/qt5/qt5quick1/Config.in
index dc3f621..9cb97a6 100644
--- a/package/qt5/qt5quick1/Config.in
+++ b/package/qt5/qt5quick1/Config.in
@@ -7,7 +7,6 @@ config BR2_PACKAGE_QT5QUICK1
 	select BR2_PACKAGE_QT5XMLPATTERNS
 	select BR2_PACKAGE_QT5DECLARATIVE
 	select BR2_PACKAGE_QT5JSBACKEND
-	select BR2_PACKAGE_QT5WEBKIT
 	# This module does not support static linking
 	depends on !BR2_PREFER_STATIC_LIB
 	depends on BR2_PACKAGE_HAS_OPENGL_EGL
diff --git a/package/qt5/qt5quick1/qt5quick1.mk b/package/qt5/qt5quick1/qt5quick1.mk
index 0b7f9ea..8d11e67 100644
--- a/package/qt5/qt5quick1/qt5quick1.mk
+++ b/package/qt5/qt5quick1/qt5quick1.mk
@@ -7,7 +7,7 @@
 QT5QUICK1_VERSION = $(QT5_VERSION)
 QT5QUICK1_SITE = $(QT5_SITE)
 QT5QUICK1_SOURCE = qtquick1-opensource-src-$(QT5QUICK1_VERSION).tar.xz
-QT5QUICK1_DEPENDENCIES = qt5base qt5xmlpatterns qt5script qt5declarative qt5jsbackend qt5webkit
+QT5QUICK1_DEPENDENCIES = qt5base qt5xmlpatterns qt5script qt5declarative qt5jsbackend
 QT5QUICK1_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
