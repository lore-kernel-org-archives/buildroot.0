From: Simon J. Rowe <srowe@mose.org.uk>
Date: Fri, 27 Nov 2020 14:10:38 +0000
Subject: [Buildroot] [PATCH 1/1] package/python-defusedxml: new package
Message-ID: <20201127141038.30065-1-srowe@mose.org.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Rowe <simon.rowe@citrix.com>

XML bomb protection for Python stdlib modules.

Signed-off-by: Simon Rowe <simon.rowe@citrix.com>
---
 package/Config.in                                |  1 +
 package/python-defusedxml/Config.in              |  6 ++++++
 package/python-defusedxml/python-defusedxml.hash |  5 +++++
 package/python-defusedxml/python-defusedxml.mk   | 14 ++++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/python-defusedxml/Config.in
 create mode 100644 package/python-defusedxml/python-defusedxml.hash
 create mode 100644 package/python-defusedxml/python-defusedxml.mk

diff --git a/package/Config.in b/package/Config.in
index 016a99ed1a..868c3b00ea 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -942,6 +942,7 @@ menu "External python modules"
 	source "package/python-dataproperty/Config.in"
 	source "package/python-dateutil/Config.in"
 	source "package/python-decorator/Config.in"
+	source "package/python-defusedxml/Config.in"
 	source "package/python-dialog/Config.in"
 	source "package/python-dialog3/Config.in"
 	source "package/python-dicttoxml/Config.in"
diff --git a/package/python-defusedxml/Config.in b/package/python-defusedxml/Config.in
new file mode 100644
index 0000000000..85285da5ec
--- /dev/null
+++ b/package/python-defusedxml/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_DEFUSEDXML
+	bool "python-defusedxml"
+	help
+	  XML bomb protection for Python stdlib modules
+
+	  https://pypi.org/project/defusedxml/
diff --git a/package/python-defusedxml/python-defusedxml.hash b/package/python-defusedxml/python-defusedxml.hash
new file mode 100644
index 0000000000..9f9171858b
--- /dev/null
+++ b/package/python-defusedxml/python-defusedxml.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/defusedxml/json
+md5	a59741f675c4cba649de40a99f732897  defusedxml-0.6.0.tar.gz
+sha256	f684034d135af4c6cbb949b8a4d2ed61634515257a67299e5f940fbaa34377f5  defusedxml-0.6.0.tar.gz
+# Locally computed sha256 checksums
+sha256	b80ce9da8c42a1f91079627fbbe2bf27210ae108a0ffe5f077d5b08e076c24c8  LICENSE
diff --git a/package/python-defusedxml/python-defusedxml.mk b/package/python-defusedxml/python-defusedxml.mk
new file mode 100644
index 0000000000..6d2a9aff43
--- /dev/null
+++ b/package/python-defusedxml/python-defusedxml.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-defusedxml
+#
+################################################################################
+
+PYTHON_DEFUSEDXML_VERSION = 0.6.0
+PYTHON_DEFUSEDXML_SOURCE = defusedxml-$(PYTHON_DEFUSEDXML_VERSION).tar.gz
+PYTHON_DEFUSEDXML_SITE = https://files.pythonhosted.org/packages/a4/5f/f8aa58ca0cf01cbcee728abc9d88bfeb74e95e6cb4334cfd5bed5673ea77
+PYTHON_DEFUSEDXML_SETUP_TYPE = setuptools
+PYTHON_DEFUSEDXML_LICENSE = Python-2.0
+PYTHON_DEFUSEDXML_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.21.3
