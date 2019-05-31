From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 31 May 2019 12:16:49 -0500
Subject: [Buildroot] [PATCH 1/6] package/python-colorama: new package
Message-ID: <20190531171654.17906-1-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package provides a simple cross-platform API for printing
colored terminal text.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 DEVELOPERS                                   |  1 +
 package/Config.in                            |  1 +
 package/python-colorama/Config.in            |  6 ++++++
 package/python-colorama/python-colorama.hash |  5 +++++
 package/python-colorama/python-colorama.mk   | 14 ++++++++++++++
 5 files changed, 27 insertions(+)
 create mode 100644 package/python-colorama/Config.in
 create mode 100644 package/python-colorama/python-colorama.hash
 create mode 100644 package/python-colorama/python-colorama.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 1149fcb508..ddab99c9de 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1518,6 +1518,7 @@ F:	package/policycoreutils/
 F:	package/proftpd/
 F:	package/protobuf-c/
 F:	package/protobuf/
+F:	package/python-colorama/
 F:	package/python-flask-cors/
 F:	package/python-ipy/
 F:	package/python-posix-ipc/
diff --git a/package/Config.in b/package/Config.in
index f592e74a99..0c784eac0e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -849,6 +849,7 @@ menu "External python modules"
 	source "package/python-cherrypy/Config.in"
 	source "package/python-click/Config.in"
 	source "package/python-coherence/Config.in"
+	source "package/python-colorama/Config.in"
 	source "package/python-configobj/Config.in"
 	source "package/python-configshell-fb/Config.in"
 	source "package/python-constantly/Config.in"
diff --git a/package/python-colorama/Config.in b/package/python-colorama/Config.in
new file mode 100644
index 0000000000..911effb3d3
--- /dev/null
+++ b/package/python-colorama/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_COLORAMA
+	bool "python-colorama"
+	help
+	  Cross-platform colored terminal text.
+
+	  https://github.com/tartley/colorama
diff --git a/package/python-colorama/python-colorama.hash b/package/python-colorama/python-colorama.hash
new file mode 100644
index 0000000000..06f61f80af
--- /dev/null
+++ b/package/python-colorama/python-colorama.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/colorama/json
+md5	f927529cd1735f6f50ee2c61628e9c1f  colorama-0.4.1.tar.gz
+sha256	05eed71e2e327246ad6b38c540c4a3117230b19679b875190486ddd2d721422d  colorama-0.4.1.tar.gz
+# Locally computed sha256 checksums
+sha256	cac35c02686e5d04a5a7140bfb3b36e73aed496656e891102e428886d7930318  LICENSE.txt
diff --git a/package/python-colorama/python-colorama.mk b/package/python-colorama/python-colorama.mk
new file mode 100644
index 0000000000..2f4bc5e1f1
--- /dev/null
+++ b/package/python-colorama/python-colorama.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-colorama
+#
+################################################################################
+
+PYTHON_COLORAMA_VERSION = 0.4.1
+PYTHON_COLORAMA_SOURCE = colorama-$(PYTHON_COLORAMA_VERSION).tar.gz
+PYTHON_COLORAMA_SITE = https://files.pythonhosted.org/packages/76/53/e785891dce0e2f2b9f4b4ff5bc6062a53332ed28833c7afede841f46a5db
+PYTHON_COLORAMA_SETUP_TYPE = setuptools
+PYTHON_COLORAMA_LICENSE = BSD-3-Clause
+PYTHON_COLORAMA_LICENSE_FILES = LICENSE.txt
+
+$(eval $(python-package))
-- 
2.17.1
