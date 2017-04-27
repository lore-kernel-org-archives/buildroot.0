From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Thu, 27 Apr 2017 14:33:34 -0700
Subject: [Buildroot] [PATCH v2 04/10] package/python-ipython-genutils: New
	package
In-Reply-To: <20170427213340.26917-1-andrew.smirnov@gmail.com>
References: <20170427213340.26917-1-andrew.smirnov@gmail.com>
Message-ID: <20170427213340.26917-5-andrew.smirnov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add 'ipython_genutils'[1] package to Buildroot. Needed by IPython.

[1] https://pypi.python.org/pypi/ipython_genutils

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 package/Config.in                                           |  1 +
 package/python-ipython-genutils/Config.in                   |  6 ++++++
 .../python-ipython-genutils/python-ipython-genutils.hash    |  3 +++
 package/python-ipython-genutils/python-ipython-genutils.mk  | 13 +++++++++++++
 4 files changed, 23 insertions(+)
 create mode 100644 package/python-ipython-genutils/Config.in
 create mode 100644 package/python-ipython-genutils/python-ipython-genutils.hash
 create mode 100644 package/python-ipython-genutils/python-ipython-genutils.mk

diff --git a/package/Config.in b/package/Config.in
index 1a0702d..143bccc 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -735,6 +735,7 @@ menu "External python modules"
 	source "package/python-ipaddress/Config.in"
 	source "package/python-ipy/Config.in"
 	source "package/python-ipython/Config.in"
+	source "package/python-ipython-genutils/Config.in"
 	source "package/python-itsdangerous/Config.in"
 	source "package/python-jinja2/Config.in"
 	source "package/python-jsonschema/Config.in"
diff --git a/package/python-ipython-genutils/Config.in b/package/python-ipython-genutils/Config.in
new file mode 100644
index 0000000..d49442e
--- /dev/null
+++ b/package/python-ipython-genutils/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_IPYTHON_GENUTILS
+	bool "python-ipython-genutils"
+	help
+	  IPython vestigial utilities
+
+	  https://pypi.python.org/pypi/ipython_genutils
diff --git a/package/python-ipython-genutils/python-ipython-genutils.hash b/package/python-ipython-genutils/python-ipython-genutils.hash
new file mode 100644
index 0000000..76a74c9
--- /dev/null
+++ b/package/python-ipython-genutils/python-ipython-genutils.hash
@@ -0,0 +1,3 @@
+# sha256 locally computed.
+
+sha256  424a6ecb33b8c9a8320f8601c533067ed75b491e4bc31621d6278f288497cb1a ipython_genutils-0.2.0.tar.gz
diff --git a/package/python-ipython-genutils/python-ipython-genutils.mk b/package/python-ipython-genutils/python-ipython-genutils.mk
new file mode 100644
index 0000000..e888300
--- /dev/null
+++ b/package/python-ipython-genutils/python-ipython-genutils.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-ipython-genutils
+#
+################################################################################
+
+PYTHON_IPYTHON_GENUTILS_VERSION = 0.2.0
+PYTHON_IPYTHON_GENUTILS_SOURCE = ipython_genutils-$(PYTHON_IPYTHON_GENUTILS_VERSION).tar.gz
+PYTHON_IPYTHON_GENUTILS_SITE = $(call github,ipython,ipython_genutils,$(PYTHON_IPYTHON_GENUTILS_VERSION))
+PYTHON_IPYTHON_GENUTILS_LICENSE = BSD-3-Clause
+PYTHON_IPYTHON_GENUTILS_SETUP_TYPE = distutils
+
+$(eval $(python-package))
-- 
2.9.3
