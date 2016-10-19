From: johanderycke at gmail.com <johanderycke@gmail.com>
Date: Wed, 19 Oct 2016 13:49:06 +0200
Subject: [Buildroot] [PATCH V2, 1/1] Fix: qt5webkit overwrites target python.
Message-ID: <1476877746-13572-1-git-send-email-johanderycke@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Johan Derycke <johan.derycke@barco.com>

Signed-off-by: Johan Derycke <johan.derycke@barco.com>
---
Changes v1 -> v2:
- simpler fix suggested by Thomas

 package/qt5/qt5webkit/qt5webkit.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/qt5/qt5webkit/qt5webkit.mk b/package/qt5/qt5webkit/qt5webkit.mk
index f300c11..378cdf7 100644
--- a/package/qt5/qt5webkit/qt5webkit.mk
+++ b/package/qt5/qt5webkit/qt5webkit.mk
@@ -36,10 +36,10 @@ endif
 # QtWebkit's build system uses python, but only supports python2. We work
 # around this by forcing python2 early in the PATH, via a python->python2
 # symlink.
-QT5WEBKIT_ENV = PATH=$(@D)/bin:$(BR_PATH)
+QT5WEBKIT_ENV = PATH=$(@D)/host-bin:$(BR_PATH)
 define QT5WEBKIT_PYTHON2_SYMLINK
-	mkdir -p $(@D)/bin
-	ln -sf $(HOST_DIR)/usr/bin/python2 $(@D)/bin/python
+	mkdir -p $(@D)/host-bin
+	ln -sf $(HOST_DIR)/usr/bin/python2 $(@D)/host-bin/python
 endef
 QT5WEBKIT_PRE_CONFIGURE_HOOKS += QT5WEBKIT_PYTHON2_SYMLINK
 
-- 
2.1.4
