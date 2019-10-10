From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 10 Oct 2019 22:45:13 +0200
Subject: [Buildroot] [git commit] package/python-webencodings: new package
Message-ID: <20191010204125.232078CA01@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7c70446e01b454a3e022e974c0a7e1ab362d4a2c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License is not included in the tarball, so we'll use PKG-INFO
(the license was added to the MANIFEST, and maybe included on the
next release).

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                                    |  1 +
 package/python-webencodings/Config.in                |  6 ++++++
 package/python-webencodings/python-webencodings.hash |  5 +++++
 package/python-webencodings/python-webencodings.mk   | 14 ++++++++++++++
 4 files changed, 26 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 71e939797c..d94ae5132e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1123,6 +1123,7 @@ menu "External python modules"
 	source "package/python-watchdog/Config.in"
 	source "package/python-wcwidth/Config.in"
 	source "package/python-web2py/Config.in"
+	source "package/python-webencodings/Config.in"
 	source "package/python-webob/Config.in"
 	source "package/python-webpy/Config.in"
 	source "package/python-websocket-client/Config.in"
diff --git a/package/python-webencodings/Config.in b/package/python-webencodings/Config.in
new file mode 100644
index 0000000000..52c7235452
--- /dev/null
+++ b/package/python-webencodings/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_WEBENCODINGS
+	bool "python-webencodings"
+	help
+	  Character encoding aliases for legacy web content.
+
+	  https://github.com/SimonSapin/python-webencodings
diff --git a/package/python-webencodings/python-webencodings.hash b/package/python-webencodings/python-webencodings.hash
new file mode 100644
index 0000000000..90f5e66264
--- /dev/null
+++ b/package/python-webencodings/python-webencodings.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/webencodings/json
+md5	32f6e261d52e57bf7e1c4d41546d15b8  webencodings-0.5.1.tar.gz
+sha256	b36a1c245f2d304965eb4e0a82848379241dc04b865afcc4aab16748587e1923  webencodings-0.5.1.tar.gz
+# Locally computed sha256 checksumms
+sha256	c27693b0174d6d04dafd0242857ae72763f5404b675972c777fd865bc3c0abe1  PKG-INFO
diff --git a/package/python-webencodings/python-webencodings.mk b/package/python-webencodings/python-webencodings.mk
new file mode 100644
index 0000000000..63c6d37373
--- /dev/null
+++ b/package/python-webencodings/python-webencodings.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-webencodings
+#
+################################################################################
+
+PYTHON_WEBENCODINGS_VERSION = 0.5.1
+PYTHON_WEBENCODINGS_SOURCE = webencodings-$(PYTHON_WEBENCODINGS_VERSION).tar.gz
+PYTHON_WEBENCODINGS_SITE = https://files.pythonhosted.org/packages/0b/02/ae6ceac1baeda530866a85075641cec12989bd8d31af6d5ab4a3e8c92f47
+PYTHON_WEBENCODINGS_SETUP_TYPE = setuptools
+PYTHON_WEBENCODINGS_LICENSE = BSD-3-Clause
+PYTHON_WEBENCODINGS_LICENSE_FILES = PKG-INFO
+
+$(eval $(python-package))
