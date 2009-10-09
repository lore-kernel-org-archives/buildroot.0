From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 9 Oct 2009 14:58:32 +0200
Subject: [Buildroot] [git commit master] qt: don't enable internal
	tslib-module debugging
Message-ID: <20091009130115.75F0877784@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=51a3b74b6eee42e335b963b4f3ddbdaa9c6459b0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In Qt there are virtually hundreds of internal debug flags like
TSLIBMOUSEHANDLER_DEBUG for every module or even C++ class. There
is no reason to enable a single such flag when Qt is build with
debugging symbols and others not.

Signed-off-by: Michael Roth <mroth@nessie.de>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/qt/qt.mk |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index e7c22c3..6c73e04 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -153,8 +153,6 @@ endif
 ifeq ($(BR2_PACKAGE_QT_MOUSE_TSLIB),y)
 QT_CONFIGURE += -qt-mouse-tslib
 QT_DEP_LIBS+=tslib
-QT_TSLIB_DEB="-D TSLIBMOUSEHANDLER_DEBUG"
-QT_TSLIB_DEB:=$(call qstrip,$(QT_TSLIB_DEB))
 else
 QT_CONFIGURE += -no-mouse-tslib
 endif
@@ -165,7 +163,7 @@ QT_CONFIGURE += -no-mouse-qvfb
 endif
 
 ifeq ($(BR2_PACKAGE_QT_DEBUG),y)
-QT_CONFIGURE+= "-debug $(QT_TSLIB_DEB)"
+QT_CONFIGURE+= -debug
 else
 QT_CONFIGURE+= -release
 endif
-- 
1.6.3.3
