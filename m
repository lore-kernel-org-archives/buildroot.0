From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 12 Apr 2021 10:20:32 -0500
Subject: [Buildroot] [PATCH] package/python-iwlib: add python-iwlib
Message-ID: <20210412152032.7053-1-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jared Bents <jared.bents@rockwellcollins.com>

Update to add python-iwlib. A package for interfacing with
iwlib, providing an implementation to the wireless tools in
Linux.

Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
Signed-off-by: Kalpesh Panchal <kalpesh.panchal@rockwellcollins.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---

No CPE item identified at this time.

---
 DEVELOPERS                             |  1 +
 package/Config.in                      |  1 +
 package/python-iwlib/Config.in         |  9 +++++++++
 package/python-iwlib/python-iwlib.hash |  3 +++
 package/python-iwlib/python-iwlib.mk   | 14 ++++++++++++++
 5 files changed, 28 insertions(+)
 create mode 100644 package/python-iwlib/Config.in
 create mode 100644 package/python-iwlib/python-iwlib.hash
 create mode 100644 package/python-iwlib/python-iwlib.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index e997c0e60a..529e6903d4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1786,6 +1786,7 @@ F:	package/python-filelock/
 F:	package/python-flask-cors/
 F:	package/python-iptables/
 F:	package/python-ipy/
+F:	package/python-iwlib/
 F:	package/python-posix-ipc/
 F:	package/python-pycairo/
 F:	package/python-pypcap/
diff --git a/package/Config.in b/package/Config.in
index 3e0b288f88..2e15e222d9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1031,6 +1031,7 @@ menu "External python modules"
 	source "package/python-ipython-genutils/Config.in"
 	source "package/python-iso8601/Config.in"
 	source "package/python-itsdangerous/Config.in"
+	source "package/python-iwlib/Config.in"
 	source "package/python-janus/Config.in"
 	source "package/python-jaraco-classes/Config.in"
 	source "package/python-jaraco-functools/Config.in"
diff --git a/package/python-iwlib/Config.in b/package/python-iwlib/Config.in
new file mode 100644
index 0000000000..bcbea6a0a0
--- /dev/null
+++ b/package/python-iwlib/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_IWLIB
+	bool "python-iwlib"
+	depends on BR2_PACKAGE_WIRELESS_TOOLS_LIB
+	help
+	  python-iwlib is a package for interfacing
+	  with iwlib, providing an implementation to
+	  the wireless tools in Linux.
+
+	  https://github.com/nhoad/python-iwlib
diff --git a/package/python-iwlib/python-iwlib.hash b/package/python-iwlib/python-iwlib.hash
new file mode 100644
index 0000000000..4d71a3fea6
--- /dev/null
+++ b/package/python-iwlib/python-iwlib.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  7f1ad4354284a452388e178b5d9b191fa5a68a9183423a90a1d261ba2ebd1cac  python-iwlib-1.5.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/python-iwlib/python-iwlib.mk b/package/python-iwlib/python-iwlib.mk
new file mode 100644
index 0000000000..9d0985567d
--- /dev/null
+++ b/package/python-iwlib/python-iwlib.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-iwlib
+#
+################################################################################
+
+PYTHON_IWLIB_VERSION = 1.5
+PYTHON_IWLIB_SITE = $(call github,nhoad,python-iwlib,$(PYTHON_IWLIB_VERSION))
+PYTHON_IWLIB_LICENSE = GPL-2.0
+PYTHON_IWLIB_LICENSE_FILES = COPYING
+PYTHON_IWLIB_SETUP_TYPE = setuptools
+PYTHON_IWLIB_DEPENDENCIES = wireless_tools
+
+$(eval $(python-package))
-- 
2.17.1
