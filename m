From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Fri,  5 Jan 2018 13:13:07 -0800
Subject: [Buildroot] [PATCH v2 1/1] python-xlib: new package
In-Reply-To: <20180105000420.20152-1-joseph.kogut@gmail.com>
References: <20180105000420.20152-1-joseph.kogut@gmail.com>
Message-ID: <20180105211307.25071-1-joseph.kogut@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks for the review, Yegor!

Changes since v1:
- added runtime tag to python-six Config dependency
- remove unneeded command and newline from python-xlib.hash
- added host-python-setuptools-scm to build dependencies
- removed setup.py patch

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 DEVELOPERS                           |  1 +
 package/Config.in                    |  1 +
 package/python-xlib/Config.in        |  7 +++++++
 package/python-xlib/python-xlib.hash |  4 ++++
 package/python-xlib/python-xlib.mk   | 15 +++++++++++++++
 5 files changed, 28 insertions(+)
 create mode 100644 package/python-xlib/Config.in
 create mode 100644 package/python-xlib/python-xlib.hash
 create mode 100644 package/python-xlib/python-xlib.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index a9a9ac5a39..999e7d3300 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -848,6 +848,7 @@ F:	package/gconf/
 F:	package/python-raven/
 F:	package/python-schedule/
 F:	package/python-websockets/
+F:	package/python-xlib/

 N:	Johan Derycke <johanderycke@gmail.com>
 F:	package/python-libconfig/
diff --git a/package/Config.in b/package/Config.in
index 37b1e9fe4f..729d660d52 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -941,6 +941,7 @@ menu "External python modules"
 	source "package/python-whoosh/Config.in"
 	source "package/python-ws4py/Config.in"
 	source "package/python-wsaccel/Config.in"
+	source "package/python-xlib/Config.in"
 	source "package/python-xlrd/Config.in"
 	source "package/python-xlsxwriter/Config.in"
 	source "package/python-xlutils/Config.in"
diff --git a/package/python-xlib/Config.in b/package/python-xlib/Config.in
new file mode 100644
index 0000000000..081af6a2fc
--- /dev/null
+++ b/package/python-xlib/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_XLIB
+	bool "python-xlib"
+	select BR2_PACKAGE_PYTHON_SIX # runtime
+	help
+	  XLib in pure Python (Py2/Py3 compatible)
+
+	  https://github.com/python-xlib/python-xlib
diff --git a/package/python-xlib/python-xlib.hash b/package/python-xlib/python-xlib.hash
new file mode 100644
index 0000000000..5cb9806856
--- /dev/null
+++ b/package/python-xlib/python-xlib.hash
@@ -0,0 +1,4 @@
+# md5 from https://pypi.python.org/pypi/python-xlib/json, sha256 locally computed
+md5 cdf342aa145c2be0ccae46cfb7b62551 python-xlib-0.21.tar.bz2
+sha256 25aad0056172920552c01a163e979b02336abaf47b0792dae9c93ecb29500431 python-xlib-0.21.tar.bz2
+sha256 5ce9459bc19ced99cc9eb135d4f559ed01e336354bdf16dd998be85aa688c233 LICENSE
diff --git a/package/python-xlib/python-xlib.mk b/package/python-xlib/python-xlib.mk
new file mode 100644
index 0000000000..5476edfe0d
--- /dev/null
+++ b/package/python-xlib/python-xlib.mk
@@ -0,0 +1,15 @@
+###############################################################################
+#
+# python-xlib
+#
+###############################################################################
+
+PYTHON_XLIB_VERSION = 0.21
+PYTHON_XLIB_SOURCE = python-xlib-$(PYTHON_XLIB_VERSION).tar.bz2
+PYTHON_XLIB_SITE = https://pypi.python.org/packages/eb/de/b0eaaea7b8512dc41504db071824eef30293ff55c58d83081ebaebe85a38
+PYTHON_XLIB_SETUP_TYPE = setuptools
+PYTHON_XLIB_LICENSE = LGPL-2.0+
+PYTHON_XLIB_LICENSE_FILES = LICENSE
+PYTHON_XLIB_DEPENDENCIES = host-python-setuptools-scm
+
+$(eval $(python-package))
--
2.15.1
