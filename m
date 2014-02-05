From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 05 Feb 2014 14:50:58 +0100
Subject: [Buildroot] [PATCH 6 of 8 v2] gdb: remove deprecated versions 7.2.x
	and 7.3.x
In-Reply-To: <patchbomb.1391608252@argentina>
References: <patchbomb.1391608252@argentina>
Message-ID: <f438af7e2c66e011971b.1391608258@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gdb versions 7.2.x and 7.3.x have been deprecated since 2013.02 and thus can
be removed in 2014.02.
For legacy handling, version 7.5.x is automatically selected.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
v2: no changes

 Config.in.legacy           |  18 ++++++++++++++++++
 package/gdb/Config.in.host |  12 ------------
 2 files changed, 18 insertions(+), 12 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -101,6 +101,24 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2014.02"
 
+config BR2_GDB_VERSION_7_2
+	bool "gdb 7.2.x is no longer supported"
+	select BR2_GDB_VERSION_7_5
+	select BR2_LEGACY
+	help
+	  Version 7.2.x of gdb has been deprecated for more than four
+	  buildroot releases and is now removed. As an alternative, gdb
+	  7.5.x has been automatically selected in your configuration.
+
+config BR2_GDB_VERSION_7_3
+	bool "gdb 7.3.x is no longer supported"
+	select BR2_GDB_VERSION_7_5
+	select BR2_LEGACY
+	help
+	  Version 7.3.x of gdb has been deprecated for more than four
+	  buildroot releases and is now removed. As an alternative, gdb
+	  7.5.x has been automatically selected in your configuration.
+
 config BR2_PACKAGE_CCACHE
 	bool "ccache target package has been removed"
 	select BR2_LEGACY
diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -31,16 +31,6 @@ choice
 		depends on BR2_avr32
 		bool "gdb 6.7.1-avr32-2.1.5"
 
-	config BR2_GDB_VERSION_7_2
-		bool "gdb 7.2.x"
-		depends on !BR2_bfin
-		depends on BR2_DEPRECATED_SINCE_2013_02
-
-	config BR2_GDB_VERSION_7_3
-		bool "gdb 7.3.x"
-		depends on !BR2_bfin
-		depends on BR2_DEPRECATED_SINCE_2013_02
-
 	config BR2_GDB_VERSION_7_4
 		bool "gdb 7.4.x"
 		depends on !BR2_bfin
@@ -55,8 +45,6 @@ config BR2_GDB_VERSION
 	string
 	default "6.6a"     if BR2_GDB_VERSION_6_6
 	default "6.7.1-avr32-2.1.5" if BR2_GDB_VERSION_6_7_1_AVR32_2_1_5
-	default "7.2a"     if BR2_GDB_VERSION_7_2
-	default "7.3.1"    if BR2_GDB_VERSION_7_3
 	default "7.4.1"    if BR2_GDB_VERSION_7_4
 	default "7.5.1"    if BR2_GDB_VERSION_7_5
 	default "f25a1952afd054205f9471e449c1f7ca5b271b7c" if BR2_arc
