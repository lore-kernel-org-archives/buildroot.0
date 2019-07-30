From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Tue, 30 Jul 2019 11:42:14 +0200
Subject: [Buildroot] [PATCH v3] package/python-modbus-tk: new package
Message-ID: <1564479734-10240-1-git-send-email-pjtexier@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
---
Changes v2 -> v3:
	- Rework _LICENSE (after review of Yegor Yefremov)

Changes v1 -> v2:
	- add missing entry in Config.in

 DEVELOPERS                                     |  1 +
 package/Config.in                              |  1 +
 package/python-modbus-tk/Config.in             |  7 +++++++
 package/python-modbus-tk/python-modbus-tk.hash |  6 ++++++
 package/python-modbus-tk/python-modbus-tk.mk   | 14 ++++++++++++++
 5 files changed, 29 insertions(+)
 create mode 100644 package/python-modbus-tk/Config.in
 create mode 100644 package/python-modbus-tk/python-modbus-tk.hash
 create mode 100644 package/python-modbus-tk/python-modbus-tk.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 4ab4e36..9c5a9bb 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1860,6 +1860,7 @@ F:	package/trace-cmd/
 
 N:	Pierre-Jean Texier <pjtexier@koncepto.io>
 F:	package/libubootenv/
+F:	package/python-modbus-tk/
 F:	package/python-periphery/
 F:	package/stunnel/
 
diff --git a/package/Config.in b/package/Config.in
index 9b2cc75..b792a04 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -944,6 +944,7 @@ menu "External python modules"
 	source "package/python-meld3/Config.in"
 	source "package/python-mimeparse/Config.in"
 	source "package/python-mistune/Config.in"
+	source "package/python-modbus-tk/Config.in"
 	source "package/python-more-itertools/Config.in"
 	source "package/python-msgpack/Config.in"
 	source "package/python-multidict/Config.in"
diff --git a/package/python-modbus-tk/Config.in b/package/python-modbus-tk/Config.in
new file mode 100644
index 0000000..16d87ff
--- /dev/null
+++ b/package/python-modbus-tk/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_MODBUS_TK
+	bool "python-modbus-tk"
+	select BR2_PACKAGE_PYTHON_SERIAL # runtime
+	help
+	  Implementation of modbus protocol in python.
+
+	  https://github.com/ljean/modbus-tk/
diff --git a/package/python-modbus-tk/python-modbus-tk.hash b/package/python-modbus-tk/python-modbus-tk.hash
new file mode 100644
index 0000000..f4da4e5
--- /dev/null
+++ b/package/python-modbus-tk/python-modbus-tk.hash
@@ -0,0 +1,6 @@
+# md5, sha256 from https://pypi.org/pypi/modbus-tk/json
+md5	e268242483b719030656ab6047cebff3  modbus_tk-1.0.0.tar.gz
+sha256	041a34afec8ef487d9e8c0c20834909c2f43a3ae9a0d007b978686d580e9b873  modbus_tk-1.0.0.tar.gz
+# Locally computed sha256 checksums
+sha256	3b6a7f9c478ac1982e86cdadb45eb4788241b95839500eb26839d5053b74a24a  license.txt
+sha256	aa7ca42152a13db6a27b31944f99851efc3b9ee813912ff21d7d6ceadca62e6f  copying.txt
diff --git a/package/python-modbus-tk/python-modbus-tk.mk b/package/python-modbus-tk/python-modbus-tk.mk
new file mode 100644
index 0000000..3d790e1
--- /dev/null
+++ b/package/python-modbus-tk/python-modbus-tk.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-modbus-tk
+#
+################################################################################
+
+PYTHON_MODBUS_TK_VERSION = 1.0.0
+PYTHON_MODBUS_TK_SOURCE = modbus_tk-$(PYTHON_MODBUS_TK_VERSION).tar.gz
+PYTHON_MODBUS_TK_SITE = https://files.pythonhosted.org/packages/8b/03/50193a66aac4eeccbaecea22044de6f07f4e8bfcb6ec37d724a0bba50f46
+PYTHON_MODBUS_TK_SETUP_TYPE = setuptools
+PYTHON_MODBUS_TK_LICENSE = LGPL-2.1-or-later
+PYTHON_MODBUS_TK_LICENSE_FILES = license.txt copying.txt
+
+$(eval $(python-package))
-- 
2.7.4
