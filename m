Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC3E1C52D7F
	for <buildroot@archiver.kernel.org>; Wed, 14 Aug 2024 21:49:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6DCBC608C3;
	Wed, 14 Aug 2024 21:49:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m3yhd-jE9GxL; Wed, 14 Aug 2024 21:49:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC079608F9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC079608F9;
	Wed, 14 Aug 2024 21:49:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 01A101BF4DB
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 21:49:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F018C608F9
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 21:49:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PVfBngBOX0eQ for <buildroot@lists.busybox.net>;
 Wed, 14 Aug 2024 21:49:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80E88608C3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 80E88608C3
 for <buildroot@buildroot.org>; Wed, 14 Aug 2024 21:49:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6EA4785D65; Wed, 14 Aug 2024 21:49:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 14 Aug 2024 23:48:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fee74a7a9f535f782626ccf0e4d88b623333fe1c
X-Git-Newrev: e60d1c3babdf84956f963cbfee40760b72867aa4
X-Patchwork-Hint: ignore
Message-Id: <20240814214904.6EA4785D65@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uclibc: update to 1.0.50
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8251342732735201375=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8251342732735201375==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=e60d1c3babdf84956f963cbfee40760b72867aa4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See this git shortlog for changes:

Dmitry Chestnykh (2):
      Fix compilation with 4.x kernel headers
      Group conditions after `&&`

Frank Mehnert (6):
      libdl: properly cast parameters for %p format string specifier
      iconv: explicit cast to `unsigned char*`
      iconv: explicitly state operator precedence
      ldso.c: use 'unsigned int' as loop variable type
      iconv: fix parameter type of utf8seq_is_{overlong,surrogate,illegal}
      iconv: prevent compiler warning during initialization with jis0208

J. Neuschäfer (1):
      bits/stat.h: Declare st_mtim if defined(__USE_XOPEN2K8), everywhere

Marcus Haehnel (5):
      ldso/dl-vdso: avoid compiler warning if configured without vdso
      uclibc: Fix double promotion warning
      libm: Fix float conversion compiler warning
      features.h: add clang prerequisite macro
      buildsys: allow building with gcc-14

Sven Linker (1):
      c++: Remove deprecated dynamic exception specification

Valentin Gehrke (1):
      arm: Replace deprecated asm instructions for ARMv8 AArch32

Waldemar Brodkorb (9):
      Clang support for gnu_inline attribute
      allow to use <sys/ucontext.h>
      add SEEK_DATA/SEEK_HOLE
      lseek: allow SEEK_DATA/SEEK_HOLE to be used
      bits/stat.h: Declare st_mtim if defined(__USE_XOPEN2K8), add missing
      riscv: remove incomplete context implementation, use libucontext
      add memfd_create syscall wrapper
      getrandom: remove __USE_GNU / add GRND_INSECURE
      bump version for 1.0.50 release

Yann Le Du (1):
      stdlib: increase number of static atexit handlers to 32

All buildroot patches are upstream.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../uclibc/0001-allow-to-use-sys-ucontext.h.patch  |  35 ----
 ...2-Fix-compilation-with-4.x-kernel-headers.patch |  80 --------
 ...-Declare-st_mtim-if-defined-__USE_XOPEN2K.patch | 205 ---------------------
 ...004-Fix-arc-build-with-4.x-kernel-headers.patch |  35 ----
 ...-Declare-st_mtim-if-defined-__USE_XOPEN2K.patch | 132 -------------
 package/uclibc/uclibc.hash                         |   4 +-
 package/uclibc/uclibc.mk                           |   2 +-
 7 files changed, 3 insertions(+), 490 deletions(-)

diff --git a/package/uclibc/0001-allow-to-use-sys-ucontext.h.patch b/package/uclibc/0001-allow-to-use-sys-ucontext.h.patch
deleted file mode 100644
index b6bd5602d9..0000000000
--- a/package/uclibc/0001-allow-to-use-sys-ucontext.h.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 903da45dde43836e35a295226c5b1efccd413c08 Mon Sep 17 00:00:00 2001
-From: Waldemar Brodkorb <wbx@openadk.org>
-Date: Wed, 17 Jul 2024 15:41:40 +0200
-Subject: [PATCH] allow to use <sys/ucontext.h>
-
-For architectures without ucontext implementation it is possible
-to use libucontext with this small adaptation.
-
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-Upstream: https://mailman.openadk.org/mailman3/hyperkitty/list/devel@uclibc-ng.org/thread/MZCPGG56TL7SVOZY2L3AGHLREJ76BYZE/
----
- include/ucontext.h | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/include/ucontext.h b/include/ucontext.h
-index 4ce114ef1..76b4f375e 100644
---- a/include/ucontext.h
-+++ b/include/ucontext.h
-@@ -23,11 +23,11 @@
- 
- #include <features.h>
- 
--#ifdef __UCLIBC_HAS_CONTEXT_FUNCS__
--
- /* Get machine dependent definition of data structures.  */
- #include <sys/ucontext.h>
- 
-+#ifdef __UCLIBC_HAS_CONTEXT_FUNCS__
-+
- __BEGIN_DECLS
- 
- /* Get user context and store it in variable pointed to by UCP.  */
--- 
-2.30.2
-
diff --git a/package/uclibc/0002-Fix-compilation-with-4.x-kernel-headers.patch b/package/uclibc/0002-Fix-compilation-with-4.x-kernel-headers.patch
deleted file mode 100644
index ad3efa9638..0000000000
--- a/package/uclibc/0002-Fix-compilation-with-4.x-kernel-headers.patch
+++ /dev/null
@@ -1,80 +0,0 @@
-From 839bae66a376631ee7d5b1f5b2f5b4094c519ea8 Mon Sep 17 00:00:00 2001
-From: Dmitry Chestnykh <dm.chestnykh@gmail.com>
-Date: Sat, 20 Jul 2024 17:23:45 +0300
-Subject: [PATCH] Fix compilation with 4.x kernel headers
-
-- Fallback to __NR_stat syscall in ld.so if we use 4.x kernel headers.
-4.x kernel doesn't support 64-bit time so we can use old syscall
-- Add preprocessor conditions to have fstat64 and fstatat64 in libc
-with old kernel headers
-
-Signed-off-by: Dmitry Chestnykh <dm.chestnykh@gmail.com>
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-Upstream: https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?id=839bae66a376631ee7d5b1f5b2f5b4094c519ea8
----
- ldso/include/dl-syscall.h             | 4 +++-
- libc/sysdeps/linux/common/fstat64.c   | 3 ++-
- libc/sysdeps/linux/common/fstatat64.c | 3 ++-
- 3 files changed, 7 insertions(+), 3 deletions(-)
-
-diff --git a/ldso/include/dl-syscall.h b/ldso/include/dl-syscall.h
-index 4f41034ad..9ec0eac60 100644
---- a/ldso/include/dl-syscall.h
-+++ b/ldso/include/dl-syscall.h
-@@ -17,6 +17,8 @@ extern int _dl_errno;
- #define __set_errno(X) {(_dl_errno) = (X);}
- #endif
- 
-+#include <linux/version.h>
-+
- /* Pull in the arch specific syscall implementation */
- #include <dl-syscalls.h>
- /*  For MAP_ANONYMOUS -- differs between platforms */
-@@ -139,7 +141,7 @@ static __always_inline int _dl_stat(const char *file_name,
- {
- 	return _dl_newfstatat(AT_FDCWD, file_name, buf, 0);
- }
--#elif defined __NR_stat && (!defined(__UCLIBC_USE_TIME64__) || defined(__sparc__))
-+#elif defined __NR_stat && (!defined(__UCLIBC_USE_TIME64__) || defined(__sparc__)) || (LINUX_VERSION_CODE <= KERNEL_VERSION(5,1,0))
- # define __NR__dl_stat __NR_stat
- static __always_inline _syscall2(int, _dl_stat, const char *, file_name,
-                         struct stat *, buf)
-diff --git a/libc/sysdeps/linux/common/fstat64.c b/libc/sysdeps/linux/common/fstat64.c
-index 359c22af6..121b21fc8 100644
---- a/libc/sysdeps/linux/common/fstat64.c
-+++ b/libc/sysdeps/linux/common/fstat64.c
-@@ -8,8 +8,9 @@
- 
- #include <_lfs_64.h>
- #include <sys/syscall.h>
-+#include <linux/version.h>
- 
--#if defined(__NR_fstat64) && !defined(__UCLIBC_USE_TIME64__)
-+#if defined(__NR_fstat64) && (!defined(__UCLIBC_USE_TIME64__) || LINUX_VERSION_CODE <= KERNEL_VERSION(5,1,0))
- # include <unistd.h>
- # include <sys/stat.h>
- # include "xstatconv.h"
-diff --git a/libc/sysdeps/linux/common/fstatat64.c b/libc/sysdeps/linux/common/fstatat64.c
-index 16dbf9215..739e84081 100644
---- a/libc/sysdeps/linux/common/fstatat64.c
-+++ b/libc/sysdeps/linux/common/fstatat64.c
-@@ -9,6 +9,7 @@
- #include <_lfs_64.h>
- #include <bits/wordsize.h>
- #include <sys/syscall.h>
-+#include <linux/version.h>
- 
- #if defined __mips__
- # include <sgidefs.h>
-@@ -23,7 +24,7 @@
- # define __NR_fstatat64 __NR_newfstatat
- #endif
- 
--#if defined(__NR_fstatat64) && !defined(__UCLIBC_USE_TIME64__)
-+#if defined(__NR_fstatat64) && (!defined(__UCLIBC_USE_TIME64__)  || LINUX_VERSION_CODE <= KERNEL_VERSION(5,1,0))
- # include <sys/stat.h>
- # include "xstatconv.h"
- int fstatat64(int fd, const char *file, struct stat64 *buf, int flag)
--- 
-2.30.2
-
diff --git a/package/uclibc/0003-bits-stat.h-Declare-st_mtim-if-defined-__USE_XOPEN2K.patch b/package/uclibc/0003-bits-stat.h-Declare-st_mtim-if-defined-__USE_XOPEN2K.patch
deleted file mode 100644
index 73100c2c1b..0000000000
--- a/package/uclibc/0003-bits-stat.h-Declare-st_mtim-if-defined-__USE_XOPEN2K.patch
+++ /dev/null
@@ -1,205 +0,0 @@
-From d0c8c185b439187b12644457bb2aa0326f25aaf7 Mon Sep 17 00:00:00 2001
-From: J.Neuschäfer?= <j.neuschaefer@gmx.net>
-Date: Sat, 27 Jul 2024 18:47:09 +0200
-Subject: [PATCH] bits/stat.h: Declare st_mtim if defined(__USE_XOPEN2K8),
- everywhere
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-While building software that sets _POSIX_C_SOURCE=200809L and uses
-stat.st_mtim for ARM, it was noticed that st_mtim was not defined.
-
-This seems to be because common/bits/stat.h was picked up, which does
-not take __USE_XOPEN2K8 as a reason to enable st_mtim and related
-fields. This appears to be an oversight, and porting the check from
-common-generic/bits/stat.h to other architectures does indeed fix the
-build issue.
-
-This patch is based on commit 50bd6d06e ("Fix memory corruption due to
-struct stat field").
-
-Signed-off-by: J. Neuschäfer <j.neuschaefer@gmx.net>
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-Upstream: https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?id=d0c8c185b439187b12644457bb2aa0326f25aaf7
----
- libc/sysdeps/linux/alpha/bits/stat.h   | 2 +-
- libc/sysdeps/linux/common/bits/stat.h  | 4 ++--
- libc/sysdeps/linux/frv/bits/stat.h     | 4 ++--
- libc/sysdeps/linux/ia64/bits/stat.h    | 4 ++--
- libc/sysdeps/linux/m68k/bits/stat.h    | 4 ++--
- libc/sysdeps/linux/mips/bits/stat.h    | 4 ++--
- libc/sysdeps/linux/nds32/bits/stat.h   | 4 ++--
- libc/sysdeps/linux/powerpc/bits/stat.h | 4 ++--
- 8 files changed, 15 insertions(+), 15 deletions(-)
-
-diff --git a/libc/sysdeps/linux/alpha/bits/stat.h b/libc/sysdeps/linux/alpha/bits/stat.h
-index 88bc6617d..f2dca250d 100644
---- a/libc/sysdeps/linux/alpha/bits/stat.h
-+++ b/libc/sysdeps/linux/alpha/bits/stat.h
-@@ -40,7 +40,7 @@
- 
-    Use neat tidy anonymous unions and structures when possible.  */
- 
--#ifdef __USE_MISC
-+#if defined(__USE_MISC) || defined(__USE_XOPEN2K8)
- # if __GNUC_PREREQ(3,3)
- #  define __ST_TIME(X)				\
- 	__extension__ union {			\
-diff --git a/libc/sysdeps/linux/common/bits/stat.h b/libc/sysdeps/linux/common/bits/stat.h
-index 07c09f50a..fc76cc3e7 100644
---- a/libc/sysdeps/linux/common/bits/stat.h
-+++ b/libc/sysdeps/linux/common/bits/stat.h
-@@ -61,7 +61,7 @@ struct stat
- #else
-     __blkcnt64_t st_blocks;		/* Number 512-byte blocks allocated. */
- #endif
--#ifdef __USE_MISC
-+#if defined(__USE_MISC) || defined(__USE_XOPEN2K8)
-     /* Nanosecond resolution timestamps are stored in a format
-        equivalent to 'struct timespec'.  This is the type used
-        whenever possible but the Unix namespace rules do not allow the
-@@ -107,7 +107,7 @@ struct stat64
-     __blksize_t st_blksize;		/* Optimal block size for I/O.  */
- 
-     __blkcnt64_t st_blocks;		/* Number 512-byte blocks allocated. */
--#ifdef __USE_MISC
-+#if defined(__USE_MISC) || defined(__USE_XOPEN2K8)
-     /* Nanosecond resolution timestamps are stored in a format
-        equivalent to 'struct timespec'.  This is the type used
-        whenever possible but the Unix namespace rules do not allow the
-diff --git a/libc/sysdeps/linux/frv/bits/stat.h b/libc/sysdeps/linux/frv/bits/stat.h
-index 381d207f2..18321c080 100644
---- a/libc/sysdeps/linux/frv/bits/stat.h
-+++ b/libc/sysdeps/linux/frv/bits/stat.h
-@@ -70,7 +70,7 @@ struct stat
-     __blkcnt64_t st_blocks;		/* Number 512-byte blocks allocated. */
- #endif
- 
--#ifdef __USE_MISC
-+#if defined(__USE_MISC) || defined(__USE_XOPEN2K8)
-     /* Nanosecond resolution timestamps are stored in a format
-        equivalent to 'struct timespec'.  This is the type used
-        whenever possible but the Unix namespace rules do not allow the
-@@ -117,7 +117,7 @@ struct stat64
-     __blksize_t st_blksize;		/* Optimal block size for I/O.  */
- 
-     __blkcnt64_t st_blocks;		/* Number 512-byte blocks allocated. */
--#ifdef __USE_MISC
-+#if defined(__USE_MISC) || defined(__USE_XOPEN2K8)
-     /* Nanosecond resolution timestamps are stored in a format
-        equivalent to 'struct timespec'.  This is the type used
-        whenever possible but the Unix namespace rules do not allow the
-diff --git a/libc/sysdeps/linux/ia64/bits/stat.h b/libc/sysdeps/linux/ia64/bits/stat.h
-index 6723166e7..2b70b8cf8 100644
---- a/libc/sysdeps/linux/ia64/bits/stat.h
-+++ b/libc/sysdeps/linux/ia64/bits/stat.h
-@@ -38,7 +38,7 @@ struct stat
-     int pad0;
-     __dev_t st_rdev;		/* Device number, if device.  */
-     __off_t st_size;		/* Size of file, in bytes.  */
--#ifdef __USE_MISC
-+#if defined(__USE_MISC) || defined(__USE_XOPEN2K8)
-     /* Nanosecond resolution timestamps are stored in a format
-        equivalent to 'struct timespec'.  This is the type used
-        whenever possible but the Unix namespace rules do not allow the
-@@ -77,7 +77,7 @@ struct stat64
-     int pad0;
-     __dev_t st_rdev;		/* Device number, if device.  */
-     __off_t st_size;		/* Size of file, in bytes.  */
--#ifdef __USE_MISC
-+#if defined(__USE_MISC) || defined(__USE_XOPEN2K8)
-     /* Nanosecond resolution timestamps are stored in a format
-        equivalent to 'struct timespec'.  This is the type used
-        whenever possible but the Unix namespace rules do not allow the
-diff --git a/libc/sysdeps/linux/m68k/bits/stat.h b/libc/sysdeps/linux/m68k/bits/stat.h
-index 7b9c3d144..70da1b384 100644
---- a/libc/sysdeps/linux/m68k/bits/stat.h
-+++ b/libc/sysdeps/linux/m68k/bits/stat.h
-@@ -60,7 +60,7 @@ struct stat
- #else
-     __blkcnt64_t st_blocks;		/* Number 512-byte blocks allocated. */
- #endif
--#ifdef __USE_MISC
-+#if defined(__USE_MISC) || defined(__USE_XOPEN2K8)
-     /* Nanosecond resolution timestamps are stored in a format
-        equivalent to 'struct timespec'.  This is the type used
-        whenever possible but the Unix namespace rules do not allow the
-@@ -106,7 +106,7 @@ struct stat64
-     __blksize_t st_blksize;		/* Optimal block size for I/O.  */
- 
-     __blkcnt64_t st_blocks;		/* Number 512-byte blocks allocated. */
--#ifdef __USE_MISC
-+#if defined(__USE_MISC) || defined(__USE_XOPEN2K8)
-     /* Nanosecond resolution timestamps are stored in a format
-        equivalent to 'struct timespec'.  This is the type used
-        whenever possible but the Unix namespace rules do not allow the
-diff --git a/libc/sysdeps/linux/mips/bits/stat.h b/libc/sysdeps/linux/mips/bits/stat.h
-index 539fa33d2..bad2a0244 100644
---- a/libc/sysdeps/linux/mips/bits/stat.h
-+++ b/libc/sysdeps/linux/mips/bits/stat.h
-@@ -60,7 +60,7 @@ struct stat
-     long int st_pad2[2];
-     __off64_t st_size;		/* Size of file, in bytes.  */
- #endif
--#ifdef __USE_MISC
-+#if defined(__USE_MISC) || defined(__USE_XOPEN2K8)
-     /* Nanosecond resolution timestamps are stored in a format
-        equivalent to 'struct timespec'.  This is the type used
-        whenever possible but the Unix namespace rules do not allow the
-@@ -103,7 +103,7 @@ struct stat {
-     unsigned int st_rdev;	/* Device number, if device.  */
-     int st_pad2[3];
-     __off_t st_size;		/* Size of file, in bytes.  */
--#ifdef __USE_MISC
-+#if defined(__USE_MISC) || defined(__USE_XOPEN2K8)
-     /* Nanosecond resolution timestamps are stored in a format
-        equivalent to 'struct timespec'.  This is the type used
-        whenever possible but the Unix namespace rules do not allow the
-diff --git a/libc/sysdeps/linux/nds32/bits/stat.h b/libc/sysdeps/linux/nds32/bits/stat.h
-index c4e09e0f2..5272751f4 100644
---- a/libc/sysdeps/linux/nds32/bits/stat.h
-+++ b/libc/sysdeps/linux/nds32/bits/stat.h
-@@ -64,7 +64,7 @@ struct stat
- #else
-     __blkcnt64_t st_blocks;		/* Number 512-byte blocks allocated. */
- #endif
--#ifdef __USE_MISC
-+#if defined(__USE_MISC) || defined(__USE_XOPEN2K8)
-     /* Nanosecond resolution timestamps are stored in a format
-        equivalent to 'struct timespec'.  This is the type used
-        whenever possible but the Unix namespace rules do not allow the
-@@ -110,7 +110,7 @@ struct stat64
-     __blksize_t st_blksize;		/* Optimal block size for I/O.  */
- 
-     __blkcnt64_t st_blocks;		/* Number 512-byte blocks allocated. */
--#ifdef __USE_MISC
-+#if defined(__USE_MISC) || defined(__USE_XOPEN2K8)
-     /* Nanosecond resolution timestamps are stored in a format
-        equivalent to 'struct timespec'.  This is the type used
-        whenever possible but the Unix namespace rules do not allow the
-diff --git a/libc/sysdeps/linux/powerpc/bits/stat.h b/libc/sysdeps/linux/powerpc/bits/stat.h
-index 7494586b5..ce2ebf896 100644
---- a/libc/sysdeps/linux/powerpc/bits/stat.h
-+++ b/libc/sysdeps/linux/powerpc/bits/stat.h
-@@ -59,7 +59,7 @@ struct stat
- # else
-     __blkcnt64_t st_blocks;		/* Number 512-byte blocks allocated. */
- # endif
--#ifdef __USE_MISC
-+#if defined(__USE_MISC) || defined(__USE_XOPEN2K8)
-     /* Nanosecond resolution timestamps are stored in a format
-        equivalent to 'struct timespec'.  This is the type used
-        whenever possible but the Unix namespace rules do not allow the
-@@ -99,7 +99,7 @@ struct stat64
-     __off64_t st_size;			/* Size of file, in bytes.  */
-     __blksize_t st_blksize;		/* Optimal block size for I/O.  */
-     __blkcnt64_t st_blocks;		/* Number 512-byte blocks allocated. */
--#ifdef __USE_MISC
-+#if defined(__USE_MISC) || defined(__USE_XOPEN2K8)
-     /* Nanosecond resolution timestamps are stored in a format
-        equivalent to 'struct timespec'.  This is the type used
-        whenever possible but the Unix namespace rules do not allow the
--- 
-2.30.2
-
diff --git a/package/uclibc/0004-Fix-arc-build-with-4.x-kernel-headers.patch b/package/uclibc/0004-Fix-arc-build-with-4.x-kernel-headers.patch
deleted file mode 100644
index 02a04a42dc..0000000000
--- a/package/uclibc/0004-Fix-arc-build-with-4.x-kernel-headers.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 1afc19eb6a7948afbcf3dd19091ce127a355ebcb Mon Sep 17 00:00:00 2001
-From: Dmitry Chestnykh <dm.chestnykh@gmail.com>
-Date: Sun, 28 Jul 2024 14:12:39 +0300
-Subject: [PATCH] [ldso] Group conditions after `&&`
-
-If the conditions are not grouped we can reach
-this block even if `__NR_stat` is not defined.
-
-`defined __NR_stat && ((!defined(__UCLIBC_USE_TIME64__) || defined(__sparc__))`
-gives us false but `LINUX_VERSION_CODE <= KERNEL_VERSION(5,1,0))`
-may give us true. So if linux headers version is below 5.1.0 and
-__NR_stat is not defined we can have compilation error
-
-Signed-off-by: Dmitry Chestnykh <dm.chestnykh@gmail.com>
-Upstream: https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?id=841d0729883ee0de606de161c1d6a5c37cedf575
----
- ldso/include/dl-syscall.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/ldso/include/dl-syscall.h b/ldso/include/dl-syscall.h
-index 9ec0eac60..180d03012 100644
---- a/ldso/include/dl-syscall.h
-+++ b/ldso/include/dl-syscall.h
-@@ -141,7 +141,7 @@ static __always_inline int _dl_stat(const char *file_name,
- {
- 	return _dl_newfstatat(AT_FDCWD, file_name, buf, 0);
- }
--#elif defined __NR_stat && (!defined(__UCLIBC_USE_TIME64__) || defined(__sparc__)) || (LINUX_VERSION_CODE <= KERNEL_VERSION(5,1,0))
-+#elif defined __NR_stat && (!defined(__UCLIBC_USE_TIME64__) || defined(__sparc__) || (LINUX_VERSION_CODE <= KERNEL_VERSION(5,1,0)))
- # define __NR__dl_stat __NR_stat
- static __always_inline _syscall2(int, _dl_stat, const char *, file_name,
-                         struct stat *, buf)
--- 
-2.45.2
-
diff --git a/package/uclibc/0005-bits-stat.h-Declare-st_mtim-if-defined-__USE_XOPEN2K.patch b/package/uclibc/0005-bits-stat.h-Declare-st_mtim-if-defined-__USE_XOPEN2K.patch
deleted file mode 100644
index 749a098406..0000000000
--- a/package/uclibc/0005-bits-stat.h-Declare-st_mtim-if-defined-__USE_XOPEN2K.patch
+++ /dev/null
@@ -1,132 +0,0 @@
-From 354129807db12c792696b74d0cd38f2c5d2fd704 Mon Sep 17 00:00:00 2001
-From: Waldemar Brodkorb <wbx@openadk.org>
-Date: Fri, 9 Aug 2024 06:16:02 +0200
-Subject: [PATCH] bits/stat.h: Declare st_mtim if defined(__USE_XOPEN2K8),
- add missing
-
-d0c8c185b439187b12644457bb2aa0326f25aaf7 was not complete, add
-missing architectures.
-
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-Upstream: https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?id=354129807db12c792696b74d0cd38f2c5d2fd704
----
- libc/sysdeps/linux/mips/bits/stat.h    | 4 ++--
- libc/sysdeps/linux/sparc/bits/stat.h   | 4 ++--
- libc/sysdeps/linux/sparc64/bits/stat.h | 4 ++--
- libc/sysdeps/linux/x86_64/bits/stat.h  | 4 ++--
- libc/sysdeps/linux/xtensa/bits/stat.h  | 4 ++--
- 5 files changed, 10 insertions(+), 10 deletions(-)
-
-diff --git a/libc/sysdeps/linux/mips/bits/stat.h b/libc/sysdeps/linux/mips/bits/stat.h
-index bad2a0244..81d2e4687 100644
---- a/libc/sysdeps/linux/mips/bits/stat.h
-+++ b/libc/sysdeps/linux/mips/bits/stat.h
-@@ -145,7 +145,7 @@ struct stat64
-     __dev_t st_rdev;	/* Device number, if device.  */
-     long int st_pad2[2];
-     __off64_t st_size;		/* Size of file, in bytes.  */
--#ifdef __USE_MISC
-+#if defined(__USE_MISC) || defined(__USE_XOPEN2K8)
-     /* Nanosecond resolution timestamps are stored in a format
-        equivalent to 'struct timespec'.  This is the type used
-        whenever possible but the Unix namespace rules do not allow the
-@@ -184,7 +184,7 @@ struct stat64 {
-     unsigned int st_rdev;	/* Device number, if device.  */
-     int st_pad2[3];
-     __off_t st_size;		/* Size of file, in bytes.  */
--#ifdef __USE_MISC
-+#if defined(__USE_MISC) || defined(__USE_XOPEN2K8)
-     /* Nanosecond resolution timestamps are stored in a format
-        equivalent to 'struct timespec'.  This is the type used
-        whenever possible but the Unix namespace rules do not allow the
-diff --git a/libc/sysdeps/linux/sparc/bits/stat.h b/libc/sysdeps/linux/sparc/bits/stat.h
-index b88885fe2..0fbef8b3f 100644
---- a/libc/sysdeps/linux/sparc/bits/stat.h
-+++ b/libc/sysdeps/linux/sparc/bits/stat.h
-@@ -53,7 +53,7 @@ struct stat
- #else
-     __blkcnt64_t st_blocks;		/* Number 512-byte blocks allocated. */
- #endif
--#ifdef __USE_MISC
-+#if defined(__USE_MISC) || defined(__USE_XOPEN2K8)
-     /* Nanosecond resolution timestamps are stored in a format
-        equivalent to 'struct timespec'.  This is the type used
-        whenever possible but the Unix namespace rules do not allow the
-@@ -93,7 +93,7 @@ struct stat64
-     __blksize_t st_blksize;		/* Optimal block size for I/O.  */
- 
-     __blkcnt64_t st_blocks;		/* Number 512-byte blocks allocated. */
--#ifdef __USE_MISC
-+#if defined(__USE_MISC) || defined(__USE_XOPEN2K8)
-     /* Nanosecond resolution timestamps are stored in a format
-        equivalent to 'struct timespec'.  This is the type used
-        whenever possible but the Unix namespace rules do not allow the
-diff --git a/libc/sysdeps/linux/sparc64/bits/stat.h b/libc/sysdeps/linux/sparc64/bits/stat.h
-index 8516b159c..62b48b745 100644
---- a/libc/sysdeps/linux/sparc64/bits/stat.h
-+++ b/libc/sysdeps/linux/sparc64/bits/stat.h
-@@ -58,7 +58,7 @@ struct stat
- #else
-     __blkcnt64_t st_blocks;		/* Number 512-byte blocks allocated. */
- #endif
--#ifdef __USE_MISC
-+#if defined(__USE_MISC) || defined(__USE_XOPEN2K8)
-     /* Nanosecond resolution timestamps are stored in a format
-        equivalent to 'struct timespec'.  This is the type used
-        whenever possible but the Unix namespace rules do not allow the
-@@ -101,7 +101,7 @@ struct stat64
-     __blksize_t st_blksize;		/* Optimal block size for I/O.  */
- 
-     __blkcnt64_t st_blocks;		/* Number 512-byte blocks allocated. */
--#ifdef __USE_MISC
-+#if defined(__USE_MISC) || defined(__USE_XOPEN2K8)
-     /* Nanosecond resolution timestamps are stored in a format
-        equivalent to 'struct timespec'.  This is the type used
-        whenever possible but the Unix namespace rules do not allow the
-diff --git a/libc/sysdeps/linux/x86_64/bits/stat.h b/libc/sysdeps/linux/x86_64/bits/stat.h
-index a7412c8f9..a8c75feaa 100644
---- a/libc/sysdeps/linux/x86_64/bits/stat.h
-+++ b/libc/sysdeps/linux/x86_64/bits/stat.h
-@@ -77,7 +77,7 @@ struct stat
- #else
-     __blkcnt64_t st_blocks;		/* Number 512-byte blocks allocated. */
- #endif
--#ifdef __USE_MISC
-+#if defined(__USE_MISC) || defined(__USE_XOPEN2K8)
-     /* Nanosecond resolution timestamps are stored in a format
-        equivalent to 'struct timespec'.  This is the type used
-        whenever possible but the Unix namespace rules do not allow the
-@@ -138,7 +138,7 @@ struct stat64
- #endif
-     __blksize_t st_blksize;	/* Optimal block size for I/O.  */
-     __blkcnt64_t st_blocks;	/* Nr. 512-byte blocks allocated.  */
--#ifdef __USE_MISC
-+#if defined(__USE_MISC) || defined(__USE_XOPEN2K8)
-     /* Nanosecond resolution timestamps are stored in a format
-        equivalent to 'struct timespec'.  This is the type used
-        whenever possible but the Unix namespace rules do not allow the
-diff --git a/libc/sysdeps/linux/xtensa/bits/stat.h b/libc/sysdeps/linux/xtensa/bits/stat.h
-index 045a017fd..43af825ec 100644
---- a/libc/sysdeps/linux/xtensa/bits/stat.h
-+++ b/libc/sysdeps/linux/xtensa/bits/stat.h
-@@ -54,7 +54,7 @@ struct stat
-     unsigned long __pad2;
-     __blkcnt64_t st_blocks;		/* Number 512-byte blocks allocated. */
- #endif
--#ifdef __USE_MISC
-+#if defined(__USE_MISC) || defined(__USE_XOPEN2K8)
-     /* Nanosecond resolution timestamps are stored in a format
-        equivalent to 'struct timespec'.  This is the type used
-        whenever possible but the Unix namespace rules do not allow the
-@@ -94,7 +94,7 @@ struct stat64
- 
-     unsigned long __pad2;
-     __blkcnt64_t st_blocks;		/* Number 512-byte blocks allocated. */
--#ifdef __USE_MISC
-+#if defined(__USE_MISC) || defined(__USE_XOPEN2K8)
-     /* Nanosecond resolution timestamps are stored in a format
-        equivalent to 'struct timespec'.  This is the type used
-        whenever possible but the Unix namespace rules do not allow the
--- 
-2.30.2
-
diff --git a/package/uclibc/uclibc.hash b/package/uclibc/uclibc.hash
index 1067ea9b0f..dbc3966906 100644
--- a/package/uclibc/uclibc.hash
+++ b/package/uclibc/uclibc.hash
@@ -1,4 +1,4 @@
-# From https://downloads.uclibc-ng.org/releases/1.0.49/uClibc-ng-1.0.49.tar.xz.sha256
-sha256  340f9d5dd1159c69c3380654e39e567cbb304afcd3f9dfa2e9833f0fa13f5bbe  uClibc-ng-1.0.49.tar.xz
+# From https://downloads.uclibc-ng.org/releases/1.0.50/uClibc-ng-1.0.50.tar.xz.sha256
+sha256  aed867251f4823a74ea5e3a3993d3a7c123280abe15e38dc206770c3968f21cf  uClibc-ng-1.0.50.tar.xz
 # Locally calculated
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING.LIB
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 31f9899f00..de834bac4f 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UCLIBC_VERSION = 1.0.49
+UCLIBC_VERSION = 1.0.50
 UCLIBC_SOURCE = uClibc-ng-$(UCLIBC_VERSION).tar.xz
 UCLIBC_SITE = https://downloads.uclibc-ng.org/releases/$(UCLIBC_VERSION)
 UCLIBC_LICENSE = LGPL-2.1+

--===============8251342732735201375==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8251342732735201375==--
