From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Apr 2017 22:31:05 +0200
Subject: [Buildroot] [PATCH 17/29] package/qt5sensors: always use the
	opensource license
In-Reply-To: <cover.1492979449.git.yann.morin.1998@free.fr>
References: <cover.1492979449.git.yann.morin.1998@free.fr>
Message-ID: <bfadaac3d1e5b228056c1adaea4ced4249da8ca4.1492979449.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We never ask the user to confirm their assent about the use of a free
license; there is no reason we do so for Qt.

The output of legal-info is there to gather all the licenses used in a
build; the license for qt5sensors will be there to be consulted as well.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Julien Corjon <corjon.j@ecagroup.com>
Cc: Peter Seiderer <ps.report@gmx.net>
---
 package/qt5/qt5sensors/qt5sensors.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/qt5/qt5sensors/qt5sensors.mk b/package/qt5/qt5sensors/qt5sensors.mk
index f73ae5b8d0..079f056da7 100644
--- a/package/qt5/qt5sensors/qt5sensors.mk
+++ b/package/qt5/qt5sensors/qt5sensors.mk
@@ -10,7 +10,6 @@ QT5SENSORS_SOURCE = qtsensors-opensource-src-$(QT5SENSORS_VERSION).tar.xz
 QT5SENSORS_DEPENDENCIES = qt5base
 QT5SENSORS_INSTALL_STAGING = YES
 
-ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5SENSORS_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3 (docs)
 QT5SENSORS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
@@ -18,10 +17,6 @@ else
 QT5SENSORS_LICENSE = GPL-2.0 or GPL-3.0 or LGPL-2.1 with exception or LGPL-3.0, GFDL-1.3 (docs)
 QT5SENSORS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
 endif
-else
-QT5SENSORS_LICENSE = Commercial license
-QT5SENSORS_REDISTRIBUTE = NO
-endif
 
 ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
 QT5SENSORS_DEPENDENCIES += qt5declarative
-- 
2.11.0
