From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Apr 2020 21:33:52 +0200
Subject: [Buildroot] [git commit] package/python-canopen: new package
Message-ID: <20200412192255.145058E7D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c7e9b4d8d269dad49a6c811fc5c543ac6def2499
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A Python implementation of the CANopen standard.

Signed-off-by: Attila Wagner <attila.wagner@onyxinsight.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                 |  3 +++
 package/Config.in                          |  1 +
 package/python-canopen/Config.in           |  9 +++++++++
 package/python-canopen/python-canopen.hash |  4 ++++
 package/python-canopen/python-canopen.mk   | 14 ++++++++++++++
 5 files changed, 31 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index bf209b45d6..aae94314cf 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -279,6 +279,9 @@ F:	package/luasec/
 F:	package/lua-ev/
 F:	package/orbit/
 
+N:	Attila Wagner <attila.wagner@onyxinsight.com>
+F:	package/python-canopen/
+
 N:	Bartosz Bilas <b.bilas@grinn-global.com>
 F:	board/stmicroelectronics/stm32mp157a-dk1/
 F:	configs/stm32mp157a_dk1_defconfig
diff --git a/package/Config.in b/package/Config.in
index fce3eeff03..f7d70a1afd 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -892,6 +892,7 @@ menu "External python modules"
 	source "package/python-bunch/Config.in"
 	source "package/python-cached-property/Config.in"
 	source "package/python-can/Config.in"
+	source "package/python-canopen/Config.in"
 	source "package/python-cbor/Config.in"
 	source "package/python-cchardet/Config.in"
 	source "package/python-certifi/Config.in"
diff --git a/package/python-canopen/Config.in b/package/python-canopen/Config.in
new file mode 100644
index 0000000000..e36b8c7643
--- /dev/null
+++ b/package/python-canopen/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_CANOPEN
+	bool "python-canopen"
+	select BR2_PACKAGE_PYTHON_CAN # runtime
+	help
+	  A Python implementation of the CANopen standard. The aim
+	  of the project is to support the most common parts of the
+	  CiA 301 standard in a Pythonic interface.
+
+	  https://github.com/christiansandberg/canopen
diff --git a/package/python-canopen/python-canopen.hash b/package/python-canopen/python-canopen.hash
new file mode 100644
index 0000000000..e1a628a3a3
--- /dev/null
+++ b/package/python-canopen/python-canopen.hash
@@ -0,0 +1,4 @@
+# sha256 from https://pypi.org/pypi/canopen/json
+sha256	4394770d528e93a48936138c4a7b37b5dff26d54f82a435ad9790cd1e43f55b9  canopen-1.0.0.tar.gz
+# Locally computed sha256 checksums
+sha256	0740d30978affcd91c0fc817b7cf942a332381bf0380fe17e60c6a0b377c6e0d  LICENSE.txt
diff --git a/package/python-canopen/python-canopen.mk b/package/python-canopen/python-canopen.mk
new file mode 100644
index 0000000000..fc328c698e
--- /dev/null
+++ b/package/python-canopen/python-canopen.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-canopen
+#
+################################################################################
+
+PYTHON_CANOPEN_VERSION = 1.0.0
+PYTHON_CANOPEN_SOURCE = canopen-$(PYTHON_CANOPEN_VERSION).tar.gz
+PYTHON_CANOPEN_SITE = https://files.pythonhosted.org/packages/1f/2b/55b6d82b3dcba184a01c6fe027df239953940e36a463cd24b71e67bd1f37
+PYTHON_CANOPEN_SETUP_TYPE = setuptools
+PYTHON_CANOPEN_LICENSE = MIT
+PYTHON_CANOPEN_LICENSE_FILES = LICENSE.txt
+
+$(eval $(python-package))
