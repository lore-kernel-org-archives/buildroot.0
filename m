From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Jul 2016 15:04:39 +0200
Subject: [Buildroot] [git commit] python-engineio: new package
Message-ID: <20160701131243.C9507820FE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a6a675c0ea6a82438f1349222a2e2e390729a66e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                            |  1 +
 package/python-engineio/Config.in            |  9 +++++++++
 package/python-engineio/python-engineio.hash |  4 ++++
 package/python-engineio/python-engineio.mk   | 14 ++++++++++++++
 4 files changed, 28 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 1bf7b1c..a2d08a1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -671,6 +671,7 @@ menu "External python modules"
 	source "package/python-dominate/Config.in"
 	source "package/python-dpkt/Config.in"
 	source "package/python-ecdsa/Config.in"
+	source "package/python-engineio/Config.in"
 	source "package/python-enum/Config.in"
 	source "package/python-enum34/Config.in"
 	source "package/python-flask/Config.in"
diff --git a/package/python-engineio/Config.in b/package/python-engineio/Config.in
new file mode 100644
index 0000000..b12db92
--- /dev/null
+++ b/package/python-engineio/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_ENGINEIO
+	bool "python-engineio"
+	select BR2_PACKAGE_PYTHON_SIX # runtime
+	select BR2_PACKAGE_PYTHON_ZLIB if BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON3_ZLIB if BR2_PACKAGE_PYTHON3
+	help
+	  Engine.IO server.
+
+	  http://github.com/miguelgrinberg/python-engineio/
diff --git a/package/python-engineio/python-engineio.hash b/package/python-engineio/python-engineio.hash
new file mode 100644
index 0000000..b2c0669
--- /dev/null
+++ b/package/python-engineio/python-engineio.hash
@@ -0,0 +1,4 @@
+# md5 from https://pypi.python.org/pypi/python-engineio/json
+md5	9b0075dbbb25d7a302eba99dd9ba4af8  python-engineio-0.9.2.tar.gz
+# sha256 calculated by scanpypi
+sha256	c53282415ed9bc3cb4e7beafb2a1ce5c369af95dcf8f968061e5bc7572b60867  python-engineio-0.9.2.tar.gz
diff --git a/package/python-engineio/python-engineio.mk b/package/python-engineio/python-engineio.mk
new file mode 100644
index 0000000..700b638
--- /dev/null
+++ b/package/python-engineio/python-engineio.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-engineio
+#
+################################################################################
+
+PYTHON_ENGINEIO_VERSION = 0.9.2
+PYTHON_ENGINEIO_SOURCE = python-engineio-$(PYTHON_ENGINEIO_VERSION).tar.gz
+PYTHON_ENGINEIO_SITE = https://pypi.python.org/packages/c3/8f/0e066fc7a7029893b96b1d68a0cd5e75f6410f154fa4079b2be4991f5ae0
+PYTHON_ENGINEIO_SETUP_TYPE = setuptools
+PYTHON_ENGINEIO_LICENSE = MIT
+PYTHON_ENGINEIO_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
