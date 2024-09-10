Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EF0FEDE9AB
	for <buildroot@archiver.kernel.org>; Tue, 10 Sep 2024 19:41:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B25D44023F;
	Tue, 10 Sep 2024 19:41:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AUivmp7MfEHw; Tue, 10 Sep 2024 19:41:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35D79401F2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35D79401F2;
	Tue, 10 Sep 2024 19:41:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F3FB91BF288
 for <buildroot@lists.busybox.net>; Tue, 10 Sep 2024 19:41:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E19C9608AD
 for <buildroot@lists.busybox.net>; Tue, 10 Sep 2024 19:41:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ArQdI66a687m for <buildroot@lists.busybox.net>;
 Tue, 10 Sep 2024 19:41:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D182960720
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D182960720
 for <buildroot@buildroot.org>; Tue, 10 Sep 2024 19:41:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7F74D86F10; Tue, 10 Sep 2024 19:41:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 10 Sep 2024 21:40:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9022c0ca00615ed11e92420194fcd4d8ad3bf5b6
X-Git-Newrev: 2358693dd03a2657633241950f84d9761001d02d
X-Patchwork-Hint: ignore
Message-Id: <20240910194152.7F74D86F10@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uclibc: remove already included
 patches
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2358693dd03a2657633241950f84d9761001d02d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

1.0.50 already includes these patches, so remove them.
This happened mistakenly while merging next back to master branch.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...004-Fix-arc-build-with-4.x-kernel-headers.patch |  35 --
 ...-Declare-st_mtim-if-defined-__USE_XOPEN2K.patch | 132 ------
 .../0006-add-memfd_create-syscall-wrapper.patch    | 467 ---------------------
 3 files changed, 634 deletions(-)

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
diff --git a/package/uclibc/0006-add-memfd_create-syscall-wrapper.patch b/package/uclibc/0006-add-memfd_create-syscall-wrapper.patch
deleted file mode 100644
index 75309d195a..0000000000
--- a/package/uclibc/0006-add-memfd_create-syscall-wrapper.patch
+++ /dev/null
@@ -1,467 +0,0 @@
-From 811cd361e144dd7bdf75bcad8b4572ec786af5c7 Mon Sep 17 00:00:00 2001
-From: Waldemar Brodkorb <wbx@openadk.org>
-Date: Sun, 11 Aug 2024 20:22:48 +0200
-Subject: [PATCH] add memfd_create syscall wrapper
-
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-Upstream: https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?id=811cd361e144dd7bdf75bcad8b4572ec786af5c7
----
- libc/sysdeps/linux/aarch64/bits/fcntl.h      |  3 ++
- libc/sysdeps/linux/alpha/bits/fcntl.h        |  2 ++
- libc/sysdeps/linux/arc/bits/fcntl.h          |  3 ++
- libc/sysdeps/linux/arm/bits/fcntl.h          |  2 ++
- libc/sysdeps/linux/avr32/bits/fcntl.h        |  3 ++
- libc/sysdeps/linux/bfin/bits/fcntl.h         |  2 ++
- libc/sysdeps/linux/c6x/bits/fcntl.h          |  3 ++
- libc/sysdeps/linux/common/Makefile.in        |  1 +
- libc/sysdeps/linux/common/bits/fcntl-linux.h | 34 ++++++++++++++++++++
- libc/sysdeps/linux/common/bits/mman-shared.h |  2 --
- libc/sysdeps/linux/common/memfd_create.c     | 13 ++++++++
- libc/sysdeps/linux/cris/bits/fcntl.h         |  2 ++
- libc/sysdeps/linux/csky/bits/fcntl.h         |  2 ++
- libc/sysdeps/linux/frv/bits/fcntl.h          |  2 ++
- libc/sysdeps/linux/h8300/bits/fcntl.h        |  2 ++
- libc/sysdeps/linux/hppa/bits/fcntl.h         |  2 ++
- libc/sysdeps/linux/i386/bits/fcntl.h         |  2 ++
- libc/sysdeps/linux/ia64/bits/fcntl.h         |  2 ++
- libc/sysdeps/linux/kvx/bits/fcntl.h          |  3 ++
- libc/sysdeps/linux/lm32/bits/fcntl.h         |  2 ++
- libc/sysdeps/linux/m68k/bits/fcntl.h         |  2 ++
- libc/sysdeps/linux/metag/bits/fcntl.h        |  2 ++
- libc/sysdeps/linux/microblaze/bits/fcntl.h   |  2 ++
- libc/sysdeps/linux/mips/bits/fcntl.h         |  2 ++
- libc/sysdeps/linux/nds32/bits/fcntl.h        |  2 ++
- libc/sysdeps/linux/nios2/bits/fcntl.h        |  2 ++
- libc/sysdeps/linux/or1k/bits/fcntl.h         |  3 ++
- libc/sysdeps/linux/powerpc/bits/fcntl.h      |  2 ++
- libc/sysdeps/linux/riscv32/bits/fcntl.h      |  3 ++
- libc/sysdeps/linux/riscv64/bits/fcntl.h      |  3 ++
- libc/sysdeps/linux/sh/bits/fcntl.h           |  2 ++
- libc/sysdeps/linux/sparc/bits/fcntl.h        |  2 ++
- libc/sysdeps/linux/sparc64/bits/fcntl.h      |  2 ++
- libc/sysdeps/linux/tile/bits/fcntl.h         |  3 ++
- libc/sysdeps/linux/x86_64/bits/fcntl.h       |  2 ++
- libc/sysdeps/linux/xtensa/bits/fcntl.h       |  2 ++
- 36 files changed, 121 insertions(+), 2 deletions(-)
- create mode 100644 libc/sysdeps/linux/common/bits/fcntl-linux.h
- create mode 100644 libc/sysdeps/linux/common/memfd_create.c
-
-diff --git a/libc/sysdeps/linux/aarch64/bits/fcntl.h b/libc/sysdeps/linux/aarch64/bits/fcntl.h
-index dbe929351..024344eec 100644
---- a/libc/sysdeps/linux/aarch64/bits/fcntl.h
-+++ b/libc/sysdeps/linux/aarch64/bits/fcntl.h
-@@ -289,3 +289,6 @@ extern int fallocate64 (int __fd, int __mode, __off64_t __offset,
- #endif	/* use GNU */
- 
- __END_DECLS
-+
-+/* Include generic Linux declarations.  */
-+#include <bits/fcntl-linux.h>
-diff --git a/libc/sysdeps/linux/alpha/bits/fcntl.h b/libc/sysdeps/linux/alpha/bits/fcntl.h
-index 11e68214e..7d06c76b7 100644
---- a/libc/sysdeps/linux/alpha/bits/fcntl.h
-+++ b/libc/sysdeps/linux/alpha/bits/fcntl.h
-@@ -236,3 +236,5 @@ extern ssize_t tee (int __fdin, int __fdout, size_t __len,
- #endif
- __END_DECLS
- 
-+/* Include generic Linux declarations.  */
-+#include <bits/fcntl-linux.h>
-diff --git a/libc/sysdeps/linux/arc/bits/fcntl.h b/libc/sysdeps/linux/arc/bits/fcntl.h
-index beb32e41e..b02849691 100755
---- a/libc/sysdeps/linux/arc/bits/fcntl.h
-+++ b/libc/sysdeps/linux/arc/bits/fcntl.h
-@@ -230,3 +230,6 @@ extern ssize_t tee (int __fdin, int __fdout, size_t __len,
- 
- #endif
- __END_DECLS
-+
-+/* Include generic Linux declarations.  */
-+#include <bits/fcntl-linux.h>
-diff --git a/libc/sysdeps/linux/arm/bits/fcntl.h b/libc/sysdeps/linux/arm/bits/fcntl.h
-index 823660648..52dee4287 100644
---- a/libc/sysdeps/linux/arm/bits/fcntl.h
-+++ b/libc/sysdeps/linux/arm/bits/fcntl.h
-@@ -244,3 +244,5 @@ extern ssize_t tee (int __fdin, int __fdout, size_t __len,
- #endif
- __END_DECLS
- 
-+/* Include generic Linux declarations.  */
-+#include <bits/fcntl-linux.h>
-diff --git a/libc/sysdeps/linux/avr32/bits/fcntl.h b/libc/sysdeps/linux/avr32/bits/fcntl.h
-index ec0a3b55d..9e41550be 100644
---- a/libc/sysdeps/linux/avr32/bits/fcntl.h
-+++ b/libc/sysdeps/linux/avr32/bits/fcntl.h
-@@ -218,3 +218,6 @@ extern ssize_t tee (int __fdin, int __fdout, size_t __len,
- 
- __END_DECLS
- #endif
-+
-+/* Include generic Linux declarations.  */
-+#include <bits/fcntl-linux.h>
-diff --git a/libc/sysdeps/linux/bfin/bits/fcntl.h b/libc/sysdeps/linux/bfin/bits/fcntl.h
-index 0909ae6c4..67d2c5245 100644
---- a/libc/sysdeps/linux/bfin/bits/fcntl.h
-+++ b/libc/sysdeps/linux/bfin/bits/fcntl.h
-@@ -244,3 +244,5 @@ extern ssize_t tee (int __fdin, int __fdout, size_t __len,
- #endif
- __END_DECLS
- 
-+/* Include generic Linux declarations.  */
-+#include <bits/fcntl-linux.h>
-diff --git a/libc/sysdeps/linux/c6x/bits/fcntl.h b/libc/sysdeps/linux/c6x/bits/fcntl.h
-index 14aea565e..00f3b34e0 100644
---- a/libc/sysdeps/linux/c6x/bits/fcntl.h
-+++ b/libc/sysdeps/linux/c6x/bits/fcntl.h
-@@ -237,3 +237,6 @@ extern ssize_t tee (int __fdin, int __fdout, size_t __len,
- 
- #endif
- __END_DECLS
-+
-+/* Include generic Linux declarations.  */
-+#include <bits/fcntl-linux.h>
-diff --git a/libc/sysdeps/linux/common/Makefile.in b/libc/sysdeps/linux/common/Makefile.in
-index 848bc1e4a..83be2691e 100644
---- a/libc/sysdeps/linux/common/Makefile.in
-+++ b/libc/sysdeps/linux/common/Makefile.in
-@@ -30,6 +30,7 @@ CSRC-$(UCLIBC_LINUX_SPECIFIC) += \
- 	inotify.c \
- 	ioperm.c \
- 	iopl.c \
-+	memfd_create.c \
- 	modify_ldt.c \
- 	module.c \
- 	name_to_handle_at.c \
-diff --git a/libc/sysdeps/linux/common/bits/fcntl-linux.h b/libc/sysdeps/linux/common/bits/fcntl-linux.h
-new file mode 100644
-index 000000000..d0236fd8b
---- /dev/null
-+++ b/libc/sysdeps/linux/common/bits/fcntl-linux.h
-@@ -0,0 +1,34 @@
-+/* O_*, F_*, FD_* bit values for Linux.
-+   Copyright (C) 2001-2024 Free Software Foundation, Inc.
-+
-+   The GNU C Library is free software; you can redistribute it and/or
-+   modify it under the terms of the GNU Lesser General Public
-+   License as published by the Free Software Foundation; either
-+   version 2.1 of the License, or (at your option) any later version.
-+
-+   The GNU C Library is distributed in the hope that it will be useful,
-+   but WITHOUT ANY WARRANTY; without even the implied warranty of
-+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+   Lesser General Public License for more details.
-+
-+   You should have received a copy of the GNU Lesser General Public
-+   License along with the GNU C Library; if not, see
-+   <https://www.gnu.org/licenses/>.  */
-+
-+#ifndef	_FCNTL_H
-+# error "Never use <bits/fcntl-linux.h> directly; include <fcntl.h> instead."
-+#endif
-+
-+#ifdef __USE_GNU
-+/* Types of seals.  */
-+# define F_SEAL_SEAL	0x0001	/* Prevent further seals from being set.  */
-+# define F_SEAL_SHRINK	0x0002	/* Prevent file from shrinking.  */
-+# define F_SEAL_GROW	0x0004	/* Prevent file from growing.  */
-+# define F_SEAL_WRITE	0x0008	/* Prevent writes.  */
-+# define F_SEAL_FUTURE_WRITE	0x0010	/* Prevent future writes while
-+					   mapped.  */
-+# define F_SEAL_EXEC	0x0020	/* Prevent chmod modifying exec bits. */
-+
-+# define F_ADD_SEALS	1033	/* Add seals to file.  */
-+# define F_GET_SEALS	1034	/* Get seals for file.  */
-+#endif
-diff --git a/libc/sysdeps/linux/common/bits/mman-shared.h b/libc/sysdeps/linux/common/bits/mman-shared.h
-index 98c9e1d3c..c40ae2d1e 100644
---- a/libc/sysdeps/linux/common/bits/mman-shared.h
-+++ b/libc/sysdeps/linux/common/bits/mman-shared.h
-@@ -40,11 +40,9 @@
- 
- __BEGIN_DECLS
- 
--#if 0
- /* Create a new memory file descriptor.  NAME is a name for debugging.
-    FLAGS is a combination of the MFD_* constants.  */
- int memfd_create (const char *__name, unsigned int __flags) __THROW;
--#endif
- 
- /* Lock pages from ADDR (inclusive) to ADDR + LENGTH (exclusive) into
-    memory.  FLAGS is a combination of the MLOCK_* flags above.  */
-diff --git a/libc/sysdeps/linux/common/memfd_create.c b/libc/sysdeps/linux/common/memfd_create.c
-new file mode 100644
-index 000000000..7165f3278
---- /dev/null
-+++ b/libc/sysdeps/linux/common/memfd_create.c
-@@ -0,0 +1,13 @@
-+/*
-+ * memfd_create() for uClibc-ng
-+ *
-+ * Copyright (C) 2024 Waldemar Brodkorb <wbx@uclibc-ng.org>
-+ *
-+ * Licensed under the LGPL v2.1, see the file COPYING.LIB in this tarball.
-+ */
-+
-+#include <sys/syscall.h>
-+#include <sys/mman.h>
-+#if defined(__NR_memfd_create)
-+_syscall2(int, memfd_create, const char *, name, unsigned int, flags)
-+#endif
-diff --git a/libc/sysdeps/linux/cris/bits/fcntl.h b/libc/sysdeps/linux/cris/bits/fcntl.h
-index e9bc90ea9..e1d4ee1a6 100644
---- a/libc/sysdeps/linux/cris/bits/fcntl.h
-+++ b/libc/sysdeps/linux/cris/bits/fcntl.h
-@@ -245,3 +245,5 @@ extern ssize_t tee (int __fdin, int __fdout, size_t __len,
- #endif
- __END_DECLS
- 
-+/* Include generic Linux declarations.  */
-+#include <bits/fcntl-linux.h>
-diff --git a/libc/sysdeps/linux/csky/bits/fcntl.h b/libc/sysdeps/linux/csky/bits/fcntl.h
-index b36f41569..25f4491ba 100644
---- a/libc/sysdeps/linux/csky/bits/fcntl.h
-+++ b/libc/sysdeps/linux/csky/bits/fcntl.h
-@@ -232,3 +232,5 @@ extern ssize_t tee (int __fdin, int __fdout, size_t __len,
- #endif
- __END_DECLS
- 
-+/* Include generic Linux declarations.  */
-+#include <bits/fcntl-linux.h>
-diff --git a/libc/sysdeps/linux/frv/bits/fcntl.h b/libc/sysdeps/linux/frv/bits/fcntl.h
-index 02c8ac310..81a1bcd99 100644
---- a/libc/sysdeps/linux/frv/bits/fcntl.h
-+++ b/libc/sysdeps/linux/frv/bits/fcntl.h
-@@ -226,3 +226,5 @@ extern ssize_t tee (int __fdin, int __fdout, size_t __len,
- #endif
- __END_DECLS
- 
-+/* Include generic Linux declarations.  */
-+#include <bits/fcntl-linux.h>
-diff --git a/libc/sysdeps/linux/h8300/bits/fcntl.h b/libc/sysdeps/linux/h8300/bits/fcntl.h
-index 2062f7cda..7cbe04e15 100644
---- a/libc/sysdeps/linux/h8300/bits/fcntl.h
-+++ b/libc/sysdeps/linux/h8300/bits/fcntl.h
-@@ -244,3 +244,5 @@ extern ssize_t tee (int __fdin, int __fdout, size_t __len,
- #endif
- __END_DECLS
- 
-+/* Include generic Linux declarations.  */
-+#include <bits/fcntl-linux.h>
-diff --git a/libc/sysdeps/linux/hppa/bits/fcntl.h b/libc/sysdeps/linux/hppa/bits/fcntl.h
-index 4ce76ce5f..bcd6618b2 100644
---- a/libc/sysdeps/linux/hppa/bits/fcntl.h
-+++ b/libc/sysdeps/linux/hppa/bits/fcntl.h
-@@ -234,3 +234,5 @@ extern ssize_t tee (int __fdin, int __fdout, size_t __len,
- #endif
- __END_DECLS
- 
-+/* Include generic Linux declarations.  */
-+#include <bits/fcntl-linux.h>
-diff --git a/libc/sysdeps/linux/i386/bits/fcntl.h b/libc/sysdeps/linux/i386/bits/fcntl.h
-index f3c08bbe5..5caf66114 100644
---- a/libc/sysdeps/linux/i386/bits/fcntl.h
-+++ b/libc/sysdeps/linux/i386/bits/fcntl.h
-@@ -245,3 +245,5 @@ extern ssize_t tee (int __fdin, int __fdout, size_t __len,
- #endif
- __END_DECLS
- 
-+/* Include generic Linux declarations.  */
-+#include <bits/fcntl-linux.h>
-diff --git a/libc/sysdeps/linux/ia64/bits/fcntl.h b/libc/sysdeps/linux/ia64/bits/fcntl.h
-index a20f44ff7..53263c3d3 100644
---- a/libc/sysdeps/linux/ia64/bits/fcntl.h
-+++ b/libc/sysdeps/linux/ia64/bits/fcntl.h
-@@ -238,3 +238,5 @@ extern ssize_t tee (int __fdin, int __fdout, size_t __len,
- #endif
- __END_DECLS
- 
-+/* Include generic Linux declarations.  */
-+#include <bits/fcntl-linux.h>
-diff --git a/libc/sysdeps/linux/kvx/bits/fcntl.h b/libc/sysdeps/linux/kvx/bits/fcntl.h
-index ea0c59d09..79cd3f14e 100644
---- a/libc/sysdeps/linux/kvx/bits/fcntl.h
-+++ b/libc/sysdeps/linux/kvx/bits/fcntl.h
-@@ -227,3 +227,6 @@ extern ssize_t tee (int __fdin, int __fdout, size_t __len,
- 
- #endif
- __END_DECLS
-+
-+/* Include generic Linux declarations.  */
-+#include <bits/fcntl-linux.h>
-diff --git a/libc/sysdeps/linux/lm32/bits/fcntl.h b/libc/sysdeps/linux/lm32/bits/fcntl.h
-index 0bfea6e7a..049c7fd83 100644
---- a/libc/sysdeps/linux/lm32/bits/fcntl.h
-+++ b/libc/sysdeps/linux/lm32/bits/fcntl.h
-@@ -244,3 +244,5 @@ extern ssize_t tee (int __fdin, int __fdout, size_t __len,
- #endif
- __END_DECLS
- 
-+/* Include generic Linux declarations.  */
-+#include <bits/fcntl-linux.h>
-diff --git a/libc/sysdeps/linux/m68k/bits/fcntl.h b/libc/sysdeps/linux/m68k/bits/fcntl.h
-index 5a56c8781..92c0964d9 100644
---- a/libc/sysdeps/linux/m68k/bits/fcntl.h
-+++ b/libc/sysdeps/linux/m68k/bits/fcntl.h
-@@ -244,3 +244,5 @@ extern ssize_t tee (int __fdin, int __fdout, size_t __len,
- #endif
- __END_DECLS
- 
-+/* Include generic Linux declarations.  */
-+#include <bits/fcntl-linux.h>
-diff --git a/libc/sysdeps/linux/metag/bits/fcntl.h b/libc/sysdeps/linux/metag/bits/fcntl.h
-index bdd697348..471938b7d 100644
---- a/libc/sysdeps/linux/metag/bits/fcntl.h
-+++ b/libc/sysdeps/linux/metag/bits/fcntl.h
-@@ -244,3 +244,5 @@ extern ssize_t tee (int __fdin, int __fdout, size_t __len,
- #endif
- __END_DECLS
- 
-+/* Include generic Linux declarations.  */
-+#include <bits/fcntl-linux.h>
-diff --git a/libc/sysdeps/linux/microblaze/bits/fcntl.h b/libc/sysdeps/linux/microblaze/bits/fcntl.h
-index 110927d95..8c9c2ceef 100644
---- a/libc/sysdeps/linux/microblaze/bits/fcntl.h
-+++ b/libc/sysdeps/linux/microblaze/bits/fcntl.h
-@@ -244,3 +244,5 @@ extern ssize_t tee (int __fdin, int __fdout, size_t __len,
- #endif
- __END_DECLS
- 
-+/* Include generic Linux declarations.  */
-+#include <bits/fcntl-linux.h>
-diff --git a/libc/sysdeps/linux/mips/bits/fcntl.h b/libc/sysdeps/linux/mips/bits/fcntl.h
-index 33251c74d..a98b8c2e5 100644
---- a/libc/sysdeps/linux/mips/bits/fcntl.h
-+++ b/libc/sysdeps/linux/mips/bits/fcntl.h
-@@ -268,3 +268,5 @@ extern ssize_t tee (int __fdin, int __fdout, size_t __len,
- #endif
- __END_DECLS
- 
-+/* Include generic Linux declarations.  */
-+#include <bits/fcntl-linux.h>
-diff --git a/libc/sysdeps/linux/nds32/bits/fcntl.h b/libc/sysdeps/linux/nds32/bits/fcntl.h
-index 2e6a95ec8..cfce8ab27 100644
---- a/libc/sysdeps/linux/nds32/bits/fcntl.h
-+++ b/libc/sysdeps/linux/nds32/bits/fcntl.h
-@@ -249,3 +249,5 @@ extern ssize_t tee (int __fdin, int __fdout, size_t __len,
- #endif
- __END_DECLS
- 
-+/* Include generic Linux declarations.  */
-+#include <bits/fcntl-linux.h>
-diff --git a/libc/sysdeps/linux/nios2/bits/fcntl.h b/libc/sysdeps/linux/nios2/bits/fcntl.h
-index 200a35443..0c11c3aba 100644
---- a/libc/sysdeps/linux/nios2/bits/fcntl.h
-+++ b/libc/sysdeps/linux/nios2/bits/fcntl.h
-@@ -244,3 +244,5 @@ extern ssize_t tee (int __fdin, int __fdout, size_t __len,
- #endif
- __END_DECLS
- 
-+/* Include generic Linux declarations.  */
-+#include <bits/fcntl-linux.h>
-diff --git a/libc/sysdeps/linux/or1k/bits/fcntl.h b/libc/sysdeps/linux/or1k/bits/fcntl.h
-index c9599ef3a..78eed9d5f 100644
---- a/libc/sysdeps/linux/or1k/bits/fcntl.h
-+++ b/libc/sysdeps/linux/or1k/bits/fcntl.h
-@@ -244,3 +244,6 @@ extern ssize_t tee (int __fdin, int __fdout, size_t __len,
- 
- #endif
- __END_DECLS
-+
-+/* Include generic Linux declarations.  */
-+#include <bits/fcntl-linux.h>
-diff --git a/libc/sysdeps/linux/powerpc/bits/fcntl.h b/libc/sysdeps/linux/powerpc/bits/fcntl.h
-index ef1beeca0..54e4894ec 100644
---- a/libc/sysdeps/linux/powerpc/bits/fcntl.h
-+++ b/libc/sysdeps/linux/powerpc/bits/fcntl.h
-@@ -245,3 +245,5 @@ extern ssize_t tee (int __fdin, int __fdout, size_t __len,
- #endif
- __END_DECLS
- 
-+/* Include generic Linux declarations.  */
-+#include <bits/fcntl-linux.h>
-diff --git a/libc/sysdeps/linux/riscv32/bits/fcntl.h b/libc/sysdeps/linux/riscv32/bits/fcntl.h
-index a9d7c84e0..fdfb1805d 100644
---- a/libc/sysdeps/linux/riscv32/bits/fcntl.h
-+++ b/libc/sysdeps/linux/riscv32/bits/fcntl.h
-@@ -229,3 +229,6 @@ extern ssize_t tee (int __fdin, int __fdout, size_t __len,
- 
- #endif
- __END_DECLS
-+
-+/* Include generic Linux declarations.  */
-+#include <bits/fcntl-linux.h>
-diff --git a/libc/sysdeps/linux/riscv64/bits/fcntl.h b/libc/sysdeps/linux/riscv64/bits/fcntl.h
-index a9d7c84e0..fdfb1805d 100644
---- a/libc/sysdeps/linux/riscv64/bits/fcntl.h
-+++ b/libc/sysdeps/linux/riscv64/bits/fcntl.h
-@@ -229,3 +229,6 @@ extern ssize_t tee (int __fdin, int __fdout, size_t __len,
- 
- #endif
- __END_DECLS
-+
-+/* Include generic Linux declarations.  */
-+#include <bits/fcntl-linux.h>
-diff --git a/libc/sysdeps/linux/sh/bits/fcntl.h b/libc/sysdeps/linux/sh/bits/fcntl.h
-index 0d687f04f..4ae682425 100644
---- a/libc/sysdeps/linux/sh/bits/fcntl.h
-+++ b/libc/sysdeps/linux/sh/bits/fcntl.h
-@@ -245,3 +245,5 @@ extern ssize_t tee (int __fdin, int __fdout, size_t __len,
- #endif
- __END_DECLS
- 
-+/* Include generic Linux declarations.  */
-+#include <bits/fcntl-linux.h>
-diff --git a/libc/sysdeps/linux/sparc/bits/fcntl.h b/libc/sysdeps/linux/sparc/bits/fcntl.h
-index 935495937..35224cdb3 100644
---- a/libc/sysdeps/linux/sparc/bits/fcntl.h
-+++ b/libc/sysdeps/linux/sparc/bits/fcntl.h
-@@ -252,3 +252,5 @@ extern ssize_t tee (int __fdin, int __fdout, size_t __len,
- #endif
- __END_DECLS
- 
-+/* Include generic Linux declarations.  */
-+#include <bits/fcntl-linux.h>
-diff --git a/libc/sysdeps/linux/sparc64/bits/fcntl.h b/libc/sysdeps/linux/sparc64/bits/fcntl.h
-index 395c95baf..00e91a671 100644
---- a/libc/sysdeps/linux/sparc64/bits/fcntl.h
-+++ b/libc/sysdeps/linux/sparc64/bits/fcntl.h
-@@ -248,3 +248,5 @@ extern ssize_t tee (int __fdin, int __fdout, size_t __len,
- #endif
- __END_DECLS
- 
-+/* Include generic Linux declarations.  */
-+#include <bits/fcntl-linux.h>
-diff --git a/libc/sysdeps/linux/tile/bits/fcntl.h b/libc/sysdeps/linux/tile/bits/fcntl.h
-index 818da5c4a..28fda899d 100644
---- a/libc/sysdeps/linux/tile/bits/fcntl.h
-+++ b/libc/sysdeps/linux/tile/bits/fcntl.h
-@@ -229,3 +229,6 @@ extern ssize_t tee (int __fdin, int __fdout, size_t __len,
- 
- #endif
- __END_DECLS
-+
-+/* Include generic Linux declarations.  */
-+#include <bits/fcntl-linux.h>
-diff --git a/libc/sysdeps/linux/x86_64/bits/fcntl.h b/libc/sysdeps/linux/x86_64/bits/fcntl.h
-index 3547a2046..821b2e3cc 100644
---- a/libc/sysdeps/linux/x86_64/bits/fcntl.h
-+++ b/libc/sysdeps/linux/x86_64/bits/fcntl.h
-@@ -259,3 +259,5 @@ extern ssize_t tee (int __fdin, int __fdout, size_t __len,
- #endif
- __END_DECLS
- 
-+/* Include generic Linux declarations.  */
-+#include <bits/fcntl-linux.h>
-diff --git a/libc/sysdeps/linux/xtensa/bits/fcntl.h b/libc/sysdeps/linux/xtensa/bits/fcntl.h
-index 5af9d2124..9bc5fa893 100644
---- a/libc/sysdeps/linux/xtensa/bits/fcntl.h
-+++ b/libc/sysdeps/linux/xtensa/bits/fcntl.h
-@@ -245,3 +245,5 @@ extern ssize_t tee (int __fdin, int __fdout, size_t __len,
- #endif
- __END_DECLS
- 
-+/* Include generic Linux declarations.  */
-+#include <bits/fcntl-linux.h>
--- 
-2.30.2
-
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
