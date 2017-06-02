From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Fri,  2 Jun 2017 16:56:46 -0700
Subject: [Buildroot] [PATCH v3 04/11] package/python-ipython-genutils: New
	package
In-Reply-To: <20170602235653.4655-1-andrew.smirnov@gmail.com>
References: <20170602235653.4655-1-andrew.smirnov@gmail.com>
Message-ID: <20170602235653.4655-5-andrew.smirnov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add 'ipython_genutils'[1] package to Buildroot. Needed by 'traitlets'.

[1] https://pypi.python.org/pypi/ipython_genutils

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 DEVELOPERS                                                  |  1 +
 package/Config.in                                           |  1 +
 package/python-ipython-genutils/Config.in                   |  6 ++++++
 .../python-ipython-genutils/python-ipython-genutils.hash    |  3 +++
 package/python-ipython-genutils/python-ipython-genutils.mk  | 13 +++++++++++++
 5 files changed, 24 insertions(+)
 create mode 100644 package/python-ipython-genutils/Config.in
 create mode 100644 package/python-ipython-genutils/python-ipython-genutils.hash
 create mode 100644 package/python-ipython-genutils/python-ipython-genutils.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index fd63b2f..9450445 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -74,6 +74,7 @@ F:	package/wine/
 N:	Andrey Smirnov <andrew.smirnov@gmail.com>
 F:	package/python-decorator/
 F:	package/python-simplegeneric/
+F:	package/python-ipython-genutils/
 
 N:	Andrew Ruder <andrew.ruder@elecsyscorp.com>
 F:	package/expect/
diff --git a/package/Config.in b/package/Config.in
index d338bf4..b59510e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -736,6 +736,7 @@ menu "External python modules"
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
index 0000000..1efea2c
--- /dev/null
+++ b/package/python-ipython-genutils/python-ipython-genutils.hash
@@ -0,0 +1,3 @@
+# sha256 locally computed.
+md5 5a4f9781f78466da0ea1a648f3e1f79f ipython_genutils-0.2.0.tar.gz
+sha256 eb2e116e75ecef9d4d228fdc66af54269afa26ab4463042e33785b887c628ba8 ipython_genutils-0.2.0.tar.gz
diff --git a/package/python-ipython-genutils/python-ipython-genutils.mk b/package/python-ipython-genutils/python-ipython-genutils.mk
new file mode 100644
index 0000000..bd4944f
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
+PYTHON_IPYTHON_GENUTILS_SITE = https://pypi.python.org/packages/e8/69/fbeffffc05236398ebfcfb512b6d2511c622871dca1746361006da310399
+PYTHON_IPYTHON_GENUTILS_LICENSE = BSD-3-Clause
+PYTHON_IPYTHON_GENUTILS_SETUP_TYPE = distutils
+
+$(eval $(python-package))
-- 
2.9.4
