From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 4 Oct 2018 13:52:04 +0200
Subject: [Buildroot] [git commit] python-pyasn1-modules: new package
Message-ID: <20181004115819.6CFEC8B64D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dcc89b7602afb66b72c5ab42ebeb27690e9ae2cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A collection of ASN.1-based protocols modules.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                               |  1 +
 package/Config.in                                        |  1 +
 package/python-pyasn1-modules/Config.in                  |  7 +++++++
 package/python-pyasn1-modules/python-pyasn1-modules.hash |  5 +++++
 package/python-pyasn1-modules/python-pyasn1-modules.mk   | 14 ++++++++++++++
 5 files changed, 28 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 28cf84300c..b2718b82c4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -207,6 +207,7 @@ F:	package/python-lxml/
 F:	package/python-paramiko/
 F:	package/python-passlib/
 F:	package/python-pyasn1/
+F:	package/python-pyasn1-modules/
 F:	package/python-pyroute2/
 F:	package/python-pytz/
 F:	package/python-reentry/
diff --git a/package/Config.in b/package/Config.in
index 73ba0ad8da..13b24f1815 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -920,6 +920,7 @@ menu "External python modules"
 	source "package/python-pyasn/Config.in"
 	source "package/python-pyasn-modules/Config.in"
 	source "package/python-pyasn1/Config.in"
+	source "package/python-pyasn1-modules/Config.in"
 	source "package/python-pycli/Config.in"
 	source "package/python-pycparser/Config.in"
 	source "package/python-pycrypto/Config.in"
diff --git a/package/python-pyasn1-modules/Config.in b/package/python-pyasn1-modules/Config.in
new file mode 100644
index 0000000000..6aff4d935b
--- /dev/null
+++ b/package/python-pyasn1-modules/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_PYASN1_MODULES
+	bool "python-pyasn1-modules"
+	select BR2_PACKAGE_PYTHON_PYASN1 # runtime
+	help
+	  A collection of ASN.1-based protocols modules.
+
+	  https://github.com/etingof/pyasn1-modules
diff --git a/package/python-pyasn1-modules/python-pyasn1-modules.hash b/package/python-pyasn1-modules/python-pyasn1-modules.hash
new file mode 100644
index 0000000000..7c7f02461f
--- /dev/null
+++ b/package/python-pyasn1-modules/python-pyasn1-modules.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/pyasn1-modules/json
+md5	65ce1ea1021679bffe96065baab232de  pyasn1-modules-0.2.2.tar.gz
+sha256	a0cf3e1842e7c60fde97cb22d275eb6f9524f5c5250489e292529de841417547  pyasn1-modules-0.2.2.tar.gz
+# Locally computed sha256 checksums
+sha256	f82128f64d567c333936a12b99a21d0e8cd66ce628d51ce0a7770cc38dc7fe43  LICENSE.txt
diff --git a/package/python-pyasn1-modules/python-pyasn1-modules.mk b/package/python-pyasn1-modules/python-pyasn1-modules.mk
new file mode 100644
index 0000000000..dbdf82e6ee
--- /dev/null
+++ b/package/python-pyasn1-modules/python-pyasn1-modules.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-pyasn1-modules
+#
+################################################################################
+
+PYTHON_PYASN1_MODULES_VERSION = 0.2.2
+PYTHON_PYASN1_MODULES_SOURCE = pyasn1-modules-$(PYTHON_PYASN1_MODULES_VERSION).tar.gz
+PYTHON_PYASN1_MODULES_SITE = https://files.pythonhosted.org/packages/37/33/74ebdc52be534e683dc91faf263931bc00ae05c6073909fde53999088541
+PYTHON_PYASN1_MODULES_SETUP_TYPE = setuptools
+PYTHON_PYASN1_MODULES_LICENSE = BSD-2-Clause
+PYTHON_PYASN1_MODULES_LICENSE_FILES = LICENSE.txt
+
+$(eval $(python-package))
