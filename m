From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Dec 2013 14:01:01 +0100
Subject: [Buildroot] [git commit] python-pysnmp: new package
Message-ID: <20131215130826.C5D699BC97@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=83cebd8e8edb8bfe79917aac3c2b4144f9879262
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                      |    1 +
 package/python-pysnmp/Config.in        |   14 ++++++++++++++
 package/python-pysnmp/python-pysnmp.mk |   17 +++++++++++++++++
 3 files changed, 32 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 50307f2..017876d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -405,6 +405,7 @@ source "package/python-pycrypto/Config.in"
 source "package/python-pygame/Config.in"
 source "package/python-pyparsing/Config.in"
 source "package/python-pyro/Config.in"
+source "package/python-pysnmp/Config.in"
 source "package/python-pyusb/Config.in"
 source "package/python-pyzmq/Config.in"
 source "package/python-serial/Config.in"
diff --git a/package/python-pysnmp/Config.in b/package/python-pysnmp/Config.in
new file mode 100644
index 0000000..a87a4d0
--- /dev/null
+++ b/package/python-pysnmp/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_PYTHON_PYSNMP
+	bool "python-pysnmp"
+	depends on BR2_PACKAGE_PYTHON
+	depends on BR2_INSTALL_LIBSTDCPP # pyasn
+	select BR2_PACKAGE_PYTHON_PYASN
+	select BR2_PACKAGE_PYTHON_PYCRYPTO
+	help
+	  PySNMP is a cross-platform, pure-Python SNMP engine
+	  implementation.
+
+	  http://pysnmp.sf.net
+
+comment "python-pysnmp needs a toolchain w/ C++"
+        depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/python-pysnmp/python-pysnmp.mk b/package/python-pysnmp/python-pysnmp.mk
new file mode 100644
index 0000000..3d0f3b5
--- /dev/null
+++ b/package/python-pysnmp/python-pysnmp.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# python-pysnmp
+#
+################################################################################
+
+PYTHON_PYSNMP_VERSION = 4.2.4
+PYTHON_PYSNMP_SOURCE = pysnmp-$(PYTHON_PYSNMP_VERSION).tar.gz
+PYTHON_PYSNMP_SITE = https://pypi.python.org/packages/source/p/pysnmp
+PYTHON_PYSNMP_SETUP_TYPE = setuptools
+
+PYTHON_PYSNMP_LICENSE = BSD-3c
+PYTHON_PYSNMP_LICENSE_FILES = LICENSE
+
+PYTHON_PYSNMP_DEPENDENCIES = python-pyasn python-pycrypto
+
+$(eval $(python-package))
