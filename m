From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 3 Feb 2016 22:31:36 +0100
Subject: [Buildroot] [git commit] python-pycparser: new package
Message-ID: <20160203213539.747EF7F978@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=60093650c84d9b758a5919f663797fdb72fde323
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

pycparser requires C preprocessor in order to parse C related files,
hence available only as host package.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-pycparser/python-pycparser.hash |  3 +++
 package/python-pycparser/python-pycparser.mk   | 14 ++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/package/python-pycparser/python-pycparser.hash b/package/python-pycparser/python-pycparser.hash
new file mode 100644
index 0000000..a87bfd4
--- /dev/null
+++ b/package/python-pycparser/python-pycparser.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=a2bc8d28c923b4fe2b2c3b4b51a4f935, sha256 locally computed
+md5     a2bc8d28c923b4fe2b2c3b4b51a4f935  pycparser-2.14.tar.gz
+sha256  7959b4a74abdc27b312fed1c21e6caf9309ce0b29ea86b591fd2e99ecdf27f73  pycparser-2.14.tar.gz
diff --git a/package/python-pycparser/python-pycparser.mk b/package/python-pycparser/python-pycparser.mk
new file mode 100644
index 0000000..328bc8a
--- /dev/null
+++ b/package/python-pycparser/python-pycparser.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-pycparser
+#
+################################################################################
+
+PYTHON_PYCPARSER_VERSION = 2.14
+PYTHON_PYCPARSER_SOURCE = pycparser-$(PYTHON_PYCPARSER_VERSION).tar.gz
+PYTHON_PYCPARSER_SITE = https://pypi.python.org/packages/source/p/pycparser
+PYTHON_PYCPARSER_SETUP_TYPE = setuptools
+PYTHON_PYCPARSER_LICENSE = BSD-3c
+PYTHON_PYCPARSER_LICENSE_FILES = LICENSE
+
+$(eval $(host-python-package))
