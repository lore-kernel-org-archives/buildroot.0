From: Erwan Gautron <erwan.gautron@yahoo.fr>
Date: Tue,  7 Mar 2017 09:23:07 +0100
Subject: [Buildroot] [PATCH 1/2] rasqal: new package
Message-ID: <1488874988-17596-1-git-send-email-erwan.gautron@yahoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Erwan Gautron <erwan.gautron@yahoo.fr>

	A free C library that handles
	Resource Description Framework (RDF)
	query syntaxes, query construction and
	query execution returning result bindings

Signed-off-by: Erwan Gautron <erwan.gautron@yahoo.fr>
---
 package/Config.in        |  1 +
 package/rasqal/Config.in | 10 ++++++++++
 package/rasqal/rasqal.mk | 19 +++++++++++++++++++
 3 files changed, 30 insertions(+)
 create mode 100755 package/rasqal/Config.in
 create mode 100755 package/rasqal/rasqal.mk

diff --git a/package/Config.in b/package/Config.in
index cfe7fc6..e332d98 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1160,6 +1160,7 @@ menu "JSON/XML"
 	source "package/rapidjson/Config.in"
 	source "package/rapidxml/Config.in"
 	source "package/raptor/Config.in"
+	source "package/rasqal/Config.in"
 	source "package/tinyxml/Config.in"
 	source "package/tinyxml2/Config.in"
 	source "package/valijson/Config.in"
diff --git a/package/rasqal/Config.in b/package/rasqal/Config.in
new file mode 100755
index 0000000..96ea82a
--- /dev/null
+++ b/package/rasqal/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_RASQAL
+	bool "rasqal"
+	select BR2_PACKAGE_RAPTOR
+	help
+		A free C library that handles 
+		Resource Description Framework (RDF) 
+		query syntaxes, query construction and 
+		query execution returning result bindings
+
+		http://librdf.org/rasqal/
diff --git a/package/rasqal/rasqal.mk b/package/rasqal/rasqal.mk
new file mode 100755
index 0000000..5295800
--- /dev/null
+++ b/package/rasqal/rasqal.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# rasqal
+#
+################################################################################
+RASQAL_VERSION = 0.9.33
+RASQAL_SOURCE = rasqal-$(RASQAL_VERSION).tar.gz
+RASQAL_SITE = http://download.librdf.org/source
+RASQAL_DEPENDENCIES = raptor
+RASQAL_LICENSE = GPLv2+ or LGPLv2.1+ or Apache-2.0+
+RASQAL_LICENSE_FILES = LICENSE.txt
+
+# Flag is added to make sure the patch is applied for the configure.ac
+RASQAL_AUTORECONF = YES
+
+#Install into staging of redland package need it
+RASQAL_INSTALL_STAGING = YES
+
+$(eval $(autotools-package))
-- 
2.7.4
