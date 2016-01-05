From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Tue,  5 Jan 2016 08:17:23 +0100
Subject: [Buildroot] [PATCH v2 2/3] python-pycparser: new package
In-Reply-To: <1451978244-15878-1-git-send-email-yegorslists@googlemail.com>
References: <1451978244-15878-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <1451978244-15878-3-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

pycparser requires C preprocessor in order to parse C related files,
hence available only as host package.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
Changes:
	v2: remove target package variant

 package/python-pycparser/python-pycparser.hash |  3 +++
 package/python-pycparser/python-pycparser.mk   | 14 ++++++++++++++
 2 files changed, 17 insertions(+)
 create mode 100644 package/python-pycparser/python-pycparser.hash
 create mode 100644 package/python-pycparser/python-pycparser.mk

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
-- 
2.1.4
