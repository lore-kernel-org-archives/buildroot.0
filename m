From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Thu, 27 Apr 2017 14:33:35 -0700
Subject: [Buildroot] [PATCH v2 05/10] package/python-scandir: New package
In-Reply-To: <20170427213340.26917-1-andrew.smirnov@gmail.com>
References: <20170427213340.26917-1-andrew.smirnov@gmail.com>
Message-ID: <20170427213340.26917-6-andrew.smirnov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add 'scandir'[1] package to buildroot. Needed by 'pathlib2'.

[1] https://pypi.python.org/pypi/scandir
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 package/Config.in                          |  1 +
 package/python-scandir/Config.in           |  6 ++++++
 package/python-scandir/python-scandir.hash |  2 ++
 package/python-scandir/python-scandir.mk   | 13 +++++++++++++
 4 files changed, 22 insertions(+)
 create mode 100644 package/python-scandir/Config.in
 create mode 100644 package/python-scandir/python-scandir.hash
 create mode 100644 package/python-scandir/python-scandir.mk

diff --git a/package/Config.in b/package/Config.in
index 143bccc..c64105e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -823,6 +823,7 @@ menu "External python modules"
 	source "package/python-rpi-gpio/Config.in"
 	source "package/python-rtslib-fb/Config.in"
 	source "package/python-scapy3k/Config.in"
+	source "package/python-scandir/Config.in"
 	source "package/python-sdnotify/Config.in"
 	source "package/python-serial/Config.in"
 	source "package/python-service-identity/Config.in"
diff --git a/package/python-scandir/Config.in b/package/python-scandir/Config.in
new file mode 100644
index 0000000..5e8ca0d
--- /dev/null
+++ b/package/python-scandir/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_SCANDIR
+	bool "python-scandir"
+	help
+	  A configuration system for Python applications.
+
+	  https://pypi.python.org/pypi/pickleshare
diff --git a/package/python-scandir/python-scandir.hash b/package/python-scandir/python-scandir.hash
new file mode 100644
index 0000000..a7ee337
--- /dev/null
+++ b/package/python-scandir/python-scandir.hash
@@ -0,0 +1,2 @@
+# sha256 locally computed
+sha256 c2612d1a487d80fb4701b4a91ca1b8f8a695b1ae820570815e85e8c8b23f1283 scandir-1.5.tar.gz
diff --git a/package/python-scandir/python-scandir.mk b/package/python-scandir/python-scandir.mk
new file mode 100644
index 0000000..cf921ae
--- /dev/null
+++ b/package/python-scandir/python-scandir.mk
@@ -0,0 +1,13 @@
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
+PYTHON_SCANDIR_SETUP_TYPE = distutils
+
+$(eval $(python-package))
-- 
2.9.3
