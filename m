From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 8 Feb 2014 23:39:05 +0100
Subject: [Buildroot] [git commit] gdb: remove deprecated versions 7.2.x and
	7.3.x
Message-ID: <20140208224725.6E9149B985@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=348060f9603d7515ee92a52b9332375080ed231c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Gdb versions 7.2.x and 7.3.x have been deprecated since 2013.02 and thus can
be removed in 2014.02.
For legacy handling, version 7.5.x is automatically selected.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy           |   18 ++++++++++++++++++
 package/gdb/Config.in.host |   12 ------------
 2 files changed, 18 insertions(+), 12 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index a417046..fe91ecb 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -119,6 +119,24 @@ config BR2_sh3eb
 	  Due to an inexistent user base and generally poor Linux
 	  support, the support for the SH3eb architecture was removed.
 
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
index 9c0c78c..9c77028 100644
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
@@ -61,8 +51,6 @@ config BR2_GDB_VERSION
 	                      (!BR2_PACKAGE_HOST_GDB && BR2_bfin)
 	default "6.7.1-avr32-2.1.5" if BR2_GDB_VERSION_6_7_1_AVR32_2_1_5 || \
                                    (!BR2_PACKAGE_HOST_GDB && BR2_avr32)
-	default "7.2a"     if BR2_GDB_VERSION_7_2
-	default "7.3.1"    if BR2_GDB_VERSION_7_3
 	default "7.4.1"    if BR2_GDB_VERSION_7_4
 	default "7.5.1"    if BR2_GDB_VERSION_7_5 || !BR2_PACKAGE_HOST_GDB
 	default "f25a1952afd054205f9471e449c1f7ca5b271b7c" if BR2_arc
