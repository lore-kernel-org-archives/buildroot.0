From: Lionel Flandrin <lionel@svkt.org>
Date: Mon, 30 Jan 2017 11:40:52 +0100
Subject: [Buildroot] [PATCH 1/2] python-gunicorn: new package
Message-ID: <20170130104053.16234-1-lionel@svkt.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gunicorn ?Green Unicorn? is a Python WSGI HTTP Server for UNIX. It?s a
pre-fork worker model ported from Ruby?s Unicorn project. The Gunicorn
server is broadly compatible with various web frameworks, simply
implemented, light on server resource usage, and fairly speedy.

Signed-off-by: Lionel Flandrin <lionel@svkt.org>
---
 package/Config.in                            |  1 +
 package/python-gunicorn/Config.in            | 15 +++++++++++++++
 package/python-gunicorn/python-gunicorn.hash |  3 +++
 package/python-gunicorn/python-gunicorn.mk   | 14 ++++++++++++++
 4 files changed, 33 insertions(+)
 create mode 100644 package/python-gunicorn/Config.in
 create mode 100644 package/python-gunicorn/python-gunicorn.hash
 create mode 100644 package/python-gunicorn/python-gunicorn.mk

diff --git a/package/Config.in b/package/Config.in
index 6a3a1a7c7..c68d84889 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -696,6 +696,7 @@ menu "External python modules"
 	source "package/python-flup/Config.in"
 	source "package/python-futures/Config.in"
 	source "package/python-gobject/Config.in"
+	source "package/python-gunicorn/Config.in"
 	source "package/python-html5lib/Config.in"
 	source "package/python-httplib2/Config.in"
 	source "package/python-humanize/Config.in"
diff --git a/package/python-gunicorn/Config.in b/package/python-gunicorn/Config.in
new file mode 100644
index 000000000..d675c03e0
--- /dev/null
+++ b/package/python-gunicorn/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_PYTHON_GUNICORN
+	bool "python-gunicorn"
+	select BR2_PACKAGE_PYTHON_SETUPTOOLS
+	select BR2_PACKAGE_PYTHON_ZLIB if BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON3_ZLIB if BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON_SSL if BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON3_SSL if BR2_PACKAGE_PYTHON3
+	help
+	  Gunicorn ?Green Unicorn? is a Python WSGI HTTP Server for
+	  UNIX. It?s a pre-fork worker model ported from Ruby?s
+	  Unicorn project. The Gunicorn server is broadly compatible
+	  with various web frameworks, simply implemented, light on
+	  server resource usage, and fairly speedy.
+
+	  http://gunicorn.org/
diff --git a/package/python-gunicorn/python-gunicorn.hash b/package/python-gunicorn/python-gunicorn.hash
new file mode 100644
index 000000000..a282bc995
--- /dev/null
+++ b/package/python-gunicorn/python-gunicorn.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi/gunicorn/json, sha256 locally computed
+md5	338e5e8a83ea0f0625f768dba4597530  gunicorn-19.6.0.tar.gz
+sha256	813f6916d18a4c8e90efde72f419308b357692f81333cb1125f80013d22fb618  gunicorn-19.6.0.tar.gz
diff --git a/package/python-gunicorn/python-gunicorn.mk b/package/python-gunicorn/python-gunicorn.mk
new file mode 100644
index 000000000..c33b753db
--- /dev/null
+++ b/package/python-gunicorn/python-gunicorn.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-gunicorn
+#
+################################################################################
+
+PYTHON_GUNICORN_VERSION = 19.6.0
+PYTHON_GUNICORN_SOURCE = gunicorn-$(PYTHON_GUNICORN_VERSION).tar.gz
+PYTHON_GUNICORN_SITE = https://pypi.python.org/packages/84/ce/7ea5396efad1cef682bbc4068e72a0276341d9d9d0f501da609fab9fcb80
+PYTHON_GUNICORN_SETUP_TYPE = setuptools
+PYTHON_GUNICORN_LICENSE = BSD-3c
+PYTHON_GUNICORN_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.11.0
