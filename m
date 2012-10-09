From: Thiago A. Correa <thiago.correa@gmail.com>
Date: Tue, 9 Oct 2012 15:16:15 -0300
Subject: [Buildroot] [PATCH] QtSerialPort: new package
Message-ID: <20121009181615.GA30642@localhost.comm5.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thiago A. Correa <thiago.correa@gmail.com>
---
 package/Config.in                    |    1 +
 package/qtserialport/Config.in       |    9 +++++++++
 package/qtserialport/qtserialport.mk |   21 +++++++++++++++++++++
 3 files changed, 31 insertions(+), 0 deletions(-)
 create mode 100644 package/qtserialport/Config.in
 create mode 100644 package/qtserialport/qtserialport.mk

diff --git a/package/Config.in b/package/Config.in
index 331d879..e869c8a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -133,6 +133,7 @@ source "package/sdl_gfx/Config.in"
 comment "other GUIs"
 source "package/efl/Config.in"
 source "package/qt/Config.in"
+source "package/qtserialport/Config.in"
 source "package/x11r7/Config.in"
 
 comment "X libraries and helper libraries"
diff --git a/package/qtserialport/Config.in b/package/qtserialport/Config.in
new file mode 100644
index 0000000..773f4ce
--- /dev/null
+++ b/package/qtserialport/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_QTSERIALPORT
+	bool "QtSerialPort"
+	depends on BR2_PACKAGE_QT
+	help
+	  QtSerialPort module is an add-on for the Qt library, providing
+	  a single interface for both hardware and virtual serial ports.
+
+	  http://qt-project.org/wiki/QtSerialPort
+
diff --git a/package/qtserialport/qtserialport.mk b/package/qtserialport/qtserialport.mk
new file mode 100644
index 0000000..eee6f73
--- /dev/null
+++ b/package/qtserialport/qtserialport.mk
@@ -0,0 +1,21 @@
+#############################################################
+#
+# QtSerialPort 
+#
+#############################################################
+QTSERIALPORT_VERSION = 8389c4606ddcedf004838a6b8003f8e4421a37cc
+QTSERIALPORT_SITE = git://gitorious.org/qtplayground/qtserialport.git
+QTSERIALPORT_LICENSE = LGPLv2
+QTSERIALPORT_LICENSE_FILES = LICENSE.LGPL
+QTSERIALPORT_INSTALL_STAGING = YES
+
+QTSERIALPORT_DEPENDENCIES = qt
+
+QTSERIALPORT_LDFLAGS = $(TARGET_LDFLAGS)
+
+define QTSERIALPORT_CONF_CMDS
+	(cd $(@D); \
+		$(QT_QMAKE) CONFIG+=release)
+endef
+
+$(eval $(generic-package))
-- 
1.7.3.4
