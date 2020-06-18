From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 18 Jun 2020 21:45:00 +0200
Subject: [Buildroot] [git commit] package/python-gpiozero: new package
Message-ID: <20200618194318.B1B8A8006E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4e41b6377d7b1ce559b543a7fe1ad37740ec8916
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                   |  1 +
 package/Config.in                            |  1 +
 package/python-gpiozero/Config.in            |  9 +++++++++
 package/python-gpiozero/python-gpiozero.hash |  4 ++++
 package/python-gpiozero/python-gpiozero.mk   | 13 +++++++++++++
 5 files changed, 28 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 65bce3e4a4..32a9ecc909 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2026,6 +2026,7 @@ F:	package/libevdev/
 F:	package/log4cplus/
 F:	package/postgresql/
 F:	package/python-colorzero/
+F:	package/python-gpiozero/
 F:	package/qt5/
 F:	package/quotatool/
 F:	package/racehound/
diff --git a/package/Config.in b/package/Config.in
index fbe87ec902..8da95d846d 100644
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
index 0000000000..2302003561
--- /dev/null
+++ b/package/python-gpiozero/python-gpiozero.hash
@@ -0,0 +1,4 @@
+# Locally computed
+sha256  8cb9824fe1b08e7935de03899455e20ce2c242e4cebb0c954c274c48059f6ea5  python-gpiozero-1.5.1.tar.gz
+# Locally computed
+sha256  b6e26763b79d7904d6eaa66f7f53ae374cf30431bb6ba8bcb0d9d5ff56dc69e3  LICENSE.rst
diff --git a/package/python-gpiozero/python-gpiozero.mk b/package/python-gpiozero/python-gpiozero.mk
new file mode 100644
index 0000000000..67e8067a8b
--- /dev/null
+++ b/package/python-gpiozero/python-gpiozero.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-gpiozero
+#
+################################################################################
+
+PYTHON_GPIOZERO_VERSION = 1.5.1
+PYTHON_GPIOZERO_SITE = $(call github,gpiozero,gpiozero,v$(PYTHON_GPIOZERO_VERSION))
+PYTHON_GPIOZERO_LICENSE = BSD-3-Clause
+PYTHON_GPIOZERO_LICENSE_FILES = LICENSE.rst
+PYTHON_GPIOZERO_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
