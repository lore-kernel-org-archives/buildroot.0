From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
Date: Sat, 30 Jun 2018 08:57:13 -0400
Subject: [Buildroot] [PATCH] qt5base: remove unused definition
Message-ID: <20180630125713.4302-1-gael.portay@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since commit 81fb33af2a (qt5base: correct eglfs support in
qmake.conf.in) the definition QT5BASE_CONFIGURE_QMAKE_CONFIG is left
unused.

Remove it since it is not used anymore.

Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
---
 package/qt5/qt5base/qt5base.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index d5b25abcb8..9eafd593f1 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -269,7 +269,6 @@ define QT5BASE_CONFIGURE_CMDS
 	sed 's/@EGLFS_DEVICE@/$(QT5BASE_EGLFS_DEVICE)/g' \
 		$(QT5BASE_PKGDIR)/qmake.conf.in > \
 		$(@D)/mkspecs/devices/linux-buildroot-g++/qmake.conf
-	$(QT5BASE_CONFIGURE_QMAKE_CONFIG)
 	$(INSTALL) -m 0644 -D $(QT5BASE_PKGDIR)/qplatformdefs.h \
 		$(@D)/mkspecs/devices/linux-buildroot-g++/qplatformdefs.h
 	$(QT5BASE_CONFIGURE_CONFIG_FILE)
-- 
2.17.1
