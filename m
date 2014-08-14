From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 14 Aug 2014 20:28:34 +0200
Subject: [Buildroot] [PATCH] bluez5_utils: gatttool depends on bluez5_utils
	client
Message-ID: <1408040914-23320-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The gatttool utility uses readline, and is therefore built only if
--enable-client is used, i.e when bluez5_utils client applications are
enabled. Therefore, this commit makes
BR2_PACKAGE_BLUEZ5_UTILS_GATTTOOL depend on
BR2_PACKAGE_BLUEZ5_UTILS_CLIENT. It also moves
BR2_PACKAGE_BLUEZ5_UTILS_GATTTOOL to be right below the
BR2_PACKAGE_BLUEZ5_UTILS_CLIENT definition.

Fixes:

  http://autobuild.buildroot.org/results/f2b/f2b8b1bf5d50e6223a9a6d6858320975edb2a25a/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/bluez5_utils/Config.in | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/package/bluez5_utils/Config.in b/package/bluez5_utils/Config.in
index 10588db..ec1352f 100644
--- a/package/bluez5_utils/Config.in
+++ b/package/bluez5_utils/Config.in
@@ -39,18 +39,9 @@ config BR2_PACKAGE_BLUEZ5_UTILS_CLIENT
 	help
 	  Enable the Bluez 5.x command line client.
 
-config BR2_PACKAGE_BLUEZ5_UTILS_EXPERIMENTAL
-	bool "build experimental plugins"
-	help
-	  Build BlueZ 5.x experimental plugins (SAP, NFC, ...).
-
-config BR2_PACKAGE_BLUEZ5_UTILS_TEST
-	bool "build tests"
-	help
-	  Build BlueZ 5.x tests
-
 config BR2_PACKAGE_BLUEZ5_UTILS_GATTTOOL
 	bool "install GATT tool"
+	depends on BR2_PACKAGE_BLUEZ5_UTILS_CLIENT
 	help
 	  Generic Attribute Profile (GATT) support. This provides
 	  profile discovery and description services for Bluetooth Low
@@ -59,6 +50,16 @@ config BR2_PACKAGE_BLUEZ5_UTILS_GATTTOOL
 	  It is always built with BlueZ 5.x, but upstream choose not
 	  to install it by default.
 
+config BR2_PACKAGE_BLUEZ5_UTILS_EXPERIMENTAL
+	bool "build experimental plugins"
+	help
+	  Build BlueZ 5.x experimental plugins (SAP, NFC, ...).
+
+config BR2_PACKAGE_BLUEZ5_UTILS_TEST
+	bool "build tests"
+	help
+	  Build BlueZ 5.x tests
+
 endif
 
 comment "bluez5-utils needs a toolchain w/ wchar, threads, IPv6, headers >= 3.4"
-- 
2.0.0
