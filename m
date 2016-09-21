From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Sep 2016 20:48:05 +0200
Subject: [Buildroot] [git commit] python-docutils: new package
Message-ID: <20160921184829.2D79081D60@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=688cff67b82db71e482f32edf12133e75aa4b264
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Host variant is needed for building python-daemon package.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
[Thomas: improve license description.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                            |  1 +
 package/python-docutils/Config.in            |  9 +++++++++
 package/python-docutils/python-docutils.hash |  3 +++
 package/python-docutils/python-docutils.mk   | 15 +++++++++++++++
 4 files changed, 28 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index dd220e8..9ca6c15 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -669,6 +669,7 @@ menu "External python modules"
 	source "package/python-dicttoxml/Config.in"
 	source "package/python-django/Config.in"
 	source "package/python-docopt/Config.in"
+	source "package/python-docutils/Config.in"
 	source "package/python-dominate/Config.in"
 	source "package/python-dpkt/Config.in"
 	source "package/python-ecdsa/Config.in"
diff --git a/package/python-docutils/Config.in b/package/python-docutils/Config.in
new file mode 100644
index 0000000..e7bf7e6
--- /dev/null
+++ b/package/python-docutils/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_DOCUTILS
+	bool "python-docutils"
+	help
+	  Docutils is a modular system for processing documentation
+	  into useful formats, such as HTML, XML, and LaTeX. For input
+	  Docutils supports reStructuredText, an easy-to-read,
+	  what-you-see-is-what-you-get plaintext markup syntax.
+
+	  http://docutils.sourceforge.net/
diff --git a/package/python-docutils/python-docutils.hash b/package/python-docutils/python-docutils.hash
new file mode 100644
index 0000000..9d45058
--- /dev/null
+++ b/package/python-docutils/python-docutils.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi/docutils/json, sha256 locally computed
+md5     4622263b62c5c771c03502afa3157768 docutils-0.12.tar.gz
+sha256  c7db717810ab6965f66c8cf0398a98c9d8df982da39b4cd7f162911eb89596fa  docutils-0.12.tar.gz
diff --git a/package/python-docutils/python-docutils.mk b/package/python-docutils/python-docutils.mk
new file mode 100644
index 0000000..a67d89f
--- /dev/null
+++ b/package/python-docutils/python-docutils.mk
@@ -0,0 +1,15 @@
+#############################################################
+#
+# python-docutils
+#
+#############################################################
+
+PYTHON_DOCUTILS_VERSION = 0.12
+PYTHON_DOCUTILS_SOURCE = docutils-$(PYTHON_DOCUTILS_VERSION).tar.gz
+PYTHON_DOCUTILS_SITE = https://pypi.python.org/packages/37/38/ceda70135b9144d84884ae2fc5886c6baac4edea39550f28bcd144c1234d
+PYTHON_DOCUTILS_LICENSE = Public Domain, BSD-2c, GPLv3 (emacs mode), other
+PYTHON_DOCUTILS_LICENSE_FILES = COPYING.txt
+PYTHON_DOCUTILS_SETUP_TYPE = distutils
+
+$(eval $(python-package))
+$(eval $(host-python-package))
