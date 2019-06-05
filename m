From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Wed,  5 Jun 2019 20:57:33 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-periphery: new package
Message-ID: <1559761053-2367-1-git-send-email-pjtexier@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 DEVELOPERS                                     |  1 +
 package/Config.in                              |  1 +
 package/python-periphery/Config.in             | 13 +++++++++++++
 package/python-periphery/python-periphery.hash |  3 +++
 package/python-periphery/python-periphery.mk   | 13 +++++++++++++
 5 files changed, 31 insertions(+)
 create mode 100644 package/python-periphery/Config.in
 create mode 100644 package/python-periphery/python-periphery.hash
 create mode 100644 package/python-periphery/python-periphery.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 7025ac6..d05ceab 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1848,6 +1848,7 @@ F:	package/trace-cmd/
 
 N:	Pierre-Jean Texier <pjtexier@koncepto.io>
 F:	package/libubootenv/
+F:	package/python-periphery/
 
 N:	Pieter De Gendt <pieter.degendt@gmail.com>
 F:	package/libvips/
diff --git a/package/Config.in b/package/Config.in
index f610094..db2862f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -963,6 +963,7 @@ menu "External python modules"
 	source "package/python-pathpy/Config.in"
 	source "package/python-pathtools/Config.in"
 	source "package/python-pathvalidate/Config.in"
+	source "package/python-periphery/Config.in"
 	source "package/python-pexpect/Config.in"
 	source "package/python-pickleshare/Config.in"
 	source "package/python-pigpio/Config.in"
diff --git a/package/python-periphery/Config.in b/package/python-periphery/Config.in
new file mode 100644
index 0000000..b34ecbb
--- /dev/null
+++ b/package/python-periphery/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_PYTHON_PERIPHERY
+	bool "python-periphery"
+	help
+	  python-periphery is a pure Python library for
+	  GPIO, LED, PWM, SPI, I2C, MMIO, and Serial peripheral
+	  I/O interface access in userspace Linux.
+	  It is useful in embedded Linux environments
+	  (including Raspberry Pi, BeagleBone, etc. platforms)
+	  for interfacing with external peripherals.
+	  python-periphery is compatible with Python 2 and Python 3,
+	  is written in pure Python, and is MIT licensed.
+
+	  https://github.com/vsergeev/python-periphery
diff --git a/package/python-periphery/python-periphery.hash b/package/python-periphery/python-periphery.hash
new file mode 100644
index 0000000..c59cef3
--- /dev/null
+++ b/package/python-periphery/python-periphery.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 a9a0a0ac02b8c3a954281777e92a15ec41abd311eb8732b50a2faaa9df62f1df  python-periphery-v1.1.1.tar.gz
+sha256 db1bea825e728d8bcdf6c220d79c74370a9fcb63a4f9153c2cece2b63e177aa4  LICENSE
diff --git a/package/python-periphery/python-periphery.mk b/package/python-periphery/python-periphery.mk
new file mode 100644
index 0000000..0bd969a
--- /dev/null
+++ b/package/python-periphery/python-periphery.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-periphery
+#
+################################################################################
+
+PYTHON_PERIPHERY_VERSION = v1.1.1
+PYTHON_PERIPHERY_SITE = $(call github,vsergeev,python-periphery,$(PYTHON_PERIPHERY_VERSION))
+PYTHON_PERIPHERY_LICENSE = MIT
+PYTHON_PERIPHERY_LICENSE_FILES = LICENSE
+PYTHON_PERIPHERY_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
-- 
2.7.4
