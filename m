From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Jul 2015 00:01:09 +0200
Subject: [Buildroot] [git commit] python-pycli: new package
Message-ID: <20150728220141.755667FEF8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1ec19e5e47486d2ba61564b37f1c8b6e62ec6d28
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
  - rewrap too long lines in Config.in help text
  - add missing upstream URL in Config.in help text
  - add missing hash file
  - fix the licensing informations, which were incorrect
  - remove duplicate <pkg>_SETUP_TYPE definition.]

Signed-off-by: Geoffrey Ragot <geoffrey.ragot@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                      |    1 +
 package/python-pycli/Config.in         |    7 +++++++
 package/python-pycli/python-pycli.hash |    4 ++++
 package/python-pycli/python-pycli.mk   |   14 ++++++++++++++
 4 files changed, 26 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 8db91eb..eba74a0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -636,6 +636,7 @@ menu "external python modules"
 	source "package/python-protobuf/Config.in"
 	source "package/python-psutil/Config.in"
 	source "package/python-pyasn/Config.in"
+	source "package/python-pycli/Config.in"
 	source "package/python-pycrypto/Config.in"
 	source "package/python-pydal/Config.in"
 	source "package/python-pyftpdlib/Config.in"
diff --git a/package/python-pycli/Config.in b/package/python-pycli/Config.in
new file mode 100644
index 0000000..e1ce3b9
--- /dev/null
+++ b/package/python-pycli/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_PYCLI
+	bool "python-pycli"
+	help
+	  The cli package is a framework for making simple, correct
+	  command line applications in Python.
+
+	  https://pythonhosted.org/pyCLI/
diff --git a/package/python-pycli/python-pycli.hash b/package/python-pycli/python-pycli.hash
new file mode 100644
index 0000000..8be3178
--- /dev/null
+++ b/package/python-pycli/python-pycli.hash
@@ -0,0 +1,4 @@
+# From https://pypi.python.org/pypi?:action=show_md5&digest=5cad880168f3423a1235b396735c1360
+md5 5cad880168f3423a1235b396735c1360 pyCLI-devel.tar.gz
+# Locally calculated
+sha256 d7dc3245d79ef00ba5c0d6b008eb3d1a519c0df4cfa4467eee5160a80c6ddc0a pyCLI-devel.tar.gz
diff --git a/package/python-pycli/python-pycli.mk b/package/python-pycli/python-pycli.mk
new file mode 100644
index 0000000..2d83acd
--- /dev/null
+++ b/package/python-pycli/python-pycli.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-pycli
+#
+################################################################################
+
+PYTHON_PYCLI_VERSION = devel
+PYTHON_PYCLI_SOURCE = pyCLI-$(PYTHON_PYCLI_VERSION).tar.gz
+PYTHON_PYCLI_SITE = https://pypi.python.org/packages/source/p/pyCLI/
+PYTHON_PYCLI_LICENSE = ISC-like
+PYTHON_PYCLI_LICENSE_FILES = lib/cli/__init__.py
+PYTHON_PYCLI_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
