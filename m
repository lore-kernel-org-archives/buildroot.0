From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 30 Jun 2018 18:09:05 +0200
Subject: [Buildroot] [git commit] qt5base: remove unused definition
Message-ID: <20180630160551.A2D03835F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b0241095a67bc87faf19b52a2be21915b2ac44aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since commit 81fb33af2a (qt5base: correct eglfs support in
qmake.conf.in) the definition QT5BASE_CONFIGURE_QMAKE_CONFIG is left
unused.

Remove it since it is not used anymore.

Signed-off-by: Ga??l PORTAY <gael.portay@savoirfairelinux.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
