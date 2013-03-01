From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  1 Mar 2013 07:16:26 -0300
Subject: [Buildroot] [PATCH 1/3] kernel-headers: bump 3.{0, 2, 4,
	7}.x stable version and add 3.8.1
Message-ID: <1362132988-3805-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also mark 3.6.x as deprecated to match upstream EOL.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 toolchain/kernel-headers/Config.in                        | 15 ++++++++++-----
 ...rs_install-fix-__packed-in-exported-kernel-head.patch} |  0
 2 files changed, 10 insertions(+), 5 deletions(-)
 rename toolchain/kernel-headers/{linux-3.0.64-headers_install-fix-__packed-in-exported-kernel-head.patch => linux-3.0.67-headers_install-fix-__packed-in-exported-kernel-head.patch} (100%)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index ea65b4f..38cf9d3 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -6,7 +6,7 @@ comment "Kernel Header Options"
 
 choice
 	prompt "Kernel Headers"
-	default BR2_KERNEL_HEADERS_3_7
+	default BR2_KERNEL_HEADERS_3_8
 	help
 	  Select the version of kernel header files you wish to use.
 	  You must select the correct set of header files to match
@@ -38,10 +38,14 @@ choice
 
 	config BR2_KERNEL_HEADERS_3_6
 		bool "Linux 3.6.x kernel headers"
+		depends on BR2_DEPRECATED
 
 	config BR2_KERNEL_HEADERS_3_7
 		bool "Linux 3.7.x kernel headers"
 
+	config BR2_KERNEL_HEADERS_3_8
+		bool "Linux 3.8.x kernel headers"
+
 	config BR2_KERNEL_HEADERS_VERSION
 		bool "Manually specified Linux version"
 
@@ -58,13 +62,14 @@ config BR2_DEFAULT_KERNEL_VERSION
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "3.0.64"	if BR2_KERNEL_HEADERS_3_0
+	default "3.0.67"	if BR2_KERNEL_HEADERS_3_0
 	default "3.1.10"	if BR2_KERNEL_HEADERS_3_1
-	default "3.2.38"	if BR2_KERNEL_HEADERS_3_2
+	default "3.2.39"	if BR2_KERNEL_HEADERS_3_2
 	default "3.3.8"		if BR2_KERNEL_HEADERS_3_3
-	default "3.4.31"	if BR2_KERNEL_HEADERS_3_4
+	default "3.4.34"	if BR2_KERNEL_HEADERS_3_4
 	default "3.5.7"		if BR2_KERNEL_HEADERS_3_5
 	default "3.6.11"	if BR2_KERNEL_HEADERS_3_6
-	default "3.7.8"		if BR2_KERNEL_HEADERS_3_7
+	default "3.7.10"	if BR2_KERNEL_HEADERS_3_7
+	default "3.8.1"		if BR2_KERNEL_HEADERS_3_8
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default $BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
diff --git a/toolchain/kernel-headers/linux-3.0.64-headers_install-fix-__packed-in-exported-kernel-head.patch b/toolchain/kernel-headers/linux-3.0.67-headers_install-fix-__packed-in-exported-kernel-head.patch
similarity index 100%
rename from toolchain/kernel-headers/linux-3.0.64-headers_install-fix-__packed-in-exported-kernel-head.patch
rename to toolchain/kernel-headers/linux-3.0.67-headers_install-fix-__packed-in-exported-kernel-head.patch
-- 
1.7.12.4
