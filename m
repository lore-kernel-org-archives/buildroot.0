From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 13 Jun 2020 21:20:31 +0200
Subject: [Buildroot] [PATCH v1 1/4] package/python-colorzero: new package
Message-ID: <20200613192034.10286-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 DEVELOPERS                                     |  1 +
 package/Config.in                              |  1 +
 package/python-colorzero/Config.in             |  7 +++++++
 package/python-colorzero/python-colorzero.hash |  4 ++++
 package/python-colorzero/python-colorzero.mk   | 13 +++++++++++++
 5 files changed, 26 insertions(+)
 create mode 100644 package/python-colorzero/Config.in
 create mode 100644 package/python-colorzero/python-colorzero.hash
 create mode 100644 package/python-colorzero/python-colorzero.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 9a94307082..9cd7d373b6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2023,6 +2023,7 @@ F:	package/iwd/
 F:	package/libevdev/
 F:	package/log4cplus/
 F:	package/postgresql/
+F:	package/python-colorzero/
 F:	package/qt5/
 F:	package/quotatool/
 F:	package/racehound/
diff --git a/package/Config.in b/package/Config.in
index b0a7da2f5c..502f917815 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -913,6 +913,7 @@ menu "External python modules"
 	source "package/python-coherence/Config.in"
 	source "package/python-colorama/Config.in"
 	source "package/python-colorlog/Config.in"
+	source "package/python-colorzero/Config.in"
 	source "package/python-configobj/Config.in"
 	source "package/python-configshell-fb/Config.in"
 	source "package/python-constantly/Config.in"
diff --git a/package/python-colorzero/Config.in b/package/python-colorzero/Config.in
new file mode 100644
index 0000000000..58af9f49e9
--- /dev/null
+++ b/package/python-colorzero/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_COLORZERO
+	bool "python-colorzero"
+	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
+	help
+	  A color manipulation library for Python.
+
+	  https://github.com/waveform80/colorzero
diff --git a/package/python-colorzero/python-colorzero.hash b/package/python-colorzero/python-colorzero.hash
new file mode 100644
index 0000000000..12be3bb46e
--- /dev/null
+++ b/package/python-colorzero/python-colorzero.hash
@@ -0,0 +1,4 @@
+# Locally computed
+sha256  24d30b55793150f9ae7478f8aa2126fe5598a31f928907eadbf9d5a19aa9964c  python-colorzero-release-1.1.tar.gz
+# Locally computed
+sha256  47778d78e05bb6c39c022814e3712a0327c6418c7251757e72167ab8ff12bb4d  LICENSE.txt
diff --git a/package/python-colorzero/python-colorzero.mk b/package/python-colorzero/python-colorzero.mk
new file mode 100644
index 0000000000..6ba421f89c
--- /dev/null
+++ b/package/python-colorzero/python-colorzero.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-colorzero
+#
+################################################################################
+
+PYTHON_COLORZERO_VERSION = release-1.1
+PYTHON_COLORZERO_SITE = $(call github,waveform80,colorzero,$(PYTHON_COLORZERO_VERSION))
+PYTHON_COLORZERO_LICENSE = BSD-3-Clause 
+PYTHON_COLORZERO_LICENSE_FILES = LICENSE.txt
+PYTHON_COLORZERO_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
-- 
2.27.0
