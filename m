From: Andreas Naumann <anaumann@ultratronik.de>
Date: Tue, 13 Dec 2016 15:59:29 +0100
Subject: [Buildroot] [PATCH v3 5/7] Revert "qt5base: install bundled fonts
	to target"
In-Reply-To: <1481641171-10407-1-git-send-email-anaumann@ultratronik.de>
References: <1481641171-10407-1-git-send-email-anaumann@ultratronik.de>
Message-ID: <1481641171-10407-6-git-send-email-anaumann@ultratronik.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Julien Corjon <corjon.j@ecagroup.com>

qtbase carries nor more fonts since c5ceabb9a1caf6b9b7615a28c3097f221772f645

This reverts commit cdfa21b06041eb601e0bea79f2c8f50e9d637384.

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
---
 package/qt5/qt5base/qt5base.mk | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 79ad868..fffadad 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -230,14 +230,6 @@ define QT5BASE_INSTALL_TARGET_PLUGINS
 	done
 endef
 
-define QT5BASE_INSTALL_TARGET_FONTS
-	if [ -d $(STAGING_DIR)/usr/lib/fonts/ ] ; then \
-		mkdir -p $(TARGET_DIR)/usr/lib/fonts ; \
-		cp -dpfr $(STAGING_DIR)/usr/lib/fonts/* $(TARGET_DIR)/usr/lib/fonts ; \
-	fi
-endef
-
-
 define QT5BASE_INSTALL_TARGET_EXAMPLES
 	example_dirs=$$(cd $(@D)/examples; find . -mindepth 1 -maxdepth 1 -type d); \
 	for example in $${example_dirs}; do \
-- 
1.9.1
