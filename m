From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Apr 2017 22:30:54 +0200
Subject: [Buildroot] [PATCH 06/29] package/qt5canvas: always use the
	opensource license
In-Reply-To: <cover.1492979449.git.yann.morin.1998@free.fr>
References: <cover.1492979449.git.yann.morin.1998@free.fr>
Message-ID: <078d2a81abf8c3c70754a61473e4494dc92b6aaf.1492979449.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We never ask the user to confirm their assent about the use of a free
license; there is no reason we do so for Qt.

The output of legal-info is there to gather all the licenses used in a
build; the license for qt5canvas will be there to be consulted as well.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Julien Corjon <corjon.j@ecagroup.com>
Cc: Peter Seiderer <ps.report@gmx.net>
---
 package/qt5/qt5canvas3d/qt5canvas3d.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/qt5/qt5canvas3d/qt5canvas3d.mk b/package/qt5/qt5canvas3d/qt5canvas3d.mk
index f49113b538..c0448cfd54 100644
--- a/package/qt5/qt5canvas3d/qt5canvas3d.mk
+++ b/package/qt5/qt5canvas3d/qt5canvas3d.mk
@@ -10,13 +10,8 @@ QT5CANVAS3D_SOURCE = qtcanvas3d-opensource-src-$(QT5CANVAS3D_VERSION).tar.xz
 QT5CANVAS3D_DEPENDENCIES = qt5base qt5declarative
 QT5CANVAS3D_INSTALL_STAGING = YES
 
-ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
 QT5CANVAS3D_LICENSE = GPL-2.0 or GPL-3.0 or LGPL-3.0
 QT5CANVAS3D_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv3
-else
-QT5CANVAS3D_LICENSE = Commercial license
-QT5CANVAS3D_REDISTRIBUTE = NO
-endif
 
 define QT5CANVAS3D_CONFIGURE_CMDS
 	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
-- 
2.11.0
