From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 30 Oct 2018 21:10:28 +0100
Subject: [Buildroot] [git commit] python-typing: new package
Message-ID: <20181030201013.3B77283239@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0135bc5b60d65426c3d41a6b3ac0a33defcf4b58
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Reviewed-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                        |  1 +
 package/python-typing/Config.in          |  8 ++++++++
 package/python-typing/python-typing.hash |  5 +++++
 package/python-typing/python-typing.mk   | 14 ++++++++++++++
 4 files changed, 28 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 94e19e4a19..7e8224cc7e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1041,6 +1041,7 @@ menu "External python modules"
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
