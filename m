From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Apr 2017 15:53:36 +0200
Subject: [Buildroot] [git commit] package/qt5quickcontrols2: always use the
	opensource license
Message-ID: <20170429135923.855AF82629@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=79802f5f7cbab351c63e64a2548df7d51d60e428
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We never ask the user to confirm their assent about the use of a free
license; there is no reason we do so for Qt.

The output of legal-info is there to gather all the licenses used in a
build; the license for qt5quickcontrols2 will be there to be consulted
as well.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Julien Corjon <corjon.j@ecagroup.com>
Cc: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk
index d6c3ee3..23bcbad 100644
--- a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk
+++ b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk
@@ -10,13 +10,8 @@ QT5QUICKCONTROLS2_SOURCE = qtquickcontrols2-opensource-src-$(QT5QUICKCONTROLS2_V
 QT5QUICKCONTROLS2_DEPENDENCIES = qt5base qt5declarative
 QT5QUICKCONTROLS2_INSTALL_STAGING = YES
 
-ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
 QT5QUICKCONTROLS2_LICENSE = GPL-3.0 or LGPL-3.0, GFDL-1.3 (docs)
 QT5QUICKCONTROLS2_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv3 LICENSE.FDL
-else
-QT5QUICKCONTROLS2_LICENSE = Commercial license
-QT5QUICKCONTROLS2_REDISTRIBUTE = NO
-endif
 
 define QT5QUICKCONTROLS2_CONFIGURE_CMDS
 	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
