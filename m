From: Asaf Kahlon <asafka7@gmail.com>
Date: Sat, 24 Oct 2020 17:57:50 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-memory-profiler: new package
Message-ID: <20201024145750.267540-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A module for monitoring memory usage of a python program.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/Config.in                                  |  1 +
 package/python-memory-profiler/Config.in           |  8 ++++++++
 .../python-memory-profiler.hash                    |  5 +++++
 .../python-memory-profiler.mk                      | 14 ++++++++++++++
 4 files changed, 28 insertions(+)
 create mode 100644 package/python-memory-profiler/Config.in
 create mode 100644 package/python-memory-profiler/python-memory-profiler.hash
 create mode 100644 package/python-memory-profiler/python-memory-profiler.mk

diff --git a/package/Config.in b/package/Config.in
index 504cfec98e..4da49ad179 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1037,6 +1037,7 @@ menu "External python modules"
 	source "package/python-matplotlib/Config.in"
 	source "package/python-mbstrdecoder/Config.in"
 	source "package/python-meld3/Config.in"
+	source "package/python-memory-profiler/Config.in"
 	source "package/python-mimeparse/Config.in"
 	source "package/python-mistune/Config.in"
 	source "package/python-modbus-tk/Config.in"
diff --git a/package/python-memory-profiler/Config.in b/package/python-memory-profiler/Config.in
new file mode 100644
index 0000000000..60833304ae
--- /dev/null
+++ b/package/python-memory-profiler/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_MEMORY_PROFILER
+	bool "python-memory-profiler"
+	depends on BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON_PSUTIL # runtime
+	help
+	  A module for monitoring memory usage of a python program.
+
+	  https://github.com/pythonprofilers/memory_profiler
diff --git a/package/python-memory-profiler/python-memory-profiler.hash b/package/python-memory-profiler/python-memory-profiler.hash
new file mode 100644
index 0000000000..9ee515b529
--- /dev/null
+++ b/package/python-memory-profiler/python-memory-profiler.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/memory-profiler/json
+md5  b1d1783064a1198fb21bc877e535ec1b  memory_profiler-0.58.0.tar.gz
+sha256  01385ac0fec944fcf7969814ec4406c6d8a9c66c079d09276723c5a7680f44e5  memory_profiler-0.58.0.tar.gz
+# Locally computed sha256 checksums
+sha256  51926ce91b8283532efa9dfb02518582c15f49c105a3ac18cce1f7a4947e96ae  COPYING
diff --git a/package/python-memory-profiler/python-memory-profiler.mk b/package/python-memory-profiler/python-memory-profiler.mk
new file mode 100644
index 0000000000..053b0e2d62
--- /dev/null
+++ b/package/python-memory-profiler/python-memory-profiler.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-memory-profiler
+#
+################################################################################
+
+PYTHON_MEMORY_PROFILER_VERSION = 0.58.0
+PYTHON_MEMORY_PROFILER_SOURCE = memory_profiler-$(PYTHON_MEMORY_PROFILER_VERSION).tar.gz
+PYTHON_MEMORY_PROFILER_SITE = https://files.pythonhosted.org/packages/8f/fd/d92b3295657f8837e0177e7b48b32d6651436f0293af42b76d134c3bb489
+PYTHON_MEMORY_PROFILER_SETUP_TYPE = setuptools
+PYTHON_MEMORY_PROFILER_LICENSE = BSD-3-Clause
+PYTHON_MEMORY_PROFILER_LICENSE_FILES = COPYING
+
+$(eval $(python-package))
-- 
2.29.0
