From: Andreas Naumann <anaumann@ultratronik.de>
Date: Thu, 22 Dec 2016 15:21:10 +0100
Subject: [Buildroot] [PATCH v4 04/10] Revert "qt5base: install bundled fonts
	to target"
In-Reply-To: <1482416476-20306-1-git-send-email-anaumann@ultratronik.de>
References: <1482416476-20306-1-git-send-email-anaumann@ultratronik.de>
Message-ID: <1482416476-20306-5-git-send-email-anaumann@ultratronik.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Julien Corjon <corjon.j@ecagroup.com>

qtbase carries nor more fonts since c5ceabb9a1caf6b9b7615a28c3097f221772f645

This reverts commit cdfa21b06041eb601e0bea79f2c8f50e9d637384
and part of 186ef9f6f4647ed34b67a3427a5e0e249f0794e7

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
---
 package/qt5/qt5base/qt5base.mk | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index a44fbe3..6bca17c 100644
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
@@ -250,14 +242,12 @@ endef
 
 ifeq ($(BR2_STATIC_LIBS),y)
 define QT5BASE_INSTALL_TARGET_CMDS
-	$(QT5BASE_INSTALL_TARGET_FONTS)
 	$(QT5BASE_INSTALL_TARGET_EXAMPLES)
 endef
 else
 define QT5BASE_INSTALL_TARGET_CMDS
 	$(QT5BASE_INSTALL_TARGET_LIBS)
 	$(QT5BASE_INSTALL_TARGET_PLUGINS)
-	$(QT5BASE_INSTALL_TARGET_FONTS)
 	$(QT5BASE_INSTALL_TARGET_EXAMPLES)
 endef
 endif
-- 
1.9.1
