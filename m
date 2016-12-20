From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 20 Dec 2016 11:48:26 -0300
Subject: [Buildroot] [PATCH] linux-headers: kill 3.14.x and 4.{5, 6,
	7}.x series
Message-ID: <20161220144826.3034-1-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

These aren't supported upstream any more so remove the options and add
them to legacy.
Also switch the older deprecations that used 3.14.x to 3.12.x

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 Config.in.legacy                     | 52 +++++++++++++++++++++++++++++++-----
 package/linux-headers/Config.in.host | 21 ---------------
 2 files changed, 46 insertions(+), 27 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 2922fb4..2e11725 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,46 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2017.02"
 
+config BR2_KERNEL_HEADERS_4_7
+	bool "kernel headers version 4.7.x are no longer supported"
+	select BR2_KERNEL_HEADERS_4_4
+	select BR2_LEGACY
+	help
+	  Version 4.7.x of the Linux kernel headers are no longer
+	  maintained upstream and are now removed. As an alternative,
+	  version 4.4.x of the headers have been automatically
+	  selected in your configuration.
+
+config BR2_KERNEL_HEADERS_4_6
+	bool "kernel headers version 4.6.x are no longer supported"
+	select BR2_KERNEL_HEADERS_4_4
+	select BR2_LEGACY
+	help
+	  Version 4.6.x of the Linux kernel headers are no longer
+	  maintained upstream and are now removed. As an alternative,
+	  version 4.4.x of the headers have been automatically
+	  selected in your configuration.
+
+config BR2_KERNEL_HEADERS_4_5
+	bool "kernel headers version 4.5.x are no longer supported"
+	select BR2_KERNEL_HEADERS_4_4
+	select BR2_LEGACY
+	help
+	  Version 4.5.x of the Linux kernel headers are no longer
+	   maintained upstream and are now removed. As an alternative,
+	   version 4.4.x of the headers have been automatically
+	   selected in your configuration.
+
+config BR2_KERNEL_HEADERS_3_14
+        bool "kernel headers version 3.14.x are no longer supported"
+	select BR2_KERNEL_HEADERS_3_12
+	select BR2_LEGACY
+	  help
+	  Version 3.14.x of the Linux kernel headers are no longer
+	  maintained upstream and are now removed. As an alternative,
+	  version 3.12.x of the headers have been automatically
+	  selected in your configuration.
+
 config BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS
 	bool "musl-cross 1.1.12 toolchain removed"
 	select BR2_LEGACY
@@ -599,12 +639,12 @@ config BR2_PACKAGE_XDRIVER_XF86_INPUT_VOID
 
 config BR2_KERNEL_HEADERS_3_17
 	bool "kernel headers version 3.17.x are no longer supported"
-	select BR2_KERNEL_HEADERS_3_14
+	select BR2_KERNEL_HEADERS_3_12
 	select BR2_LEGACY
 	help
 	  Version 3.17.x of the Linux kernel headers have been deprecated
 	  for more than four buildroot releases and are now removed.
-	  As an alternative, version 3.14.x of the headers have been
+	  As an alternative, version 3.12.x of the headers have been
 	  automatically selected in your configuration.
 
 config BR2_GDB_VERSION_7_7
@@ -745,12 +785,12 @@ config BR2_PACKAGE_CUPS_PDFTOPS
 
 config BR2_KERNEL_HEADERS_3_16
 	bool "kernel headers version 3.16.x are no longer supported"
-	select BR2_KERNEL_HEADERS_3_14
+	select BR2_KERNEL_HEADERS_3_12
 	select BR2_LEGACY
 	help
 	Version 3.16.x of the Linux kernel headers have been deprecated
 	for more than four buildroot releases and are now removed.
-	As an alternative, version 3.14.x of the headers have been
+	As an alternative, version 3.12.x of the headers have been
 	automatically selected in your configuration.
 
 config BR2_PACKAGE_PYTHON_PYXML
@@ -981,12 +1021,12 @@ config BR2_KERNEL_HEADERS_3_13
 
 config BR2_KERNEL_HEADERS_3_15
 	bool "kernel headers version 3.15.x are no longer supported"
-	select BR2_KERNEL_HEADERS_3_14
+	select BR2_KERNEL_HEADERS_3_12
 	select BR2_LEGACY
 	help
 	  Version 3.15.x of the Linux kernel headers have been deprecated
 	  for more than four buildroot releases and are now removed.
-	  As an alternative, version 3.14.x of the headers have been
+	  As an alternative, version 3.12.x of the headers have been
 	  automatically selected in your configuration.
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_ANDI
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index a95b41d..4ab562c 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -46,11 +46,6 @@ choice
 		depends on !BR2_nios2
 		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
 
-	config BR2_KERNEL_HEADERS_3_14
-		bool "Linux 3.14.x kernel headers"
-		depends on !BR2_nios2
-		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14
-
 	config BR2_KERNEL_HEADERS_3_18
 		bool "Linux 3.18.x kernel headers"
 		depends on !BR2_nios2
@@ -64,18 +59,6 @@ choice
 		bool "Linux 4.4.x kernel headers"
 		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_4
 
-	config BR2_KERNEL_HEADERS_4_5
-		bool "Linux 4.5.x kernel headers"
-		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5
-
-	config BR2_KERNEL_HEADERS_4_6
-		bool "Linux 4.6.x kernel headers"
-		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_6
-
-	config BR2_KERNEL_HEADERS_4_7
-		bool "Linux 4.7.x kernel headers"
-		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_7
-
 	config BR2_KERNEL_HEADERS_4_8
 		bool "Linux 4.8.x kernel headers"
 		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_8
@@ -235,15 +218,11 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.4.113"	if BR2_KERNEL_HEADERS_3_4
 	default "3.10.104"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.69"	if BR2_KERNEL_HEADERS_3_12
-	default "3.14.79"	if BR2_KERNEL_HEADERS_3_14
 	default "3.18.45"	if BR2_KERNEL_HEADERS_3_18
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
 	default "4.0.9"		if BR2_KERNEL_HEADERS_4_0
 	default "4.1.36"	if BR2_KERNEL_HEADERS_4_1
 	default "4.4.39"	if BR2_KERNEL_HEADERS_4_4
-	default "4.5.7"		if BR2_KERNEL_HEADERS_4_5
-	default "4.6.7"		if BR2_KERNEL_HEADERS_4_6
-	default "4.7.10"	if BR2_KERNEL_HEADERS_4_7
 	default "4.8.15"	if BR2_KERNEL_HEADERS_4_8
 	default "4.9"		if BR2_KERNEL_HEADERS_4_9
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
2.10.2
