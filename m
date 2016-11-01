From: Matt Kraai <kraai@ftbfs.org>
Date: Tue,  1 Nov 2016 07:09:32 -0700
Subject: [Buildroot] [PATCH 1/2] qt5webchannel: remove
	QT5WEBCHANNEL_INSTALL_TARGET_EXAMPLES
Message-ID: <20161101140933.859-1-kraai@ftbfs.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matt Kraai <kraai@ftbfs.org>
---
 package/qt5/qt5webchannel/qt5webchannel.mk | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/qt5/qt5webchannel/qt5webchannel.mk b/package/qt5/qt5webchannel/qt5webchannel.mk
index 9e94914..316b8e0 100644
--- a/package/qt5/qt5webchannel/qt5webchannel.mk
+++ b/package/qt5/qt5webchannel/qt5webchannel.mk
@@ -46,12 +46,6 @@ define QT5WEBCHANNEL_INSTALL_TARGET_QMLS
 endef
 endif
 
-ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
-define QT5WEBCHANNEL_INSTALL_TARGET_EXAMPLES
-	cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/webchannel $(TARGET_DIR)/usr/lib/qt/examples/
-endef
-endif
-
 ifneq ($(BR2_STATIC_LIBS),y)
 define QT5WEBCHANNEL_INSTALL_TARGET_LIBS
 	cp -dpf $(STAGING_DIR)/usr/lib/libQt5WebChannel.so.* $(TARGET_DIR)/usr/lib
-- 
2.10.2
