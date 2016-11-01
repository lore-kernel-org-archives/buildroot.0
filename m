From: Matt Kraai <kraai@ftbfs.org>
Date: Tue,  1 Nov 2016 07:09:33 -0700
Subject: [Buildroot] [PATCH 2/2] qt5websockets: remove
	QT5WEBSOCKETS_INSTALL_TARGET_EXAMPLES
In-Reply-To: <20161101140933.859-1-kraai@ftbfs.org>
References: <20161101140933.859-1-kraai@ftbfs.org>
Message-ID: <20161101140933.859-2-kraai@ftbfs.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matt Kraai <kraai@ftbfs.org>
---
 package/qt5/qt5websockets/qt5websockets.mk | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/qt5/qt5websockets/qt5websockets.mk b/package/qt5/qt5websockets/qt5websockets.mk
index f1200c2..9e4c850 100644
--- a/package/qt5/qt5websockets/qt5websockets.mk
+++ b/package/qt5/qt5websockets/qt5websockets.mk
@@ -41,12 +41,6 @@ define QT5WEBSOCKETS_INSTALL_TARGET_QMLS
 endef
 endif
 
-ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
-define QT5WEBSOCKETS_INSTALL_TARGET_EXAMPLES
-	cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/websockets $(TARGET_DIR)/usr/lib/qt/examples/
-endef
-endif
-
 ifneq ($(BR2_STATIC_LIBS),y)
 define QT5WEBSOCKETS_INSTALL_TARGET_LIBS
 	cp -dpf $(STAGING_DIR)/usr/lib/libQt5WebSockets.so.* $(TARGET_DIR)/usr/lib
-- 
2.10.2
