From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 3 Jan 2016 21:57:00 +0100
Subject: [Buildroot] [git commit] python-urllib3: new package
Message-ID: <20160103210633.80CEA822D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1bdd3b92a300010af6ecf5b57da3c74f696af50d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                          |  1 +
 package/python-urllib3/Config.in           |  9 +++++++++
 package/python-urllib3/python-urllib3.hash |  3 +++
 package/python-urllib3/python-urllib3.mk   | 14 ++++++++++++++
 4 files changed, 27 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index f58f2be..442021f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -701,6 +701,7 @@ menu "External python modules"
 	source "package/python-thrift/Config.in"
 	source "package/python-tornado/Config.in"
 	source "package/python-twisted/Config.in"
+	source "package/python-urllib3/Config.in"
 	source "package/python-urwid/Config.in"
 	source "package/python-versiontools/Config.in"
 	source "package/python-web2py/Config.in"
diff --git a/package/python-urllib3/Config.in b/package/python-urllib3/Config.in
new file mode 100644
index 0000000..21d3f67
--- /dev/null
+++ b/package/python-urllib3/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_URLLIB3
+	bool "python-urllib3"
+	select BR2_PACKAGE_PYTHON_ZLIB if BR2_PACKAGE_PYTHON # runtime
+	select BR2_PACKAGE_PYTHON3_ZLIB if BR2_PACKAGE_PYTHON3 # runtime
+	help
+	  Python HTTP library with thread-safe connection pooling, file
+	  post support, sanity friendly, and more.
+
+	  http://urllib3.readthedocs.org/
diff --git a/package/python-urllib3/python-urllib3.hash b/package/python-urllib3/python-urllib3.hash
new file mode 100644
index 0000000..266b8e9
--- /dev/null
+++ b/package/python-urllib3/python-urllib3.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=5e1407428ac33b521c71a7ac273b3847, sha256 locally computed
+md5     5e1407428ac33b521c71a7ac273b3847  urllib3-1.14.tar.gz
+sha256  dd4fb13a4ce50b18338c7e4d665b21fd38632c5d4b1d9f1a1379276bd3c08d37  urllib3-1.14.tar.gz
diff --git a/package/python-urllib3/python-urllib3.mk b/package/python-urllib3/python-urllib3.mk
new file mode 100644
index 0000000..0101053
--- /dev/null
+++ b/package/python-urllib3/python-urllib3.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-urllib3
+#
+################################################################################
+
+PYTHON_URLLIB3_VERSION = 1.14
+PYTHON_URLLIB3_SOURCE = urllib3-$(PYTHON_URLLIB3_VERSION).tar.gz
+PYTHON_URLLIB3_SITE = https://pypi.python.org/packages/source/u/urllib3
+PYTHON_URLLIB3_LICENSE = MIT
+PYTHON_URLLIB3_LICENSE_FILES = LICENSE.txt
+PYTHON_URLLIB3_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
