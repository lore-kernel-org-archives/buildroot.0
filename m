From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Apr 2017 22:31:02 +0200
Subject: [Buildroot] [PATCH 14/29] package/qt5quickcontrols: always use the
	opensource license
In-Reply-To: <cover.1492979449.git.yann.morin.1998@free.fr>
References: <cover.1492979449.git.yann.morin.1998@free.fr>
Message-ID: <39f6abda2a425d8d614ec26e64bbed3fbff7b786.1492979449.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We never ask the user to confirm their assent about the use of a free
license; there is no reason we do so for Qt.

The output of legal-info is there to gather all the licenses used in a
build; the license for qt5quickcontrols will be there to be consulted
as well.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Julien Corjon <corjon.j@ecagroup.com>
Cc: Peter Seiderer <ps.report@gmx.net>
---
 package/qt5/qt5quickcontrols/qt5quickcontrols.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/qt5/qt5quickcontrols/qt5quickcontrols.mk b/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
index d28993244e..5fee6ff424 100644
--- a/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
+++ b/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
@@ -10,13 +10,8 @@ QT5QUICKCONTROLS_SOURCE = qtquickcontrols-opensource-src-$(QT5QUICKCONTROLS_VERS
 QT5QUICKCONTROLS_DEPENDENCIES = qt5base qt5declarative
 QT5QUICKCONTROLS_INSTALL_STAGING = YES
 
-ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
 QT5QUICKCONTROLS_LICENSE = GPL-2.0 or GPL-3.0 or LGPL-3.0, GFDL-1.3 (docs)
 QT5QUICKCONTROLS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv3 LICENSE.FDL
-else
-QT5QUICKCONTROLS_LICENSE = Commercial license
-QT5QUICKCONTROLS_REDISTRIBUTE = NO
-endif
 
 define QT5QUICKCONTROLS_CONFIGURE_CMDS
 	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
-- 
2.11.0
