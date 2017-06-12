From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Mon, 12 Jun 2017 16:42:10 -0700
Subject: [Buildroot] [PATCH v4 1/7] package/python-traitlets: New package
In-Reply-To: <20170612234216.902-1-andrew.smirnov@gmail.com>
References: <20170612234216.902-1-andrew.smirnov@gmail.com>
Message-ID: <20170612234216.902-2-andrew.smirnov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add 'traitlets'[1] package to Buildroot. Needed by IPython.

[1] https://pypi.python.org/pypi/traitlets

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 DEVELOPERS                                     |  1 +
 package/Config.in                              |  1 +
 package/python-traitlets/Config.in             | 10 ++++++++++
 package/python-traitlets/python-traitlets.hash |  3 +++
 package/python-traitlets/python-traitlets.mk   | 14 ++++++++++++++
 5 files changed, 29 insertions(+)
 create mode 100644 package/python-traitlets/Config.in
 create mode 100644 package/python-traitlets/python-traitlets.hash
 create mode 100644 package/python-traitlets/python-traitlets.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 7d8b410..39aed97 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -84,6 +84,7 @@ N:	Andrey Smirnov <andrew.smirnov@gmail.com>
 F:	package/python-decorator/
 F:	package/python-ipython-genutils/
 F:	package/python-simplegeneric/
+F:	package/python-traitlets/
 
 N:	Andy Kennedy <andy.kennedy@adtran.com>
 F:	package/libunwind/
diff --git a/package/Config.in b/package/Config.in
index 02ae1c3..2341950 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -855,6 +855,7 @@ menu "External python modules"
 	source "package/python-tomako/Config.in"
 	source "package/python-toml/Config.in"
 	source "package/python-tornado/Config.in"
+	source "package/python-traitlets/Config.in"
 	source "package/python-treq/Config.in"
 	source "package/python-twisted/Config.in"
 	source "package/python-txaio/Config.in"
diff --git a/package/python-traitlets/Config.in b/package/python-traitlets/Config.in
new file mode 100644
index 0000000..f1804e5
--- /dev/null
+++ b/package/python-traitlets/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_PYTHON_TRAITLETS
+	bool "python-traitlets"
+	select BR2_PACKAGE_PYTHON_ENUM34 if BR2_PACKAGE_PYTHON # runtime
+	select BR2_PACKAGE_PYTHON_SIX  # runtime
+	select BR2_PACKAGE_PYTHON_IPYTHON_GENUTILS  # runtime
+	select BR2_PACKAGE_PYTHON_DECORATOR  # runtime
+	help
+	  A configuration system for Python applications.
+
+	  https://pypi.python.org/pypi/traitlets
diff --git a/package/python-traitlets/python-traitlets.hash b/package/python-traitlets/python-traitlets.hash
new file mode 100644
index 0000000..23aa159
--- /dev/null
+++ b/package/python-traitlets/python-traitlets.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi/traitlets/json, sha256 locally computed
+md5 3068663f2f38fd939a9eb3a500ccc154 traitlets-4.3.2.tar.gz
+sha256 9c4bd2d267b7153df9152698efb1050a5d84982d3384a37b2c1f7723ba3e7835 traitlets-4.3.2.tar.gz
diff --git a/package/python-traitlets/python-traitlets.mk b/package/python-traitlets/python-traitlets.mk
new file mode 100644
index 0000000..c711bde
--- /dev/null
+++ b/package/python-traitlets/python-traitlets.mk
@@ -0,0 +1,14 @@
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
+PYTHON_TRAITLETS_LICENSE_FILE = COPYING.md
+PYTHON_TRAITLETS_SETUP_TYPE = distutils
+
+$(eval $(python-package))
-- 
2.9.4
