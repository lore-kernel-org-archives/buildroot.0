From: Steve Calfee <stevecalfee@gmail.com>
Date: Sun, 13 Sep 2015 09:41:43 -0700
Subject: [Buildroot] [PATCH 1/1] add python simple template module
Message-ID: <1442162503-5817-1-git-send-email-stevecalfee@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Steve Calfee <stevecalfee@gmail.com>
---
 package/Config.in                            |  1 +
 package/python-pyratemp/Config.in            |  9 +++++++++
 package/python-pyratemp/python-pyratemp.hash |  4 ++++
 package/python-pyratemp/python-pyratemp.mk   | 14 ++++++++++++++
 4 files changed, 28 insertions(+)
 create mode 100644 package/python-pyratemp/Config.in
 create mode 100644 package/python-pyratemp/python-pyratemp.hash
 create mode 100644 package/python-pyratemp/python-pyratemp.mk

diff --git a/package/Config.in b/package/Config.in
index 030477a..2784339 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -643,6 +643,7 @@ menu "external python modules"
 	source "package/python-pyparsing/Config.in"
 	source "package/python-pypcap/Config.in"
 	source "package/python-pyqt/Config.in"
+	source "package/python-pyratemp/Config.in"
 	source "package/python-pyro/Config.in"
 	source "package/python-pyroute2/Config.in"
 	source "package/python-pysendfile/Config.in"
diff --git a/package/python-pyratemp/Config.in b/package/python-pyratemp/Config.in
new file mode 100644
index 0000000..1e7309e
--- /dev/null
+++ b/package/python-pyratemp/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_PYRATEMP
+	bool "python-pyratemp"
+	depends on BR2_PACKAGE_PYTHON
+	help
+	  python-pyratemp is a Python library for doing html templates.
+	  written entirely in Python, that is designed to be very easy to use
+	  and very like writing Python.
+
+	  https://pypi.python.org/pypi/pyratemp/
diff --git a/package/python-pyratemp/python-pyratemp.hash b/package/python-pyratemp/python-pyratemp.hash
new file mode 100644
index 0000000..0abb9e0
--- /dev/null
+++ b/package/python-pyratemp/python-pyratemp.hash
@@ -0,0 +1,4 @@
+# From http://www.simple-is-better.org/template
+# Locally calculated:
+sha256 c45ed656ada482a02fe780495f37a695e7671accb04f918f7e7f18abf877bc71 pyratemp-0.3.2.tgz
+
diff --git a/package/python-pyratemp/python-pyratemp.mk b/package/python-pyratemp/python-pyratemp.mk
new file mode 100644
index 0000000..4c78154
--- /dev/null
+++ b/package/python-pyratemp/python-pyratemp.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-pyratemp
+#
+################################################################################
+
+PYTHON_PYRATEMP_VERSION = 0.3.2
+PYTHON_PYRATEMP_SOURCE = pyratemp-$(PYTHON_PYRATEMP_VERSION).tgz
+PYTHON_PYRATEMP_SITE = http://www.simple-is-better.org/template
+PYTHON_PYRATEMP_LICENSE = MIT
+PYTHON_PYRATEMP_LICENSE_FILES = LICENSE
+PYTHON_PYRATEMP_SETUP_TYPE = distutils
+
+$(eval $(python-package))
-- 
1.9.1
