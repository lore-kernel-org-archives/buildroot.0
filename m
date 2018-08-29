From: Laurent Hartanerot <laurent.hartanerot@gmail.com>
Date: Wed, 29 Aug 2018 13:05:17 +0200
Subject: [Buildroot] [PATCH v2 1/1] qt5quickcontrols: update license file
 names
In-Reply-To: <20180829061813.9348-1-laurent.hartanerot@gmail.com>
References: <20180829061813.9348-1-laurent.hartanerot@gmail.com>
Message-ID: <20180829110517.15151-1-laurent.hartanerot@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Laurent Hartanerot <laurent.hartanerot@atos.net>

Update license file name for qt5quickcontrols-5.6

Signed-off-by: Laurent Hartanerot <laurent.hartanerot@atos.net>
---
 package/qt5/qt5quickcontrols/qt5quickcontrols.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/qt5/qt5quickcontrols/qt5quickcontrols.mk b/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
index 6e551d5a27..318b015739 100644
--- a/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
+++ b/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
@@ -10,8 +10,13 @@ QT5QUICKCONTROLS_SOURCE = qtquickcontrols-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5QUIC
 QT5QUICKCONTROLS_DEPENDENCIES = qt5base qt5declarative
 QT5QUICKCONTROLS_INSTALL_STAGING = YES

+ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5QUICKCONTROLS_LICENSE = GPL-2.0 or GPL-3.0 or LGPL-3.0, GFDL-1.3 (docs)
 QT5QUICKCONTROLS_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.LGPL3 LICENSE.FDL
+else
+QT5QUICKCONTROLS_LICENSE = GPL-2.0 or GPL-3.0 or LGPL-3.0, GFDL-1.3 (docs)
+QT5QUICKCONTROLS_LICENSE_FILES = LICENSE.FDL LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv3
+endif

 define QT5QUICKCONTROLS_CONFIGURE_CMDS
 	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
--
2.11.0
