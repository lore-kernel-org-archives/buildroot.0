From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Dec 2013 13:41:35 +0100
Subject: [Buildroot] [git commit] python-simplejson: new package
Message-ID: <20131215130826.A1DBF9C025@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b973f3bb2cd66efe0ab2a9698b31b9318bcbdf78
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: convert to the Python package infrastructure, drop the
setuptools dependency since the package uses distutils.]

Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                              |    1 +
 package/python-simplejson/Config.in            |    7 +++++++
 package/python-simplejson/python-simplejson.mk |   14 ++++++++++++++
 3 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index e8ecb6a..097ae79 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -406,6 +406,7 @@ source "package/python-pyusb/Config.in"
 source "package/python-pyzmq/Config.in"
 source "package/python-serial/Config.in"
 source "package/python-setuptools/Config.in"
+source "package/python-simplejson/Config.in"
 source "package/python-thrift/Config.in"
 source "package/python-versiontools/Config.in"
 endmenu
diff --git a/package/python-simplejson/Config.in b/package/python-simplejson/Config.in
new file mode 100644
index 0000000..be0ee8f
--- /dev/null
+++ b/package/python-simplejson/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_SIMPLEJSON
+	bool "python-simplejson"
+	depends on BR2_PACKAGE_PYTHON
+	help
+	  Simple, fast, extensible JSON encoder/decoder for Python
+
+	  https://pypi.python.org/pypi/simplejson/
diff --git a/package/python-simplejson/python-simplejson.mk b/package/python-simplejson/python-simplejson.mk
new file mode 100644
index 0000000..eb6287a
--- /dev/null
+++ b/package/python-simplejson/python-simplejson.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-simplejson
+#
+################################################################################
+
+PYTHON_SIMPLEJSON_VERSION = 3.3.1
+PYTHON_SIMPLEJSON_SOURCE = simplejson-$(PYTHON_SIMPLEJSON_VERSION).tar.gz
+PYTHON_SIMPLEJSON_SITE = http://pypi.python.org/packages/source/s/simplejson/
+PYTHON_SIMPLEJSON_LICENSE = MIT
+PYTHON_SIMPLEJSON_LICENSE_FILES = LICENSE.txt
+PYTHON_SIMPLEJSON_SETUP_TYPE = distutils
+
+$(eval $(python-package))
