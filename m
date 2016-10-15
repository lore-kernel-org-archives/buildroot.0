From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Oct 2016 12:07:36 +0200
Subject: [Buildroot] [git commit] python-pyelftools: new package
Message-ID: <20161015100906.8B5D881ED9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f41d153b6cae9ee27007024d1aa026f125a3f99d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Olivier Matz <olivier.matz@6wind.com>
Signed-off-by: Julien Floret <julien.floret@6wind.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                |  1 +
 package/python-pyelftools/Config.in              |  7 +++++++
 package/python-pyelftools/python-pyelftools.hash |  4 ++++
 package/python-pyelftools/python-pyelftools.mk   | 14 ++++++++++++++
 4 files changed, 26 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 25f1688..35ba5f6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -737,6 +737,7 @@ menu "External python modules"
 	source "package/python-pycparser/Config.in"
 	source "package/python-pycrypto/Config.in"
 	source "package/python-pydal/Config.in"
+	source "package/python-pyelftools/Config.in"
 	source "package/python-pyftpdlib/Config.in"
 	source "package/python-pygame/Config.in"
 	source "package/python-pygments/Config.in"
diff --git a/package/python-pyelftools/Config.in b/package/python-pyelftools/Config.in
new file mode 100644
index 0000000..ca27302
--- /dev/null
+++ b/package/python-pyelftools/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_PYELFTOOLS
+	bool "python-pyelftools"
+	help
+	  Pyelftools is a Python library for parsing and analyzing ELF
+	  files and DWARF debug information.
+
+	  https://github.com/eliben/pyelftools
diff --git a/package/python-pyelftools/python-pyelftools.hash b/package/python-pyelftools/python-pyelftools.hash
new file mode 100644
index 0000000..e345a5b
--- /dev/null
+++ b/package/python-pyelftools/python-pyelftools.hash
@@ -0,0 +1,4 @@
+# From https://pypi.python.org/packages/ba/78/d4a186a2e38731286c99dc3e3ca8123b6f55cf2e28608e8daf2d84b65494/pyelftools-0.24.tar.gz#md5=c960d5fe0a9308d96ba38b4beec8ac8e
+md5 c960d5fe0a9308d96ba38b4beec8ac8e pyelftools-0.24.tar.gz
+# Locally calculated
+sha256 e9dd97d685a5b96b88a988dabadb88e5a539b64cd7d7927fac9a7368dc4c459c pyelftools-0.24.tar.gz
diff --git a/package/python-pyelftools/python-pyelftools.mk b/package/python-pyelftools/python-pyelftools.mk
new file mode 100644
index 0000000..5b5b488
--- /dev/null
+++ b/package/python-pyelftools/python-pyelftools.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-pyelftools
+#
+################################################################################
+
+PYTHON_PYELFTOOLS_VERSION = 0.24
+PYTHON_PYELFTOOLS_SOURCE = pyelftools-$(PYTHON_PYELFTOOLS_VERSION).tar.gz
+PYTHON_PYELFTOOLS_SITE = https://pypi.python.org/packages/ba/78/d4a186a2e38731286c99dc3e3ca8123b6f55cf2e28608e8daf2d84b65494
+PYTHON_PYELFTOOLS_LICENSE = Public domain
+PYTHON_PYELFTOOLS_LICENSE_FILES = LICENSE
+PYTHON_PYELFTOOLS_SETUP_TYPE = distutils
+
+$(eval $(python-package))
