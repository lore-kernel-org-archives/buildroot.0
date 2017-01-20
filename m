From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 20 Jan 2017 21:23:17 +0100
Subject: [Buildroot] [git commit] qt5multimedia: install examples
Message-ID: <20170120202351.D6CEA819A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9efbfd9f531c5ef115e5ea7f369ad0b8de16d1ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5multimedia/qt5multimedia.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/qt5/qt5multimedia/qt5multimedia.mk b/package/qt5/qt5multimedia/qt5multimedia.mk
index 67e7968..3075ffc 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.mk
+++ b/package/qt5/qt5multimedia/qt5multimedia.mk
@@ -59,9 +59,16 @@ define QT5MULTIMEDIA_INSTALL_TARGET_QMLS
 endef
 endif
 
+ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
+define QT5MULTIMEDIA_INSTALL_TARGET_EXAMPLES
+       cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/multimedia* $(TARGET_DIR)/usr/lib/qt/examples/
+endef
+endif
+
 define QT5MULTIMEDIA_INSTALL_TARGET_CMDS
 	$(QT5MULTIMEDIA_INSTALL_TARGET_LIBS)
 	$(QT5MULTIMEDIA_INSTALL_TARGET_QMLS)
+	$(QT5MULTIMEDIA_INSTALL_TARGET_EXAMPLES)
 endef
 
 $(eval $(generic-package))
