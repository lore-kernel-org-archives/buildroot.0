From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Tue, 20 Jan 2015 23:28:36 +0100
Subject: [Buildroot] [RFC] python-lxml: new package
Message-ID: <1421792916-8946-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in                  |  1 +
 package/python-lxml/Config.in      |  9 +++++++++
 package/python-lxml/python-lxml.mk | 16 ++++++++++++++++
 3 files changed, 26 insertions(+)
 create mode 100644 package/python-lxml/Config.in
 create mode 100644 package/python-lxml/python-lxml.mk

diff --git a/package/Config.in b/package/Config.in
index 266de13..366e393 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -519,6 +519,7 @@ menu "external python modules"
 	source "package/python-json-schema-validator/Config.in"
 	source "package/python-keyring/Config.in"
 	source "package/python-libconfig/Config.in"
+	source "package/python-lxml/Config.in"
 	source "package/python-mad/Config.in"
 	source "package/python-markdown/Config.in"
 	source "package/python-markupsafe/Config.in"
diff --git a/package/python-lxml/Config.in b/package/python-lxml/Config.in
new file mode 100644
index 0000000..4806073
--- /dev/null
+++ b/package/python-lxml/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_LXML
+	bool "python-lxml"
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_LIBXSLT
+	help
+	  The lxml XML toolkit is a Pythonic binding for the C libraries
+	  libxml2 and libxslt.
+
+	  http://lxml.de/
diff --git a/package/python-lxml/python-lxml.mk b/package/python-lxml/python-lxml.mk
new file mode 100644
index 0000000..ec32782
--- /dev/null
+++ b/package/python-lxml/python-lxml.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# python-lxml
+#
+################################################################################
+
+PYTHON_LXML_VERSION = 3.4.1
+PYTHON_LXML_SITE = http://lxml.de/files/
+PYTHON_LXML_SOURCE = lxml-$(PYTHON_LXML_VERSION).tgz
+PYTHON_LXML_SETUP_TYPE = setuptools
+PYTHON_LXML_LICENSE = MIT
+PYTHON_LXML_LICENSE_FILES = LICENSE
+PYTHON_LXML_DEPENDENCIES = libxml2 libxslt
+PYTHON_LXML_BUILD_OPTS = --with-xslt-config=$(HOST_DIR)/usr/arm-buildroot-linux-gnueabi/sysroot/usr/bin/xslt-config --with-xml2-config=$(HOST_DIR)/usr/arm-buildroot-linux-gnueabi/sysroot/usr/bin/xml2-config
+
+$(eval $(python-package))
-- 
2.1.0
