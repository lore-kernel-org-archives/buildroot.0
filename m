From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Sep 2017 23:38:47 +0200
Subject: [Buildroot] [git commit] python-iso8601: new package
Message-ID: <20170912213541.B59DE80FA2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cce0cc2bbdafb0800840605f226ecb9f8bb33401
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                          |  1 +
 package/python-iso8601/Config.in           |  6 ++++++
 package/python-iso8601/python-iso8601.hash |  4 ++++
 package/python-iso8601/python-iso8601.mk   | 14 ++++++++++++++
 4 files changed, 25 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 4d7d5a2..9554b6f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -767,6 +767,7 @@ menu "External python modules"
 	source "package/python-ipy/Config.in"
 	source "package/python-ipython/Config.in"
 	source "package/python-ipython-genutils/Config.in"
+	source "package/python-iso8601/Config.in"
 	source "package/python-itsdangerous/Config.in"
 	source "package/python-jinja2/Config.in"
 	source "package/python-jsonschema/Config.in"
diff --git a/package/python-iso8601/Config.in b/package/python-iso8601/Config.in
new file mode 100644
index 0000000..9e4610c
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
index 0000000..57604cc
--- /dev/null
+++ b/package/python-iso8601/python-iso8601.hash
@@ -0,0 +1,4 @@
+# md5 from https://pypi.python.org/pypi/iso8601/json, sha256 locally computed
+md5	4de940f691c5ea759fb254384c8ddcf6  iso8601-0.1.12.tar.gz
+sha256	49c4b20e1f38aa5cf109ddcd39647ac419f928512c869dc01d5c7098eddede82  iso8601-0.1.12.tar.gz
+sha256  116d368d14a8cf0061027c944c60ee20b476ce42814818a7d627396906761f16  LICENSE
diff --git a/package/python-iso8601/python-iso8601.mk b/package/python-iso8601/python-iso8601.mk
new file mode 100644
index 0000000..7fc171d
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
