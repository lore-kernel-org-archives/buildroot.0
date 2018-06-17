From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Jun 2018 14:35:17 +0200
Subject: [Buildroot] [git commit] qt5sensors: install examples to target
Message-ID: <20180617123958.B097A888A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9d2d810a6c3fb95d764a7ff4d2e7c9554fd8c1d3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When BR2_PACKAGE_QT5BASE_EXAMPLES is set, the examples for this module
are installed in the staging directory but they are not shipped to the
target.

This commit copies the examples `sensors' from the staging directory
to the target.

Signed-off-by: Ga??l PORTAY <gael.portay@savoirfairelinux.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt5/qt5sensors/qt5sensors.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/qt5/qt5sensors/qt5sensors.mk b/package/qt5/qt5sensors/qt5sensors.mk
index 805abcccd1..2d5cf327a6 100644
--- a/package/qt5/qt5sensors/qt5sensors.mk
+++ b/package/qt5/qt5sensors/qt5sensors.mk
@@ -48,9 +48,16 @@ define QT5SENSORS_INSTALL_TARGET_QMLS
 endef
 endif
 
+ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
+define QT5SENSORS_INSTALL_TARGET_EXAMPLES
+	cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/sensors $(TARGET_DIR)/usr/lib/qt/examples/
+endef
+endif
+
 define QT5SENSORS_INSTALL_TARGET_CMDS
 	$(QT5SENSORS_INSTALL_TARGET_LIBS)
 	$(QT5SENSORS_INSTALL_TARGET_QMLS)
+	$(QT5SENSORS_INSTALL_TARGET_EXAMPLES)
 endef
 
 $(eval $(generic-package))
