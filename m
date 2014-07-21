From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Jul 2014 21:49:26 +0200
Subject: [Buildroot] [git commit] qt5multimedia: fix installation when quick
	is disabled
Message-ID: <20140721195331.3EE729D2A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e934b8b13daba99955d89382388f737556ad01b0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.net/results/b97/b975c4bb8aebad2d0b8eaefc98c42c0460ace5be/
  http://autobuild.buildroot.net/results/b1c/b1ca9c845f1cf3a396cbd7ad81bfc4411974c709/

Signed-off-by: Fatih A????c?? <fatih.asici@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/qt5multimedia/qt5multimedia.mk |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/package/qt5/qt5multimedia/qt5multimedia.mk b/package/qt5/qt5multimedia/qt5multimedia.mk
index e89e31c..da26c03 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.mk
+++ b/package/qt5/qt5multimedia/qt5multimedia.mk
@@ -53,9 +53,15 @@ define QT5MULTIMEDIA_INSTALL_TARGET_LIBS
 endef
 endif
 
+ifeq ($(BR2_PACKAGE_QT5DECLARATIVE_QUICK),y)
+define QT5MULTIMEDIA_INSTALL_TARGET_QMLS
+	cp -dpfr $(STAGING_DIR)/usr/qml/QtMultimedia $(TARGET_DIR)/usr/qml/
+endef
+endif
+
 define QT5MULTIMEDIA_INSTALL_TARGET_CMDS
-	cp -dpfr $(STAGING_DIR)/usr/qml/* $(TARGET_DIR)/usr/qml
 	$(QT5MULTIMEDIA_INSTALL_TARGET_LIBS)
+	$(QT5MULTIMEDIA_INSTALL_TARGET_QMLS)
 endef
 
 $(eval $(generic-package))
