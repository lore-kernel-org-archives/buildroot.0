From: Conrad Ratschan <conrad.ratschan@rockwellcollins.com>
Date: Fri, 26 Feb 2021 10:09:37 -0600
Subject: [Buildroot] [PATCH 4/4] package/python-diffoscope: Add as new
 package
In-Reply-To: <20210226160937.16082-1-conrad.ratschan@rockwellcollins.com>
References: <20210226160937.16082-1-conrad.ratschan@rockwellcollins.com>
Message-ID: <20210226160937.16082-4-conrad.ratschan@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a new host python package for python-diffoscope.

Signed-off-by: Conrad Ratschan <conrad.ratschan@rockwellcollins.com>
---
 package/Config.in.host                           |  1 +
 package/python-diffoscope/Config.in.host         | 10 ++++++++++
 package/python-diffoscope/python-diffoscope.hash |  2 ++
 package/python-diffoscope/python-diffoscope.mk   | 16 ++++++++++++++++
 4 files changed, 29 insertions(+)
 create mode 100644 package/python-diffoscope/Config.in.host
 create mode 100644 package/python-diffoscope/python-diffoscope.hash
 create mode 100644 package/python-diffoscope/python-diffoscope.mk

diff --git a/package/Config.in.host b/package/Config.in.host
index 4edfb9cfa4..5a9e606a4b 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -65,6 +65,7 @@ menu "Host utilities"
 	source "package/pwgen/Config.in.host"
 	source "package/python/Config.in.host"
 	source "package/python-cython/Config.in.host"
+	source "package/python-diffoscope/Config.in.host"
 	source "package/python-libarchive-c/Config.in.host"
 	source "package/python-lxml/Config.in.host"
 	source "package/python-magic/Config.in.host"
diff --git a/package/python-diffoscope/Config.in.host b/package/python-diffoscope/Config.in.host
new file mode 100644
index 0000000000..520607e8a6
--- /dev/null
+++ b/package/python-diffoscope/Config.in.host
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_HOST_PYTHON_DIFFOSCOPE
+	bool "host-python-diffoscope"
+	depends on BR2_PACKAGE_HOST_PYTHON3
+	select BR2_PACKAGE_HOST_PYTHON_MAGIC
+	select BR2_PACKAGE_HOST_PYTHON_LIBARCHIVE_C
+	select BR2_PACKAGE_HOST_PYTHON3_CURSES
+	help
+	  Tool to recursively diff varying file types.
+
+	  https://diffoscope.org/
diff --git a/package/python-diffoscope/python-diffoscope.hash b/package/python-diffoscope/python-diffoscope.hash
new file mode 100644
index 0000000000..ea6d73aa60
--- /dev/null
+++ b/package/python-diffoscope/python-diffoscope.hash
@@ -0,0 +1,2 @@
+# sha256 from https://pypi.org/pypi/diffoscope/json
+sha256  d95cef5b3eef49fa1c811c1ac103f7f7cca4a0ebabc674e4283b51f28309d242  diffoscope-167.tar.gz
diff --git a/package/python-diffoscope/python-diffoscope.mk b/package/python-diffoscope/python-diffoscope.mk
new file mode 100644
index 0000000000..ad5a7c6255
--- /dev/null
+++ b/package/python-diffoscope/python-diffoscope.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# python-diffoscope
+#
+################################################################################
+
+PYTHON_DIFFOSCOPE_VERSION = 167
+PYTHON_DIFFOSCOPE_SOURCE = diffoscope-$(PYTHON_DIFFOSCOPE_VERSION).tar.gz
+PYTHON_DIFFOSCOPE_SITE = https://files.pythonhosted.org/packages/69/d8/3cd7efd904d4db9039f3111938598f6093d14087f40f4359ef1514e7d5eb
+PYTHON_DIFFOSCOPE_SETUP_TYPE = setuptools
+PYTHON_DIFFOSCOPE_LICENSE = GPL-3.0+
+HOST_PYTHON_DIFFOSCOPE_DL_SUBDIR = python-diffoscope
+HOST_PYTHON_DIFFOSCOPE_NEEDS_HOST_PYTHON = python3
+HOST_PYTHON_DIFFOSCOPE_DEPENDENCIES = host-python-libarchive-c host-python-magic
+
+$(eval $(host-python-package))
-- 
2.17.1
