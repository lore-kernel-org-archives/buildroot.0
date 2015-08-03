From: Jonathan Ben-Avraham <yba@tkos.co.il>
Date: Mon,  3 Aug 2015 21:04:14 +0300
Subject: [Buildroot] [PATCH 1/1] rapidxml: new package
Message-ID: <1438625054-7118-1-git-send-email-yba@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jonathan Ben Avraham <yba@tkos.co.il>

Signed-off-by: Jonathan Ben Avraham <yba@tkos.co.il>
---
 package/Config.in              |    1 +
 package/rapidxml/Config.in     |   10 ++++++++++
 package/rapidxml/rapidxml.hash |    1 +
 package/rapidxml/rapidxml.mk   |   25 +++++++++++++++++++++++++
 4 files changed, 37 insertions(+)
 create mode 100644 package/rapidxml/Config.in
 create mode 100644 package/rapidxml/rapidxml.hash
 create mode 100644 package/rapidxml/rapidxml.mk

diff --git a/package/Config.in b/package/Config.in
index ae00758..0a3386a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -915,6 +915,7 @@ menu "JSON/XML"
 	source "package/libyaml/Config.in"
 	source "package/mxml/Config.in"
 	source "package/rapidjson/Config.in"
+	source "package/rapidxml/Config.in"
 	source "package/tinyxml/Config.in"
 	source "package/tinyxml2/Config.in"
 	source "package/xerces/Config.in"
diff --git a/package/rapidxml/Config.in b/package/rapidxml/Config.in
new file mode 100644
index 0000000..d17d838
--- /dev/null
+++ b/package/rapidxml/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_RAPIDXML
+	bool "rapidxml"
+	help
+	  RapidXml is an attempt to create the fastest XML parser
+	  possible, while retaining useability, portability and
+	  reasonable W3C compatibility. It is an in-situ parser
+	  with parsing speed approaching speed of strlen function
+	  executed on the same data.
+
+	  http://sourceforge.net/projects/rapidxml/
diff --git a/package/rapidxml/rapidxml.hash b/package/rapidxml/rapidxml.hash
new file mode 100644
index 0000000..8c7366c
--- /dev/null
+++ b/package/rapidxml/rapidxml.hash
@@ -0,0 +1 @@
+sha256	c3f0b886374981bb20fabcf323d755db4be6dba42064599481da64a85f5b3571  rapidxml-1.13.zip
diff --git a/package/rapidxml/rapidxml.mk b/package/rapidxml/rapidxml.mk
new file mode 100644
index 0000000..af6b374
--- /dev/null
+++ b/package/rapidxml/rapidxml.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# rapidxml
+#
+################################################################################
+
+RAPIDXML_VERSION = 1.13
+RAPIDXML_SOURCE = rapidxml-$(RAPIDXML_VERSION).zip
+
+#RAPIDXML_SITE = http://sourceforge.net/projects/rapidxml/files/latest/download
+RAPIDXML_SITE = http://garr.dl.sourceforge.net/project/rapidxml/rapidxml/rapidxml%201.13/
+RAPIDXML_LICENSE = MIT
+RAPIDXML_LICENSE_FILES = license.txt
+RAPIDXML_INSTALL_TARGET = NO
+RAPIDXML_INSTALL_STAGING = YES
+
+define RAPIDXML_EXTRACT_CMDS
+	$(UNZIP) -d $(@D) $(DL_DIR)/$(RAPIDXML_SOURCE)
+endef
+
+define RAPIDXML_INSTALL_STAGING_CMDS
+	cp -dpfr $(@D)/rapidxml-$(RAPIDXML_VERSION)/*hpp $(STAGING_DIR)/usr/include
+endef
+
+$(eval $(generic-package))
-- 
1.7.9.5
