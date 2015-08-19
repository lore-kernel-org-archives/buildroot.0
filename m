From: Matthew Shyu <matthew.shyu.amlogic@gmail.com>
Date: Wed, 19 Aug 2015 17:48:15 +0800
Subject: [Buildroot] [PATCH 1/1] qt5base: install libQt5XcbQpa.so for xcb
	backend
Message-ID: <1439977695-2214-1-git-send-email-matthew.shyu.amlogic@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Matthew Shyu <matthew.shyu@amlogic.com>

libqxcb.so links again libQt5XcbQpa.so

Signed-off-by: Matthew Shyu <matthew.shyu@amlogic.com>
---
 package/qt5/qt5base/qt5base.mk |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 753b069..e80c20c 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -156,6 +156,7 @@ QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_EXAMPLES),-make,-nomake) ex
 
 # Build the list of libraries to be installed on the target
 QT5BASE_INSTALL_LIBS_y                                 += Qt5Core
+QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_XCB)        += Qt5XcbQpa
 QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_NETWORK)    += Qt5Network
 QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_CONCURRENT) += Qt5Concurrent
 QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_SQL)        += Qt5Sql
-- 
1.7.9.5
