From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Feb 2017 17:15:35 +0100
Subject: [Buildroot] [git commit] python-attrs: new package
Message-ID: <20170206161703.B4B0081EA9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9ebf0a963f86889bb6d71feb79b1ef83fa7232be
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                      |  1 +
 package/python-attrs/Config.in         |  8 ++++++++
 package/python-attrs/python-attrs.hash |  3 +++
 package/python-attrs/python-attrs.mk   | 14 ++++++++++++++
 4 files changed, 26 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index cb6c12e..907b1e6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -650,6 +650,7 @@ menu "External python modules"
 	source "package/python-alsaaudio/Config.in"
 	source "package/python-argh/Config.in"
 	source "package/python-arrow/Config.in"
+	source "package/python-attrs/Config.in"
 	source "package/python-autobahn/Config.in"
 	source "package/python-babel/Config.in"
 	source "package/python-backports-abc/Config.in"
diff --git a/package/python-attrs/Config.in b/package/python-attrs/Config.in
new file mode 100644
index 0000000..fb0ab24
--- /dev/null
+++ b/package/python-attrs/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_ATTRS
+	bool "python-attrs"
+	help
+	  attrs is the Python package that will bring back the joy of
+	  writing classes by relieving you from the drudgery of
+	  implementing object protocols (aka dunder methods).
+
+	  https://attrs.readthedocs.io/
diff --git a/package/python-attrs/python-attrs.hash b/package/python-attrs/python-attrs.hash
new file mode 100644
index 0000000..33ecd2c
--- /dev/null
+++ b/package/python-attrs/python-attrs.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi/attrs/json, sha256 locally computed
+md5	4ec003c49360853cf935113d1ae56151  attrs-16.3.0.tar.gz
+sha256	80203177723e36f3bbe15aa8553da6e80d47bfe53647220ccaa9ad7a5e473ccc  attrs-16.3.0.tar.gz
diff --git a/package/python-attrs/python-attrs.mk b/package/python-attrs/python-attrs.mk
new file mode 100644
index 0000000..5e7985a
--- /dev/null
+++ b/package/python-attrs/python-attrs.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-attrs
+#
+################################################################################
+
+PYTHON_ATTRS_VERSION = 16.3.0
+PYTHON_ATTRS_SOURCE = attrs-$(PYTHON_ATTRS_VERSION).tar.gz
+PYTHON_ATTRS_SITE = https://pypi.python.org/packages/01/b0/3ac73bf6df716a38568a16f6a9cbc46cc9e8ed6fe30c8768260030db55d4
+PYTHON_ATTRS_SETUP_TYPE = setuptools
+PYTHON_ATTRS_LICENSE = MIT
+PYTHON_ATTRS_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
