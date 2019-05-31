From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 31 May 2019 12:16:52 -0500
Subject: [Buildroot] [PATCH 4/6] package/python-tinyrpc: new package
In-Reply-To: <20190531171654.17906-1-matthew.weber@rockwellcollins.com>
References: <20190531171654.17906-1-matthew.weber@rockwellcollins.com>
Message-ID: <20190531171654.17906-4-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A protocol neutral RPC library that supports JSON-RPC and zmq.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 DEVELOPERS                                 |  1 +
 package/Config.in                          |  1 +
 package/python-tinyrpc/Config.in           |  9 +++++++++
 package/python-tinyrpc/python-tinyrpc.hash |  5 +++++
 package/python-tinyrpc/python-tinyrpc.mk   | 14 ++++++++++++++
 5 files changed, 30 insertions(+)
 create mode 100644 package/python-tinyrpc/Config.in
 create mode 100644 package/python-tinyrpc/python-tinyrpc.hash
 create mode 100644 package/python-tinyrpc/python-tinyrpc.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index e4c25e1877..b53e98259f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1526,6 +1526,7 @@ F:	package/python-posix-ipc/
 F:	package/python-pycairo/
 F:	package/python-pypcap/
 F:	package/python-pyrex/
+F:	package/python-tinyrpc/
 F:	package/raptor/
 F:	package/rcw/
 F:	package/rng-tools/
diff --git a/package/Config.in b/package/Config.in
index d89bbbb4bc..0080cdd625 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1070,6 +1070,7 @@ menu "External python modules"
 	source "package/python-terminaltables/Config.in"
 	source "package/python-texttable/Config.in"
 	source "package/python-thrift/Config.in"
+	source "package/python-tinyrpc/Config.in"
 	source "package/python-tomako/Config.in"
 	source "package/python-toml/Config.in"
 	source "package/python-tornado/Config.in"
diff --git a/package/python-tinyrpc/Config.in b/package/python-tinyrpc/Config.in
new file mode 100644
index 0000000000..3c643c754a
--- /dev/null
+++ b/package/python-tinyrpc/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_TINYRPC
+	bool "python-tinyrpc"
+	select BR2_PACKAGE_PYTHON_SIX # runtime
+	help
+	  A small, modular, transport and protocol neutral RPC
+	  library that, among other things, supports JSON-RPC and
+	  zmq.
+
+	  http://github.com/mbr/tinyrpc
diff --git a/package/python-tinyrpc/python-tinyrpc.hash b/package/python-tinyrpc/python-tinyrpc.hash
new file mode 100644
index 0000000000..dcaa479866
--- /dev/null
+++ b/package/python-tinyrpc/python-tinyrpc.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/tinyrpc/json
+md5	ee8fd20fb4879d4ec96500e50333b6cf  tinyrpc-1.0.1.tar.gz
+sha256	4572c9d63b056b5eb24bae5e0894115fe6b5c3fa314851d9df439c7d3f8e9d2b  tinyrpc-1.0.1.tar.gz
+# Locally computed sha256 checksums
+sha256	587f1ea174824613f4a7e0d7fb95fda000a7f58ca17df12416e014c9ee82e619  LICENSE
diff --git a/package/python-tinyrpc/python-tinyrpc.mk b/package/python-tinyrpc/python-tinyrpc.mk
new file mode 100644
index 0000000000..9ab039f955
--- /dev/null
+++ b/package/python-tinyrpc/python-tinyrpc.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-tinyrpc
+#
+################################################################################
+
+PYTHON_TINYRPC_VERSION = 1.0.1
+PYTHON_TINYRPC_SOURCE = tinyrpc-$(PYTHON_TINYRPC_VERSION).tar.gz
+PYTHON_TINYRPC_SITE = https://files.pythonhosted.org/packages/1f/f9/d2f9aa8238fc4f3f92e3912b3768c67e3b74257fdf47da2db391354be285
+PYTHON_TINYRPC_SETUP_TYPE = setuptools
+PYTHON_TINYRPC_LICENSE = MIT
+PYTHON_TINYRPC_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.17.1
