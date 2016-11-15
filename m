From: Julien Corjon <corjon.j@ecagroup.com>
Date: Tue, 15 Nov 2016 18:13:05 +0100
Subject: [Buildroot] [PATCH v2 5/7] Revert "qt5base: install bundled fonts
	to target"
In-Reply-To: <20161115171307.7499-1-corjon.j@ecagroup.com>
References: <20161115171307.7499-1-corjon.j@ecagroup.com>
Message-ID: <20161115171307.7499-6-corjon.j@ecagroup.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

qtbase carries nor more fonts since c5ceabb9a1caf6b9b7615a28c3097f221772f645

This reverts commit cdfa21b06041eb601e0bea79f2c8f50e9d637384.

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
---
 package/qt5/qt5base/qt5base.mk | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index f4ca921..e49718e 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -234,13 +234,6 @@ define QT5BASE_INSTALL_TARGET_PLUGINS
 	fi
 endef
 
-define QT5BASE_INSTALL_TARGET_FONTS
-	if [ -d $(STAGING_DIR)/usr/lib/fonts/ ] ; then \
-		mkdir -p $(TARGET_DIR)/usr/lib/fonts ; \
-		cp -dpfr $(STAGING_DIR)/usr/lib/fonts/* $(TARGET_DIR)/usr/lib/fonts ; \
-	fi
-endef
-
 define QT5BASE_INSTALL_TARGET_EXAMPLES
 	if [ -d $(STAGING_DIR)/usr/lib/qt/examples/ ] ; then \
 		mkdir -p $(TARGET_DIR)/usr/lib/qt/examples ; \
-- 
2.9.3
