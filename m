From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  1 Sep 2015 15:45:31 -0300
Subject: [Buildroot] [PATCH 1/2] linux-headers: remove deprecated versions
	3.{0, 11, 13, 15}
Message-ID: <1441133132-11343-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove for the upcoming 2015.11 release, they've been deprecated for a
year now.
Also remove some previously forgotten selection removals in legacy.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 Config.in.legacy                     | 58 +++++++++++++++++++++++++++++++-----
 package/linux-headers/Config.in.host | 28 -----------------
 2 files changed, 50 insertions(+), 36 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 3330566..8016b53 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -105,6 +105,48 @@ comment "----------------------------------------------------"
 endif
 
 ###############################################################################
+comment "Legacy options removed in 2015.11"
+
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
 comment "Legacy options removed in 2015.08"
 
 config BR2_PACKAGE_KODI_PVR_ADDONS
@@ -630,12 +672,12 @@ config BR2_PACKAGE_LIBELF
 
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
@@ -788,22 +830,22 @@ config BR2_PACKAGE_EVTEST_CAPTURE
 
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
@@ -983,12 +1025,12 @@ config BR2_KERNEL_HEADERS_3_3
 
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
-- 
2.4.6
