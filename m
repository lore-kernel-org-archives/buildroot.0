From: Alexey Roslyakov <alexey.roslyakov@gmail.com>
Date: Fri, 14 Jul 2017 12:37:58 +0700
Subject: [Buildroot] [PATCH 1/3] python-greenlet: new package
Message-ID: <20170714053800.20007-1-alexey.roslyakov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alexey Roslyakov <alexey.roslyakov@gmail.com>
---
 package/Config.in                            |  1 +
 package/python-greenlet/Config.in            |  6 ++++++
 package/python-greenlet/python-greenlet.hash |  3 +++
 package/python-greenlet/python-greenlet.mk   | 14 ++++++++++++++
 4 files changed, 24 insertions(+)
 create mode 100644 package/python-greenlet/Config.in
 create mode 100644 package/python-greenlet/python-greenlet.hash
 create mode 100644 package/python-greenlet/python-greenlet.mk

diff --git a/package/Config.in b/package/Config.in
index b48ab5e0dd..e09327168b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -738,6 +738,7 @@ menu "External python modules"
 	source "package/python-flup/Config.in"
 	source "package/python-futures/Config.in"
 	source "package/python-gobject/Config.in"
+	source "package/python-greenlet/Config.in"
 	source "package/python-gunicorn/Config.in"
 	source "package/python-html5lib/Config.in"
 	source "package/python-httplib2/Config.in"
diff --git a/package/python-greenlet/Config.in b/package/python-greenlet/Config.in
new file mode 100644
index 0000000000..1b24141d5e
--- /dev/null
+++ b/package/python-greenlet/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_GREENLET
+	bool "python-greenlet"
+	help
+	  Lightweight in-process concurrent programming for Python
+
+	  https://pypi.python.org/pypi/greenlet/
diff --git a/package/python-greenlet/python-greenlet.hash b/package/python-greenlet/python-greenlet.hash
new file mode 100644
index 0000000000..0ad9e41025
--- /dev/null
+++ b/package/python-greenlet/python-greenlet.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=e8637647d58a26c4a1f51ca393e53c00, sha256 locally computed
+md5	e8637647d58a26c4a1f51ca393e53c00 greenlet-0.4.12.tar.gz
+sha256 e4c99c6010a5d153d481fdaf63b8a0782825c0721506d880403a3b9b82ae347e greenlet-0.4.12.tar.gz
diff --git a/package/python-greenlet/python-greenlet.mk b/package/python-greenlet/python-greenlet.mk
new file mode 100644
index 0000000000..b5b234c7c2
--- /dev/null
+++ b/package/python-greenlet/python-greenlet.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-greenlet
+#
+################################################################################
+
+PYTHON_GREENLET_VERSION = 0.4.12
+PYTHON_GREENLET_SOURCE = greenlet-$(PYTHON_GREENLET_VERSION).tar.gz
+PYTHON_GREENLET_SITE = https://pypi.python.org/packages/be/76/82af375d98724054b7e273b5d9369346937324f9bcc20980b45b068ef0b0
+PYTHON_GREENLET_LICENSE = MIT
+PYTHON_GREENLET_LICENSE_FILES = LICENSE
+PYTHON_GREENLET_SETUP_TYPE = distutils
+
+$(eval $(python-package))
-- 
2.13.0
