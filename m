From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Jun 2016 10:42:58 +0200
Subject: [Buildroot] [git commit] python-u-msgpack: new package
Message-ID: <20160609084329.D1820817B4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f18d22e8342454c86281ed93734e8b56fae8b3a3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
[Thomas: add umsgpack.py as license file.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                              |  1 +
 package/python-u-msgpack/Config.in             |  7 +++++++
 package/python-u-msgpack/python-u-msgpack.hash |  4 ++++
 package/python-u-msgpack/python-u-msgpack.mk   | 14 ++++++++++++++
 4 files changed, 26 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index fa269d8..38c8527 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -759,6 +759,7 @@ menu "External python modules"
 	source "package/python-treq/Config.in"
 	source "package/python-twisted/Config.in"
 	source "package/python-txaio/Config.in"
+	source "package/python-u-msgpack/Config.in"
 	source "package/python-ubjson/Config.in"
 	source "package/python-ujson/Config.in"
 	source "package/python-urllib3/Config.in"
diff --git a/package/python-u-msgpack/Config.in b/package/python-u-msgpack/Config.in
new file mode 100644
index 0000000..ad0f90e
--- /dev/null
+++ b/package/python-u-msgpack/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_U_MSGPACK
+	bool "python-u-msgpack"
+	help
+	  A portable, lightweight MessagePack serializer and deserializer
+	  written in pure Python.
+
+	  https://github.com/vsergeev/u-msgpack-python
diff --git a/package/python-u-msgpack/python-u-msgpack.hash b/package/python-u-msgpack/python-u-msgpack.hash
new file mode 100644
index 0000000..16f5040
--- /dev/null
+++ b/package/python-u-msgpack/python-u-msgpack.hash
@@ -0,0 +1,4 @@
+# md5 from https://pypi.python.org/pypi/u-msgpack-python/json
+md5	2ccadbf06c7e70bbdb58e920d045d50c  u-msgpack-python-2.1.tar.gz
+# sha256 calculated by scanpypi
+sha256	66a39ddc6830be29b6d304dee9d4ab37104550ac4565eab1aa4c2bd3d34d759f  u-msgpack-python-2.1.tar.gz
diff --git a/package/python-u-msgpack/python-u-msgpack.mk b/package/python-u-msgpack/python-u-msgpack.mk
new file mode 100644
index 0000000..e389716
--- /dev/null
+++ b/package/python-u-msgpack/python-u-msgpack.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-u-msgpack
+#
+################################################################################
+
+PYTHON_U_MSGPACK_VERSION = 2.1
+PYTHON_U_MSGPACK_SOURCE = u-msgpack-python-$(PYTHON_U_MSGPACK_VERSION).tar.gz
+PYTHON_U_MSGPACK_SITE = https://pypi.python.org/packages/b7/8d/791f037a0954f98a8eceb09c7c14babb97db0a81c985108bb21939b801eb
+PYTHON_U_MSGPACK_SETUP_TYPE = distutils
+PYTHON_U_MSGPACK_LICENSE = MIT
+PYTHON_U_MSGPACK_LICENSE_FILES = umsgpack.py
+
+$(eval $(python-package))
