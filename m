From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  4 Sep 2012 09:00:17 -0300
Subject: [Buildroot] [PATCH 1/3] kernel-headers: add 3.5.x and bump 3.{0, 2,
	4}.x stable versions
Message-ID: <1346760019-31807-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 toolchain/kernel-headers/Config.in                 |   12 ++++++++----
 ...all-fix-__packed-in-exported-kernel-head.patch} |    0
 2 files changed, 8 insertions(+), 4 deletions(-)
 rename toolchain/kernel-headers/{linux-3.0.40-headers_install-fix-__packed-in-exported-kernel-head.patch => linux-3.0.41-headers_install-fix-__packed-in-exported-kernel-head.patch} (100%)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index dc5c2ad..d35aed2 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -6,7 +6,7 @@ comment "Kernel Header Options"
 
 choice
 	prompt "Kernel Headers"
-	default BR2_KERNEL_HEADERS_3_4
+	default BR2_KERNEL_HEADERS_3_5
 	help
 	  Select the version of kernel header files you wish to use.
 	  You must select the correct set of header files to match
@@ -44,6 +44,9 @@ choice
 	config BR2_KERNEL_HEADERS_3_4
 		bool "Linux 3.4.x kernel headers"
 
+	config BR2_KERNEL_HEADERS_3_5
+		bool "Linux 3.5.x kernel headers"
+
 	config BR2_KERNEL_HEADERS_VERSION
 		bool "Linux 2.6 (manually specified version)"
 
@@ -64,10 +67,11 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "2.6.37.6"	if BR2_KERNEL_HEADERS_2_6_37
 	default "2.6.38.8"	if BR2_KERNEL_HEADERS_2_6_38
 	default "2.6.39.4"	if BR2_KERNEL_HEADERS_2_6_39
-	default "3.0.40"	if BR2_KERNEL_HEADERS_3_0
+	default "3.0.42"	if BR2_KERNEL_HEADERS_3_0
 	default "3.1.10"	if BR2_KERNEL_HEADERS_3_1
-	default "3.2.26"	if BR2_KERNEL_HEADERS_3_2
+	default "3.2.28"	if BR2_KERNEL_HEADERS_3_2
 	default "3.3.8"		if BR2_KERNEL_HEADERS_3_3
-	default "3.4.8"		if BR2_KERNEL_HEADERS_3_4
+	default "3.4.10"	if BR2_KERNEL_HEADERS_3_4
+	default "3.5.3"		if BR2_KERNEL_HEADERS_3_5
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default $BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
diff --git a/toolchain/kernel-headers/linux-3.0.40-headers_install-fix-__packed-in-exported-kernel-head.patch b/toolchain/kernel-headers/linux-3.0.41-headers_install-fix-__packed-in-exported-kernel-head.patch
similarity index 100%
rename from toolchain/kernel-headers/linux-3.0.40-headers_install-fix-__packed-in-exported-kernel-head.patch
rename to toolchain/kernel-headers/linux-3.0.41-headers_install-fix-__packed-in-exported-kernel-head.patch
-- 
1.7.8.6
