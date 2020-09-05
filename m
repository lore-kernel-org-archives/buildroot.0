From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 5 Sep 2020 22:40:00 +0200
Subject: [Buildroot] [git commit] package/python-crayons : new package
Message-ID: <20200905204727.BC32087149@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ceb090fd6e8eae389f80d08f00599076a0553a6f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This module is really simple, it gives you
colored strings for terminal usage.

Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                 |  1 +
 package/Config.in                          |  1 +
 package/python-crayons/Config.in           |  8 ++++++++
 package/python-crayons/python-crayons.hash |  5 +++++
 package/python-crayons/python-crayons.mk   | 14 ++++++++++++++
 5 files changed, 29 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index f28c6b4235..4806c14fd6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1422,6 +1422,7 @@ N:	Joshua Henderson <joshua.henderson@microchip.com>
 F:	package/qt5/qt5wayland/
 
 N:	Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
+F:	package/python-crayons/
 F:	package/python-cycler/
 F:	package/python-matplotlib/
 
diff --git a/package/Config.in b/package/Config.in
index 92acf7c9e4..7a23c92f0f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -923,6 +923,7 @@ menu "External python modules"
 	source "package/python-configshell-fb/Config.in"
 	source "package/python-constantly/Config.in"
 	source "package/python-couchdb/Config.in"
+	source "package/python-crayons/Config.in"
 	source "package/python-crc16/Config.in"
 	source "package/python-crcmod/Config.in"
 	source "package/python-crontab/Config.in"
diff --git a/package/python-crayons/Config.in b/package/python-crayons/Config.in
new file mode 100644
index 0000000000..10f3ece009
--- /dev/null
+++ b/package/python-crayons/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_CRAYONS
+	bool "python-crayons"
+	depends on BR2_PACKAGE_PYTHON3
+	help
+	  This module is really simple, it gives you
+	  colored strings for terminal usage.
+
+	  https://pypi.org/project/crayons
diff --git a/package/python-crayons/python-crayons.hash b/package/python-crayons/python-crayons.hash
new file mode 100644
index 0000000000..e3d6632169
--- /dev/null
+++ b/package/python-crayons/python-crayons.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/crayons/json
+md5  88a79c854ce54bcbb8376d18a448d627  crayons-0.4.0.tar.gz
+sha256  bd33b7547800f2cfbd26b38431f9e64b487a7de74a947b0fafc89b45a601813f  crayons-0.4.0.tar.gz
+# Locally computed sha256 checksums
+sha256  7deeb137f78337fd1e2e3966a7896821c6ebff244200d009d3f4157246b5a457  LICENSE
diff --git a/package/python-crayons/python-crayons.mk b/package/python-crayons/python-crayons.mk
new file mode 100644
index 0000000000..33562d097b
--- /dev/null
+++ b/package/python-crayons/python-crayons.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-crayons
+#
+################################################################################
+
+PYTHON_CRAYONS_VERSION = 0.4.0
+PYTHON_CRAYONS_SOURCE = crayons-$(PYTHON_CRAYONS_VERSION).tar.gz
+PYTHON_CRAYONS_SITE = https://files.pythonhosted.org/packages/b8/6b/12a1dea724c82f1c19f410365d3e25356625b48e8009a7c3c9ec4c42488d
+PYTHON_CRAYONS_LICENSE = MIT
+PYTHON_CRAYONS_LICENSE_FILES = LICENSE
+PYTHON_CRAYONS_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
