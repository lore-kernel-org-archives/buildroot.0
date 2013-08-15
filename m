From: Dave Skok <blanco.ether@gmail.com>
Date: Thu, 15 Aug 2013 10:12:20 -0400
Subject: [Buildroot] [PATCH 3/3] ola: new package
In-Reply-To: <a3673089a21b539b377ec10ae2660890d2c9a5f6.1376575789.git.blanco.ether@gmail.com>
References: <a3673089a21b539b377ec10ae2660890d2c9a5f6.1376575789.git.blanco.ether@gmail.com>
Message-ID: <11085f636be81b71573751ca6aef732258e32fc1.1376575789.git.blanco.ether@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/ola/Config.in | 35 +++++++++++++++++++----------------
 1 file changed, 19 insertions(+), 16 deletions(-)

diff --git a/package/ola/Config.in b/package/ola/Config.in
index 7a43bcf..ce13786 100644
--- a/package/ola/Config.in
+++ b/package/ola/Config.in
@@ -27,11 +27,6 @@ config BR2_PACKAGE_OLA_WEB
 	help
 	  Build OLA with browser interface.
 
-config BR2_PACKAGE_OLA_SLP
-	bool "slp tools"
-	help
-	  Build OLA with slp tools.
- 
 config BR2_PACKAGE_OLA_PYTHON_BINDINGS
 	bool "python bindings"
 	select BR2_PACKAGE_PYTHON
@@ -40,6 +35,11 @@ config BR2_PACKAGE_OLA_PYTHON_BINDINGS
 	help
 	  Build OLA with support for the Python language.
 
+config BR2_PACKAGE_OLA_SLP
+	bool "slp tools"
+	help
+	  Build OLA with slp tools.
+
 endmenu
 
 menu "Tests and Examples"
@@ -50,6 +50,9 @@ config BR2_PACKAGE_OLA_EXAMPLES
 	help
 	  Build OLA examples.
 
+comment "rdm tests require ola python bindings"
+	depends on !BR2_PACKAGE_OLA_PYTHON_BINDINGS
+
 config BR2_PACKAGE_OLA_RDM_TESTS
 	bool "rdm tests"
 	depends on BR2_PACKAGE_OLA_PYTHON_BINDINGS
@@ -88,6 +91,11 @@ config BR2_PACKAGE_OLA_PLUGIN_ESPNET
 	help
 	  Build EspNet plugin for OLA.
 
+config BR2_PACKAGE_OLA_PLUGIN_KARATE
+	bool "karate"
+	help
+	  Build Karate plugin for OLA.
+
 config BR2_PACKAGE_OLA_PLUGIN_KINET
 	bool "kinet"
 	help
@@ -98,6 +106,12 @@ config BR2_PACKAGE_OLA_PLUGIN_MILINT
 	help
 	  Build Milford Instruments 1-463 plugin for OLA.
 
+config BR2_PACKAGE_OLA_PLUGIN_OSC
+	bool "osc"
+	select BR2_PACKAGE_LIBLO
+	help
+	  Build Open sound control plugin for OLA.
+
 config BR2_PACKAGE_OLA_PLUGIN_PATHPORT
 	bool "pathport"
 	help
@@ -113,17 +127,6 @@ config BR2_PACKAGE_OLA_PLUGIN_SHOWNET
 	help
 	  Build ShowNet plugin for OLA.
 
-config BR2_PACKAGE_OLA_PLUGIN_KARATE
-	bool "karate"
-	help
-	  Build Karate plugin for OLA.
-
-config BR2_PACKAGE_OLA_PLUGIN_OSC
-	bool "osc"
-	select BR2_PACKAGE_LIBLO
-	help
-	  Build Open sound control plugin for OLA.
-
 config BR2_PACKAGE_OLA_PLUGIN_SPI
 	bool "spi"
 	help
-- 
1.8.3.4
