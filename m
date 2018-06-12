From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
Date: Tue, 12 Jun 2018 08:32:06 -0400
Subject: [Buildroot] [PATCH 9/9] qt5sensors: install examples to target
In-Reply-To: <20180612123206.31523-1-gael.portay@savoirfairelinux.com>
References: <20180612123206.31523-1-gael.portay@savoirfairelinux.com>
Message-ID: <20180612123206.31523-10-gael.portay@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When BR2_PACKAGE_QT5BASE_EXAMPLES is set, the examples for this module
are installed in the staging directory but they are not shipped to the
target.

This commit copies the examples `sensors' from the staging directory
to the target.

Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
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
-- 
2.17.1
