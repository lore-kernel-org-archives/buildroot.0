From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 13 Apr 2020 14:19:31 +0200
Subject: [Buildroot] [git commit] package/python-modbus-tk: new package
Message-ID: <20200413120554.6FAC88E9F8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f57eeebbe36b226aef0563c0f5cf9522358b55c3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
[Thomas: bump to 1.1.0, adjust license information]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                     |  1 +
 package/Config.in                              |  1 +
 package/python-modbus-tk/Config.in             |  7 +++++++
 package/python-modbus-tk/python-modbus-tk.hash |  6 ++++++
 package/python-modbus-tk/python-modbus-tk.mk   | 14 ++++++++++++++
 5 files changed, 29 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index ac3d89dd0a..cea4a18cd9 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2102,6 +2102,7 @@ F:	package/libxml2/
 F:	package/mongoose/
 F:	package/mxml/
 F:	package/numactl/
+F:	package/python-modbus-tk/
 F:	package/python-periphery/
 F:	package/raspi-gpio/
 F:	package/sbc/
diff --git a/package/Config.in b/package/Config.in
index b5bf4e32d3..e2868dd1b5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1019,6 +1019,7 @@ menu "External python modules"
 	source "package/python-meld3/Config.in"
 	source "package/python-mimeparse/Config.in"
 	source "package/python-mistune/Config.in"
+	source "package/python-modbus-tk/Config.in"
 	source "package/python-more-itertools/Config.in"
 	source "package/python-msgfy/Config.in"
 	source "package/python-msgpack/Config.in"
diff --git a/package/python-modbus-tk/Config.in b/package/python-modbus-tk/Config.in
new file mode 100644
index 0000000000..16d87ffc9d
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
index 0000000000..fc9899366b
--- /dev/null
+++ b/package/python-modbus-tk/python-modbus-tk.hash
@@ -0,0 +1,6 @@
+# md5, sha256 from https://pypi.org/pypi/modbus-tk/json
+md5	65e0a1b12bd6650bdc4f7d823669ab6f  modbus_tk-1.1.0.tar.gz
+sha256	8e31db8f148871006b569931c31ef17692363acf90a0d0bafd2d868f51b70772  modbus_tk-1.1.0.tar.gz
+# Locally computed sha256 checksums
+sha256	3b6a7f9c478ac1982e86cdadb45eb4788241b95839500eb26839d5053b74a24a  license.txt
+sha256	aa7ca42152a13db6a27b31944f99851efc3b9ee813912ff21d7d6ceadca62e6f  copying.txt
diff --git a/package/python-modbus-tk/python-modbus-tk.mk b/package/python-modbus-tk/python-modbus-tk.mk
new file mode 100644
index 0000000000..a2a0cd0e6c
--- /dev/null
+++ b/package/python-modbus-tk/python-modbus-tk.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-modbus-tk
+#
+################################################################################
+
+PYTHON_MODBUS_TK_VERSION = 1.1.0
+PYTHON_MODBUS_TK_SOURCE = modbus_tk-$(PYTHON_MODBUS_TK_VERSION).tar.gz
+PYTHON_MODBUS_TK_SITE = https://files.pythonhosted.org/packages/49/aa/97e40e2da1b9904a78466b4d759091ef015f6946a423f1675bfcab7950c8
+PYTHON_MODBUS_TK_SETUP_TYPE = setuptools
+PYTHON_MODBUS_TK_LICENSE = LGPL-2.1+
+PYTHON_MODBUS_TK_LICENSE_FILES = license.txt copying.txt
+
+$(eval $(python-package))
