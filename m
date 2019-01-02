From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed,  2 Jan 2019 12:11:40 +0100
Subject: [Buildroot] [PATCH] package/linux-headers: drop obsolete 3.2.x /
 4.{1, 16, 18}.x versions
Message-ID: <20190102111140.13016-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

According to https://www.kernel.org/category/releases.html, these kernel
versions are no longer supported, so drop them now that we have added 4.20.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.hash                     |  5 -----
 package/linux-headers/Config.in.host | 23 -----------------------
 2 files changed, 28 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index 3e7fdbc81f..6467d8abca 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,11 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256 ad0823183522e743972382df0aa08fb5ae3077f662b125f1e599b0b2aaa12438  linux-4.20.tar.xz
 sha256 f50a77fc40e13fc406791346fa91926394205874cd50246c7c2374006bacc0c2  linux-4.19.13.tar.xz
-sha256 68ac319e0fb7edd6b6051541d9cf112cd4f77a29e16a69ae1e133ff51117f653  linux-4.18.20.tar.xz
-sha256 41026d713ba4f7a5e9d514b876ce4ed28a1d993c0c58b42b2a2597d6a0e83021  linux-4.16.18.tar.xz
 sha256 6a587c8b4160918efa082b0c2eda8c2db0f50d8814ad1d1ac94be1edf66ca6a9  linux-4.14.91.tar.xz
 sha256 6067151b0225a8de1ab79abc9be7bae237eaca0cd838eb26684169560d88a994  linux-4.9.148.tar.xz
 sha256 06f1b080332251628727e42d21b4530035f03f00d75432199b2548172b1650a9  linux-4.4.169.tar.xz
-sha256 6ad9389e55e0ea57768eae173747058a4487fa3630e10a7999cfec9f945e559c  linux-4.1.52.tar.xz
-# From https://www.kernel.org/pub/linux/kernel/v3.x/sha256sums.asc
-sha256 ad96d797571496c969aa71bf5d08e9d2a8c84458090d29a120f1b2981185a99e  linux-3.2.102.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 32ddcef5f9..907725093d 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -26,17 +26,6 @@ config BR2_KERNEL_HEADERS_AS_KERNEL
 	bool "Same as kernel being built"
 	depends on BR2_LINUX_KERNEL
 
-config BR2_KERNEL_HEADERS_3_2
-	bool "Linux 3.2.x kernel headers"
-	depends on !BR2_aarch64 && !BR2_aarch64_be && !BR2_arc && !BR2_nios2
-	depends on !BR2_riscv
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
-
-config BR2_KERNEL_HEADERS_4_1
-	bool "Linux 4.1.x kernel headers"
-	depends on !BR2_riscv
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_1
-
 config BR2_KERNEL_HEADERS_4_4
 	bool "Linux 4.4.x kernel headers"
 	depends on !BR2_riscv
@@ -52,14 +41,6 @@ config BR2_KERNEL_HEADERS_4_14
 	depends on !BR2_riscv
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
 
-config BR2_KERNEL_HEADERS_4_16
-	bool "Linux 4.16.x kernel headers"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_16
-
-config BR2_KERNEL_HEADERS_4_18
-	bool "Linux 4.18.x kernel headers"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_18
-
 config BR2_KERNEL_HEADERS_4_19
 	bool "Linux 4.19.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
@@ -304,13 +285,9 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "3.2.102"	if BR2_KERNEL_HEADERS_3_2
-	default "4.1.52"	if BR2_KERNEL_HEADERS_4_1
 	default "4.4.169"	if BR2_KERNEL_HEADERS_4_4
 	default "4.9.148"	if BR2_KERNEL_HEADERS_4_9
 	default "4.14.91"	if BR2_KERNEL_HEADERS_4_14
-	default "4.16.18"	if BR2_KERNEL_HEADERS_4_16
-	default "4.18.20"	if BR2_KERNEL_HEADERS_4_18
 	default "4.19.13"	if BR2_KERNEL_HEADERS_4_19
 	default "4.20"		if BR2_KERNEL_HEADERS_4_20
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
2.11.0
