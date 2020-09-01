From: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
Date: Tue,  1 Sep 2020 16:37:29 +0200
Subject: [Buildroot] [PATCH 1/3] package/python-crayons : new package
In-Reply-To: <20200901143731.2916-1-jugurtha.belkalem@smile.fr>
References: <20200901143731.2916-1-jugurtha.belkalem@smile.fr>
Message-ID: <20200901143731.2916-2-jugurtha.belkalem@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This module is really simple, it gives you
colored strings for terminal usage.

Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
---
 Notes :
 - This package can be used optionally by python-stegano.
 - This module has been tested with Python3.
 - It has been checked with check-package :
   $ ./utils/check-package package/python-crayons/*
   27 lines processed
   0 warnings generated

 DEVELOPERS                                 |  1 +
 package/Config.in                          |  1 +
 package/python-crayons/Config.in           |  8 ++++++++
 package/python-crayons/python-crayons.hash |  5 +++++
 package/python-crayons/python-crayons.mk   | 14 ++++++++++++++
 5 files changed, 29 insertions(+)
 create mode 100644 package/python-crayons/Config.in
 create mode 100644 package/python-crayons/python-crayons.hash
 create mode 100644 package/python-crayons/python-crayons.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 3c3dcda859..6357eba0bc 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1398,6 +1398,7 @@ N:	Joshua Henderson <joshua.henderson@microchip.com>
 F:	package/qt5/qt5wayland/
 
 N:	Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
+F:	package/python-crayons/
 F:	package/python-cycler/
 F:	package/python-matplotlib/
 
diff --git a/package/Config.in b/package/Config.in
index d7e79f4795..fee0a964d0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -920,6 +920,7 @@ menu "External python modules"
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
-- 
2.11.0
