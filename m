From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 8 Oct 2019 23:17:43 +0200
Subject: [Buildroot] [git commit] package/qt5/qt5webview: install missing
 plugins
Message-ID: <20191008211202.916A98B866@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8f04948193e35089bb46dae678e0fdf6aa11aea8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
  No WebView plug-in found!

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
 
