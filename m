From: Theo Debrouwere <theo.debrouwere@skynet.be>
Date: Wed,  7 Sep 2016 17:37:07 +0200
Subject: [Buildroot] [PATCH] pugixml: new package
In-Reply-To: <1473262627-14429-1-git-send-email-theo.debrouwere@skynet.be>
References: <20160904210846.1332-1-theo.debrouwere@skynet.be>
 <1473262627-14429-1-git-send-email-theo.debrouwere@skynet.be>
Message-ID: <1473262627-14429-2-git-send-email-theo.debrouwere@skynet.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Theo Debrouwere <t.debrouwere@televic.com>

pugixml is a light-weight C++ XML processing library. It features:
* DOM-like interface with rich traversal/modification capabilities
* Extremely fast non-validating XML parser which constructs the DOM tree from an XML file/buffer
* XPath 1.0 implementation for complex data-driven tree queries
* Full Unicode support with Unicode interface variants and automatic encoding conversions

Homepage: http://pugixml.org/
Repository: https://github.com/zeux/pugixml

Signed-off-by: Theo Debrouwere <t.debrouwere@televic.com>
---
 package/Config.in            |  1 +
 package/pugixml/Config.in    | 16 ++++++++++++++++
 package/pugixml/pugixml.hash |  2 ++
 package/pugixml/pugixml.mk   | 15 +++++++++++++++
 4 files changed, 34 insertions(+)
 create mode 100644 package/pugixml/Config.in
 create mode 100644 package/pugixml/pugixml.hash
 create mode 100644 package/pugixml/pugixml.mk

diff --git a/package/Config.in b/package/Config.in
index 1e51a45..8d864bc 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1092,6 +1092,7 @@ menu "JSON/XML"
 	source "package/libxslt/Config.in"
 	source "package/libyaml/Config.in"
 	source "package/mxml/Config.in"
+	source "package/pugixml/Config.in"
 	source "package/rapidjson/Config.in"
 	source "package/rapidxml/Config.in"
 	source "package/raptor/Config.in"
diff --git a/package/pugixml/Config.in b/package/pugixml/Config.in
new file mode 100644
index 0000000..5310b10
--- /dev/null
+++ b/package/pugixml/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_PUGIXML
+	bool "pugixml"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  Light-weight, simple and fast XML parser for C++ with XPath support
+
+	  Features:
+	  * DOM-like interface with rich traversal/modification capabilities
+	  * Extremely fast non-validating XML parser which constructs the DOM tree
+	    from an XML file/buffer
+	  * XPath 1.0 implementation for complex data-driven tree queries
+	  * Full Unicode support with Unicode interface variants and automatic
+	    encoding conversions
+
+	  http://pugixml.org/
+	  https://github.com/zeux/pugixml
diff --git a/package/pugixml/pugixml.hash b/package/pugixml/pugixml.hash
new file mode 100644
index 0000000..9007f7c
--- /dev/null
+++ b/package/pugixml/pugixml.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  fbe10d46f61d769f7d92a296102e4e2bd3ee16130f11c5b10a1aae590ea1f5ca  pugixml-1.7.tar.gz
diff --git a/package/pugixml/pugixml.mk b/package/pugixml/pugixml.mk
new file mode 100644
index 0000000..2e4f0ce
--- /dev/null
+++ b/package/pugixml/pugixml.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# pugixml
+#
+################################################################################
+
+PUGIXML_VERSION = 1.7
+PUGIXML_SITE = http://github.com/zeux/pugixml/releases/download/v$(PUGIXML_VERSION)
+PUGIXML_LICENSE = MIT
+PUGIXML_LICENSE_FILES = readme.txt
+PUGIXML_INSTALL_STAGING = YES
+
+PUGIXML_SUBDIR = scripts
+
+$(eval $(cmake-package))
-- 
2.8.1
