From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 13 Sep 2015 23:28:26 +0200
Subject: [Buildroot] [git commit] linux-headers: remove deprecated versions
	3.{0, 11, 13, 15}
Message-ID: <20150913212900.89D2881D8A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4ac4bc32836454845bd33a6e2539c6338dd94f6c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove for the upcoming 2015.11 release, they've been deprecated for a
year now.
Also remove some previously forgotten selection removals in legacy.

[Peter: drop 3.0.x kernel patch]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                                   |   56 +++++++++++++++++---
 ...tall-fix-__packed-in-exported-kernel-head.patch |   46 ----------------
 package/linux-headers/Config.in.host               |   28 ----------
 3 files changed, 48 insertions(+), 82 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 52031fe..fbe61d8 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -107,6 +107,46 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2015.11"
 
+config BR2_KERNEL_HEADERS_3_0
+	bool "kernel headers version 3.0.x are no longer supported"
+	select BR2_KERNEL_HEADERS_3_2
+	select BR2_LEGACY
+	help
+	  Version 3.0.x of the Linux kernel headers have been deprecated
+	  for more than four buildroot releases and are now removed.
+	  As an alternative, version 3.2.x of the headers have been
+	  automatically selected in your configuration.
+
+config BR2_KERNEL_HEADERS_3_11
+	bool "kernel headers version 3.11.x are no longer supported"
+	select BR2_KERNEL_HEADERS_3_12
+	select BR2_LEGACY
+	help
+	  Version 3.11.x of the Linux kernel headers have been deprecated
+	  for more than four buildroot releases and are now removed.
+	  As an alternative, version 3.12.x of the headers have been
+	  automatically selected in your configuration.
+
+config BR2_KERNEL_HEADERS_3_13
+	bool "kernel headers version 3.13.x are no longer supported"
+	select BR2_KERNEL_HEADERS_3_14
+	select BR2_LEGACY
+	help
+	  Version 3.13.x of the Linux kernel headers have been deprecated
+	  for more than four buildroot releases and are now removed.
+	  As an alternative, version 3.14.x of the headers have been
+	  automatically selected in your configuration.
+
+config BR2_KERNEL_HEADERS_3_15
+	bool "kernel headers version 3.15.x are no longer supported"
+	select BR2_KERNEL_HEADERS_3_18
+	select BR2_LEGACY
+	help
+	  Version 3.15.x of the Linux kernel headers have been deprecated
+	  for more than four buildroot releases and are now removed.
+	  As an alternative, version 3.18.x of the headers have been
+	  automatically selected in your configuration.
+
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_ANDI
 	bool "DirectFB example df_andi has been removed"
 	select BR2_PACKAGE_DIRECTFB_EXAMPLES
@@ -862,12 +902,12 @@ config BR2_PACKAGE_LIBELF
 
 config BR2_KERNEL_HEADERS_3_8
 	bool "kernel headers version 3.8.x are no longer supported"
-	select BR2_KERNEL_HEADERS_3_9
+	select BR2_KERNEL_HEADERS_3_10
 	select BR2_LEGACY
 	help
 	  Version 3.8.x of the Linux kernel headers have been deprecated
 	  for more than four buildroot releases and are now removed.
-	  As an alternative, version 3.9.x of the headers have been
+	  As an alternative, version 3.10.x of the headers have been
 	  automatically selected in your configuration.
 
 config BR2_PACKAGE_GETTEXT_TOOLS
@@ -1020,22 +1060,22 @@ config BR2_PACKAGE_EVTEST_CAPTURE
 
 config BR2_KERNEL_HEADERS_3_6
 	bool "kernel headers version 3.6.x are no longer supported"
-	select BR2_KERNEL_HEADERS_3_9
+	select BR2_KERNEL_HEADERS_3_10
 	select BR2_LEGACY
 	help
 	  Version 3.6.x of the Linux kernel headers have been deprecated
 	  for more than four buildroot releases and are now removed.
-	  As an alternative, version 3.8.x of the headers have been
+	  As an alternative, version 3.10.x of the headers have been
 	  automatically selected in your configuration.
 
 config BR2_KERNEL_HEADERS_3_7
 	bool "kernel headers version 3.7.x are no longer supported"
-	select BR2_KERNEL_HEADERS_3_9
+	select BR2_KERNEL_HEADERS_3_10
 	select BR2_LEGACY
 	help
 	  Version 3.7.x of the Linux kernel headers have been deprecated
 	  for more than four buildroot releases and are now removed.
-	  As an alternative, version 3.8.x of the headers have been
+	  As an alternative, version 3.10.x of the headers have been
 	  automatically selected in your configuration.
 
 config BR2_PACKAGE_VALA
@@ -1215,12 +1255,12 @@ config BR2_KERNEL_HEADERS_3_3
 
 config BR2_KERNEL_HEADERS_3_5
 	bool "kernel headers version 3.5.x are no longer supported"
-	select BR2_KERNEL_HEADERS_3_9
+	select BR2_KERNEL_HEADERS_3_10
 	select BR2_LEGACY
 	help
 	  Version 3.5.x of the Linux kernel headers have been deprecated
 	  for more than four buildroot releases and are now removed.
-	  As an alternative, version 3.8.x of the headers have been
+	  As an alternative, version 3.10.x of the headers have been
 	  automatically selected in your configuration.
 
 config BR2_GDB_VERSION_7_2
diff --git a/package/linux-headers/3.0.101/0001-headers_install-fix-__packed-in-exported-kernel-head.patch b/package/linux-headers/3.0.101/0001-headers_install-fix-__packed-in-exported-kernel-head.patch
deleted file mode 100644
index 8777b71..0000000
--- a/package/linux-headers/3.0.101/0001-headers_install-fix-__packed-in-exported-kernel-head.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From f210735fe2f17a6225432ee3d1239bcf23a8659c Mon Sep 17 00:00:00 2001
-From: Markus Trippelsdorf <markus@trippelsdorf.de>
-Date: Fri, 24 Jun 2011 15:51:00 +0200
-Subject: [PATCH] headers_install: fix __packed in exported kernel headers
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-checkpatch.pl warns about using __attribute__((packed)) in kernel
-headers: "__packed is preferred over __attribute__((packed))". If one
-follows that advice it could cause problems in the exported header
-files, because the outside world doesn't know about this shortcut.
-
-For example busybox will fail to compile:
- CC      miscutils/ubi_attach_detach.o
- In file included from miscutils/ubi_attach_detach.c:27:0:
- /usr/include/mtd/ubi-user.h:330:3: error: conflicting types for ???__packed???
- /usr/include/mtd/ubi-user.h:314:3: note: previous declaration of ???__packed??? was here
-...
-
-Fix the problem by substituting __packed with __attribute__((packed)) in
-the header_install.pl script.
-
-Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
-CC: Joe Perches <joe@perches.com>
-Signed-off-by: Markus Trippelsdorf <markus@trippelsdorf.de>
-Signed-off-by: Michal Marek <mmarek@suse.cz>
----
- scripts/headers_install.pl |    1 +
- 1 files changed, 1 insertions(+), 0 deletions(-)
-
-diff --git a/scripts/headers_install.pl b/scripts/headers_install.pl
-index efb3be1..48462be 100644
---- a/scripts/headers_install.pl
-+++ b/scripts/headers_install.pl
-@@ -35,6 +35,7 @@ foreach my $file (@files) {
- 		$line =~ s/([\s(])__iomem\s/$1/g;
- 		$line =~ s/\s__attribute_const__\s/ /g;
- 		$line =~ s/\s__attribute_const__$//g;
-+		$line =~ s/\b__packed\b/__attribute__((packed))/g;
- 		$line =~ s/^#include <linux\/compiler.h>//;
- 		$line =~ s/(^|\s)(inline)\b/$1__$2__/g;
- 		$line =~ s/(^|\s)(asm)\b(\s|[(]|$)/$1__$2__$3/g;
--- 
-1.7.5.4
-
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 3a9603e..49a8dc2 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -11,12 +11,6 @@ choice
 	  You must select the correct set of header files to match
 	  the kernel you intend to use on your target system.
 
-	config BR2_KERNEL_HEADERS_3_0
-		bool "Linux 3.0.x kernel headers"
-		depends on BR2_DEPRECATED_SINCE_2014_08
-		depends on !BR2_arc && !BR2_nios2
-		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
-
 	config BR2_KERNEL_HEADERS_3_2
 		bool "Linux 3.2.x kernel headers"
 		depends on !BR2_arc && !BR2_nios2
@@ -32,34 +26,16 @@ choice
 		depends on !BR2_nios2
 		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
 
-	config BR2_KERNEL_HEADERS_3_11
-		bool "Linux 3.11.x kernel headers"
-		depends on BR2_DEPRECATED_SINCE_2014_08
-		depends on !BR2_nios2
-		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_11
-
 	config BR2_KERNEL_HEADERS_3_12
 		bool "Linux 3.12.x kernel headers"
 		depends on !BR2_nios2
 		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
 
-	config BR2_KERNEL_HEADERS_3_13
-		bool "Linux 3.13.x kernel headers"
-		depends on BR2_DEPRECATED_SINCE_2014_08
-		depends on !BR2_nios2
-		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_13
-
 	config BR2_KERNEL_HEADERS_3_14
 		bool "Linux 3.14.x kernel headers"
 		depends on !BR2_nios2
 		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14
 
-	config BR2_KERNEL_HEADERS_3_15
-		bool "Linux 3.15.x kernel headers"
-		depends on BR2_DEPRECATED_SINCE_2014_08
-		depends on !BR2_nios2
-		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15
-
 	config BR2_KERNEL_HEADERS_3_16
 		bool "Linux 3.16.x kernel headers"
 		depends on BR2_DEPRECATED_SINCE_2015_02
@@ -215,15 +191,11 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "3.0.101"	if BR2_KERNEL_HEADERS_3_0
 	default "3.2.71"	if BR2_KERNEL_HEADERS_3_2
 	default "3.4.108"	if BR2_KERNEL_HEADERS_3_4
 	default "3.10.87"	if BR2_KERNEL_HEADERS_3_10
-	default "3.11.10"	if BR2_KERNEL_HEADERS_3_11
 	default "3.12.47"	if BR2_KERNEL_HEADERS_3_12
-	default "3.13.11"	if BR2_KERNEL_HEADERS_3_13
 	default "3.14.51"	if BR2_KERNEL_HEADERS_3_14
-	default "3.15.10"	if BR2_KERNEL_HEADERS_3_15
 	default "3.16.7"	if BR2_KERNEL_HEADERS_3_16
 	default "3.17.8"	if BR2_KERNEL_HEADERS_3_17
 	default "3.18.20"	if BR2_KERNEL_HEADERS_3_18
