From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 29 Aug 2018 22:37:47 +0200
Subject: [Buildroot] [git commit] qt5quickcontrols: update license file
 names for Qt 5.6 version
Message-ID: <20180829204411.8294881DE8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=83d33f76f6bb94e0a91285ae4c3f8aa072c1dd8f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Laurent Hartanerot <laurent.hartanerot@atos.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt5/qt5quickcontrols/qt5quickcontrols.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/qt5/qt5quickcontrols/qt5quickcontrols.mk b/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
index 6e551d5a27..3e0c5effb3 100644
--- a/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
+++ b/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
@@ -11,7 +11,12 @@ QT5QUICKCONTROLS_DEPENDENCIES = qt5base qt5declarative
 QT5QUICKCONTROLS_INSTALL_STAGING = YES
 
 QT5QUICKCONTROLS_LICENSE = GPL-2.0 or GPL-3.0 or LGPL-3.0, GFDL-1.3 (docs)
+
+ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5QUICKCONTROLS_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.LGPL3 LICENSE.FDL
+else
+QT5QUICKCONTROLS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv3 LICENSE.FDL
+endif
 
 define QT5QUICKCONTROLS_CONFIGURE_CMDS
 	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
