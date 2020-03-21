From: Jagan Teki <jagan@amarulasolutions.com>
Date: Sun, 22 Mar 2020 00:32:40 +0530
Subject: [Buildroot] [PATCH v7 3/4] package/python-pybind11: new host package
In-Reply-To: <20200321190241.3590-1-jagan@amarulasolutions.com>
References: <20200321190241.3590-1-jagan@amarulasolutions.com>
Message-ID: <20200321190241.3590-4-jagan@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add python-pybind11 package with 2.4.3 release version.

Cc: Esben Haabendal <esben@geanix.com>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v7:
- update the commit message
- fix sha256 value of pybind11 LICENCE

 DEVELOPERS                                   |  1 +
 package/Config.in.host                       |  1 +
 package/python-pybind11/Config.in.host       |  7 +++++++
 package/python-pybind11/python-pybind11.hash |  5 +++++
 package/python-pybind11/python-pybind11.mk   | 14 ++++++++++++++
 5 files changed, 28 insertions(+)
 create mode 100644 package/python-pybind11/Config.in.host
 create mode 100644 package/python-pybind11/python-pybind11.hash
 create mode 100644 package/python-pybind11/python-pybind11.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index a2c6da208b..308a59b264 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1151,6 +1151,7 @@ F:	configs/orangepi_win_defconfig
 F:	configs/orangepi_zero_plus2_defconfig
 F:	configs/pine64_defconfig
 F:	configs/pine64_sopine_defconfig
+F:	package/python-pybind11
 
 N:	James Hilliard <james.hilliard1@gmail.com>
 F:	package/gensio/
diff --git a/package/Config.in.host b/package/Config.in.host
index dfea478868..d63bf54aa7 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -57,6 +57,7 @@ menu "Host utilities"
 	source "package/python/Config.in.host"
 	source "package/python-cython/Config.in.host"
 	source "package/python-lxml/Config.in.host"
+	source "package/python-pybind11/Config.in.host"
 	source "package/python-six/Config.in.host"
 	source "package/python-xlrd/Config.in.host"
 	source "package/python3/Config.in.host"
diff --git a/package/python-pybind11/Config.in.host b/package/python-pybind11/Config.in.host
new file mode 100644
index 0000000000..e4164efd9d
--- /dev/null
+++ b/package/python-pybind11/Config.in.host
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_HOST_PYTHON_PYBIND11
+	bool "host python-pybind11"
+	help
+	  Python module for Seamless operability between
+	  C++11 and Python.
+
+	  https://github.com/pybind/pybind11
diff --git a/package/python-pybind11/python-pybind11.hash b/package/python-pybind11/python-pybind11.hash
new file mode 100644
index 0000000000..880b678b94
--- /dev/null
+++ b/package/python-pybind11/python-pybind11.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.python.org/pypi/pybind11/json
+md5  23fdca8191b16ce3e7f38fb9e4252b2d  pybind11-2.4.3.tar.gz
+sha256  72e6def53fb491f7f4e92692029d2e7bb5a0783314f20d80222735ff10a75758  pybind11-2.4.3.tar.gz
+# sha256 for LICENSE is locally computed
+sha256  9a37ea54aa3cf12c7f3292799f20822ffd4b9b7142b36a7a9997b28c39264dc9  LICENSE
diff --git a/package/python-pybind11/python-pybind11.mk b/package/python-pybind11/python-pybind11.mk
new file mode 100644
index 0000000000..833ec92c86
--- /dev/null
+++ b/package/python-pybind11/python-pybind11.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-pybind11
+#
+################################################################################
+
+PYTHON_PYBIND11_VERSION = 2.4.3
+PYTHON_PYBIND11_SOURCE = pybind11-$(PYTHON_PYBIND11_VERSION).tar.gz
+PYTHON_PYBIND11_SITE = https://pypi.python.org/packages/aa/91/deb6743e79e22ab01502296570b39b8404f10cc507a6692d612a7fee8d51
+PYTHON_PYBIND11_SETUP_TYPE = setuptools
+PYTHON_PYBIND11_LICENSE = BSD
+PYTHON_PYBIND11_LICENSE_FILES = LICENSE
+
+$(eval $(host-python-package))
-- 
2.17.1
