From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  5 Jan 2012 13:30:14 -0300
Subject: [Buildroot] [PATCH 1/9] kernel-headers: bump 3.0 & 3.1 stable
	versions, add 3.2
Message-ID: <1325781022-19371-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 toolchain/kernel-headers/Config.in                 |   10 +++++++---
 ...all-fix-__packed-in-exported-kernel-head.patch} |    0
 2 files changed, 7 insertions(+), 3 deletions(-)
 rename toolchain/kernel-headers/{linux-3.0.14-headers_install-fix-__packed-in-exported-kernel-head.patch => linux-3.0.15-headers_install-fix-__packed-in-exported-kernel-head.patch} (100%)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index e092651..ccd7a30 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -6,7 +6,7 @@ comment "Kernel Header Options"
 
 choice
 	prompt "Kernel Headers"
-	default BR2_KERNEL_HEADERS_3_1
+	default BR2_KERNEL_HEADERS_3_2
 	help
 	  Select the version of kernel header files you wish to use.
 	  You must select the correct set of header files to match
@@ -36,6 +36,9 @@ choice
 	config BR2_KERNEL_HEADERS_3_1
 		bool "Linux 3.1.x kernel headers"
 
+	config BR2_KERNEL_HEADERS_3_2
+		bool "Linux 3.2.x kernel headers"
+
 	config BR2_KERNEL_HEADERS_VERSION
 		bool "Linux 2.6 (manually specified version)"
 
@@ -57,7 +60,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "2.6.37.6"	if BR2_KERNEL_HEADERS_2_6_37
 	default "2.6.38.8"	if BR2_KERNEL_HEADERS_2_6_38
 	default "2.6.39.4"	if BR2_KERNEL_HEADERS_2_6_39
-	default "3.0.14"	if BR2_KERNEL_HEADERS_3_0
-	default "3.1.6"		if BR2_KERNEL_HEADERS_3_1
+	default "3.0.15"	if BR2_KERNEL_HEADERS_3_0
+	default "3.1.7"		if BR2_KERNEL_HEADERS_3_1
+	default "3.2"		if BR2_KERNEL_HEADERS_3_2
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default $BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
diff --git a/toolchain/kernel-headers/linux-3.0.14-headers_install-fix-__packed-in-exported-kernel-head.patch b/toolchain/kernel-headers/linux-3.0.15-headers_install-fix-__packed-in-exported-kernel-head.patch
similarity index 100%
rename from toolchain/kernel-headers/linux-3.0.14-headers_install-fix-__packed-in-exported-kernel-head.patch
rename to toolchain/kernel-headers/linux-3.0.15-headers_install-fix-__packed-in-exported-kernel-head.patch
-- 
1.7.3.4
