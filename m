From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 11 Mar 2016 11:32:22 -0300
Subject: [Buildroot] [PATCH 5/7] linux-headers: remove deprecated version
	3.17.x
In-Reply-To: <1457706744-23401-1-git-send-email-gustavo@zacarias.com.ar>
References: <1457706744-23401-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1457706744-23401-5-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove for the upcoming 2016.05 release, it's been deprecated for a year
now.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 Config.in.legacy                     | 10 ++++++++++
 package/linux-headers/Config.in.host |  7 -------
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index bb7c333..807d701 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,16 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2016.05"
 
+config BR2_KERNEL_HEADERS_3_17
+	bool "kernel headers version 3.17.x are no longer supported"
+	select BR2_KERNEL_HEADERS_3_18
+	select BR2_LEGACY
+	help
+	  Version 3.17.x of the Linux kernel headers have been deprecated
+	  for more than four buildroot releases and are now removed.
+	  As an alternative, version 3.18.x of the headers have been
+	  automatically selected in your configuration.
+
 config BR2_GDB_VERSION_7_7
 	bool "gdb 7.7 has been removed"
 	select BR2_LEGACY
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index f847720..b29d761 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -41,12 +41,6 @@ choice
 		depends on !BR2_nios2
 		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14
 
-	config BR2_KERNEL_HEADERS_3_17
-		bool "Linux 3.17.x kernel headers"
-		depends on BR2_DEPRECATED_SINCE_2015_05
-		depends on !BR2_nios2
-		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
-
 	config BR2_KERNEL_HEADERS_3_18
 		bool "Linux 3.18.x kernel headers"
 		depends on !BR2_nios2
@@ -213,7 +207,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.10.100"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.56"	if BR2_KERNEL_HEADERS_3_12
 	default "3.14.64"	if BR2_KERNEL_HEADERS_3_14
-	default "3.17.8"	if BR2_KERNEL_HEADERS_3_17
 	default "3.18.28"	if BR2_KERNEL_HEADERS_3_18
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
 	default "4.0.9"		if BR2_KERNEL_HEADERS_4_0
-- 
2.4.10
