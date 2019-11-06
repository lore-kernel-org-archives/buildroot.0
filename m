From: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Wed,  6 Nov 2019 19:30:23 +0100
Subject: [Buildroot] [PATCH 3/3] package/python-esptool: new package
In-Reply-To: <20191106183023.531278-1-b.bilas@grinn-global.com>
References: <20191106183023.531278-1-b.bilas@grinn-global.com>
Message-ID: <20191106183023.531278-3-b.bilas@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
---
 DEVELOPERS                                 |  1 +
 package/Config.in                          |  1 +
 package/python-esptool/Config.in           | 10 ++++++++++
 package/python-esptool/python-esptool.hash |  5 +++++
 package/python-esptool/python-esptool.mk   | 14 ++++++++++++++
 5 files changed, 31 insertions(+)
 create mode 100644 package/python-esptool/Config.in
 create mode 100644 package/python-esptool/python-esptool.hash
 create mode 100644 package/python-esptool/python-esptool.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index e453b828d0..1835024b75 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -260,6 +260,7 @@ F:	package/qt5/qt5scxml/
 F:	package/qt5/qt5webview/
 F:	package/python-pyserial
 F:	package/python-pyaes
+F:	package/python-esptool
 
 N:	Bartosz Golaszewski <brgl@bgdev.pl>
 F:	package/autoconf-archive/
diff --git a/package/Config.in b/package/Config.in
index 86332e5e91..af2e8d3a0c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -902,6 +902,7 @@ menu "External python modules"
 	source "package/python-engineio/Config.in"
 	source "package/python-enum/Config.in"
 	source "package/python-enum34/Config.in"
+	source "package/python-esptool/Config.in"
 	source "package/python-falcon/Config.in"
 	source "package/python-fire/Config.in"
 	source "package/python-flask/Config.in"
diff --git a/package/python-esptool/Config.in b/package/python-esptool/Config.in
new file mode 100644
index 0000000000..ad565b6f1b
--- /dev/null
+++ b/package/python-esptool/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_PYTHON_ESPTOOL
+	bool "python-esptool"
+	select BR2_PACKAGE_PYTHON_PYSERIAL # runtime
+	select BR2_PACKAGE_PYTHON_PYAES # runtime
+	select BR2_PACKAGE_PYTHON_ECDSA # runtime
+	help
+	  A serial utility to communicate & flash code to Espressif
+	  ESP8266 & ESP32 chips.
+
+	  https://github.com/espressif/esptool
diff --git a/package/python-esptool/python-esptool.hash b/package/python-esptool/python-esptool.hash
new file mode 100644
index 0000000000..b4dac7ed51
--- /dev/null
+++ b/package/python-esptool/python-esptool.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/esptool/json
+md5	d17b9293910773045b9de0d5caa0597d  esptool-2.8.tar.gz
+sha256	1e4288d9f00e55ba36809cc79c493643c623bfa036d7b019a0ebe396284bc317  esptool-2.8.tar.gz
+# Locally computed sha256 checksums
+sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/python-esptool/python-esptool.mk b/package/python-esptool/python-esptool.mk
new file mode 100644
index 0000000000..a2bd335ac4
--- /dev/null
+++ b/package/python-esptool/python-esptool.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-esptool
+#
+################################################################################
+
+PYTHON_ESPTOOL_VERSION = 2.8
+PYTHON_ESPTOOL_SOURCE = esptool-$(PYTHON_ESPTOOL_VERSION).tar.gz
+PYTHON_ESPTOOL_SITE = https://files.pythonhosted.org/packages/68/91/08c182f66fa3f12a96e754ae8ec7762abb2d778429834638f5746f81977a
+PYTHON_ESPTOOL_SETUP_TYPE = setuptools
+PYTHON_ESPTOOL_LICENSE = GNU General Public License v2 or later (GPLv2+)
+PYTHON_ESPTOOL_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.24.0
