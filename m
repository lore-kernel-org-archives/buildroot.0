From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 14 Jan 2011 09:59:06 +0100
Subject: [Buildroot] [git commit master 1/1] uClibc: 0.9.32-rc1
	netlinkaccess fix
Message-ID: <20110114090039.7B28E8B528@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=051923e948f0abbe6e2db367094f307095b8f246
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

From uClibc git, fixes build issue on powerpc.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../uClibc-0.9.32-rc1-netlinkaccess-fix.patch      |   34 ++++++++++++++++++++
 1 files changed, 34 insertions(+), 0 deletions(-)
 create mode 100644 toolchain/uClibc/uClibc-0.9.32-rc1-netlinkaccess-fix.patch

diff --git a/toolchain/uClibc/uClibc-0.9.32-rc1-netlinkaccess-fix.patch b/toolchain/uClibc/uClibc-0.9.32-rc1-netlinkaccess-fix.patch
new file mode 100644
index 0000000..c5d7b94
--- /dev/null
+++ b/toolchain/uClibc/uClibc-0.9.32-rc1-netlinkaccess-fix.patch
@@ -0,0 +1,34 @@
+From 4ac7ad3543dd6d7780e71af80fa5c45414451719 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 1 Jan 2011 22:59:00 -0800
+Subject: [PATCH] libc/inet/netlinkaccess.h: Use the types from kernel
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libc/inet/netlinkaccess.h |    9 +--------
+ 1 files changed, 1 insertions(+), 8 deletions(-)
+
+diff --git a/libc/inet/netlinkaccess.h b/libc/inet/netlinkaccess.h
+index 5111d38..96ece39 100644
+--- a/libc/inet/netlinkaccess.h
++++ b/libc/inet/netlinkaccess.h
+@@ -22,15 +22,8 @@
+ #include <features.h>
+ #include <stdint.h>
+ #include <unistd.h>
+-#include <sys/types.h>
+-
+ #if defined __ASSUME_NETLINK_SUPPORT || defined __UCLIBC_USE_NETLINK__
+-#define _LINUX_TYPES_H
+-typedef uint8_t __u8;
+-typedef uint16_t __u16;
+-typedef uint32_t __u32;
+-typedef uint64_t __u64;
+-typedef int32_t __s32;
++#include <asm/types.h>
+ #include <linux/rtnetlink.h>
+ #include <linux/netlink.h>
+ 
+-- 
+1.7.2.3
+
-- 
1.7.2.2
