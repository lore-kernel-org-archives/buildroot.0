From: Andreas Naumann <anaumann@ultratronik.de>
Date: Tue,  8 Nov 2016 11:30:46 +0100
Subject: [Buildroot] [PATCH 3/5] qt5webkit: bump to 5.8.0-beta
In-Reply-To: <1478601048-21388-1-git-send-email-anaumann@ultratronik.de>
References: <1478601048-21388-1-git-send-email-anaumann@ultratronik.de>
Message-ID: <1478601048-21388-4-git-send-email-anaumann@ultratronik.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Using the 5.8.0-beta version qmake fails because private_tests are not available.
Running qmake a second time makes it compile.

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
---
 package/qt5/qt5webkit/qt5webkit.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/qt5/qt5webkit/qt5webkit.mk b/package/qt5/qt5webkit/qt5webkit.mk
index 378cdf7..2489e32 100644
--- a/package/qt5/qt5webkit/qt5webkit.mk
+++ b/package/qt5/qt5webkit/qt5webkit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5WEBKIT_VERSION = b35917bcb44d7f200af0f4ac68a126fa0aa8d93d
+QT5WEBKIT_VERSION = 431520f1508e92272171c214b087183e71d08ec5
 # Using GitHub since it supports downloading tarballs from random commits.
 # The http://code.qt.io/cgit/qt/qtwebkit.git/ repo doesn't allow to do so.
 QT5WEBKIT_SITE = $(call github,qtproject,qtwebkit,$(QT5WEBKIT_VERSION))
@@ -52,6 +52,7 @@ QT5WEBKIT_PRE_CONFIGURE_HOOKS += QT5WEBKIT_PYTHON2_SYMLINK
 define QT5WEBKIT_CONFIGURE_CMDS
 	mkdir -p $(@D)/.git
 	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5WEBKIT_ENV) $(HOST_DIR)/usr/bin/qmake)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5WEBKIT_ENV) $(HOST_DIR)/usr/bin/qmake)
 endef
 
 define QT5WEBKIT_BUILD_CMDS
-- 
1.9.1
