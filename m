From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Tue, 31 Jan 2017 08:59:06 +0100
Subject: [Buildroot] [PATCH v6 4/9] Conditional revert "qt5base: install
	bundled fonts to target"
In-Reply-To: <1485849551-20469-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
References: <1485849551-20469-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
Message-ID: <1485849551-20469-5-git-send-email-mr.zoltan.gyarmati@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Julien Corjon <corjon.j@ecagroup.com>

qtbase carries nor more fonts since c5ceabb9a1caf6b9b7615a28c3097f221772f645

So for Qt Version 5.8.0 this reverts commit cdfa21b06041eb601e0bea79f2c8f50e9d637384
and part of 186ef9f6f4647ed34b67a3427a5e0e249f0794e7

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
---
 package/qt5/qt5base/qt5base.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index c09bf58..0a70dc8 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -260,12 +260,14 @@ define QT5BASE_INSTALL_TARGET_PLUGINS
 	fi
 endef
 
+ifeq ($(BR2_QT5_VERSION_5_6),y)
 define QT5BASE_INSTALL_TARGET_FONTS
 	if [ -d $(STAGING_DIR)/usr/lib/fonts/ ] ; then \
 		mkdir -p $(TARGET_DIR)/usr/lib/fonts ; \
 		cp -dpfr $(STAGING_DIR)/usr/lib/fonts/* $(TARGET_DIR)/usr/lib/fonts ; \
 	fi
 endef
+endif
 
 define QT5BASE_INSTALL_TARGET_EXAMPLES
 	if [ -d $(STAGING_DIR)/usr/lib/qt/examples/ ] ; then \
-- 
2.7.4
