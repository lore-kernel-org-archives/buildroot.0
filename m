From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 23 Oct 2010 14:53:08 +0200
Subject: [Buildroot] [git commit master 1/1] kernel-headers: add 2.6.36,
	remove 2.6.29
Message-ID: <20101023143216.69EC58D3C7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=8902087ac7fa72f64e2277e8a0bf99d3d2dde726
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/kernel-headers/Config.in |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index fa79578..ccbe2b0 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -6,7 +6,7 @@ comment "Kernel Header Options"
 
 choice
 	prompt "Kernel Headers"
-	default BR2_KERNEL_HEADERS_2_6_35
+	default BR2_KERNEL_HEADERS_2_6_36
 
 	help
 	  Select the version of kernel header files you wish to use.
@@ -16,10 +16,6 @@ choice
 	  For the snapshot, you have to provide the
 	  linux-2.6.tar.bz2 tarball in your download dir.
 
-	config BR2_KERNEL_HEADERS_2_6_29
-		bool "Linux 2.6.29.x kernel headers"
-		depends on BR2_DEPRECATED
-
 	config BR2_KERNEL_HEADERS_2_6_30
 		bool "Linux 2.6.30.x kernel headers"
 		depends on BR2_DEPRECATED
@@ -33,6 +29,7 @@ choice
 		depends on BR2_DEPRECATED
 
 	config BR2_KERNEL_HEADERS_2_6_33
+		depends on BR2_DEPRECATED
 		bool "Linux 2.6.33.x kernel headers"
 
 	config BR2_KERNEL_HEADERS_2_6_34
@@ -41,6 +38,9 @@ choice
 	config BR2_KERNEL_HEADERS_2_6_35
 		bool "Linux 2.6.35.x kernel headers"
 
+	config BR2_KERNEL_HEADERS_2_6_36
+		bool "Linux 2.6.35.x kernel headers"
+
 	config BR2_KERNEL_HEADERS_VERSION
 		bool "Linux 2.6 (manually specified version)"
 
@@ -57,12 +57,12 @@ config BR2_DEFAULT_KERNEL_VERSION
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "2.6.29.6"	if BR2_KERNEL_HEADERS_2_6_29
 	default "2.6.30.10"	if BR2_KERNEL_HEADERS_2_6_30
 	default "2.6.31.14"	if BR2_KERNEL_HEADERS_2_6_31
 	default "2.6.32.24"	if BR2_KERNEL_HEADERS_2_6_32
 	default "2.6.33.7"	if BR2_KERNEL_HEADERS_2_6_33
 	default "2.6.34.7"	if BR2_KERNEL_HEADERS_2_6_34
 	default "2.6.35.6"	if BR2_KERNEL_HEADERS_2_6_35
+	default "2.6.36"	if BR2_KERNEL_HEADERS_2_6_36
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default $BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
1.7.1
