From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Wed, 15 Jun 2016 12:09:14 +0200
Subject: [Buildroot] [PATCH 1/5] python-sdnotify: new package
Message-ID: <1465985358-12555-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in                            |  1 +
 package/python-sdnotify/Config.in            |  7 +++++++
 package/python-sdnotify/python-sdnotify.hash |  4 ++++
 package/python-sdnotify/python-sdnotify.mk   | 13 +++++++++++++
 4 files changed, 25 insertions(+)
 create mode 100644 package/python-sdnotify/Config.in
 create mode 100644 package/python-sdnotify/python-sdnotify.hash
 create mode 100644 package/python-sdnotify/python-sdnotify.mk

diff --git a/package/Config.in b/package/Config.in
index ff08f27..753f5aa 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -745,6 +745,7 @@ menu "External python modules"
 	source "package/python-requests/Config.in"
 	source "package/python-rpi-gpio/Config.in"
 	source "package/python-rtslib-fb/Config.in"
+	source "package/python-sdnotify/Config.in"
 	source "package/python-serial/Config.in"
 	source "package/python-service-identity/Config.in"
 	source "package/python-setproctitle/Config.in"
diff --git a/package/python-sdnotify/Config.in b/package/python-sdnotify/Config.in
new file mode 100644
index 0000000..bc77a06
--- /dev/null
+++ b/package/python-sdnotify/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_SDNOTIFY
+	bool "python-sdnotify"
+	help
+	  A pure Python implementation of systemd's service notification
+	  protocol (sd_notify).
+
+	  https://github.com/bb4242/sdnotify
diff --git a/package/python-sdnotify/python-sdnotify.hash b/package/python-sdnotify/python-sdnotify.hash
new file mode 100644
index 0000000..4339c8f
--- /dev/null
+++ b/package/python-sdnotify/python-sdnotify.hash
@@ -0,0 +1,4 @@
+# md5 from https://pypi.python.org/pypi/sdnotify/json
+md5	8e6a6e25560162c113fa54fc3fad98f5  sdnotify-0.3.0.tar.gz
+# sha256 calculated by scanpypi
+sha256	55fcaffb239f392ecf5b2211ef65f858b8fbbc857be8ca2b6f27b011db9c2ce6  sdnotify-0.3.0.tar.gz
diff --git a/package/python-sdnotify/python-sdnotify.mk b/package/python-sdnotify/python-sdnotify.mk
new file mode 100644
index 0000000..aeeefd7
--- /dev/null
+++ b/package/python-sdnotify/python-sdnotify.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-sdnotify
+#
+################################################################################
+
+PYTHON_SDNOTIFY_VERSION = 0.3.0
+PYTHON_SDNOTIFY_SOURCE = sdnotify-$(PYTHON_SDNOTIFY_VERSION).tar.gz
+PYTHON_SDNOTIFY_SITE = https://pypi.python.org/packages/6f/ef/d57f930ba403b2e6440bd7ab14dbdd7ce1a1bfb5617bba62a950d04bfa34
+PYTHON_SDNOTIFY_SETUP_TYPE = distutils
+PYTHON_SDNOTIFY_LICENSE = MIT
+
+$(eval $(python-package))
-- 
2.8.1
