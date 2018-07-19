From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Jul 2018 11:55:48 +0200
Subject: [Buildroot] [git commit branch/2018.05.x] qt5base: remove unused
 definition
Message-ID: <20180719095142.2BB4588E3B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b318bbab6060b4344fdba861da4af87a54491cbe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.05.x

Since commit 81fb33af2a (qt5base: correct eglfs support in
qmake.conf.in) the definition QT5BASE_CONFIGURE_QMAKE_CONFIG is left
unused.

Remove it since it is not used anymore.

Signed-off-by: Ga??l PORTAY <gael.portay@savoirfairelinux.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b0241095a67bc87faf19b52a2be21915b2ac44aa)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5base/qt5base.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 1eabd7a15b..93adb03d80 100644
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
