From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 20 Jan 2011 21:23:23 +0100
Subject: [Buildroot] [git commit master 1/1] toolchain/uClibc: bump 0.9.32
	version to 0.9.32-rc2
Message-ID: <20110120202551.063A98B537@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=525c918aa298f1954f8b7a8662f190bc4dccca1f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/uClibc/Config.in                         |    4 +-
 .../uClibc-0.9.32-rc1-netlinkaccess-fix.patch      |   34 --------------------
 2 files changed, 2 insertions(+), 36 deletions(-)
 delete mode 100644 toolchain/uClibc/uClibc-0.9.32-rc1-netlinkaccess-fix.patch

diff --git a/toolchain/uClibc/Config.in b/toolchain/uClibc/Config.in
index 6c4d21d..3b31900 100644
--- a/toolchain/uClibc/Config.in
+++ b/toolchain/uClibc/Config.in
@@ -21,7 +21,7 @@ choice
 		bool "uClibc 0.9.31.x"
 
 	config BR2_UCLIBC_VERSION_0_9_32
-		bool "uClibc 0.9.32-rc1"
+		bool "uClibc 0.9.32-rc2"
 
 	config BR2_UCLIBC_VERSION_SNAPSHOT
 		bool "daily snapshot"
@@ -40,7 +40,7 @@ config BR2_UCLIBC_VERSION_STRING
 	default 0.9.29		if BR2_UCLIBC_VERSION_0_9_29
 	default 0.9.30.3	if BR2_UCLIBC_VERSION_0_9_30
 	default 0.9.31		if BR2_UCLIBC_VERSION_0_9_31
-	default 0.9.32-rc1	if BR2_UCLIBC_VERSION_0_9_32
+	default 0.9.32-rc2	if BR2_UCLIBC_VERSION_0_9_32
 	default $BR2_USE_UCLIBC_SNAPSHOT	if BR2_UCLIBC_VERSION_SNAPSHOT
 
 config BR2_UCLIBC_CONFIG
diff --git a/toolchain/uClibc/uClibc-0.9.32-rc1-netlinkaccess-fix.patch b/toolchain/uClibc/uClibc-0.9.32-rc1-netlinkaccess-fix.patch
deleted file mode 100644
index c5d7b94..0000000
--- a/toolchain/uClibc/uClibc-0.9.32-rc1-netlinkaccess-fix.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 4ac7ad3543dd6d7780e71af80fa5c45414451719 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 1 Jan 2011 22:59:00 -0800
-Subject: [PATCH] libc/inet/netlinkaccess.h: Use the types from kernel
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- libc/inet/netlinkaccess.h |    9 +--------
- 1 files changed, 1 insertions(+), 8 deletions(-)
-
-diff --git a/libc/inet/netlinkaccess.h b/libc/inet/netlinkaccess.h
-index 5111d38..96ece39 100644
---- a/libc/inet/netlinkaccess.h
-+++ b/libc/inet/netlinkaccess.h
-@@ -22,15 +22,8 @@
- #include <features.h>
- #include <stdint.h>
- #include <unistd.h>
--#include <sys/types.h>
--
- #if defined __ASSUME_NETLINK_SUPPORT || defined __UCLIBC_USE_NETLINK__
--#define _LINUX_TYPES_H
--typedef uint8_t __u8;
--typedef uint16_t __u16;
--typedef uint32_t __u32;
--typedef uint64_t __u64;
--typedef int32_t __s32;
-+#include <asm/types.h>
- #include <linux/rtnetlink.h>
- #include <linux/netlink.h>
- 
--- 
-1.7.2.3
-
-- 
1.7.3.4
