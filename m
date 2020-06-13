From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 13 Jun 2020 21:20:33 +0200
Subject: [Buildroot] [PATCH v1 3/4] package/python-gpiozero: new package
In-Reply-To: <20200613192034.10286-1-ps.report@gmx.net>
References: <20200613192034.10286-1-ps.report@gmx.net>
Message-ID: <20200613192034.10286-3-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 DEVELOPERS                                   |  1 +
 package/Config.in                            |  1 +
 package/python-gpiozero/Config.in            |  9 +++++++++
 package/python-gpiozero/python-gpiozero.hash |  4 ++++
 package/python-gpiozero/python-gpiozero.mk   | 13 +++++++++++++
 5 files changed, 28 insertions(+)
 create mode 100644 package/python-gpiozero/Config.in
 create mode 100644 package/python-gpiozero/python-gpiozero.hash
 create mode 100644 package/python-gpiozero/python-gpiozero.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 9cd7d373b6..24babce128 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2024,6 +2024,7 @@ F:	package/libevdev/
 F:	package/log4cplus/
 F:	package/postgresql/
 F:	package/python-colorzero/
+F:	package/python-gpiozero/
 F:	package/qt5/
 F:	package/quotatool/
 F:	package/racehound/
diff --git a/package/Config.in b/package/Config.in
index 502f917815..8be605e752 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -968,6 +968,7 @@ menu "External python modules"
 	source "package/python-futures/Config.in"
 	source "package/python-gitdb2/Config.in"
 	source "package/python-gobject/Config.in"
+	source "package/python-gpiozero/Config.in"
 	source "package/python-greenlet/Config.in"
 	source "package/python-gunicorn/Config.in"
 	source "package/python-h2/Config.in"
diff --git a/package/python-gpiozero/Config.in b/package/python-gpiozero/Config.in
new file mode 100644
index 0000000000..1e2735be45
--- /dev/null
+++ b/package/python-gpiozero/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_GPIOZERO
+	bool "python-gpiozero"
+	depends on BR2_arm
+	select BR2_PACKAGE_PYTHON_COLORZERO # runtime
+	select BR2_PACKAGE_PYTHON_RPI_GPIO # runtime
+	help
+	  A simple interface to GPIO devices with Raspberry Pi.
+
+	  https://github.com/gpiozero/gpiozero
diff --git a/package/python-gpiozero/python-gpiozero.hash b/package/python-gpiozero/python-gpiozero.hash
new file mode 100644
index 0000000000..a1e66e590c
--- /dev/null
+++ b/package/python-gpiozero/python-gpiozero.hash
@@ -0,0 +1,4 @@
+# Locally computed
+sha256  8cb9824fe1b08e7935de03899455e20ce2c242e4cebb0c954c274c48059f6ea5  python-gpiozero-v1.5.1.tar.gz
+# Locally computed
+sha256  b6e26763b79d7904d6eaa66f7f53ae374cf30431bb6ba8bcb0d9d5ff56dc69e3  LICENSE.rst
diff --git a/package/python-gpiozero/python-gpiozero.mk b/package/python-gpiozero/python-gpiozero.mk
new file mode 100644
index 0000000000..71d0d43bb1
--- /dev/null
+++ b/package/python-gpiozero/python-gpiozero.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-gpiozero
+#
+################################################################################
+
+PYTHON_GPIOZERO_VERSION = v1.5.1
+PYTHON_GPIOZERO_SITE = $(call github,gpiozero,gpiozero,$(PYTHON_GPIOZERO_VERSION))
+PYTHON_GPIOZERO_LICENSE = BSD-3-Clause 
+PYTHON_GPIOZERO_LICENSE_FILES = LICENSE.rst
+PYTHON_GPIOZERO_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
-- 
2.27.0
