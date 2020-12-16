From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 16 Dec 2020 12:22:37 +0100
Subject: [Buildroot] [git commit] package/linux-headers: drop 5.8 headers
Message-ID: <20201216110920.D8C638004A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b829a60bd6357ea8e466b1b7bb7d1bd1a4c0316c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The 5.8.x series is now EOL, so drop it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                     | 7 +++++++
 linux/linux.hash                     | 1 -
 package/linux-headers/Config.in.host | 5 -----
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 4f78281cd0..4928a35bb4 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2021.02"
 
+config BR2_KERNEL_HEADERS_5_8
+	bool "kernel headers version 5.8.x are no longer supported"
+	select BR2_LEGACY
+	help
+	  Version 5.8.x of the Linux kernel headers are no longer
+	  maintained upstream and are now removed.
+
 config BR2_powerpc_601
 	bool "PowerPC 601 support removed"
 	select BR2_LEGACY
diff --git a/linux/linux.hash b/linux/linux.hash
index 8d17cd8efa..9ebf880671 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,7 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  dcdf99e43e98330d925016985bfbc7b83c66d367b714b2de0cbbfcbf83d8ca43  linux-5.10.tar.xz
 sha256  5eb20a65a410669928f94b3975872e493fa6d0fe441c6a78b7564affa2a5d260  linux-5.9.11.tar.xz
-sha256  4ab4a3f694b7b4cfbe78871eab34c8039ad33692144c45c669827a594da85534  linux-5.8.18.tar.xz
 sha256  49da425c1f3c530fd3ff31d85a0461f6b6dc6e459f7faf3eee23e49a98ce64c7  linux-5.4.80.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256  9e0bdebf18a12d0c899e5e4042e715e24a70ab0fd986a3f4c67c8ec2710bad97  linux-4.4.246.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 20c1ce9f84..a5e474fa2c 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -54,10 +54,6 @@ config BR2_KERNEL_HEADERS_5_4
 	bool "Linux 5.4.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 
-config BR2_KERNEL_HEADERS_5_8
-	bool "Linux 5.8.x kernel headers"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_8
-
 config BR2_KERNEL_HEADERS_5_9
 	bool "Linux 5.9.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_9
@@ -359,7 +355,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.14.209"	if BR2_KERNEL_HEADERS_4_14
 	default "4.19.160"	if BR2_KERNEL_HEADERS_4_19
 	default "5.4.80"	if BR2_KERNEL_HEADERS_5_4
-	default "5.8.18"	if BR2_KERNEL_HEADERS_5_8
 	default "5.9.11"	if BR2_KERNEL_HEADERS_5_9
 	default "5.10"		if BR2_KERNEL_HEADERS_5_10
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
