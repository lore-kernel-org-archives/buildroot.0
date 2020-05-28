From: Asaf Kahlon <asafka7@gmail.com>
Date: Thu, 28 May 2020 12:52:04 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-ipdb: new package
Message-ID: <20200528095204.540452-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

IPython-enabled pdb.

This package can be very helpful when someone wants to debug
a Python application on the board itself.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/Config.in                    |  1 +
 package/python-ipdb/Config.in        |  9 +++++++++
 package/python-ipdb/python-ipdb.hash |  5 +++++
 package/python-ipdb/python-ipdb.mk   | 14 ++++++++++++++
 4 files changed, 29 insertions(+)
 create mode 100644 package/python-ipdb/Config.in
 create mode 100644 package/python-ipdb/python-ipdb.hash
 create mode 100644 package/python-ipdb/python-ipdb.mk

diff --git a/package/Config.in b/package/Config.in
index 85d7326361..be3571fe13 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -989,6 +989,7 @@ menu "External python modules"
 	source "package/python-iowait/Config.in"
 	source "package/python-ipaddr/Config.in"
 	source "package/python-ipaddress/Config.in"
+	source "package/python-ipdb/Config.in"
 	source "package/python-iptables/Config.in"
 	source "package/python-ipy/Config.in"
 	source "package/python-ipython/Config.in"
diff --git a/package/python-ipdb/Config.in b/package/python-ipdb/Config.in
new file mode 100644
index 0000000000..4a89bf75de
--- /dev/null
+++ b/package/python-ipdb/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_IPDB
+	bool "python-ipdb"
+	depends on BR2_PACKAGE_PYTHON3 # python-ipython
+	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
+	select BR2_PACKAGE_PYTHON_IPYTHON # runtime
+	help
+	  IPython-enabled pdb.
+
+	  https://github.com/gotcha/ipdb
diff --git a/package/python-ipdb/python-ipdb.hash b/package/python-ipdb/python-ipdb.hash
new file mode 100644
index 0000000000..c7cd93225d
--- /dev/null
+++ b/package/python-ipdb/python-ipdb.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/ipdb/json
+md5  7db72771b279924ac4e5905d7eee184e  ipdb-0.13.2.tar.gz
+sha256  77fb1c2a6fccdfee0136078c9ed6fe547ab00db00bebff181f1e8c9e13418d49  ipdb-0.13.2.tar.gz
+# Locally computed sha256 checksums
+sha256  4eeb49de04f4894f8ea1f69a04f500799041b750b3d554c06de5ca877258e734  COPYING.txt
diff --git a/package/python-ipdb/python-ipdb.mk b/package/python-ipdb/python-ipdb.mk
new file mode 100644
index 0000000000..c98f9700b2
--- /dev/null
+++ b/package/python-ipdb/python-ipdb.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-ipdb
+#
+################################################################################
+
+PYTHON_IPDB_VERSION = 0.13.2
+PYTHON_IPDB_SOURCE = ipdb-$(PYTHON_IPDB_VERSION).tar.gz
+PYTHON_IPDB_SITE = https://files.pythonhosted.org/packages/2c/bb/a3e1a441719ebd75c6dac8170d3ddba884b7ee8a5c0f9aefa7297386627a
+PYTHON_IPDB_SETUP_TYPE = setuptools
+PYTHON_IPDB_LICENSE = BSD-3-Clause
+PYTHON_IPDB_LICENSE_FILES = COPYING.txt
+
+$(eval $(python-package))
-- 
2.26.2
