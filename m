From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Dec 2013 14:01:01 +0100
Subject: [Buildroot] [git commit] python-pysnmp-mibs: new package
Message-ID: <20131215130826.D45509BC97@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=68f2291309e4a62f9280d81683793c61608eaacc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                                |    1 +
 package/python-pysnmp-mibs/Config.in             |   13 +++++++++++++
 package/python-pysnmp-mibs/python-pysnmp-mibs.mk |   16 ++++++++++++++++
 3 files changed, 30 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 938ace6..63ea528 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -407,6 +407,7 @@ source "package/python-pyparsing/Config.in"
 source "package/python-pyro/Config.in"
 source "package/python-pysnmp/Config.in"
 source "package/python-pysnmp-apps/Config.in"
+source "package/python-pysnmp-mibs/Config.in"
 source "package/python-pyusb/Config.in"
 source "package/python-pyzmq/Config.in"
 source "package/python-serial/Config.in"
diff --git a/package/python-pysnmp-mibs/Config.in b/package/python-pysnmp-mibs/Config.in
new file mode 100644
index 0000000..76089b1
--- /dev/null
+++ b/package/python-pysnmp-mibs/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_PYTHON_PYSNMP_MIBS
+	bool "python-pysnmp-mibs"
+	depends on BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON_PYSNMP
+	depends on BR2_INSTALL_LIBSTDCPP # pysnmp -> pyasn
+	help
+	  PySNMP MIBs is a set of IETF & IANA MIBs pre-compiled and
+	  packaged to simplify their use with the PySNMP library.
+
+	  http://pysnmp.sf.net
+
+comment "python-pysnmp-libs needs a toolchain w/ C++"
+        depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/python-pysnmp-mibs/python-pysnmp-mibs.mk b/package/python-pysnmp-mibs/python-pysnmp-mibs.mk
new file mode 100644
index 0000000..21b9673
--- /dev/null
+++ b/package/python-pysnmp-mibs/python-pysnmp-mibs.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# python-pysnmp-mibs
+#
+################################################################################
+
+PYTHON_PYSNMP_MIBS_VERSION = 0.1.4
+PYTHON_PYSNMP_MIBS_SOURCE = pysnmp-mibs-$(PYTHON_PYSNMP_MIBS_VERSION).tar.gz
+PYTHON_PYSNMP_MIBS_SITE = https://pypi.python.org/packages/source/p/pysnmp-mibs
+PYTHON_PYSNMP_MIBS_SETUP_TYPE = setuptools
+PYTHON_PYSNMP_MIBS_LICENSE = BSD-3c
+PYTHON_PYSNMP_MIBS_LICENSE_FILES = LICENSE
+
+PYTHON_PYSNMP_MIBS_DEPENDENCIES = python-pysnmp
+
+$(eval $(python-package))
