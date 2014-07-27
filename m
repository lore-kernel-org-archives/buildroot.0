From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Jul 2014 15:31:04 +0200
Subject: [Buildroot] [git commit] python-flup: new package
Message-ID: <20140727133515.AB4479D2E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1030ea5a5b327b2235766f70f5d86ff2d8e63818
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This module is useful to implement a fastCGI webserver
Tested with ARM and Python 2.7.6

[Thomas: fix license informations.]

Signed-off-by: oli vogt <oli.vogt.pub01@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                  |    1 +
 package/python-flup/Config.in      |    9 +++++++++
 package/python-flup/python-flup.mk |   15 +++++++++++++++
 3 files changed, 25 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 8de06e2..ce47984 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -473,6 +473,7 @@ menu "external python modules"
 	source "package/python-crc16/Config.in"
 	source "package/python-dialog/Config.in"
 	source "package/python-dpkt/Config.in"
+	source "package/python-flup/Config.in"
 	source "package/python-id3/Config.in"
 	source "package/python-ipy/Config.in"
 	source "package/python-json-schema-validator/Config.in"
diff --git a/package/python-flup/Config.in b/package/python-flup/Config.in
new file mode 100644
index 0000000..2c21323
--- /dev/null
+++ b/package/python-flup/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_FLUP
+	bool "python-flup"
+	depends on BR2_PACKAGE_PYTHON
+	help
+	  flup provides of a collection of WSGI modules for Python.
+	  It allows a webserver to use scgi-mod and fastcgi-mod
+	  with python.
+
+	  https://pypi.python.org/pypi/flup
diff --git a/package/python-flup/python-flup.mk b/package/python-flup/python-flup.mk
new file mode 100644
index 0000000..39c6658
--- /dev/null
+++ b/package/python-flup/python-flup.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-flup
+#
+################################################################################
+
+PYTHON_FLUP_VERSION = 1.0.3.dev-20110405
+PYTHON_FLUP_SOURCE = flup-$(PYTHON_FLUP_VERSION).tar.gz
+PYTHON_FLUP_SITE = http://pypi.python.org/packages/source/f/flup
+
+PYTHON_FLUP_LICENSE = BSD-2c
+
+PYTHON_FLUP_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
