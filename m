From: Geoffrey Ragot <geoffreyragot@gmail.com>
Date: Sun, 26 Jul 2015 14:12:17 +0200
Subject: [Buildroot] [PATCH 1/2] Add pyyaml package
Message-ID: <1437912738-24116-1-git-send-email-geoffrey.ragot@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Geoffrey Ragot <geoffrey.ragot@gmail.com>
---
 package/Config.in                      |  1 +
 package/python-pyyaml/Config.in        |  8 ++++++++
 package/python-pyyaml/python-pyyaml.mk | 15 +++++++++++++++
 3 files changed, 24 insertions(+)
 create mode 100644 package/python-pyyaml/Config.in
 create mode 100644 package/python-pyyaml/python-pyyaml.mk

diff --git a/package/Config.in b/package/Config.in
index cfa7512..8bc27a4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -649,6 +649,7 @@ menu "external python modules"
 	source "package/python-pyusb/Config.in"
 	source "package/python-pyxb/Config.in"
 	source "package/python-pyxml/Config.in"
+	source "package/python-pyyaml/Config.in"
 	source "package/python-pyzmq/Config.in"
 	source "package/python-requests/Config.in"
 	source "package/python-rtslib-fb/Config.in"
diff --git a/package/python-pyyaml/Config.in b/package/python-pyyaml/Config.in
new file mode 100644
index 0000000..a63c445
--- /dev/null
+++ b/package/python-pyyaml/Config.in
@@ -0,0 +1,8 @@
+comment "python-pyyaml require libyaml"
+	depends on !BR2_PACKAGE_LIBYAML
+
+config BR2_PACKAGE_PYTHON_PYYAML
+	bool "python-pyyaml"
+	depends on BR2_PACKAGE_LIBYAML
+	help
+	  The PyYAML package contains binding to the libyaml API.
diff --git a/package/python-pyyaml/python-pyyaml.mk b/package/python-pyyaml/python-pyyaml.mk
new file mode 100644
index 0000000..ef10dac
--- /dev/null
+++ b/package/python-pyyaml/python-pyyaml.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-pyyaml
+#
+################################################################################
+
+PYTHON_PYYAML_VERSION = 3.11
+PYTHON_PYYAML_SOURCE = PyYAML-$(PYTHON_PYYAML_VERSION).tar.gz
+PYTHON_PYYAML_SITE = https://pypi.python.org/packages/source/P/PyYAML/
+PYTHON_PYYAML_SETUP_TYPE = distutils
+PYTHON_PYYAML_LICENSE = Python software foundation license v2
+PYTHON_PYYAML_LICENSE_FILES = LICENSE
+PYTHON_PYYAML_DEPENDENCIES = libyaml
+
+$(eval $(python-package))
-- 
2.4.6
