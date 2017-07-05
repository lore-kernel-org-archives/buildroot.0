From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Wed,  5 Jul 2017 15:47:40 +0200
Subject: [Buildroot] [PATCH 2/4] python-hpack: new package
In-Reply-To: <20170705134742.9178-1-yegorslists@googlemail.com>
References: <20170705134742.9178-1-yegorslists@googlemail.com>
Message-ID: <20170705134742.9178-2-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in                      |  1 +
 package/python-hpack/Config.in         |  6 ++++++
 package/python-hpack/python-hpack.hash |  3 +++
 package/python-hpack/python-hpack.mk   | 14 ++++++++++++++
 4 files changed, 24 insertions(+)
 create mode 100644 package/python-hpack/Config.in
 create mode 100644 package/python-hpack/python-hpack.hash
 create mode 100644 package/python-hpack/python-hpack.mk

diff --git a/package/Config.in b/package/Config.in
index b72a24bcbe..5607f33114 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -739,6 +739,7 @@ menu "External python modules"
 	source "package/python-futures/Config.in"
 	source "package/python-gobject/Config.in"
 	source "package/python-gunicorn/Config.in"
+	source "package/python-hpack/Config.in"
 	source "package/python-html5lib/Config.in"
 	source "package/python-httplib2/Config.in"
 	source "package/python-humanize/Config.in"
diff --git a/package/python-hpack/Config.in b/package/python-hpack/Config.in
new file mode 100644
index 0000000000..b0ea03bc42
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
index 0000000000..445d4d59f5
--- /dev/null
+++ b/package/python-hpack/python-hpack.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi/hpack/json, sha256 locally computed
+md5	556b0ae66180f54c2ce8029a0952088b  hpack-3.0.0.tar.gz
+sha256	8eec9c1f4bfae3408a3f30500261f7e6a65912dc138526ea054f9ad98892e9d2  hpack-3.0.0.tar.gz
diff --git a/package/python-hpack/python-hpack.mk b/package/python-hpack/python-hpack.mk
new file mode 100644
index 0000000000..d6b96649e9
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
-- 
2.11.0
