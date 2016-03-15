From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 15 Mar 2016 22:46:20 +0100
Subject: [Buildroot] [git commit] linux-headers: remove deprecated version
	3.17.x
Message-ID: <20160315214849.2D8BF7FCCE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b8de1788c10b61573834f2516e1441eb850a9501
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove for the upcoming 2016.05 release, it's been deprecated for a year
now.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
index c5be9f5..0d1a1a9 100644
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
@@ -221,7 +215,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.10.100"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.56"	if BR2_KERNEL_HEADERS_3_12
 	default "3.14.64"	if BR2_KERNEL_HEADERS_3_14
-	default "3.17.8"	if BR2_KERNEL_HEADERS_3_17
 	default "3.18.28"	if BR2_KERNEL_HEADERS_3_18
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
 	default "4.0.9"		if BR2_KERNEL_HEADERS_4_0
