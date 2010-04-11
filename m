From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Apr 2010 06:05:07 +0200
Subject: [Buildroot] [PATCH 11/25] Get rid of all usages of BR2_RECENT
In-Reply-To: <cover.1270958653.git.thomas.petazzoni@free-electrons.com>
References: <cover.1270958653.git.thomas.petazzoni@free-electrons.com>
Message-ID: <6e36dd3554c5e768809b788bdb1fec2203708c16.1270958653.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/busybox/Config.in          |    4 ++--
 target/u-boot/Config.in            |    4 ++--
 toolchain/binutils/Config.in       |    2 +-
 toolchain/gcc/Config.in            |    4 ++--
 toolchain/kernel-headers/Config.in |    2 +-
 toolchain/uClibc/Config.in         |    2 +-
 6 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/busybox/Config.in b/package/busybox/Config.in
index 7110f0f..491319a 100644
--- a/package/busybox/Config.in
+++ b/package/busybox/Config.in
@@ -23,7 +23,7 @@ choice
 
 	config BR2_BUSYBOX_VERSION_1_13_X
 		bool "BusyBox 1.13.x"
-		depends on BR2_RECENT
+		depends on BR2_DEPRECATED
 
 	config BR2_BUSYBOX_VERSION_1_14_X
 		bool "BusyBox 1.14.x"
@@ -31,7 +31,7 @@ choice
 
 	config BR2_BUSYBOX_VERSION_1_15_X
 		bool "BusyBox 1.15.x"
-		depends on BR2_DEPRECATED || BR2_RECENT
+		depends on BR2_DEPRECATED
 
 	config BR2_BUSYBOX_VERSION_1_16_X
 		bool "BusyBox 1.16.x"
diff --git a/target/u-boot/Config.in b/target/u-boot/Config.in
index f84d181..2c3271d 100644
--- a/target/u-boot/Config.in
+++ b/target/u-boot/Config.in
@@ -22,11 +22,11 @@ config BR2_TARGET_UBOOT_2010_03
 
 config BR2_TARGET_UBOOT_2009_11
 	bool "u-boot-2009.11"
-	depends on BR2_DEPRECATED || BR2_RECENT
+	depends on BR2_DEPRECATED
 
 config BR2_TARGET_UBOOT_2009_08
 	bool "u-boot-2009.08"
-	depends on BR2_DEPRECATED || BR2_RECENT
+	depends on BR2_DEPRECATED
 
 config BR2_TARGET_UBOOT_2009_06
 	bool "u-boot-2009.06"
diff --git a/toolchain/binutils/Config.in b/toolchain/binutils/Config.in
index 003d0ee..125c447 100644
--- a/toolchain/binutils/Config.in
+++ b/toolchain/binutils/Config.in
@@ -34,7 +34,7 @@ choice
 
 	config BR2_BINUTILS_VERSION_2_20
 		depends on !BR2_avr32
-		depends on BR2_DEPRECATED || BR2_RECENT
+		depends on BR2_DEPRECATED
 		bool "binutils 2.20"
 
 	config BR2_BINUTILS_VERSION_2_20_1
diff --git a/toolchain/gcc/Config.in b/toolchain/gcc/Config.in
index 97d5eb7..b837348 100644
--- a/toolchain/gcc/Config.in
+++ b/toolchain/gcc/Config.in
@@ -35,7 +35,7 @@ choice
 
 	config BR2_GCC_VERSION_4_2_4
 		depends on !BR2_avr32
-		depends on BR2_RECENT || BR2_DEPRECATED
+		depends on BR2_DEPRECATED
 		bool "gcc 4.2.4"
 
 	config BR2_GCC_VERSION_4_3_2
@@ -45,7 +45,7 @@ choice
 
 	config BR2_GCC_VERSION_4_3_3
 		depends on !BR2_avr32
-		depends on BR2_RECENT || BR2_DEPRECATED
+		depends on BR2_DEPRECATED
 		bool "gcc 4.3.3"
 
 	config BR2_GCC_VERSION_4_3_4
diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index 8f7f720..4097409 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -38,7 +38,7 @@ choice
 
 	config BR2_KERNEL_HEADERS_2_6_32
 		bool "Linux 2.6.32.x kernel headers"
-		depends on BR2_DEPRECATED || BR2_RECENT
+		depends on BR2_DEPRECATED
 
 	config BR2_KERNEL_HEADERS_2_6_33
 		bool "Linux 2.6.33.x kernel headers"
diff --git a/toolchain/uClibc/Config.in b/toolchain/uClibc/Config.in
index e254f28..45b5eb1 100644
--- a/toolchain/uClibc/Config.in
+++ b/toolchain/uClibc/Config.in
@@ -20,7 +20,7 @@ choice
 		bool "uClibc 0.9.29"
 
 	config BR2_UCLIBC_VERSION_0_9_30
-		depends on BR2_DEPRECATED || BR2_RECENT
+		depends on BR2_DEPRECATED
 		bool "uClibc 0.9.30.x"
 
 	config BR2_UCLIBC_VERSION_0_9_31
-- 
1.6.3.3
