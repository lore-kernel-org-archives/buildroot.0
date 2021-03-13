From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 13 Mar 2021 15:52:39 +0100
Subject: [Buildroot] [git commit branch/2020.02.x]
 package/python-typing-extensions: new package
Message-ID: <20210313143049.C28307FB95@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=28e53bde358f608939ebcb30f3211d1d902c7be4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 3fb7bb45602c7ec08cb9835d2ec00e1a0a3e7c87)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                                 |  1 +
 package/Config.in                                          |  1 +
 package/python-typing-extensions/Config.in                 |  7 +++++++
 .../python-typing-extensions/python-typing-extensions.hash |  5 +++++
 .../python-typing-extensions/python-typing-extensions.mk   | 14 ++++++++++++++
 5 files changed, 28 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 75fb47650e..b9ea6bf267 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1504,6 +1504,7 @@ F:	package/lua-flu/
 F:	package/lua-stdlib/
 F:	package/luaossl/
 F:	package/murata-cyw-fw/
+F:	package/python-typing-extensions/
 F:	package/rs485conf/
 F:	package/turbolua/
 
diff --git a/package/Config.in b/package/Config.in
index 3deafedb0d..c2962f6fb7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1159,6 +1159,7 @@ menu "External python modules"
 	source "package/python-txtorcon/Config.in"
 	source "package/python-typepy/Config.in"
 	source "package/python-typing/Config.in"
+	source "package/python-typing-extensions/Config.in"
 	source "package/python-u-msgpack/Config.in"
 	source "package/python-ubjson/Config.in"
 	source "package/python-ujson/Config.in"
diff --git a/package/python-typing-extensions/Config.in b/package/python-typing-extensions/Config.in
new file mode 100644
index 0000000000..0c7c74c5fa
--- /dev/null
+++ b/package/python-typing-extensions/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS
+	bool "python-typing-extensions"
+	select BR2_PACKAGE_PYTHON_TYPING if BR2_PACKAGE_PYTHON # runtime
+	help
+	  Backported and Experimental Type Hints for Python 3.5+.
+
+	  https://github.com/python/typing/blob/master/typing_extensions/README.rst
diff --git a/package/python-typing-extensions/python-typing-extensions.hash b/package/python-typing-extensions/python-typing-extensions.hash
new file mode 100644
index 0000000000..4c76caba43
--- /dev/null
+++ b/package/python-typing-extensions/python-typing-extensions.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/typing_extensions/json
+md5  5fcbfcb22e6f8c9bf23fb9f8e020f6ee  typing_extensions-3.7.4.3.tar.gz
+sha256  99d4073b617d30288f569d3f13d2bd7548c3a7e4c8de87db09a9d29bb3a4a60c  typing_extensions-3.7.4.3.tar.gz
+# Locally computed sha256 checksums
+sha256  ff17ce94e102024deb68773eb1cc74ca76da4e658f373531f0ac22d68a6bb1ad  LICENSE
diff --git a/package/python-typing-extensions/python-typing-extensions.mk b/package/python-typing-extensions/python-typing-extensions.mk
new file mode 100644
index 0000000000..2bcf1342a2
--- /dev/null
+++ b/package/python-typing-extensions/python-typing-extensions.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-typing-extensions
+#
+################################################################################
+
+PYTHON_TYPING_EXTENSIONS_VERSION = 3.7.4.3
+PYTHON_TYPING_EXTENSIONS_SOURCE = typing_extensions-$(PYTHON_TYPING_EXTENSIONS_VERSION).tar.gz
+PYTHON_TYPING_EXTENSIONS_SITE = https://files.pythonhosted.org/packages/16/06/0f7367eafb692f73158e5c5cbca1aec798cdf78be5167f6415dd4205fa32
+PYTHON_TYPING_EXTENSIONS_SETUP_TYPE = setuptools
+PYTHON_TYPING_EXTENSIONS_LICENSE = Python-2.0
+PYTHON_TYPING_EXTENSIONS_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
