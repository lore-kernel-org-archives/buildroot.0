From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Mon, 20 Mar 2017 15:36:20 +0100
Subject: [Buildroot] [PATCH] python-sortedcontainers: new package
Message-ID: <20170320143620.8721-1-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in                                          |  1 +
 package/python-sortedcontainers/Config.in                  |  7 +++++++
 .../python-sortedcontainers/python-sortedcontainers.hash   |  3 +++
 package/python-sortedcontainers/python-sortedcontainers.mk | 14 ++++++++++++++
 4 files changed, 25 insertions(+)
 create mode 100644 package/python-sortedcontainers/Config.in
 create mode 100644 package/python-sortedcontainers/python-sortedcontainers.hash
 create mode 100644 package/python-sortedcontainers/python-sortedcontainers.mk

diff --git a/package/Config.in b/package/Config.in
index 9f4b55020..cd9d06dc1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -825,6 +825,7 @@ menu "External python modules"
 	source "package/python-slob/Config.in"
 	source "package/python-smbus-cffi/Config.in"
 	source "package/python-socketio/Config.in"
+	source "package/python-sortedcontainers//Config.in"
 	source "package/python-spidev/Config.in"
 	source "package/python-thrift/Config.in"
 	source "package/python-tomako/Config.in"
diff --git a/package/python-sortedcontainers/Config.in b/package/python-sortedcontainers/Config.in
new file mode 100644
index 000000000..43bd1b1c0
--- /dev/null
+++ b/package/python-sortedcontainers/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_SORTEDCONTAINERS
+	bool "python-sortedcontainers"
+	help
+	  Python Sorted Container Types: SortedList, SortedDict, and
+	  SortedSet.
+
+	  http://www.grantjenks.com/docs/sortedcontainers/
diff --git a/package/python-sortedcontainers/python-sortedcontainers.hash b/package/python-sortedcontainers/python-sortedcontainers.hash
new file mode 100644
index 000000000..11fa07660
--- /dev/null
+++ b/package/python-sortedcontainers/python-sortedcontainers.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi/sortedcontainers/json, sha256 locally computed
+md5	ad4f00e377ad934954ac90fcac0b185f  sortedcontainers-1.5.7.tar.gz
+sha256	0ff0442865e492bc50476b18000fb8400cf2472d14d21a92b27cd7c5184550ea  sortedcontainers-1.5.7.tar.gz
diff --git a/package/python-sortedcontainers/python-sortedcontainers.mk b/package/python-sortedcontainers/python-sortedcontainers.mk
new file mode 100644
index 000000000..99606816a
--- /dev/null
+++ b/package/python-sortedcontainers/python-sortedcontainers.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-sortedcontainers
+#
+################################################################################
+
+PYTHON_SORTEDCONTAINERS_VERSION = 1.5.7
+PYTHON_SORTEDCONTAINERS_SOURCE = sortedcontainers-$(PYTHON_SORTEDCONTAINERS_VERSION).tar.gz
+PYTHON_SORTEDCONTAINERS_SITE = https://pypi.python.org/packages/8d/aa/5369362d730728639ba434318df26b5c554804578d1c48381367ea5377c6
+PYTHON_SORTEDCONTAINERS_SETUP_TYPE = setuptools
+PYTHON_SORTEDCONTAINERS_LICENSE = Apache-2.0
+PYTHON_SORTEDCONTAINERS_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.11.0
