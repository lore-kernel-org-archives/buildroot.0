From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Apr 2017 15:53:40 +0200
Subject: [Buildroot] [git commit] package/qt5serialbus: always use the
	opensource license
Message-ID: <20170429135923.A44A88047C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=768c62a1d9cd144f2424f665da8ff5c29bae0d18
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We never ask the user to confirm their assent about the use of a free
license; there is no reason we do so for Qt.

The output of legal-info is there to gather all the licenses used in a
build; the license for qt5serialbus will be there to be consulted as
well.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Julien Corjon <corjon.j@ecagroup.com>
Cc: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/qt5serialbus/qt5serialbus.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/qt5/qt5serialbus/qt5serialbus.mk b/package/qt5/qt5serialbus/qt5serialbus.mk
index 05ca181..24fe8b1 100644
--- a/package/qt5/qt5serialbus/qt5serialbus.mk
+++ b/package/qt5/qt5serialbus/qt5serialbus.mk
@@ -10,13 +10,8 @@ QT5SERIALBUS_SOURCE = qtserialbus-opensource-src-$(QT5SERIALBUS_VERSION).tar.xz
 QT5SERIALBUS_DEPENDENCIES = qt5base qt5serialport
 QT5SERIALBUS_INSTALL_STAGING = YES
 
-ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
 QT5SERIALBUS_LICENSE = GPL-2.0 or GPL-3.0 or LGPL-3.0, GFDL-1.3 (docs)
 QT5SERIALBUS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv3 LICENSE.FDL
-else
-QT5SERIALBUS_LICENSE = Commercial license
-QT5SERIALBUS_REDISTRIBUTE = NO
-endif
 
 define QT5SERIALBUS_CONFIGURE_CMDS
 	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
