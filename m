From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri,  6 May 2016 00:09:28 +0200
Subject: [Buildroot] [PATCH] python-ubjson: new package
Message-ID: <1462486168-5597-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in                        |  1 +
 package/python-ubjson/Config.in          |  7 +++++++
 package/python-ubjson/python-ubjson.hash |  3 +++
 package/python-ubjson/python-ubjson.mk   | 14 ++++++++++++++
 4 files changed, 25 insertions(+)
 create mode 100644 package/python-ubjson/Config.in
 create mode 100644 package/python-ubjson/python-ubjson.hash
 create mode 100644 package/python-ubjson/python-ubjson.mk

diff --git a/package/Config.in b/package/Config.in
index 9d668bf..a34d670 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -748,6 +748,7 @@ menu "External python modules"
 	source "package/python-treq/Config.in"
 	source "package/python-twisted/Config.in"
 	source "package/python-txaio/Config.in"
+	source "package/python-ubjson/Config.in"
 	source "package/python-ujson/Config.in"
 	source "package/python-urllib3/Config.in"
 	source "package/python-urwid/Config.in"
diff --git a/package/python-ubjson/Config.in b/package/python-ubjson/Config.in
new file mode 100644
index 0000000..86ed3b2
--- /dev/null
+++ b/package/python-ubjson/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_UBJSON
+	bool "python-ubjson"
+	help
+	  This is a Python v3.2+ (and 2.7+) Universal Binary JSON
+	  encoder/decoder based on the draft-12 specification.
+
+	  https://pypi.python.org/pypi/py-ubjson
diff --git a/package/python-ubjson/python-ubjson.hash b/package/python-ubjson/python-ubjson.hash
new file mode 100644
index 0000000..1995da6
--- /dev/null
+++ b/package/python-ubjson/python-ubjson.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=7d7e7b9b67acfb8c6b417dab78ac4639,sha256 locally computed.
+md5	7d7e7b9b67acfb8c6b417dab78ac4639  py-ubjson-0.8.4.tar.gz
+sha256	395c0cbbb097d88bb0db92fe1ac82d31b56f3be396946fe02d38f08e86a8efe9  py-ubjson-0.8.4.tar.gz
diff --git a/package/python-ubjson/python-ubjson.mk b/package/python-ubjson/python-ubjson.mk
new file mode 100644
index 0000000..a69efab
--- /dev/null
+++ b/package/python-ubjson/python-ubjson.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-ubjson
+#
+################################################################################
+
+PYTHON_UBJSON_VERSION = 0.8.4
+PYTHON_UBJSON_SOURCE = py-ubjson-$(PYTHON_UBJSON_VERSION).tar.gz
+PYTHON_UBJSON_SITE = https://pypi.python.org/packages/bf/a3/990c47fa0d2d244a3d493ae917d5cbf2a0632c1ac6aa53445f4e53ce3675
+PYTHON_UBJSON_LICENSE = Apache-2.0
+PYTHON_UBJSON_LICENSE_FILES = LICENSE
+PYTHON_UBJSON_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
-- 
2.5.0
