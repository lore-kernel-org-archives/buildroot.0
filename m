From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Sat, 1 Nov 2008 19:55:02 +0100
Subject: [Buildroot] [PATCH 2/4] qtopia4: add mouse-qvfb to configure options
Message-ID: <200811011955.02586.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/qtopia4/qtopia4.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/qtopia4/qtopia4.mk b/package/qtopia4/qtopia4.mk
index c8be7c7..8b0415f 100644
--- a/package/qtopia4/qtopia4.mk
+++ b/package/qtopia4/qtopia4.mk
@@ -128,6 +128,11 @@ QTOPIA4_TSLIB_DEB:=$(strip $(subst ",, $(QTOPIA4_TSLIB_DEB)))
 else
 QTOPIA4_CONFIGURE += -no-mouse-tslib
 endif
+ifeq ($(BR2_PACKAGE_QTOPIA4_MOUSE_QVFB),y)
+QTOPIA4_CONFIGURE += -qt-mouse-qvfb
+else
+QTOPIA4_CONFIGURE += -no-mouse-qvfb
+endif
 
 ifeq ($(BR2_PACKAGE_QTOPIA4_DEBUG),y)
 QTOPIA4_CONFIGURE+= "-debug $(QTOPIA4_TSLIB_DEB)"
-- 
1.6.0.3.536.gb5136
