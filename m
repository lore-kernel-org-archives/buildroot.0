From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Apr 2017 22:31:04 +0200
Subject: [Buildroot] [PATCH 16/29] package/qt5script: always use the
	opensource license
In-Reply-To: <cover.1492979449.git.yann.morin.1998@free.fr>
References: <cover.1492979449.git.yann.morin.1998@free.fr>
Message-ID: <8982120823509f14da546eb5b75c5ee63170e34c.1492979449.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We never ask the user to confirm their assent about the use of a free
license; there is no reason we do so for Qt.

The output of legal-info is there to gather all the licenses used in a
build; the license for qt5script will be there to be consulted as well.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Julien Corjon <corjon.j@ecagroup.com>
Cc: Peter Seiderer <ps.report@gmx.net>
---
 package/qt5/qt5script/qt5script.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/qt5/qt5script/qt5script.mk b/package/qt5/qt5script/qt5script.mk
index c24ef3336e..50ee52ad0a 100644
--- a/package/qt5/qt5script/qt5script.mk
+++ b/package/qt5/qt5script/qt5script.mk
@@ -10,13 +10,8 @@ QT5SCRIPT_SOURCE = qtscript-opensource-src-$(QT5SCRIPT_VERSION).tar.xz
 QT5SCRIPT_DEPENDENCIES = qt5base
 QT5SCRIPT_INSTALL_STAGING = YES
 
-ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
 QT5SCRIPT_LICENSE = GPL-3.0 or LGPL-2.1 with exception or LGPL-3.0, GFDL-1.3 (docs)
 QT5SCRIPT_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
-else
-QT5SCRIPT_LICENSE = Commercial license
-QT5SCRIPT_REDISTRIBUTE = NO
-endif
 
 define QT5SCRIPT_CONFIGURE_CMDS
 	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
-- 
2.11.0
