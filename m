From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Apr 2017 15:53:50 +0200
Subject: [Buildroot] [git commit] package/qt5websockets: always use the
	opensource license
Message-ID: <20170429135923.DC35C827E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=288288e0c1790ec4f07648a2b8a7229fd7b2615c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We never ask the user to confirm their assent about the use of a free
license; there is no reason we do so for Qt.

The output of legal-info is there to gather all the licenses used in a
build; the license for qt5websockets will be there to be consulted as
well.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Julien Corjon <corjon.j@ecagroup.com>
Cc: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/qt5websockets/qt5websockets.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/qt5/qt5websockets/qt5websockets.mk b/package/qt5/qt5websockets/qt5websockets.mk
index bcbc56f..af87435 100644
--- a/package/qt5/qt5websockets/qt5websockets.mk
+++ b/package/qt5/qt5websockets/qt5websockets.mk
@@ -10,7 +10,6 @@ QT5WEBSOCKETS_SOURCE = qtwebsockets-opensource-src-$(QT5WEBSOCKETS_VERSION).tar.
 QT5WEBSOCKETS_DEPENDENCIES = qt5base
 QT5WEBSOCKETS_INSTALL_STAGING = YES
 
-ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5WEBSOCKETS_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools)
 QT5WEBSOCKETS_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3
@@ -21,10 +20,6 @@ endif
 ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
 QT5WEBSOCKETS_LICENSE := $(QT5WEBSOCKETS_LICENSE), BSD-3-Clause (examples)
 endif
-else
-QT5WEBSOCKETS_LICENSE = Commercial license
-QT5WEBSOCKETS_REDISTRIBUTE = NO
-endif
 
 ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
 QT5WEBSOCKETS_DEPENDENCIES += qt5declarative
