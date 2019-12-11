From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Dec 2019 18:51:43 -0700
Subject: [Buildroot] [PATCH 1/1] package/python-sockjs: new package
Message-ID: <20191211015143.28688-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

SockJS server implementation for aiohttp.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 DEVELOPERS                               |  1 +
 package/Config.in                        |  1 +
 package/python-sockjs/Config.in          |  8 ++++++++
 package/python-sockjs/python-sockjs.hash |  5 +++++
 package/python-sockjs/python-sockjs.mk   | 14 ++++++++++++++
 5 files changed, 29 insertions(+)
 create mode 100644 package/python-sockjs/Config.in
 create mode 100644 package/python-sockjs/python-sockjs.hash
 create mode 100644 package/python-sockjs/python-sockjs.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 61bcd99d43..edeff34d13 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1144,6 +1144,7 @@ F:	package/python-brotli/
 F:	package/python-cchardet/
 F:	package/python-multidict/
 F:	package/python-pycares/
+F:	package/python-sockjs/
 F:	package/python-terminaltables/
 F:	package/python-yarl/
 
diff --git a/package/Config.in b/package/Config.in
index 307583d01f..f813c2cc10 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1102,6 +1102,7 @@ menu "External python modules"
 	source "package/python-slob/Config.in"
 	source "package/python-smbus-cffi/Config.in"
 	source "package/python-socketio/Config.in"
+	source "package/python-sockjs/Config.in"
 	source "package/python-sortedcontainers/Config.in"
 	source "package/python-soupsieve/Config.in"
 	source "package/python-spidev/Config.in"
diff --git a/package/python-sockjs/Config.in b/package/python-sockjs/Config.in
new file mode 100644
index 0000000000..583d7ec741
--- /dev/null
+++ b/package/python-sockjs/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_SOCKJS
+	bool "python-sockjs"
+	depends on BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON_AIOHTTP # runtime
+	help
+	  SockJS server implementation for aiohttp.
+
+	  https://github.com/aio-libs/sockjs/
diff --git a/package/python-sockjs/python-sockjs.hash b/package/python-sockjs/python-sockjs.hash
new file mode 100644
index 0000000000..55ea9dc644
--- /dev/null
+++ b/package/python-sockjs/python-sockjs.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/sockjs/json
+md5	369417bd103f841f236a8623ea29353c  sockjs-0.10.0.tar.gz
+sha256	005a820387bb4611b59341eac091b05d4204050dd42e4ea6cfb83607e23e2f06  sockjs-0.10.0.tar.gz
+# Locally computed sha256 checksums
+sha256	7be23c071df0314fadeba6077a3830340a5121ad88bfa66b0c095051a766e141  LICENSE.txt
diff --git a/package/python-sockjs/python-sockjs.mk b/package/python-sockjs/python-sockjs.mk
new file mode 100644
index 0000000000..e0f58e2b61
--- /dev/null
+++ b/package/python-sockjs/python-sockjs.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-sockjs
+#
+################################################################################
+
+PYTHON_SOCKJS_VERSION = 0.10.0
+PYTHON_SOCKJS_SOURCE = sockjs-$(PYTHON_SOCKJS_VERSION).tar.gz
+PYTHON_SOCKJS_SITE = https://files.pythonhosted.org/packages/35/0e/6aa4f3283b064b04a0c7f3859c8c2c0b736c05cfb07853b6d94073c1bf63
+PYTHON_SOCKJS_SETUP_TYPE = setuptools
+PYTHON_SOCKJS_LICENSE = Apache-2.0
+PYTHON_SOCKJS_LICENSE_FILES = LICENSE.txt
+
+$(eval $(python-package))
-- 
2.20.1
