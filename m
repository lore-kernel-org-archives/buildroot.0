From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 11 Dec 2012 21:25:27 +0100
Subject: [Buildroot] [git commit] kernel-headers: bump versions,
	remove deprecated, new deprecated
Message-ID: <20121212061933.B37F79A1AC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5b24264da4771bd7af8a218619a5563b6a9d4217
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump 3.{0, 4, 6}.x stable versions
Add new version 3.7
Remove deprecated 2.6.{37, 38, 39} versions.
Mark 3.{1, 3, 5} as deprecated to follow upstream EOLs.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/kernel-headers/Config.in                 |   32 +++++++------------
 ...all-fix-__packed-in-exported-kernel-head.patch} |    0
 2 files changed, 12 insertions(+), 20 deletions(-)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index 0f3ed4f..daffef7 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -6,7 +6,7 @@ comment "Kernel Header Options"
 
 choice
 	prompt "Kernel Headers"
-	default BR2_KERNEL_HEADERS_3_6
+	default BR2_KERNEL_HEADERS_3_7
 	help
 	  Select the version of kernel header files you wish to use.
 	  You must select the correct set of header files to match
@@ -15,39 +15,33 @@ choice
 	  For the snapshot, you have to provide the
 	  linux-2.6.tar.bz2 tarball in your download dir.
 
-	config BR2_KERNEL_HEADERS_2_6_37
-		bool "Linux 2.6.37.x kernel headers"
-		depends on BR2_DEPRECATED
-
-	config BR2_KERNEL_HEADERS_2_6_38
-		bool "Linux 2.6.38.x kernel headers"
-		depends on BR2_DEPRECATED
-
-	config BR2_KERNEL_HEADERS_2_6_39
-		bool "Linux 2.6.39.x kernel headers"
-		depends on BR2_DEPRECATED
-
 	config BR2_KERNEL_HEADERS_3_0
 		bool "Linux 3.0.x kernel headers"
 
 	config BR2_KERNEL_HEADERS_3_1
 		bool "Linux 3.1.x kernel headers"
+		depends on BR2_DEPRECATED
 
 	config BR2_KERNEL_HEADERS_3_2
 		bool "Linux 3.2.x kernel headers"
 
 	config BR2_KERNEL_HEADERS_3_3
 		bool "Linux 3.3.x kernel headers"
+		depends on BR2_DEPRECATED
 
 	config BR2_KERNEL_HEADERS_3_4
 		bool "Linux 3.4.x kernel headers"
 
 	config BR2_KERNEL_HEADERS_3_5
 		bool "Linux 3.5.x kernel headers"
+		depends on BR2_DEPRECATED
 
 	config BR2_KERNEL_HEADERS_3_6
 		bool "Linux 3.6.x kernel headers"
 
+	config BR2_KERNEL_HEADERS_3_7
+		bool "Linux 3.7.x kernel headers"
+
 	config BR2_KERNEL_HEADERS_VERSION
 		bool "Linux 2.6 (manually specified version)"
 
@@ -60,19 +54,17 @@ config BR2_DEFAULT_KERNEL_VERSION
 	depends on BR2_KERNEL_HEADERS_VERSION
 	help
 	  Specify the version you want to use.
-	  E.G.: 2.6.38
+	  E.G.: 3.6.10
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "2.6.37.6"	if BR2_KERNEL_HEADERS_2_6_37
-	default "2.6.38.8"	if BR2_KERNEL_HEADERS_2_6_38
-	default "2.6.39.4"	if BR2_KERNEL_HEADERS_2_6_39
-	default "3.0.55"	if BR2_KERNEL_HEADERS_3_0
+	default "3.0.56"	if BR2_KERNEL_HEADERS_3_0
 	default "3.1.10"	if BR2_KERNEL_HEADERS_3_1
 	default "3.2.35"	if BR2_KERNEL_HEADERS_3_2
 	default "3.3.8"		if BR2_KERNEL_HEADERS_3_3
-	default "3.4.22"	if BR2_KERNEL_HEADERS_3_4
+	default "3.4.23"	if BR2_KERNEL_HEADERS_3_4
 	default "3.5.7"		if BR2_KERNEL_HEADERS_3_5
-	default "3.6.9"		if BR2_KERNEL_HEADERS_3_6
+	default "3.6.10"	if BR2_KERNEL_HEADERS_3_6
+	default "3.7"		if BR2_KERNEL_HEADERS_3_7
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default $BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
diff --git a/toolchain/kernel-headers/linux-3.0.55-headers_install-fix-__packed-in-exported-kernel-head.patch b/toolchain/kernel-headers/linux-3.0.56-headers_install-fix-__packed-in-exported-kernel-head.patch
similarity index 100%
rename from toolchain/kernel-headers/linux-3.0.55-headers_install-fix-__packed-in-exported-kernel-head.patch
rename to toolchain/kernel-headers/linux-3.0.56-headers_install-fix-__packed-in-exported-kernel-head.patch
