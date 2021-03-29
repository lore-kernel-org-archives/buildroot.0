From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 29 Mar 2021 21:15:50 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/uclibc: update to
 1.0.38
Message-ID: <20210329185210.754278A396@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=89d48452dfebf2e1b7b67f0065b5313b485113ed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

- fixes renameat2 issues on riscv64

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 0cf28c2c5a4d053e46881926134a15c8b0c243ba)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...arch-sh-Add-64-bit-time-types-from-kernel.patch | 33 ----------------------
 package/uclibc/uclibc.hash                         |  4 +--
 package/uclibc/uclibc.mk                           |  2 +-
 3 files changed, 3 insertions(+), 36 deletions(-)

diff --git a/package/uclibc/0001-arch-sh-Add-64-bit-time-types-from-kernel.patch b/package/uclibc/0001-arch-sh-Add-64-bit-time-types-from-kernel.patch
deleted file mode 100644
index aec8fcda9f..0000000000
--- a/package/uclibc/0001-arch-sh-Add-64-bit-time-types-from-kernel.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 385f2b18ccde15f72a6e8aee4c960a5bc18481d7 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Geoffrey=20Le=20Gourri=C3=A9rec?=
- <geoffrey.legourrierec@gmail.com>
-Date: Tue, 26 Jan 2021 20:39:36 +0100
-Subject: [PATCH] arch/sh: Add 64-bit time types from kernel
-
----
- libc/sysdeps/linux/sh/bits/kernel_types.h | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/libc/sysdeps/linux/sh/bits/kernel_types.h b/libc/sysdeps/linux/sh/bits/kernel_types.h
-index ac97261e6..90b2e66b6 100644
---- a/libc/sysdeps/linux/sh/bits/kernel_types.h
-+++ b/libc/sysdeps/linux/sh/bits/kernel_types.h
-@@ -21,6 +21,7 @@ typedef unsigned int	__kernel_size_t;
- typedef int		__kernel_ssize_t;
- typedef int		__kernel_ptrdiff_t;
- typedef long		__kernel_time_t;
-+typedef long long	__kernel_time64_t;
- typedef long		__kernel_suseconds_t;
- typedef long		__kernel_clock_t;
- typedef int		__kernel_daddr_t;
-@@ -33,6 +34,7 @@ typedef unsigned short	__kernel_old_uid_t;
- typedef unsigned short	__kernel_old_gid_t;
- typedef __kernel_dev_t	__kernel_old_dev_t;
- typedef long		__kernel_long_t;
-+typedef __kernel_long_t	__kernel_old_time_t;
- typedef unsigned long	__kernel_ulong_t;
- typedef long long	__kernel_loff_t;
- 
--- 
-2.17.1
-
diff --git a/package/uclibc/uclibc.hash b/package/uclibc/uclibc.hash
index e8bd5c5192..2935785f48 100644
--- a/package/uclibc/uclibc.hash
+++ b/package/uclibc/uclibc.hash
@@ -1,4 +1,4 @@
-# From https://downloads.uclibc-ng.org/releases/1.0.37/uClibc-ng-1.0.37.tar.xz.sha256
-sha256  b2b815d20645cf604b99728202bf3ecb62507ce39dfa647884b4453caf86212c  uClibc-ng-1.0.37.tar.xz
+# From https://downloads.uclibc-ng.org/releases/1.0.38/uClibc-ng-1.0.38.tar.xz.sha256
+sha256  b1a3328330d2c94a2bec8c1436a8f15673f3a9b5895e155efc2e91d4e1882570  uClibc-ng-1.0.38.tar.xz
 # Locally calculated
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING.LIB
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 53983e852d..3d253d93bc 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UCLIBC_VERSION = 1.0.37
+UCLIBC_VERSION = 1.0.38
 UCLIBC_SOURCE = uClibc-ng-$(UCLIBC_VERSION).tar.xz
 UCLIBC_SITE = https://downloads.uclibc-ng.org/releases/$(UCLIBC_VERSION)
 UCLIBC_LICENSE = LGPL-2.1+
