From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Wed,  8 Jun 2016 15:25:29 +0200
Subject: [Buildroot] [PATCH 1/2] python-pytz: new package
Message-ID: <1465392330-13320-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in                    |  1 +
 package/python-pytz/Config.in        |  6 ++++++
 package/python-pytz/python-pytz.hash |  4 ++++
 package/python-pytz/python-pytz.mk   | 14 ++++++++++++++
 4 files changed, 25 insertions(+)
 create mode 100644 package/python-pytz/Config.in
 create mode 100644 package/python-pytz/python-pytz.hash
 create mode 100644 package/python-pytz/python-pytz.mk

diff --git a/package/Config.in b/package/Config.in
index 4072d65..1337dbc 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -731,6 +731,7 @@ menu "External python modules"
 	source "package/python-pysnmp-mibs/Config.in"
 	source "package/python-pysocks/Config.in"
 	source "package/python-pytrie/Config.in"
+	source "package/python-pytz/Config.in"
 	source "package/python-pyudev/Config.in"
 	source "package/python-pyusb/Config.in"
 	source "package/python-pyxb/Config.in"
diff --git a/package/python-pytz/Config.in b/package/python-pytz/Config.in
new file mode 100644
index 0000000..949fbd3
--- /dev/null
+++ b/package/python-pytz/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_PYTZ
+	bool "python-pytz"
+	help
+	  World timezone definitions, modern and historical.
+
+	  http://pythonhosted.org/pytz
diff --git a/package/python-pytz/python-pytz.hash b/package/python-pytz/python-pytz.hash
new file mode 100644
index 0000000..5047a8c
--- /dev/null
+++ b/package/python-pytz/python-pytz.hash
@@ -0,0 +1,4 @@
+# md5 from https://pypi.python.org/pypi/pytz/json
+md5	e56283d61935963157aebc5135206a47  pytz-2016.4.tar.bz2
+# sha256 calculated by scanpypi
+sha256	ee7c751544e35a7b7fb5e3fb25a49dade37d51e70a93e5107f10575d7102c311  pytz-2016.4.tar.bz2
diff --git a/package/python-pytz/python-pytz.mk b/package/python-pytz/python-pytz.mk
new file mode 100644
index 0000000..a73c9cf
--- /dev/null
+++ b/package/python-pytz/python-pytz.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-pytz
+#
+################################################################################
+
+PYTHON_PYTZ_VERSION = 2016.4
+PYTHON_PYTZ_SOURCE = pytz-$(PYTHON_PYTZ_VERSION).tar.bz2
+PYTHON_PYTZ_SITE = https://pypi.python.org/packages/f4/7d/7c0c85e9c64a75dde11bc9d3e1adc4e09a42ce7cdb873baffa1598118709
+PYTHON_PYTZ_SETUP_TYPE = setuptools
+PYTHON_PYTZ_LICENSE = MIT
+PYTHON_PYTZ_LICENSE_FILES = LICENSE.txt
+
+$(eval $(python-package))
-- 
2.1.4
