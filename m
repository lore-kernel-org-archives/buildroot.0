From: Asaf Kahlon <asafka7@gmail.com>
Date: Sat, 22 Sep 2018 22:36:30 +0300
Subject: [Buildroot] [PATCH 3/4] python-pysmi: new package
In-Reply-To: <20180922193631.14369-1-asafka7@gmail.com>
References: <20180922193631.14369-1-asafka7@gmail.com>
Message-ID: <20180922193631.14369-3-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

SNMP SMI/MIB Parser.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 DEVELOPERS                             |  1 +
 package/Config.in                      |  1 +
 package/python-pysmi/Config.in         |  7 +++++++
 package/python-pysmi/python-pysmi.hash |  5 +++++
 package/python-pysmi/python-pysmi.mk   | 14 ++++++++++++++
 5 files changed, 28 insertions(+)
 create mode 100644 package/python-pysmi/Config.in
 create mode 100644 package/python-pysmi/python-pysmi.hash
 create mode 100644 package/python-pysmi/python-pysmi.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 03ea952377..451fa59ac5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -208,6 +208,7 @@ F:	package/python-ply/
 F:	package/python-pyasn1/
 F:	package/python-pycryptodomex/
 F:	package/python-pyroute2/
+F:	package/python-pysmi/
 F:	package/python-pytz/
 F:	package/python-reentry/
 F:	package/python-subprocess32/
diff --git a/package/Config.in b/package/Config.in
index cdfdcbe726..5bb16a12c8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -948,6 +948,7 @@ menu "External python modules"
 	source "package/python-pyroute2/Config.in"
 	source "package/python-pysendfile/Config.in"
 	source "package/python-pysmb/Config.in"
+	source "package/python-pysmi/Config.in"
 	source "package/python-pysnmp/Config.in"
 	source "package/python-pysnmp-apps/Config.in"
 	source "package/python-pysnmp-mibs/Config.in"
diff --git a/package/python-pysmi/Config.in b/package/python-pysmi/Config.in
new file mode 100644
index 0000000000..2e4453d886
--- /dev/null
+++ b/package/python-pysmi/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_PYSMI
+	bool "python-pysmi"
+	select BR2_PACKAGE_PYTHON_PLY # runtime
+	help
+	  SNMP SMI/MIB Parser.
+
+	  https://github.com/etingof/pysmi
diff --git a/package/python-pysmi/python-pysmi.hash b/package/python-pysmi/python-pysmi.hash
new file mode 100644
index 0000000000..f3ca8a9e6a
--- /dev/null
+++ b/package/python-pysmi/python-pysmi.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/pysmi/json
+md5	3293518c06b90bb45856cb0e0deb71d1  pysmi-0.3.1.tar.gz
+sha256	b1746f559b0d3dbaa6b7993936f215617271efde022dc3eb3166fd62380d8887  pysmi-0.3.1.tar.gz
+# Locally computed sha256 checksums
+sha256	ac2f8f67cae76e36a25496fbdf3293dd14b3d6db63f1ce4242ae9dd4fb7b90fd  LICENSE.rst
diff --git a/package/python-pysmi/python-pysmi.mk b/package/python-pysmi/python-pysmi.mk
new file mode 100644
index 0000000000..3aa4f76474
--- /dev/null
+++ b/package/python-pysmi/python-pysmi.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-pysmi
+#
+################################################################################
+
+PYTHON_PYSMI_VERSION = 0.3.1
+PYTHON_PYSMI_SOURCE = pysmi-$(PYTHON_PYSMI_VERSION).tar.gz
+PYTHON_PYSMI_SITE = https://files.pythonhosted.org/packages/8f/14/68331f94a5cd94e00ff064c9a790e6d7b0a0ade8c66deafa543398ca72ee
+PYTHON_PYSMI_SETUP_TYPE = setuptools
+PYTHON_PYSMI_LICENSE = BSD-2-Clause
+PYTHON_PYSMI_LICENSE_FILES = LICENSE.rst
+
+$(eval $(python-package))
-- 
2.17.1
