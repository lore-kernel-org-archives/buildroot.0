From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Mon, 22 Aug 2016 07:34:28 +0200
Subject: [Buildroot] [PATCH] python-crcmod: new package
Message-ID: <1471844068-28397-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in                        |  1 +
 package/python-crcmod/Config.in          |  8 ++++++++
 package/python-crcmod/python-crcmod.hash |  3 +++
 package/python-crcmod/python-crcmod.mk   | 14 ++++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/python-crcmod/Config.in
 create mode 100644 package/python-crcmod/python-crcmod.hash
 create mode 100644 package/python-crcmod/python-crcmod.mk

diff --git a/package/Config.in b/package/Config.in
index 645fa29..f045175 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -653,6 +653,7 @@ menu "External python modules"
 	source "package/python-configobj/Config.in"
 	source "package/python-configshell-fb/Config.in"
 	source "package/python-crc16/Config.in"
+	source "package/python-crcmod/Config.in"
 	source "package/python-crossbar/Config.in"
 	source "package/python-cryptography/Config.in"
 	source "package/python-cssselect/Config.in"
diff --git a/package/python-crcmod/Config.in b/package/python-crcmod/Config.in
new file mode 100644
index 0000000..289a3ae
--- /dev/null
+++ b/package/python-crcmod/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_CRCMOD
+	bool "python-crcmod"
+	help
+	  The software in this package is a Python module for
+	  generating objects that compute the Cyclic Redundancy
+	  Check (CRC).
+
+	  http://crcmod.sourceforge.net/
diff --git a/package/python-crcmod/python-crcmod.hash b/package/python-crcmod/python-crcmod.hash
new file mode 100644
index 0000000..7ce549c
--- /dev/null
+++ b/package/python-crcmod/python-crcmod.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi/crcmod/json, sha256 locally computed
+md5	2d5b92117d958dcead94f9e17f54cd32  crcmod-1.7.tar.gz
+sha256	dc7051a0db5f2bd48665a990d3ec1cc305a466a77358ca4492826f41f283601e  crcmod-1.7.tar.gz
diff --git a/package/python-crcmod/python-crcmod.mk b/package/python-crcmod/python-crcmod.mk
new file mode 100644
index 0000000..1aab7f5
--- /dev/null
+++ b/package/python-crcmod/python-crcmod.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-crcmod
+#
+################################################################################
+
+PYTHON_CRCMOD_VERSION = 1.7
+PYTHON_CRCMOD_SOURCE = crcmod-$(PYTHON_CRCMOD_VERSION).tar.gz
+PYTHON_CRCMOD_SITE = https://pypi.python.org/packages/6b/b0/e595ce2a2527e169c3bcd6c33d2473c1918e0b7f6826a043ca1245dd4e5b
+PYTHON_CRCMOD_SETUP_TYPE = distutils
+PYTHON_CRCMOD_LICENSE = MIT
+PYTHON_CRCMOD_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.8.1
