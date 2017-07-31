From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 31 Jul 2017 21:30:25 +0200
Subject: [Buildroot] [git commit] python-hpack: new package
Message-ID: <20170731192637.AA608817BA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d8514a745cd9a5035ead8bc8630327276e13628d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                      |  1 +
 package/python-hpack/Config.in         |  6 ++++++
 package/python-hpack/python-hpack.hash |  3 +++
 package/python-hpack/python-hpack.mk   | 14 ++++++++++++++
 4 files changed, 24 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index d92cdad..87b61a8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -741,6 +741,7 @@ menu "External python modules"
 	source "package/python-futures/Config.in"
 	source "package/python-gobject/Config.in"
 	source "package/python-gunicorn/Config.in"
+	source "package/python-hpack/Config.in"
 	source "package/python-html5lib/Config.in"
 	source "package/python-httplib2/Config.in"
 	source "package/python-humanize/Config.in"
diff --git a/package/python-hpack/Config.in b/package/python-hpack/Config.in
new file mode 100644
index 0000000..b0ea03b
--- /dev/null
+++ b/package/python-hpack/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_HPACK
+	bool "python-hpack"
+	help
+	  Pure-Python HPACK header compression.
+
+	  http://hyper.rtfd.org
diff --git a/package/python-hpack/python-hpack.hash b/package/python-hpack/python-hpack.hash
new file mode 100644
index 0000000..445d4d5
--- /dev/null
+++ b/package/python-hpack/python-hpack.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi/hpack/json, sha256 locally computed
+md5	556b0ae66180f54c2ce8029a0952088b  hpack-3.0.0.tar.gz
+sha256	8eec9c1f4bfae3408a3f30500261f7e6a65912dc138526ea054f9ad98892e9d2  hpack-3.0.0.tar.gz
diff --git a/package/python-hpack/python-hpack.mk b/package/python-hpack/python-hpack.mk
new file mode 100644
index 0000000..d6b9664
--- /dev/null
+++ b/package/python-hpack/python-hpack.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-hpack
+#
+################################################################################
+
+PYTHON_HPACK_VERSION = 3.0.0
+PYTHON_HPACK_SOURCE = hpack-$(PYTHON_HPACK_VERSION).tar.gz
+PYTHON_HPACK_SITE = https://pypi.python.org/packages/44/f1/b4440e46e265a29c0cb7b09b6daec6edf93c79eae713cfed93fbbf8716c5
+PYTHON_HPACK_SETUP_TYPE = setuptools
+PYTHON_HPACK_LICENSE = MIT
+PYTHON_HPACK_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
