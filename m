From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 31 Dec 2020 14:29:56 +0100
Subject: [Buildroot] [git commit] package/python-defusedxml: new package
Message-ID: <20201231131352.F3D288039D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0279bf08ce9b4b82b053711b9372d3ea3a9fd66f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

XML bomb protection for Python stdlib modules.

Signed-off-by: Simon Rowe <simon.rowe@citrix.com>
[yann.morin.1998 at free.fr: two spaces in hash file]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/Config.in                                |  1 +
 package/python-defusedxml/Config.in              |  6 ++++++
 package/python-defusedxml/python-defusedxml.hash |  5 +++++
 package/python-defusedxml/python-defusedxml.mk   | 14 ++++++++++++++
 4 files changed, 26 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 333f774157..2dd477d1c6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -946,6 +946,7 @@ menu "External python modules"
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
index 0000000000..c782a97bbd
--- /dev/null
+++ b/package/python-defusedxml/python-defusedxml.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/defusedxml/json
+md5  a59741f675c4cba649de40a99f732897  defusedxml-0.6.0.tar.gz
+sha256  f684034d135af4c6cbb949b8a4d2ed61634515257a67299e5f940fbaa34377f5  defusedxml-0.6.0.tar.gz
+# Locally computed sha256 checksums
+sha256  b80ce9da8c42a1f91079627fbbe2bf27210ae108a0ffe5f077d5b08e076c24c8  LICENSE
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
