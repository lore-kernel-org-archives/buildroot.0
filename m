From: Andreas Naumann <anaumann@ultratronik.de>
Date: Mon, 17 Feb 2020 22:23:37 +0100
Subject: [Buildroot] [PATCH v6 15/28] package/qt-webkit-kiosk: Convert to
 qmake infra
In-Reply-To: <20200217212350.29750-1-anaumann@ultratronik.de>
References: <20200217212350.29750-1-anaumann@ultratronik.de>
Message-ID: <20200217212350.29750-16-anaumann@ultratronik.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Convert but keep the slightly complicated custom install step for now.

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
---
 package/qt-webkit-kiosk/qt-webkit-kiosk.mk | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/package/qt-webkit-kiosk/qt-webkit-kiosk.mk b/package/qt-webkit-kiosk/qt-webkit-kiosk.mk
index a714fca9c9..22cbf3cb87 100644
--- a/package/qt-webkit-kiosk/qt-webkit-kiosk.mk
+++ b/package/qt-webkit-kiosk/qt-webkit-kiosk.mk
@@ -11,13 +11,8 @@ QT_WEBKIT_KIOSK_DEPENDENCIES = qt5webkit qt5multimedia
 QT_WEBKIT_KIOSK_LICENSE = LGPL-3.0
 QT_WEBKIT_KIOSK_LICENSE_FILES = doc/lgpl.html
 
-define QT_WEBKIT_KIOSK_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE) PREFIX=/usr)
-endef
-
-define QT_WEBKIT_KIOSK_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
-endef
+QT_WEBKIT_KIOSK_INSTALL_STAGING = NO
+QT_WEBKIT_KIOSK_CONF_OPTS = PREFIX=/usr
 
 define QT_WEBKIT_KIOSK_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src -f Makefile.qt-webkit-kiosk \
@@ -29,4 +24,4 @@ define QT_WEBKIT_KIOSK_INSTALL_TARGET_CMDS
 		$(if $(BR2_PACKAGE_QT_WEBKIT_KIOSK_SOUNDS),install_sound)
 endef
 
-$(eval $(generic-package))
+$(eval $(qmake-package))
-- 
2.25.0
