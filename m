From: Erwan Gautron <erwan.gautron@yahoo.fr>
Date: Thu,  9 Mar 2017 08:36:29 +0100
Subject: [Buildroot] [PATCH 2/2 v2] new package: redland
In-Reply-To: <1489044989-4047-1-git-send-email-erwan.gautron@yahoo.fr>
References: <1489044989-4047-1-git-send-email-erwan.gautron@yahoo.fr>
Message-ID: <1489044989-4047-2-git-send-email-erwan.gautron@yahoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Erwan Gautron <erwan.gautron@yahoo.fr>

	  Redland is a set of free software C libraries
	  that provide support for the
	  Resource Description Framework (RDF).
	  http://librdf.org/

Signed-off-by: Erwan Gautron <erwan.gautron@yahoo.fr>
---
 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/redland/Config.in  |  9 +++++++++
 package/redland/redland.mk | 15 +++++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100755 package/redland/Config.in
 create mode 100755 package/redland/redland.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index afcf983..460c71a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -465,6 +465,7 @@ F:	package/szip/
 
 N:	Erwan Gautron <erwan.gautron@yahoo.fr>
 F:	package/rasqal/
+F:	package/redland/
 
 N:	Evan Zelkowitz <evan.zelkowitz@gmail.com>
 F:	package/sdl_gfx/
diff --git a/package/Config.in b/package/Config.in
index d46758d..541af9d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1161,6 +1161,7 @@ menu "JSON/XML"
 	source "package/rapidxml/Config.in"
 	source "package/raptor/Config.in"
 	source "package/rasqal/Config.in"
+	source "package/redland/Config.in"
 	source "package/tinyxml/Config.in"
 	source "package/tinyxml2/Config.in"
 	source "package/valijson/Config.in"
diff --git a/package/redland/Config.in b/package/redland/Config.in
new file mode 100755
index 0000000..cd0a41f
--- /dev/null
+++ b/package/redland/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_REDLAND
+	bool "Redland RDF Libraries"
+	select BR2_PACKAGE_RASQAL
+
+	help
+	  Redland is a set of free software C libraries
+	  that provide support for the 
+	  Resource Description Framework (RDF).
+	  http://librdf.org/
diff --git a/package/redland/redland.mk b/package/redland/redland.mk
new file mode 100755
index 0000000..ab43efb
--- /dev/null
+++ b/package/redland/redland.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# redland
+#
+################################################################################
+REDLAND_VERSION = 1.0.17
+REDLAND_SITE = http://download.librdf.org/source
+REDLAND_DEPENDENCIES = rasqal
+REDLAND_LICENSE = GPLv2+ or LGPLv2.1+ or Apache-2.0+
+REDLAND_LICENSE_FILES = LICENSE.txt
+
+REDLAND_AUTORECONF = YES
+REDLAND_INSTALL_STAGING = YES
+
+$(eval $(autotools-package))
-- 
2.7.4
