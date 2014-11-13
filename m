From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Nov 2014 16:10:24 +0100
Subject: [Buildroot] [git commit] qt5base: unconditionally install network,
	sql, xml and test modules to target
Message-ID: <20141113153637.C33B3B4506@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=91f9a3ac1f25d4988758fa416b4fda837a486516
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The qt5 build system currently unconditionally builds and installs into
staging these libraries, so ensure they also get installed into target to
make sure we don't end up with dynamic linker errors at runtime.

From src.pro:

SUBDIRS += src_network src_sql src_xml src_testlib

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5base/Config.in |   16 ++++------------
 1 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index e5679be..6ea7301 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -37,9 +37,7 @@ config BR2_PACKAGE_QT5BASE_EXAMPLES
 	  If unsure, say N.
 
 config BR2_PACKAGE_QT5BASE_NETWORK
-	bool "network module"
-	help
-	  This options enables the Qt5Network library.
+       def_bool y
 
 config BR2_PACKAGE_QT5BASE_CONCURRENT
 	bool "concurrent module"
@@ -47,9 +45,7 @@ config BR2_PACKAGE_QT5BASE_CONCURRENT
 	  This options enables the Qt5Concurrent library.
 
 config BR2_PACKAGE_QT5BASE_SQL
-	bool "sql module"
-	help
-	  This options enables the Qt5Sql library.
+       def_bool y
 
 if BR2_PACKAGE_QT5BASE_SQL
 config BR2_PACKAGE_QT5BASE_MYSQL
@@ -101,14 +97,10 @@ endchoice
 endif
 
 config BR2_PACKAGE_QT5BASE_TEST
-	bool "test module"
-	help
-	  This options enables the Qt5Test library.
+	def_bool y
 
 config BR2_PACKAGE_QT5BASE_XML
-	bool "XML module"
-	help
-	  This options enables the Qt5Xml library.
+	def_bool y
 
 config BR2_PACKAGE_QT5BASE_GUI
 	bool "gui module"
