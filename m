From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Fri,  2 Jun 2017 16:56:48 -0700
Subject: [Buildroot] [PATCH v3 06/11] package/python-scandir: New package
In-Reply-To: <20170602235653.4655-1-andrew.smirnov@gmail.com>
References: <20170602235653.4655-1-andrew.smirnov@gmail.com>
Message-ID: <20170602235653.4655-7-andrew.smirnov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add 'scandir'[1] package to buildroot. Needed by 'pathlib2'.

[1] https://pypi.python.org/pypi/scandir
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 DEVELOPERS                                 |  1 +
 package/Config.in                          |  1 +
 package/python-scandir/Config.in           |  6 ++++++
 package/python-scandir/python-scandir.hash |  3 +++
 package/python-scandir/python-scandir.mk   | 17 +++++++++++++++++
 5 files changed, 28 insertions(+)
 create mode 100644 package/python-scandir/Config.in
 create mode 100644 package/python-scandir/python-scandir.hash
 create mode 100644 package/python-scandir/python-scandir.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index fdc5115..9f73942 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -76,6 +76,7 @@ F:	package/python-decorator/
 F:	package/python-simplegeneric/
 F:	package/python-ipython-genutils/
 F:	package/python-traitlets/
+F:	package/python-scandir/
 
 N:	Andrew Ruder <andrew.ruder@elecsyscorp.com>
 F:	package/expect/
diff --git a/package/Config.in b/package/Config.in
index 4f69076..806f0ae 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -824,6 +824,7 @@ menu "External python modules"
 	source "package/python-rpi-gpio/Config.in"
 	source "package/python-rtslib-fb/Config.in"
 	source "package/python-scapy3k/Config.in"
+	source "package/python-scandir/Config.in"
 	source "package/python-sdnotify/Config.in"
 	source "package/python-serial/Config.in"
 	source "package/python-service-identity/Config.in"
diff --git a/package/python-scandir/Config.in b/package/python-scandir/Config.in
new file mode 100644
index 0000000..497f962
--- /dev/null
+++ b/package/python-scandir/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_SCANDIR
+	bool "python-scandir"
+	help
+	  scandir, a better directory iterator and faster os.walk()
+
+	  https://pypi.python.org/pypi/scandir
diff --git a/package/python-scandir/python-scandir.hash b/package/python-scandir/python-scandir.hash
new file mode 100644
index 0000000..895f575
--- /dev/null
+++ b/package/python-scandir/python-scandir.hash
@@ -0,0 +1,3 @@
+# md5 from PyPI, sha256 locally computed
+md5 a2713043de681bba6b084be42e7a8a44 scandir-1.5.tar.gz
+sha256 c2612d1a487d80fb4701b4a91ca1b8f8a695b1ae820570815e85e8c8b23f1283 scandir-1.5.tar.gz
diff --git a/package/python-scandir/python-scandir.mk b/package/python-scandir/python-scandir.mk
new file mode 100644
index 0000000..e933003
--- /dev/null
+++ b/package/python-scandir/python-scandir.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# python-scandir
+#
+################################################################################
+
+PYTHON_SCANDIR_VERSION = 1.5
+PYTHON_SCANDIR_SOURCE = scandir-$(PYTHON_SCANDIR_VERSION).tar.gz
+PYTHON_SCANDIR_SITE = https://pypi.python.org/packages/bd/f4/3143e0289faf0883228017dbc6387a66d0b468df646645e29e1eb89ea10e
+PYTHON_SCANDIR_LICENSE = BSD-3-Clause
+#
+# Avoid installing as zipped .egg, but choosing
+# setuptools/--single-version-externally-managed instead of distutils
+#
+PYTHON_SCANDIR_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
-- 
2.9.4
