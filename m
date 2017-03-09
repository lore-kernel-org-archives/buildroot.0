From: Erwan Gautron <erwan.gautron@yahoo.fr>
Date: Thu,  9 Mar 2017 08:36:28 +0100
Subject: [Buildroot] [PATCH 1/2 v2] new package: rasqal
Message-ID: <1489044989-4047-1-git-send-email-erwan.gautron@yahoo.fr>
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
 DEVELOPERS               |  3 +++
 package/Config.in        |  1 +
 package/rasqal/Config.in | 10 ++++++++++
 package/rasqal/rasqal.mk | 15 +++++++++++++++
 4 files changed, 29 insertions(+)
 create mode 100755 package/rasqal/Config.in
 create mode 100755 package/rasqal/rasqal.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 6c74cac..afcf983 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -463,6 +463,9 @@ F:	package/mxsldr/
 N:	Ernesto L. Williams Jr <realcontrols@gmail.com>
 F:	package/szip/
 
+N:	Erwan Gautron <erwan.gautron@yahoo.fr>
+F:	package/rasqal/
+
 N:	Evan Zelkowitz <evan.zelkowitz@gmail.com>
 F:	package/sdl_gfx/
 
diff --git a/package/Config.in b/package/Config.in
index 9eb6a22..d46758d 100644
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
index 0000000..40a3adb
--- /dev/null
+++ b/package/rasqal/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_RASQAL
+	bool "rasqal"
+	select BR2_PACKAGE_RAPTOR
+	help
+	  A free C library that handles 
+	  Resource Description Framework (RDF) 
+	  query syntaxes, query construction and 
+	  query execution returning result bindings
+
+	  http://librdf.org/rasqal/
diff --git a/package/rasqal/rasqal.mk b/package/rasqal/rasqal.mk
new file mode 100755
index 0000000..8fb1e70
--- /dev/null
+++ b/package/rasqal/rasqal.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# rasqal
+#
+################################################################################
+RASQAL_VERSION = 0.9.33
+RASQAL_SITE = http://download.librdf.org/source
+RASQAL_DEPENDENCIES = raptor
+RASQAL_LICENSE = GPLv2+ or LGPLv2.1+ or Apache-2.0+
+RASQAL_LICENSE_FILES = LICENSE.txt
+
+RASQAL_AUTORECONF = YES
+RASQAL_INSTALL_STAGING = YES
+
+$(eval $(autotools-package))
-- 
2.7.4
