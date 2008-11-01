From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Sat, 1 Nov 2008 19:54:34 +0100
Subject: [Buildroot] [PATCH 1/4] qtopia4: fix wrong configure options
Message-ID: <200811011954.34239.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/qtopia4/qtopia4.mk |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/qtopia4/qtopia4.mk b/package/qtopia4/qtopia4.mk
index cadaaa6..c8be7c7 100644
--- a/package/qtopia4/qtopia4.mk
+++ b/package/qtopia4/qtopia4.mk
@@ -95,32 +95,32 @@ endif
 
 ### Mouse drivers
 ifeq ($(BR2_PACKAGE_QTOPIA4_MOUSE_PC),y)
-QTOPIA4_CONFIGURE += qt-mouse-pc
+QTOPIA4_CONFIGURE += -qt-mouse-pc
 else
 QTOPIA4_CONFIGURE += -no-mouse-pc
 endif
 ifeq ($(BR2_PACKAGE_QTOPIA4_MOUSE_BUS),y)
-QTOPIA4_CONFIGURE += qt-mouse-bus
+QTOPIA4_CONFIGURE += -qt-mouse-bus
 else
 QTOPIA4_CONFIGURE += -no-mouse-bus
 endif
 ifeq ($(BR2_PACKAGE_QTOPIA4_MOUSE_LINUXTP),y)
-QTOPIA4_CONFIGURE += qt-mouse-linuxtp
+QTOPIA4_CONFIGURE += -qt-mouse-linuxtp
 else
 QTOPIA4_CONFIGURE += -no-mouse-linuxtp
 endif
 ifeq ($(BR2_PACKAGE_QTOPIA4_MOUSE_YOPY),y)
-QTOPIA4_CONFIGURE += qt-mouse-yopy
+QTOPIA4_CONFIGURE += -qt-mouse-yopy
 else
 QTOPIA4_CONFIGURE += -no-mouse-yopy
 endif
 ifeq ($(BR2_PACKAGE_QTOPIA4_MOUSE_VR41XX),y)
-QTOPIA4_CONFIGURE += qt-mouse-vr41xx
+QTOPIA4_CONFIGURE += -qt-mouse-vr41xx
 else
 QTOPIA4_CONFIGURE += -no-mouse-vr41xx
 endif
 ifeq ($(BR2_PACKAGE_QTOPIA4_MOUSE_TSLIB),y)
-QTOPIA4_CONFIGURE += qt-mouse-tslib
+QTOPIA4_CONFIGURE += -qt-mouse-tslib
 QTOPIA4_DEP_LIBS+=tslib
 QTOPIA4_TSLIB_DEB="-D TSLIBMOUSEHANDLER_DEBUG"
 QTOPIA4_TSLIB_DEB:=$(strip $(subst ",, $(QTOPIA4_TSLIB_DEB)))
-- 
1.6.0.3.536.gb5136
