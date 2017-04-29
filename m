From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Apr 2017 15:53:32 +0200
Subject: [Buildroot] [git commit] package/qt5location: always use the
	opensource license
Message-ID: <20170429135923.6749C82629@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6e070e79afff1535a3fe552605e4baaccebaf7ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We never ask the user to confirm their assent about the use of a free
license; there is no reason we do so for Qt.

The output of legal-info is there to gather all the licenses used in a
build; the license for qt5location will be there to be consulted as well.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Julien Corjon <corjon.j@ecagroup.com>
Cc: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/qt5location/qt5location.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/qt5/qt5location/qt5location.mk b/package/qt5/qt5location/qt5location.mk
index 96263e8..b31bee7 100644
--- a/package/qt5/qt5location/qt5location.mk
+++ b/package/qt5/qt5location/qt5location.mk
@@ -10,7 +10,6 @@ QT5LOCATION_SOURCE = qtlocation-opensource-src-$(QT5LOCATION_VERSION).tar.xz
 QT5LOCATION_DEPENDENCIES = qt5base
 QT5LOCATION_INSTALL_STAGING = YES
 
-ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5LOCATION_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3 (docs)
 QT5LOCATION_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
@@ -18,10 +17,6 @@ else
 QT5LOCATION_LICENSE = GPL-2.0 or GPL-3.0 or LGPL-2.1 with exception or LGPL-3.0, GFDL-1.3 (docs)
 QT5LOCATION_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
 endif
-else
-QT5LOCATION_LICENSE = Commercial license
-QT5LOCATION_REDISTRIBUTE = NO
-endif
 
 ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
 QT5LOCATION_DEPENDENCIES += qt5declarative
