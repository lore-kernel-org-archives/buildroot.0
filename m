From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 20 Jan 2016 13:53:39 -0300
Subject: [Buildroot] [PATCH 1/2] linux-headers: remove deprecated version
	3.16.x
Message-ID: <1453308820-16940-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove for the upcoming 2016.02 release, it's been deprecated for a year
now.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 Config.in.legacy                     | 10 ++++++++++
 package/linux-headers/Config.in.host |  7 -------
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 2e6062c..9111c01 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,16 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2016.02"
 
+config BR2_KERNEL_HEADERS_3_16
+	bool "kernel headers version 3.16.x are no longer supported"
+	select BR2_KERNEL_HEADERS_3_18
+	select BR2_LEGACY
+	help
+	Version 3.16.x of the Linux kernel headers have been deprecated
+	for more than four buildroot releases and are now removed.
+	As an alternative, version 3.18.x of the headers have been
+	automatically selected in your configuration.
+
 config BR2_PACKAGE_PYTHON_PYXML
 	bool "python-pyxml package has been removed"
 	select BR2_LEGACY
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 41e3a92..ade95be 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -36,12 +36,6 @@ choice
 		depends on !BR2_nios2
 		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14
 
-	config BR2_KERNEL_HEADERS_3_16
-		bool "Linux 3.16.x kernel headers"
-		depends on BR2_DEPRECATED_SINCE_2015_02
-		depends on !BR2_nios2
-		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_16
-
 	config BR2_KERNEL_HEADERS_3_17
 		bool "Linux 3.17.x kernel headers"
 		depends on BR2_DEPRECATED_SINCE_2015_05
@@ -213,7 +207,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.10.94"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.52"	if BR2_KERNEL_HEADERS_3_12
 	default "3.14.58"	if BR2_KERNEL_HEADERS_3_14
-	default "3.16.7"	if BR2_KERNEL_HEADERS_3_16
 	default "3.17.8"	if BR2_KERNEL_HEADERS_3_17
 	default "3.18.25"	if BR2_KERNEL_HEADERS_3_18
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
-- 
2.4.10
