From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Sep 2019 23:31:04 +0200
Subject: [Buildroot] [git commit] package/python-kiwisolver: new package
Message-ID: <20190919213807.1E50A8ED12@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a7c4753998f098f9030b647f89b6337d5dfff2c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Esben Haabendal <esben@geanix.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                       |  1 +
 package/Config.in                                |  1 +
 package/python-kiwisolver/Config.in              | 17 +++++++++++++++++
 package/python-kiwisolver/python-kiwisolver.hash |  3 +++
 package/python-kiwisolver/python-kiwisolver.mk   | 13 +++++++++++++
 5 files changed, 35 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 1557608356..67a0fef088 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -722,6 +722,7 @@ F:	package/szip/
 
 N:	Esben Haabendal <esben@haabendal.dk>
 F:	boot/gummiboot/
+F:	package/python-kiwisolver/
 
 N:	Etienne Carriere <etienne.carriere@linaro.org>
 F:	boot/optee-os/
diff --git a/package/Config.in b/package/Config.in
index 1026dd7c16..dbf297f4df 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -936,6 +936,7 @@ menu "External python modules"
 	source "package/python-jsonmodels/Config.in"
 	source "package/python-jsonschema/Config.in"
 	source "package/python-keyring/Config.in"
+	source "package/python-kiwisolver/Config.in"
 	source "package/python-libconfig/Config.in"
 	source "package/python-libusb1/Config.in"
 	source "package/python-lmdb/Config.in"
diff --git a/package/python-kiwisolver/Config.in b/package/python-kiwisolver/Config.in
new file mode 100644
index 0000000000..33727ba8e1
--- /dev/null
+++ b/package/python-kiwisolver/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_PYTHON_KIWISOLVER
+	bool "python-kiwisolver"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  Kiwi is an efficient C++ implementation of the Cassowary
+	  constraint solving algorithm. Kiwi is an implementation of
+	  the algorithm based on the seminal Cassowary paper. It is
+	  not a refactoring of the original C++ solver. Kiwi has been
+	  designed from the ground up to be lightweight and fast. Kiwi
+	  ranges from 10x to 500x faster than the original Cassowary
+	  solver with typical use cases gaining a 40x
+	  improvement. Memory savings are consistently > 5x.
+
+	  https://github.com/nucleic/kiwi
+
+comment "python-kiwisolver needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/python-kiwisolver/python-kiwisolver.hash b/package/python-kiwisolver/python-kiwisolver.hash
new file mode 100644
index 0000000000..9cdb27002c
--- /dev/null
+++ b/package/python-kiwisolver/python-kiwisolver.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 48168c0ace18319c649e31907f6d8586f648e503560f506f128798b99393bcdb  python-kiwisolver-1.1.0.tar.gz
+sha256 95c32f73d43fa54d8146badbcbd73b83acb7fa2cc81a7cef7784b3cd33b146a0  LICENSE
diff --git a/package/python-kiwisolver/python-kiwisolver.mk b/package/python-kiwisolver/python-kiwisolver.mk
new file mode 100644
index 0000000000..2b99803c0d
--- /dev/null
+++ b/package/python-kiwisolver/python-kiwisolver.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-kiwisolver
+#
+################################################################################
+
+PYTHON_KIWISOLVER_VERSION = 1.1.0
+PYTHON_KIWISOLVER_SITE = $(call github,nucleic,kiwi,$(PYTHON_KIWISOLVER_VERSION))
+PYTHON_KIWISOLVER_LICENSE = BSD-3-Clause
+PYTHON_KIWISOLVER_LICENSE_FILES = LICENSE
+PYTHON_KIWISOLVER_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
