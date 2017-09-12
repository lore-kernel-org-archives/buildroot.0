From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Tue, 12 Sep 2017 11:50:54 +0200
Subject: [Buildroot] [PATCH 1/3] python-iso8601: new package
Message-ID: <20170912095056.13692-1-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in                          |  1 +
 package/python-iso8601/Config.in           |  6 ++++++
 package/python-iso8601/python-iso8601.hash |  4 ++++
 package/python-iso8601/python-iso8601.mk   | 14 ++++++++++++++
 4 files changed, 25 insertions(+)
 create mode 100644 package/python-iso8601/Config.in
 create mode 100644 package/python-iso8601/python-iso8601.hash
 create mode 100644 package/python-iso8601/python-iso8601.mk

diff --git a/package/Config.in b/package/Config.in
index 7a277d75ca..457896fa07 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -766,6 +766,7 @@ menu "External python modules"
 	source "package/python-ipy/Config.in"
 	source "package/python-ipython/Config.in"
 	source "package/python-ipython-genutils/Config.in"
+	source "package/python-iso8601/Config.in"
 	source "package/python-itsdangerous/Config.in"
 	source "package/python-jinja2/Config.in"
 	source "package/python-jsonschema/Config.in"
diff --git a/package/python-iso8601/Config.in b/package/python-iso8601/Config.in
new file mode 100644
index 0000000000..9e4610cf61
--- /dev/null
+++ b/package/python-iso8601/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_ISO8601
+	bool "python-iso8601"
+	help
+	  Simple module to parse ISO 8601 dates.
+
+	  https://bitbucket.org/micktwomey/pyiso8601
diff --git a/package/python-iso8601/python-iso8601.hash b/package/python-iso8601/python-iso8601.hash
new file mode 100644
index 0000000000..57604cc97b
--- /dev/null
+++ b/package/python-iso8601/python-iso8601.hash
@@ -0,0 +1,4 @@
+# md5 from https://pypi.python.org/pypi/iso8601/json, sha256 locally computed
+md5	4de940f691c5ea759fb254384c8ddcf6  iso8601-0.1.12.tar.gz
+sha256	49c4b20e1f38aa5cf109ddcd39647ac419f928512c869dc01d5c7098eddede82  iso8601-0.1.12.tar.gz
+sha256  116d368d14a8cf0061027c944c60ee20b476ce42814818a7d627396906761f16  LICENSE
diff --git a/package/python-iso8601/python-iso8601.mk b/package/python-iso8601/python-iso8601.mk
new file mode 100644
index 0000000000..7fc171d603
--- /dev/null
+++ b/package/python-iso8601/python-iso8601.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-iso8601
+#
+################################################################################
+
+PYTHON_ISO8601_VERSION = 0.1.12
+PYTHON_ISO8601_SOURCE = iso8601-$(PYTHON_ISO8601_VERSION).tar.gz
+PYTHON_ISO8601_SITE = https://pypi.python.org/packages/45/13/3db24895497345fb44c4248c08b16da34a9eb02643cea2754b21b5ed08b0
+PYTHON_ISO8601_SETUP_TYPE = setuptools
+PYTHON_ISO8601_LICENSE = MIT
+PYTHON_ISO8601_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.11.0
