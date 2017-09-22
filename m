From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Sep 2017 23:35:37 +0200
Subject: [Buildroot] [git commit] python-aiocoap: new package
Message-ID: <20170922213002.454567FFC6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=662b775c5c89afc6ee92de844a4a8b13873de649
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                          |  1 +
 package/python-aiocoap/Config.in           |  7 +++++++
 package/python-aiocoap/python-aiocoap.hash |  4 ++++
 package/python-aiocoap/python-aiocoap.mk   | 14 ++++++++++++++
 4 files changed, 26 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 48d1381..5797018 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -691,6 +691,7 @@ endif
 	source "package/python3/Config.in"
 if BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
 menu "External python modules"
+	source "package/python-aiocoap/Config.in"
 	source "package/python-alsaaudio/Config.in"
 	source "package/python-argh/Config.in"
 	source "package/python-arrow/Config.in"
diff --git a/package/python-aiocoap/Config.in b/package/python-aiocoap/Config.in
new file mode 100644
index 0000000..cf5ca4e
--- /dev/null
+++ b/package/python-aiocoap/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_AIOCOAP
+	bool "python-aiocoap"
+	depends on BR2_PACKAGE_PYTHON3
+	help
+	  Python CoAP library.
+
+	  https://github.com/chrysn/aiocoap
diff --git a/package/python-aiocoap/python-aiocoap.hash b/package/python-aiocoap/python-aiocoap.hash
new file mode 100644
index 0000000..6df482a
--- /dev/null
+++ b/package/python-aiocoap/python-aiocoap.hash
@@ -0,0 +1,4 @@
+# md5 from https://pypi.python.org/pypi/aiocoap/json, sha256 locally computed
+md5	f5fed00767b4197f2fbaa0ff95cbbf78  aiocoap-0.3.tar.gz
+sha256	402d4151db6d8d0b1d66af5b6e10e0de1521decbf12140637e5b8d2aa9c5aef6  aiocoap-0.3.tar.gz
+sha256  2bb211d412a6bfa4b2a9cf01123c7fe90e5e6185938896e23ab07b84f8494180  LICENSE
diff --git a/package/python-aiocoap/python-aiocoap.mk b/package/python-aiocoap/python-aiocoap.mk
new file mode 100644
index 0000000..a2db70b
--- /dev/null
+++ b/package/python-aiocoap/python-aiocoap.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-aiocoap
+#
+################################################################################
+
+PYTHON_AIOCOAP_VERSION = 0.3
+PYTHON_AIOCOAP_SOURCE = aiocoap-$(PYTHON_AIOCOAP_VERSION).tar.gz
+PYTHON_AIOCOAP_SITE = https://pypi.python.org/packages/9c/f6/d839e4b14258d76e74a39810829c13f8dd31de2bfe0915579b2a609d1bbe
+PYTHON_AIOCOAP_SETUP_TYPE = setuptools
+PYTHON_AIOCOAP_LICENSE = MIT
+PYTHON_AIOCOAP_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
