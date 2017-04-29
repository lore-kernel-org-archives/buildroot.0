From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Apr 2017 15:53:47 +0200
Subject: [Buildroot] [git commit] package/qt5webchannel: always use the
	opensource license
Message-ID: <20170429135923.C94CD827E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4ff182f30cd18f87254ed3d2a30007c91ee7a2f6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We never ask the user to confirm their assent about the use of a free
license; there is no reason we do so for Qt.

The output of legal-info is there to gather all the licenses used in a
build; the license for qt5webchannel will be there to be consulted as
well.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Julien Corjon <corjon.j@ecagroup.com>
Cc: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/qt5webchannel/qt5webchannel.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/qt5/qt5webchannel/qt5webchannel.mk b/package/qt5/qt5webchannel/qt5webchannel.mk
index e12e945..791f4a9 100644
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
