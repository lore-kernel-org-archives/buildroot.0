From: Guillaume W. Bres <guillaume.bressaix@gmail.com>
Date: Wed, 11 Apr 2018 15:04:06 +0200
Subject: [Buildroot] [PATCH 1/1] adding new package: pixiewps
Message-ID: <1523451846-29555-1-git-send-email-guillaume.bressaix@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Pixie WPS is a generic C package to perform 'pixie dust attack' against WPS pins.
Easy to cross-compile, tested on RPI1 & RPI3.

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
---
 package/Config.in            |  1 +
 package/pixiewps/Config.in   |  6 ++++++
 package/pixiewps/pixiewps.mk | 15 +++++++++++++++
 3 files changed, 22 insertions(+)
 create mode 100644 package/pixiewps/Config.in
 create mode 100644 package/pixiewps/pixiewps.mk

diff --git a/package/Config.in b/package/Config.in
index e48d0b4..132372c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1809,6 +1809,7 @@ endif
 	source "package/phidgetwebservice/Config.in"
 	source "package/phytool/Config.in"
 	source "package/pimd/Config.in"
+	source "package/pixiewps/Config.in"
 	source "package/pound/Config.in"
 	source "package/pppd/Config.in"
 	source "package/pptp-linux/Config.in"
diff --git a/package/pixiewps/Config.in b/package/pixiewps/Config.in
new file mode 100644
index 0000000..93b3a20
--- /dev/null
+++ b/package/pixiewps/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PIXIEWPS
+	bool "pixiewps"
+	
+	help
+	  Pixiewps is a tool written in C 
+	  used to bruteforce the WPS PIN using the so-called "pixie-dust attack".
diff --git a/package/pixiewps/pixiewps.mk b/package/pixiewps/pixiewps.mk
new file mode 100644
index 0000000..8235195
--- /dev/null
+++ b/package/pixiewps/pixiewps.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# pixiewps 
+#
+################################################################################
+
+PIXIEWPS_VERSION = 9e5bdc6c86c8487b2a6107d5ab3559ed5c738c59 
+PIXIEWPS_SITE = $(call github,wiire-a,pixiewps,$(PIXIEWPS_VERSION))
+PIXIEWPS_LICENSE = GPL-3.0+
+PIXIEWPS_LICENSE_FILES = LICENSE.md
+
+PIXIEWPS_SUBDIR = src
+PIXIEWPS_INSTALL_TARGET = YES
+
+$(eval $(generic-package))
-- 
2.7.4
