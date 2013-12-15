From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Dec 2013 14:01:01 +0100
Subject: [Buildroot] [git commit] python-pysnmp-apps: new package
Message-ID: <20131215130826.CD4A29BC97@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ef63b034e6a5819bf6cc6afb1a1f2d7d972a56a9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: remove wrong newline from help text]
Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                                |    1 +
 package/python-pysnmp-apps/Config.in             |   13 +++++++++++++
 package/python-pysnmp-apps/python-pysnmp-apps.mk |   16 ++++++++++++++++
 3 files changed, 30 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 017876d..938ace6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -406,6 +406,7 @@ source "package/python-pygame/Config.in"
 source "package/python-pyparsing/Config.in"
 source "package/python-pyro/Config.in"
 source "package/python-pysnmp/Config.in"
+source "package/python-pysnmp-apps/Config.in"
 source "package/python-pyusb/Config.in"
 source "package/python-pyzmq/Config.in"
 source "package/python-serial/Config.in"
diff --git a/package/python-pysnmp-apps/Config.in b/package/python-pysnmp-apps/Config.in
new file mode 100644
index 0000000..16d7c55
--- /dev/null
+++ b/package/python-pysnmp-apps/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_PYTHON_PYSNMP_APPS
+	bool "python-pysnmp-apps"
+	depends on BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON_PYSNMP
+	depends on BR2_INSTALL_LIBSTDCPP # pysnmp -> pyasn
+	help
+	  A collection of command-line tools for SNMP management
+	  purposes built on top of the PySNMP package.
+
+	  http://pysnmp.sf.net
+
+comment "python-pysnmp-apps needs a toolchain w/ C++"
+        depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/python-pysnmp-apps/python-pysnmp-apps.mk b/package/python-pysnmp-apps/python-pysnmp-apps.mk
new file mode 100644
index 0000000..d6e9db2
--- /dev/null
+++ b/package/python-pysnmp-apps/python-pysnmp-apps.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# python-pysnmp-apps
+#
+################################################################################
+
+PYTHON_PYSNMP_APPS_VERSION = 0.3.3
+PYTHON_PYSNMP_APPS_SOURCE = pysnmp-apps-$(PYTHON_PYSNMP_APPS_VERSION).tar.gz
+PYTHON_PYSNMP_APPS_SITE = https://pypi.python.org/packages/source/p/pysnmp-apps
+PYTHON_PYSNMP_APPS_SETUP_TYPE = setuptools
+PYTHON_PYSNMP_APPS_LICENSE = BSD-3c
+PYTHON_PYSNMP_APPS_LICENSE_FILES = LICENSE
+
+PYTHON_PYSNMP_APPS_DEPENDENCIES = python-pysnmp
+
+$(eval $(python-package))
