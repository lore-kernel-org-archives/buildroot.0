From: Andreas Naumann <anaumann@ultratronik.de>
Date: Fri, 21 Jun 2013 11:02:00 +0200
Subject: [Buildroot] [PATCH] qt5/qt5quick1: Drop qmlviewer from install
	since its no longer provided.
Message-ID: <1371805320-25495-1-git-send-email-anaumann@ultratronik.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
---
As Charles Krinke found out earlier, it seems like qmlviewer was dropped in qt5. Or is there anything I'm missing?
 package/qt5/qt5quick1/qt5quick1.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/qt5/qt5quick1/qt5quick1.mk b/package/qt5/qt5quick1/qt5quick1.mk
index 0b7f9ea..cd804d6 100644
--- a/package/qt5/qt5quick1/qt5quick1.mk
+++ b/package/qt5/qt5quick1/qt5quick1.mk
@@ -38,7 +38,6 @@ define QT5QUICK1_INSTALL_TARGET_CMDS
 	cp -dpf $(STAGING_DIR)/usr/lib/libQt5Declarative.so.* $(TARGET_DIR)/usr/lib
 	cp -dpf $(STAGING_DIR)/usr/lib/qt/plugins/qmltooling/libqmldbg_inspector.so $(TARGET_DIR)/usr/lib/qt/plugins/qmltooling/
 	cp -dpf $(STAGING_DIR)/usr/lib/qt/plugins/qmltooling/libqmldbg_tcp_qtdeclarative.so $(TARGET_DIR)/usr/lib/qt/plugins/qmltooling/
-	cp -dpf $(STAGING_DIR)/usr/bin/qmlviewer $(TARGET_DIR)/usr/bin
 	cp -dpfr $(STAGING_DIR)/usr/imports $(TARGET_DIR)/usr
 endef
 
-- 
1.8.2.3
