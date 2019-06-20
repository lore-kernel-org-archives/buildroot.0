From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Thu, 20 Jun 2019 20:38:13 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/python-periphery: new package
Message-ID: <1561055893-22140-1-git-send-email-pjtexier@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
Changes v1 -> v2
 - remove 'v' prefix in PYTHON_PERIPHERY_VERSION
 
 Scanpy was not used because the archive in pythonhosted
 does not contain the license file.
 
 With the github repo : make python-periphery-legal-info 
   >>> python-periphery 1.1.1 Collecting legal info
   LICENSE: OK (sha256: db1bea825e728d8bcdf6c220d79c74370a9fcb63a4f9153c2cece2b63e177aa4)
 
 DEVELOPERS                                     |  1 +
 package/Config.in                              |  1 +
 package/python-periphery/Config.in             |  7 +++++++
 package/python-periphery/python-periphery.hash |  3 +++
 package/python-periphery/python-periphery.mk   | 13 +++++++++++++
 5 files changed, 25 insertions(+)
 create mode 100644 package/python-periphery/Config.in
 create mode 100644 package/python-periphery/python-periphery.hash
 create mode 100644 package/python-periphery/python-periphery.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 9d806db..3fec0f7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1855,6 +1855,7 @@ F:	package/trace-cmd/
 
 N:	Pierre-Jean Texier <pjtexier@koncepto.io>
 F:	package/libubootenv/
+F:	package/python-periphery/
 
 N:	Pieter De Gendt <pieter.degendt@gmail.com>
 F:	package/libvips/
diff --git a/package/Config.in b/package/Config.in
index 1ef6bca..d70ce20 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -964,6 +964,7 @@ menu "External python modules"
 	source "package/python-pathpy/Config.in"
 	source "package/python-pathtools/Config.in"
 	source "package/python-pathvalidate/Config.in"
+	source "package/python-periphery/Config.in"
 	source "package/python-pexpect/Config.in"
 	source "package/python-pickleshare/Config.in"
 	source "package/python-pigpio/Config.in"
diff --git a/package/python-periphery/Config.in b/package/python-periphery/Config.in
new file mode 100644
index 0000000..99585b0
--- /dev/null
+++ b/package/python-periphery/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_PERIPHERY
+	bool "python-periphery"
+	help
+	  A pure Python 2/3 library for peripheral I/O (GPIO, LED,
+	  PWM, SPI, I2C, MMIO, Serial) in Linux.
+
+	  https://github.com/vsergeev/python-periphery
diff --git a/package/python-periphery/python-periphery.hash b/package/python-periphery/python-periphery.hash
new file mode 100644
index 0000000..de988b3
--- /dev/null
+++ b/package/python-periphery/python-periphery.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 a9a0a0ac02b8c3a954281777e92a15ec41abd311eb8732b50a2faaa9df62f1df  python-periphery-1.1.1.tar.gz
+sha256 db1bea825e728d8bcdf6c220d79c74370a9fcb63a4f9153c2cece2b63e177aa4  LICENSE
diff --git a/package/python-periphery/python-periphery.mk b/package/python-periphery/python-periphery.mk
new file mode 100644
index 0000000..150ac1c
--- /dev/null
+++ b/package/python-periphery/python-periphery.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-periphery
+#
+################################################################################
+
+PYTHON_PERIPHERY_VERSION = 1.1.1
+PYTHON_PERIPHERY_SITE = $(call github,vsergeev,python-periphery,v$(PYTHON_PERIPHERY_VERSION))
+PYTHON_PERIPHERY_LICENSE = MIT
+PYTHON_PERIPHERY_LICENSE_FILES = LICENSE
+PYTHON_PERIPHERY_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
-- 
2.7.4
