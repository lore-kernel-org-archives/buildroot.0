From: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Tue,  8 Oct 2019 11:03:13 +0200
Subject: [Buildroot] [PATCH] package/qt5/qt5webview: install missing plugins
Message-ID: <20191008090313.27361-1-b.bilas@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
  No WebView plug-in found!

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
---
 package/qt5/qt5webview/qt5webview.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qt5/qt5webview/qt5webview.mk b/package/qt5/qt5webview/qt5webview.mk
index 100fcd7b1b..d9b913d68e 100644
--- a/package/qt5/qt5webview/qt5webview.mk
+++ b/package/qt5/qt5webview/qt5webview.mk
@@ -43,6 +43,7 @@ endif
 ifneq ($(BR2_STATIC_LIBS),y)
 define QT5WEBVIEW_INSTALL_TARGET_LIBS
 	cp -dpf $(STAGING_DIR)/usr/lib/libQt5WebView.so.* $(TARGET_DIR)/usr/lib
+	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/webview $(TARGET_DIR)/usr/lib/qt/plugins
 endef
 endif
 
-- 
2.11.0
