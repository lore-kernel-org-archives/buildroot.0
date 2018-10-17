From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Oct 2018 21:47:01 +0200
Subject: [Buildroot] [git commit] qt5location: copy PositioningQuick.so* for
 QtQuick
Message-ID: <20181017194608.6B596839E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=300af90d3f9ae3989464a8a8a460b059e0e204ea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Location module for QtQuick depends on this library, which was not
being copied in the build rule.

Signed-off-by: Alexander 'z33ky' Hirsch <1zeeky@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt5/qt5location/qt5location.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/qt5/qt5location/qt5location.mk b/package/qt5/qt5location/qt5location.mk
index 18253e9965..da0aad7961 100644
--- a/package/qt5/qt5location/qt5location.mk
+++ b/package/qt5/qt5location/qt5location.mk
@@ -44,6 +44,11 @@ define QT5LOCATION_INSTALL_TARGET_LOCATION
 	cp -dpf $(STAGING_DIR)/usr/lib/libQt5Location.so.* $(TARGET_DIR)/usr/lib
 	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/geoservices $(TARGET_DIR)/usr/lib/qt/plugins/
 endef
+ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
+define QT5LOCATION_INSTALL_TARGET_POSITION_QUICK
+	cp -dpf $(STAGING_DIR)/usr/lib/libQt5PositioningQuick.so.* $(TARGET_DIR)/usr/lib
+endef
+endif
 ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
 define QT5LOCATION_INSTALL_TARGET_EXAMPLES
 	cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/location $(TARGET_DIR)/usr/lib/qt/examples/
@@ -59,6 +64,7 @@ endef
 
 define QT5LOCATION_INSTALL_TARGET_CMDS
 	$(QT5LOCATION_INSTALL_TARGET_POSITION)
+	$(QT5LOCATION_INSTALL_TARGET_POSITION_QUICK)
 	$(QT5LOCATION_INSTALL_TARGET_LOCATION)
 	$(QT5LOCATION_INSTALL_TARGET_QMLS)
 	$(QT5LOCATION_INSTALL_TARGET_EXAMPLES)
