From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 6 Feb 2019 15:41:36 +0100
Subject: [Buildroot] [git commit] package/qextserialport: remove qt4 support
Message-ID: <20190206145217.0E3A88040D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=122f8cf1cb4a54a2585d7fa022df10ab529e4261
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Qt4 support is about to be dropped, so remove the support from
qextserialport as well.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/qextserialport/Config.in         |  2 +-
 package/qextserialport/qextserialport.mk | 10 ++--------
 2 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/package/qextserialport/Config.in b/package/qextserialport/Config.in
index 4e7ef13784..f880d335e5 100644
--- a/package/qextserialport/Config.in
+++ b/package/qextserialport/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_QEXTSERIALPORT
 	bool "qextserialport"
-	depends on BR2_PACKAGE_QT || BR2_PACKAGE_QT5
+	depends on BR2_PACKAGE_QT5
 	help
 	  A Qt library to manage serial ports
 
diff --git a/package/qextserialport/qextserialport.mk b/package/qextserialport/qextserialport.mk
index e3e325ce6c..ecaff21efc 100644
--- a/package/qextserialport/qextserialport.mk
+++ b/package/qextserialport/qextserialport.mk
@@ -14,16 +14,10 @@ ifeq ($(BR2_STATIC_LIBS),y)
 QEXTSERIALPORT_CONF_OPTS += CONFIG+=qesp_static
 endif
 
-ifeq ($(BR2_PACKAGE_QT),y)
-QEXTSERIALPORT_DEPENDENCIES += qt
-QEXTSERIALPORT_QMAKE = $(QT_QMAKE)
-else ifeq ($(BR2_PACKAGE_QT5),y)
-QEXTSERIALPORT_DEPENDENCIES += qt5base
-QEXTSERIALPORT_QMAKE = $(QT5_QMAKE)
-endif
+QEXTSERIALPORT_DEPENDENCIES = qt5base
 
 define QEXTSERIALPORT_CONFIGURE_CMDS
-	cd $(@D); $(TARGET_MAKE_ENV) $(QEXTSERIALPORT_QMAKE) $(QEXTSERIALPORT_CONF_OPTS)
+	cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE) $(QEXTSERIALPORT_CONF_OPTS)
 endef
 
 define QEXTSERIALPORT_BUILD_CMDS
