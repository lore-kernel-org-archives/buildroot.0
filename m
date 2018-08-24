From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 24 Aug 2018 22:55:30 +0200
Subject: [Buildroot] [git commit] linux-headers: drop old unsupported 4.{10,
 11, 12, 13, 15} versions
Message-ID: <20180907111559.779907FD5D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a2d44ec6bf127cbf80b9bd292465c8825456e227
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

These versions received their last updated more than three months ago
and are no longer supported according to
https://www.kernel.org/category/releases.html, so drop them and add
legacy entries.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[Thomas: select an older kernel headers (4.9) rather than a newer one
(4.14) in the legacy handling of 4.10, 4.11, 4.12 and 4.13.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy                     | 53 ++++++++++++++++++++++++++++++++++++
 package/linux-headers/Config.in.host | 25 -----------------
 2 files changed, 53 insertions(+), 25 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 29d5b6adcc..aae8d28e13 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -142,6 +142,59 @@ comment "unpredictable ways.                                 "
 comment "----------------------------------------------------"
 endif
 
+###############################################################################
+comment "Legacy options removed in 2018.11"
+
+config BR2_KERNEL_HEADERS_4_10
+	bool "kernel headers version 4.10.x are no longer supported"
+	select BR2_KERNEL_HEADERS_4_9
+	select BR2_LEGACY
+	help
+	  Version 4.10.x of the Linux kernel headers are no longer
+	  maintained upstream and are now removed. As an alternative,
+	  version 4.14.x of the headers have been automatically
+	  selected in your configuration.
+
+config BR2_KERNEL_HEADERS_4_11
+	bool "kernel headers version 4.11.x are no longer supported"
+	select BR2_KERNEL_HEADERS_4_9
+	select BR2_LEGACY
+	help
+	  Version 4.11.x of the Linux kernel headers are no longer
+	  maintained upstream and are now removed. As an alternative,
+	  version 4.14.x of the headers have been automatically
+	  selected in your configuration.
+
+config BR2_KERNEL_HEADERS_4_12
+	bool "kernel headers version 4.12.x are no longer supported"
+	select BR2_KERNEL_HEADERS_4_19
+	select BR2_LEGACY
+	help
+	  Version 4.12.x of the Linux kernel headers are no longer
+	  maintained upstream and are now removed. As an alternative,
+	  version 4.14.x of the headers have been automatically
+	  selected in your configuration.
+
+config BR2_KERNEL_HEADERS_4_13
+	bool "kernel headers version 4.13.x are no longer supported"
+	select BR2_KERNEL_HEADERS_4_19
+	select BR2_LEGACY
+	help
+	  Version 4.13.x of the Linux kernel headers are no longer
+	  maintained upstream and are now removed. As an alternative,
+	  version 4.14.x of the headers have been automatically
+	  selected in your configuration.
+
+config BR2_KERNEL_HEADERS_4_15
+	bool "kernel headers version 4.15.x are no longer supported"
+	select BR2_KERNEL_HEADERS_4_14
+	select BR2_LEGACY
+	help
+	  Version 4.15.x of the Linux kernel headers are no longer
+	  maintained upstream and are now removed. As an alternative,
+	  version 4.14.x of the headers have been automatically
+	  selected in your configuration.
+
 ###############################################################################
 comment "Legacy options removed in 2018.08"
 
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index b6bc44c93e..ee3b033be3 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -43,30 +43,10 @@ config BR2_KERNEL_HEADERS_4_9
 	bool "Linux 4.9.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 
-config BR2_KERNEL_HEADERS_4_10
-	bool "Linux 4.10.x kernel headers"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_10
-
-config BR2_KERNEL_HEADERS_4_11
-	bool "Linux 4.11.x kernel headers"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_11
-
-config BR2_KERNEL_HEADERS_4_12
-	bool "Linux 4.12.x kernel headers"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12
-
-config BR2_KERNEL_HEADERS_4_13
-	bool "Linux 4.13.x kernel headers"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_13
-
 config BR2_KERNEL_HEADERS_4_14
 	bool "Linux 4.14.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
 
-config BR2_KERNEL_HEADERS_4_15
-	bool "Linux 4.15.x kernel headers"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_15
-
 config BR2_KERNEL_HEADERS_4_16
 	bool "Linux 4.16.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_16
@@ -268,12 +248,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.1.52"	if BR2_KERNEL_HEADERS_4_1
 	default "4.4.151"	if BR2_KERNEL_HEADERS_4_4
 	default "4.9.123"	if BR2_KERNEL_HEADERS_4_9
-	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
-	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
-	default "4.12.14"	if BR2_KERNEL_HEADERS_4_12
-	default "4.13.16"	if BR2_KERNEL_HEADERS_4_13
 	default "4.14.66"	if BR2_KERNEL_HEADERS_4_14
-	default "4.15.18"	if BR2_KERNEL_HEADERS_4_15
 	default "4.16.18"	if BR2_KERNEL_HEADERS_4_16
 	default "4.17.18"	if BR2_KERNEL_HEADERS_4_17
 	default "4.18.5"	if BR2_KERNEL_HEADERS_4_18
