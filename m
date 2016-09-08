From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  8 Sep 2016 15:39:01 -0300
Subject: [Buildroot] [PATCH 5/6] linux-headers: remove deprecated versions
In-Reply-To: <1473359942-15810-1-git-send-email-gustavo@zacarias.com.ar>
References: <1473359942-15810-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1473359942-15810-5-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Linux headers 3.19.x and 4.0.x have been deprecated for a while now, so
it's time to remove them.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 Config.in.legacy                     | 20 ++++++++++++++++++++
 package/linux-headers/Config.in.host | 10 ----------
 2 files changed, 20 insertions(+), 10 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 60d414b..b796904 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,26 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2016.11"
 
+config BR2_KERNEL_HEADERS_4_0
+	bool "kernel headers version 4.0.x are no longer supported"
+	select BR2_KERNEL_HEADERS_4_1
+	select BR2_LEGACY
+	help
+	  Version 4.0.x of the Linux kernel headers have been deprecated
+	  for more than four buildroot releases and are now removed.
+	  As an alternative, version 4.1.x of the headers have been
+	  automatically selected in your configuration.
+
+config BR2_KERNEL_HEADERS_3_19
+	bool "kernel headers version 3.19.x are no longer supported"
+	select BR2_KERNEL_HEADERS_4_1
+	select BR2_LEGACY
+	help
+	  Version 3.19.x of the Linux kernel headers have been deprecated
+	  for more than four buildroot releases and are now removed.
+	  As an alternative, version 4.1.x of the headers have been
+	  automatically selected in your configuration.
+
 config BR2_PACKAGE_LIBEVAS_GENERIC_LOADERS
 	bool "libevas-generic-loaders package removed"
 	select BR2_LEGACY
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 9d8f030..7fea748 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -56,16 +56,6 @@ choice
 		depends on !BR2_nios2
 		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18
 
-	config BR2_KERNEL_HEADERS_3_19
-		bool "Linux 3.19.x kernel headers"
-		depends on BR2_DEPRECATED_SINCE_2015_08
-		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_19
-
-	config BR2_KERNEL_HEADERS_4_0
-		bool "Linux 4.0.x kernel headers"
-		depends on BR2_DEPRECATED_SINCE_2015_08
-		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_0
-
 	config BR2_KERNEL_HEADERS_4_1
 		bool "Linux 4.1.x kernel headers"
 		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_1
-- 
2.7.3
