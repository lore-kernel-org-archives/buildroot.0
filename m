From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Fri,  2 Jun 2017 16:56:47 -0700
Subject: [Buildroot] [PATCH v3 05/11] package/python-traitlets: New package
In-Reply-To: <20170602235653.4655-1-andrew.smirnov@gmail.com>
References: <20170602235653.4655-1-andrew.smirnov@gmail.com>
Message-ID: <20170602235653.4655-6-andrew.smirnov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add 'traitlets'[1] package to Buildroot. Needed by IPython.

[1] https://pypi.python.org/pypi/traitlets

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 DEVELOPERS                                     |  1 +
 package/Config.in                              |  1 +
 package/python-traitlets/Config.in             | 10 ++++++++++
 package/python-traitlets/python-traitlets.hash |  3 +++
 package/python-traitlets/python-traitlets.mk   | 13 +++++++++++++
 5 files changed, 28 insertions(+)
 create mode 100644 package/python-traitlets/Config.in
 create mode 100644 package/python-traitlets/python-traitlets.hash
 create mode 100644 package/python-traitlets/python-traitlets.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 9450445..fdc5115 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -75,6 +75,7 @@ N:	Andrey Smirnov <andrew.smirnov@gmail.com>
 F:	package/python-decorator/
 F:	package/python-simplegeneric/
 F:	package/python-ipython-genutils/
+F:	package/python-traitlets/
 
 N:	Andrew Ruder <andrew.ruder@elecsyscorp.com>
 F:	package/expect/
diff --git a/package/Config.in b/package/Config.in
index b59510e..4f69076 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -846,6 +846,7 @@ menu "External python modules"
 	source "package/python-tomako/Config.in"
 	source "package/python-toml/Config.in"
 	source "package/python-tornado/Config.in"
+	source "package/python-traitlets/Config.in"
 	source "package/python-treq/Config.in"
 	source "package/python-twisted/Config.in"
 	source "package/python-txaio/Config.in"
diff --git a/package/python-traitlets/Config.in b/package/python-traitlets/Config.in
new file mode 100644
index 0000000..e4ff0b7
--- /dev/null
+++ b/package/python-traitlets/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_PYTHON_TRAITLETS
+	bool "python-traitlets"
+	select BR2_PACKAGE_PYTHON_ENUM34 if BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON_SIX
+	select BR2_PACKAGE_PYTHON_IPYTHON_GENUTILS
+	select BR2_PACKAGE_PYTHON_DECORATOR
+	help
+	  A configuration system for Python applications.
+
+	  https://pypi.python.org/pypi/traitlets
diff --git a/package/python-traitlets/python-traitlets.hash b/package/python-traitlets/python-traitlets.hash
new file mode 100644
index 0000000..8111340
--- /dev/null
+++ b/package/python-traitlets/python-traitlets.hash
@@ -0,0 +1,3 @@
+# MD5 from PyPI, sha256 locally computed
+md5 3068663f2f38fd939a9eb3a500ccc154 traitlets-4.3.2.tar.gz
+sha256 9c4bd2d267b7153df9152698efb1050a5d84982d3384a37b2c1f7723ba3e7835 traitlets-4.3.2.tar.gz
diff --git a/package/python-traitlets/python-traitlets.mk b/package/python-traitlets/python-traitlets.mk
new file mode 100644
index 0000000..7cd6acd
--- /dev/null
+++ b/package/python-traitlets/python-traitlets.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-traitlets
+#
+################################################################################
+
+PYTHON_TRAITLETS_VERSION = 4.3.2
+PYTHON_TRAITLETS_SOURCE = traitlets-$(PYTHON_TRAITLETS_VERSION).tar.gz
+PYTHON_TRAITLETS_SITE = https://pypi.python.org/packages/a5/98/7f5ef2fe9e9e071813aaf9cb91d1a732e0a68b6c44a32b38cb8e14c3f069
+PYTHON_TRAITLETS_LICENSE = BSD-3-Clause
+PYTHON_TRAITLETS_SETUP_TYPE = distutils
+
+$(eval $(python-package))
-- 
2.9.4
