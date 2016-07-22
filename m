From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Fri, 22 Jul 2016 08:36:34 +0200
Subject: [Buildroot] [PATCH v2] python-dicttoxml: new package
Message-ID: <1469169394-5402-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
Changes:
	v2: fix license information (Thomas Petazzoni)

 package/Config.in                              |  1 +
 package/python-dicttoxml/Config.in             |  9 +++++++++
 package/python-dicttoxml/python-dicttoxml.hash |  3 +++
 package/python-dicttoxml/python-dicttoxml.mk   | 14 ++++++++++++++
 4 files changed, 27 insertions(+)
 create mode 100644 package/python-dicttoxml/Config.in
 create mode 100644 package/python-dicttoxml/python-dicttoxml.hash
 create mode 100644 package/python-dicttoxml/python-dicttoxml.mk

diff --git a/package/Config.in b/package/Config.in
index 6a84f9f..6b5b011 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -656,6 +656,7 @@ menu "External python modules"
 	source "package/python-dateutil/Config.in"
 	source "package/python-dialog/Config.in"
 	source "package/python-dialog3/Config.in"
+	source "package/python-dicttoxml/Config.in"
 	source "package/python-django/Config.in"
 	source "package/python-docopt/Config.in"
 	source "package/python-dominate/Config.in"
diff --git a/package/python-dicttoxml/Config.in b/package/python-dicttoxml/Config.in
new file mode 100644
index 0000000..152afbb
--- /dev/null
+++ b/package/python-dicttoxml/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_DICTTOXML
+	bool "python-dicttoxml"
+	select BR2_PACKAGE_PYTHON_PYEXPAT if BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON3_PYEXPAT if BR2_PACKAGE_PYTHON3
+	help
+	  Converts a Python dictionary or other native data type into a valid
+	  XML string.
+
+	  https://github.com/quandyfactory/dicttoxml
diff --git a/package/python-dicttoxml/python-dicttoxml.hash b/package/python-dicttoxml/python-dicttoxml.hash
new file mode 100644
index 0000000..32ba6b0
--- /dev/null
+++ b/package/python-dicttoxml/python-dicttoxml.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi/dicttoxml/json, sha256 locally computed
+md5	ec5643a048cf32dad3c28db236b923e4  dicttoxml-1.7.4.tar.gz
+sha256	ea44cc4ec6c0f85098c57a431a1ee891b3549347b07b7414c8a24611ecf37e45  dicttoxml-1.7.4.tar.gz
diff --git a/package/python-dicttoxml/python-dicttoxml.mk b/package/python-dicttoxml/python-dicttoxml.mk
new file mode 100644
index 0000000..6976715
--- /dev/null
+++ b/package/python-dicttoxml/python-dicttoxml.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-dicttoxml
+#
+################################################################################
+
+PYTHON_DICTTOXML_VERSION = 1.7.4
+PYTHON_DICTTOXML_SOURCE = dicttoxml-$(PYTHON_DICTTOXML_VERSION).tar.gz
+PYTHON_DICTTOXML_SITE = https://pypi.python.org/packages/74/36/534db111db9e7610a41641a1f6669a964aacaf51858f466de264cc8dcdd9
+PYTHON_DICTTOXML_SETUP_TYPE = distutils
+PYTHON_DICTTOXML_LICENSE = GPLv2
+PYTHON_DICTTOXML_LICENSE_FILES = LICENCE.txt
+
+$(eval $(python-package))
-- 
2.1.4
