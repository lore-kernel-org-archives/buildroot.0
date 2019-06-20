From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 20 Jun 2019 22:18:34 +0200
Subject: [Buildroot] [git commit] package/python-tinyrpc: new package
Message-ID: <20190620201826.10EE580369@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9f85187999a0c1a76c85f787491436154766a03e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A protocol neutral RPC library that supports JSON-RPC and zmq.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                 |  1 +
 package/Config.in                          |  1 +
 package/python-tinyrpc/Config.in           |  9 +++++++++
 package/python-tinyrpc/python-tinyrpc.hash |  5 +++++
 package/python-tinyrpc/python-tinyrpc.mk   | 14 ++++++++++++++
 5 files changed, 30 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index b416cd45e8..470ee31a21 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1532,6 +1532,7 @@ F:	package/python-ipy/
 F:	package/python-posix-ipc/
 F:	package/python-pypcap/
 F:	package/python-pyrex/
+F:	package/python-tinyrpc/
 F:	package/raptor/
 F:	package/rcw/
 F:	package/rng-tools/
diff --git a/package/Config.in b/package/Config.in
index 07edde8d42..c1056e0c79 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1075,6 +1075,7 @@ menu "External python modules"
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
