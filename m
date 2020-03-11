From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 11 Mar 2020 23:03:42 +0100
Subject: [Buildroot] [git commit] package/qt-webkit-kiosk: convert to qmake
 infrastructure
Message-ID: <20200311215109.D99AE90A0A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8440ef6ad20f591f52f261b24537c0a4862e7609
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Convert but keep the slightly complicated custom install step for now.

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt-webkit-kiosk/qt-webkit-kiosk.mk | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/package/qt-webkit-kiosk/qt-webkit-kiosk.mk b/package/qt-webkit-kiosk/qt-webkit-kiosk.mk
index a714fca9c9..cd1c21e28a 100644
--- a/package/qt-webkit-kiosk/qt-webkit-kiosk.mk
+++ b/package/qt-webkit-kiosk/qt-webkit-kiosk.mk
@@ -11,13 +11,7 @@ QT_WEBKIT_KIOSK_DEPENDENCIES = qt5webkit qt5multimedia
 QT_WEBKIT_KIOSK_LICENSE = LGPL-3.0
 QT_WEBKIT_KIOSK_LICENSE_FILES = doc/lgpl.html
 
-define QT_WEBKIT_KIOSK_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE) PREFIX=/usr)
-endef
-
-define QT_WEBKIT_KIOSK_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
-endef
+QT_WEBKIT_KIOSK_CONF_OPTS = PREFIX=/usr
 
 define QT_WEBKIT_KIOSK_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src -f Makefile.qt-webkit-kiosk \
@@ -29,4 +23,4 @@ define QT_WEBKIT_KIOSK_INSTALL_TARGET_CMDS
 		$(if $(BR2_PACKAGE_QT_WEBKIT_KIOSK_SOUNDS),install_sound)
 endef
 
-$(eval $(generic-package))
+$(eval $(qmake-package))
