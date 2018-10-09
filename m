From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 9 Oct 2018 21:29:25 +0200
Subject: [Buildroot] [git commit] python-pysmi: new package
Message-ID: <20181009193406.2349881132@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fa1abca4184f42c28a44a90430a6b29358043a8f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

SNMP SMI/MIB Parser.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                             |  1 +
 package/Config.in                      |  1 +
 package/python-pysmi/Config.in         |  7 +++++++
 package/python-pysmi/python-pysmi.hash |  5 +++++
 package/python-pysmi/python-pysmi.mk   | 14 ++++++++++++++
 5 files changed, 28 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 031a162c58..4d2400e6fb 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -223,6 +223,7 @@ F:	package/python-pyhamcrest/
 F:	package/python-pyopenssl/
 F:	package/python-pyqrcode/
 F:	package/python-pyroute2/
+F:	package/python-pysmi/
 F:	package/python-pytz/
 F:	package/python-reentry/
 F:	package/python-sdnotify/
diff --git a/package/Config.in b/package/Config.in
index 125a7a85f1..539e4f30ac 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -967,6 +967,7 @@ menu "External python modules"
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
