From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Apr 2017 22:31:10 +0200
Subject: [Buildroot] [PATCH 22/29] package/qt5webchannel: always use the
	opensource license
In-Reply-To: <cover.1492979449.git.yann.morin.1998@free.fr>
References: <cover.1492979449.git.yann.morin.1998@free.fr>
Message-ID: <aec3b5521d0663e79b71799684b6b828b7c90675.1492979449.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We never ask the user to confirm their assent about the use of a free
license; there is no reason we do so for Qt.

The output of legal-info is there to gather all the licenses used in a
build; the license for qt5webchannel will be there to be consulted as
well.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Julien Corjon <corjon.j@ecagroup.com>
Cc: Peter Seiderer <ps.report@gmx.net>
---
 package/qt5/qt5webchannel/qt5webchannel.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/qt5/qt5webchannel/qt5webchannel.mk b/package/qt5/qt5webchannel/qt5webchannel.mk
index e12e945703..791f4a92f4 100644
--- a/package/qt5/qt5webchannel/qt5webchannel.mk
+++ b/package/qt5/qt5webchannel/qt5webchannel.mk
@@ -10,7 +10,6 @@ QT5WEBCHANNEL_SOURCE = qtwebchannel-opensource-src-$(QT5WEBCHANNEL_VERSION).tar.
 QT5WEBCHANNEL_DEPENDENCIES = qt5base qt5websockets
 QT5WEBCHANNEL_INSTALL_STAGING = YES
 
-ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5WEBCHANNEL_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3 (docs)
 QT5WEBCHANNEL_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
@@ -21,10 +20,6 @@ endif
 ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
 QT5WEBCHANNEL_LICENSE := $(QT5WEBCHANNEL_LICENSE), BSD-3-Clause (examples)
 endif
-else
-QT5WEBCHANNEL_LICENSE = Commercial license
-QT5WEBCHANNEL_REDISTRIBUTE = NO
-endif
 
 ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
 QT5WEBCHANNEL_DEPENDENCIES += qt5declarative
-- 
2.11.0
