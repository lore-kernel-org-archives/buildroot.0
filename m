From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Mon, 19 Dec 2016 09:22:34 +0100
Subject: [Buildroot] [PATCH 1/3] python-constantly: new package
Message-ID: <1482135756-21472-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in                                |  1 +
 package/python-constantly/Config.in              |  8 ++++++++
 package/python-constantly/python-constantly.hash |  3 +++
 package/python-constantly/python-constantly.mk   | 14 ++++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/python-constantly/Config.in
 create mode 100644 package/python-constantly/python-constantly.hash
 create mode 100644 package/python-constantly/python-constantly.mk

diff --git a/package/Config.in b/package/Config.in
index be0d150..3a49167 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -660,6 +660,7 @@ menu "External python modules"
 	source "package/python-coherence/Config.in"
 	source "package/python-configobj/Config.in"
 	source "package/python-configshell-fb/Config.in"
+	source "package/python-constantly/Config.in"
 	source "package/python-couchdb/Config.in"
 	source "package/python-crc16/Config.in"
 	source "package/python-crcmod/Config.in"
diff --git a/package/python-constantly/Config.in b/package/python-constantly/Config.in
new file mode 100644
index 0000000..13bb2e8
--- /dev/null
+++ b/package/python-constantly/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_CONSTANTLY
+	bool "python-constantly"
+	help
+	  A library that provides symbolic constant support. It
+	  includes collections and constants with text, numeric,
+	  and bit flag values.
+
+	  https://github.com/twisted/constantly
diff --git a/package/python-constantly/python-constantly.hash b/package/python-constantly/python-constantly.hash
new file mode 100644
index 0000000..fb77877
--- /dev/null
+++ b/package/python-constantly/python-constantly.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi/constantly/json, sha256 locally computed
+md5	f0762f083d83039758e53f8cf0086eef  constantly-15.1.0.tar.gz
+sha256	586372eb92059873e29eba4f9dec8381541b4d3834660707faf8ba59146dfc35  constantly-15.1.0.tar.gz
diff --git a/package/python-constantly/python-constantly.mk b/package/python-constantly/python-constantly.mk
new file mode 100644
index 0000000..783d198
--- /dev/null
+++ b/package/python-constantly/python-constantly.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-constantly
+#
+################################################################################
+
+PYTHON_CONSTANTLY_VERSION = 15.1.0
+PYTHON_CONSTANTLY_SOURCE = constantly-$(PYTHON_CONSTANTLY_VERSION).tar.gz
+PYTHON_CONSTANTLY_SITE = https://pypi.python.org/packages/95/f1/207a0a478c4bb34b1b49d5915e2db574cadc415c9ac3a7ef17e29b2e8951
+PYTHON_CONSTANTLY_SETUP_TYPE = setuptools
+PYTHON_CONSTANTLY_LICENSE = MIT
+PYTHON_CONSTANTLY_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.1.4
