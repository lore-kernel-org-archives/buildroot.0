From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Fri, 12 Oct 2018 10:06:49 +0200
Subject: [Buildroot] [PATCH 2/3] python-typing: new package
In-Reply-To: <20181012080650.2793-1-yegorslists@googlemail.com>
References: <20181012080650.2793-1-yegorslists@googlemail.com>
Message-ID: <20181012080650.2793-2-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in                        |  1 +
 package/python-typing/Config.in          |  8 ++++++++
 package/python-typing/python-typing.hash |  5 +++++
 package/python-typing/python-typing.mk   | 14 ++++++++++++++
 4 files changed, 28 insertions(+)
 create mode 100644 package/python-typing/Config.in
 create mode 100644 package/python-typing/python-typing.hash
 create mode 100644 package/python-typing/python-typing.mk

diff --git a/package/Config.in b/package/Config.in
index 9092a9e237..7287e2be7d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1040,6 +1040,7 @@ menu "External python modules"
 	source "package/python-txaio/Config.in"
 	source "package/python-txtorcon/Config.in"
 	source "package/python-typepy/Config.in"
+	source "package/python-typing/Config.in"
 	source "package/python-u-msgpack/Config.in"
 	source "package/python-ubjson/Config.in"
 	source "package/python-ujson/Config.in"
diff --git a/package/python-typing/Config.in b/package/python-typing/Config.in
new file mode 100644
index 0000000000..d5350bccd0
--- /dev/null
+++ b/package/python-typing/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_TYPING
+	bool "python-typing"
+	depends on BR2_PACKAGE_PYTHON
+	help
+	  Type Hints for Python. This is a backport of the standard library
+	  typing module to Python versions older than 3.5.
+
+	  https://docs.python.org/3/library/typing.html
diff --git a/package/python-typing/python-typing.hash b/package/python-typing/python-typing.hash
new file mode 100644
index 0000000000..5bdb8c62e8
--- /dev/null
+++ b/package/python-typing/python-typing.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/typing/json
+md5	64614206b4bdc0864fc0e0bccd69efc9  typing-3.6.6.tar.gz
+sha256	4027c5f6127a6267a435201981ba156de91ad0d1d98e9ddc2aa173453453492d  typing-3.6.6.tar.gz
+# Locally computed sha256 checksums
+sha256	ff17ce94e102024deb68773eb1cc74ca76da4e658f373531f0ac22d68a6bb1ad  LICENSE
diff --git a/package/python-typing/python-typing.mk b/package/python-typing/python-typing.mk
new file mode 100644
index 0000000000..acb5316129
--- /dev/null
+++ b/package/python-typing/python-typing.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-typing
+#
+################################################################################
+
+PYTHON_TYPING_VERSION = 3.6.6
+PYTHON_TYPING_SOURCE = typing-$(PYTHON_TYPING_VERSION).tar.gz
+PYTHON_TYPING_SITE = https://files.pythonhosted.org/packages/bf/9b/2bf84e841575b633d8d91ad923e198a415e3901f228715524689495b4317
+PYTHON_TYPING_SETUP_TYPE = setuptools
+PYTHON_TYPING_LICENSE = Python-2.0, others
+PYTHON_TYPING_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.17.0
