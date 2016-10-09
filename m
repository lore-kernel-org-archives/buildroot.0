From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  9 Oct 2016 14:46:23 +0200
Subject: [Buildroot] [PATCH v4 08/10] package/python-pyicu: new package
In-Reply-To: <20161009124625.23303-1-bernd.kuhls@t-online.de>
References: <20161009124625.23303-1-bernd.kuhls@t-online.de>
Message-ID: <20161009124625.23303-8-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Needed for the upcoming python-slob package.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v4: no changes
v3: initial version

 package/Config.in                      |  1 +
 package/python-pyicu/Config.in         | 13 +++++++++++++
 package/python-pyicu/python-pyicu.hash |  3 +++
 package/python-pyicu/python-pyicu.mk   | 15 +++++++++++++++
 4 files changed, 32 insertions(+)
 create mode 100644 package/python-pyicu/Config.in
 create mode 100644 package/python-pyicu/python-pyicu.hash
 create mode 100644 package/python-pyicu/python-pyicu.mk

diff --git a/package/Config.in b/package/Config.in
index d81b8e1..731c040 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -738,6 +738,7 @@ menu "External python modules"
 	source "package/python-pyftpdlib/Config.in"
 	source "package/python-pygame/Config.in"
 	source "package/python-pygments/Config.in"
+	source "package/python-pyicu/Config.in"
 	source "package/python-pyinotify/Config.in"
 	source "package/python-pylru/Config.in"
 	source "package/python-pymysql/Config.in"
diff --git a/package/python-pyicu/Config.in b/package/python-pyicu/Config.in
new file mode 100644
index 0000000..a3578f1
--- /dev/null
+++ b/package/python-pyicu/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_PYTHON_PYICU
+	bool "python-pyicu"
+	depends on !BR2_BINFMT_FLAT # icu
+	depends on BR2_INSTALL_LIBSTDCPP # icu
+	select BR2_PACKAGE_ICU
+	help
+	  Python extension wrapping the ICU C++ API.
+
+	  http://pyicu.osafoundation.org/
+
+comment "python-pyicu needs a toolchain w/ C++"
+	depends on !BR2_BINFMT_FLAT
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/python-pyicu/python-pyicu.hash b/package/python-pyicu/python-pyicu.hash
new file mode 100644
index 0000000..a05a30e
--- /dev/null
+++ b/package/python-pyicu/python-pyicu.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi/PyICU/json, sha256 locally computed
+md5	fadaf9f85830632f915cb85875ae9a39  PyICU-1.9.3.tar.gz
+sha256	1a7a96212cb3e42e8df85b9062f1f1d6e207474d44f087218fad1d4ec210fa42  PyICU-1.9.3.tar.gz
diff --git a/package/python-pyicu/python-pyicu.mk b/package/python-pyicu/python-pyicu.mk
new file mode 100644
index 0000000..fa3a7f4
--- /dev/null
+++ b/package/python-pyicu/python-pyicu.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-pyicu
+#
+################################################################################
+
+PYTHON_PYICU_VERSION = 1.9.3
+PYTHON_PYICU_SOURCE = PyICU-$(PYTHON_PYICU_VERSION).tar.gz
+PYTHON_PYICU_SITE = https://pypi.python.org/packages/bf/1f/cea237f542e3bb592980008a734850e8cbbc25c19c72c98767c71c1bd9c2
+PYTHON_PYICU_LICENSE = MIT
+PYTHON_PYICU_LICENSE_FILES = LICENSE
+PYTHON_PYICU_DEPENDENCIES = icu
+PYTHON_PYICU_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
-- 
2.9.3
