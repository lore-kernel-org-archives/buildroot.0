From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 7 Nov 2019 23:43:29 +0100
Subject: [Buildroot] [git commit branch/next] package/python-esptool: new
 package
Message-ID: <20191107224058.BB7DD8159A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0a581ed8b17c45499c3bb108cdae0cd663a4ddb8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                 |  1 +
 package/Config.in                          |  1 +
 package/python-esptool/Config.in           | 10 ++++++++++
 package/python-esptool/python-esptool.hash |  5 +++++
 package/python-esptool/python-esptool.mk   | 14 ++++++++++++++
 5 files changed, 31 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 503e9648d0..342df993aa 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -256,6 +256,7 @@ F:	package/lua-ev/
 F:	package/orbit/
 
 N:	Bartosz Bilas <b.bilas@grinn-global.com>
+F:	package/python-esptool/
 F:	package/python-pyaes/
 F:	package/qt5/qt5scxml/
 F:	package/qt5/qt5webview/
diff --git a/package/Config.in b/package/Config.in
index 8b554e46d8..a9742ba953 100644
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
index 0000000000..08b84e3e08
--- /dev/null
+++ b/package/python-esptool/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_PYTHON_ESPTOOL
+	bool "python-esptool"
+	select BR2_PACKAGE_PYTHON_ECDSA # runtime
+	select BR2_PACKAGE_PYTHON_PYAES # runtime
+	select BR2_PACKAGE_PYTHON_SERIAL # runtime
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
index 0000000000..0cdc98ce16
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
+PYTHON_ESPTOOL_LICENSE = GPL-2.0+
+PYTHON_ESPTOOL_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
