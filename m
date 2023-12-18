Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27445C35274
	for <buildroot@archiver.kernel.org>; Mon, 18 Dec 2023 16:51:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D0CA040018;
	Mon, 18 Dec 2023 16:51:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D0CA040018
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VQe7MSnawOqW; Mon, 18 Dec 2023 16:51:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1C10A402DC;
	Mon, 18 Dec 2023 16:51:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C10A402DC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 939E51BF3E8
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 16:51:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6CB6260E36
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 16:51:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6CB6260E36
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7DqAHnkHW19h for <buildroot@lists.busybox.net>;
 Mon, 18 Dec 2023 16:51:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2C5B360A7E
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 16:51:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C5B360A7E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 141C487BE0; Mon, 18 Dec 2023 16:51:06 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 18 Dec 2023 17:50:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6985955a69b87b20e952c3c8cfc48ce2511100be
X-Git-Newrev: 3c207c40eb0215cb51a756f94c755e31c72d0734
X-Patchwork-Hint: ignore
Message-Id: <20231218165106.141C487BE0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uclibc: update to 1.0.45
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
Content-Type: multipart/mixed; boundary="===============4332170113439450787=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4332170113439450787==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=3c207c40eb0215cb51a756f94c755e31c72d0734
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Git shortlog:

Ben Wolsieffer (3):
      fork: generate stub on no-MMU systems
      arm: elf-fdpic.h: avoid void pointer subtraction
      libpthread/nptl: make default stack size configurable

Greg Ungerer (1):
      elf: support ELF binaries in noMMU

Marcus Haehnel (3):
      fnmatch: fix possible access beyond of parameter string
      getaddrinfo.c: Avoid misleading indentation warning
      linuxthreads: Avoid unused variable warning

Marcus Hähnel (1):
      setjmp.h: Fix C++ build and avoid duplicate throw declaration

Max Filippov (1):
      daemon.c: make _fork_parent static inline again

Paul Iannetta (1):
      kvx: fix asm syntax

Pavel Kozlov (6):
      setrlimit/getrlimit: fix prlimit64 syscall use for 32-bit CPUs
      Fix -Warray-parameter warning for __sigsetjmp
      prlimit: add name redirection and fix incorrect parameters to syscall
      arc: add acq/rel variants for atomic cmpxchg/xchg
      arc: remove read ahead in asm strcmp code for ARCHS
      rlimit: fix 64-bit RLIM64_INFINITY macro

Waldemar Brodkorb (8):
      aarch64: add hwcap header file
      fcntl.h: declare f_owner_ex for all architectures
      arm: add hwcap header file
      lm32: disable ctor/dtor
      aarch64: disable lazy relocations
      riscv64: define __NR_riscv_flush_icache if not available
      depend on __UCLIBC_HAVE_STATX__
      bump version for 1.0.45 release

Yann Sionneau (9):
      fstatat64: define it as a wrapper of statx if the kernel does not support fstatat64 syscall
      fstat: add missing return value statement for the statx wrapping case
      add support for systems without legacy setrlimit/getrlimit syscalls
      fstatat: add wrapper that uses statx for non-legacy arch
      kvx: add support for kv3-2 (Coolidge v2 SoC)
      kvx: atomic: rework using compiler builtins
      kvx: align specification of user regs
      kvx: define that kvx port supports statx syscall
      kvx: use a custom stat.h header

lordrasmus (8):
      add vsdo support
      fix file permissions
      fix getauxval() on aarch64 gcc 11
      vdso support missing file
      c6x compile fix vdso support
      gettimeofday() only include ldso.h if vdso support is activated
      vdso support for x86_64
      gitignore

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../0001-aarch64-add-hwcap-header-file.patch       | 163 ---------------------
 ...-declare-f_owner_ex-for-all-architectures.patch |  85 -----------
 package/uclibc/uclibc.hash                         |   4 +-
 package/uclibc/uclibc.mk                           |   2 +-
 4 files changed, 3 insertions(+), 251 deletions(-)

diff --git a/package/uclibc/0001-aarch64-add-hwcap-header-file.patch b/package/uclibc/0001-aarch64-add-hwcap-header-file.patch
deleted file mode 100644
index 058e3242f9..0000000000
--- a/package/uclibc/0001-aarch64-add-hwcap-header-file.patch
+++ /dev/null
@@ -1,163 +0,0 @@
-From becd0cbc4168534e311f47dda6f67450ad0006b5 Mon Sep 17 00:00:00 2001
-From: Waldemar Brodkorb <wbx@openadk.org>
-Date: Tue, 8 Aug 2023 13:47:27 +0200
-Subject: [PATCH] aarch64: add hwcap header file
-
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-Upstream: https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?id=becd0cbc4168534e311f47dda6f67450ad0006b5
----
- include/sys/auxv.h                      |  1 +
- libc/sysdeps/linux/aarch64/bits/hwcap.h | 99 +++++++++++++++++++++++++
- libc/sysdeps/linux/common/bits/hwcap.h  | 22 ++++++
- 3 files changed, 122 insertions(+)
- create mode 100644 libc/sysdeps/linux/aarch64/bits/hwcap.h
- create mode 100644 libc/sysdeps/linux/common/bits/hwcap.h
-
-diff --git a/include/sys/auxv.h b/include/sys/auxv.h
-index f35196423..b07026457 100644
---- a/include/sys/auxv.h
-+++ b/include/sys/auxv.h
-@@ -20,6 +20,7 @@
- 
- #include <features.h>
- #include <elf.h>
-+#include <bits/hwcap.h>
- 
- __BEGIN_DECLS
- 
-diff --git a/libc/sysdeps/linux/aarch64/bits/hwcap.h b/libc/sysdeps/linux/aarch64/bits/hwcap.h
-new file mode 100644
-index 000000000..20061f5d1
---- /dev/null
-+++ b/libc/sysdeps/linux/aarch64/bits/hwcap.h
-@@ -0,0 +1,99 @@
-+/* Defines for bits in AT_HWCAP.  AArch64 Linux version.
-+   Copyright (C) 2016-2023 Free Software Foundation, Inc.
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
-+#if !defined (_SYS_AUXV_H)
-+# error "Never include <bits/hwcap.h> directly; use <sys/auxv.h> instead."
-+#endif
-+
-+/* The following must match the kernel's <asm/hwcap.h> and update the
-+   list together with sysdeps/unix/sysv/linux/aarch64/dl-procinfo.c.  */
-+#define HWCAP_FP		(1 << 0)
-+#define HWCAP_ASIMD		(1 << 1)
-+#define HWCAP_EVTSTRM		(1 << 2)
-+#define HWCAP_AES		(1 << 3)
-+#define HWCAP_PMULL		(1 << 4)
-+#define HWCAP_SHA1		(1 << 5)
-+#define HWCAP_SHA2		(1 << 6)
-+#define HWCAP_CRC32		(1 << 7)
-+#define HWCAP_ATOMICS		(1 << 8)
-+#define HWCAP_FPHP		(1 << 9)
-+#define HWCAP_ASIMDHP		(1 << 10)
-+#define HWCAP_CPUID		(1 << 11)
-+#define HWCAP_ASIMDRDM		(1 << 12)
-+#define HWCAP_JSCVT		(1 << 13)
-+#define HWCAP_FCMA		(1 << 14)
-+#define HWCAP_LRCPC		(1 << 15)
-+#define HWCAP_DCPOP		(1 << 16)
-+#define HWCAP_SHA3		(1 << 17)
-+#define HWCAP_SM3		(1 << 18)
-+#define HWCAP_SM4		(1 << 19)
-+#define HWCAP_ASIMDDP		(1 << 20)
-+#define HWCAP_SHA512		(1 << 21)
-+#define HWCAP_SVE		(1 << 22)
-+#define HWCAP_ASIMDFHM		(1 << 23)
-+#define HWCAP_DIT		(1 << 24)
-+#define HWCAP_USCAT		(1 << 25)
-+#define HWCAP_ILRCPC		(1 << 26)
-+#define HWCAP_FLAGM		(1 << 27)
-+#define HWCAP_SSBS		(1 << 28)
-+#define HWCAP_SB		(1 << 29)
-+#define HWCAP_PACA		(1 << 30)
-+#define HWCAP_PACG		(1UL << 31)
-+
-+#define HWCAP2_DCPODP		(1 << 0)
-+#define HWCAP2_SVE2		(1 << 1)
-+#define HWCAP2_SVEAES		(1 << 2)
-+#define HWCAP2_SVEPMULL		(1 << 3)
-+#define HWCAP2_SVEBITPERM	(1 << 4)
-+#define HWCAP2_SVESHA3		(1 << 5)
-+#define HWCAP2_SVESM4		(1 << 6)
-+#define HWCAP2_FLAGM2		(1 << 7)
-+#define HWCAP2_FRINT		(1 << 8)
-+#define HWCAP2_SVEI8MM		(1 << 9)
-+#define HWCAP2_SVEF32MM		(1 << 10)
-+#define HWCAP2_SVEF64MM		(1 << 11)
-+#define HWCAP2_SVEBF16		(1 << 12)
-+#define HWCAP2_I8MM		(1 << 13)
-+#define HWCAP2_BF16		(1 << 14)
-+#define HWCAP2_DGH		(1 << 15)
-+#define HWCAP2_RNG		(1 << 16)
-+#define HWCAP2_BTI		(1 << 17)
-+#define HWCAP2_MTE		(1 << 18)
-+#define HWCAP2_ECV		(1 << 19)
-+#define HWCAP2_AFP		(1 << 20)
-+#define HWCAP2_RPRES		(1 << 21)
-+#define HWCAP2_MTE3		(1 << 22)
-+#define HWCAP2_SME		(1 << 23)
-+#define HWCAP2_SME_I16I64	(1 << 24)
-+#define HWCAP2_SME_F64F64	(1 << 25)
-+#define HWCAP2_SME_I8I32	(1 << 26)
-+#define HWCAP2_SME_F16F32	(1 << 27)
-+#define HWCAP2_SME_B16F32	(1 << 28)
-+#define HWCAP2_SME_F32F32	(1 << 29)
-+#define HWCAP2_SME_FA64		(1 << 30)
-+#define HWCAP2_WFXT		(1UL << 31)
-+#define HWCAP2_EBF16		(1UL << 32)
-+#define HWCAP2_SVE_EBF16	(1UL << 33)
-+#define HWCAP2_CSSC		(1UL << 34)
-+#define HWCAP2_RPRFM		(1UL << 35)
-+#define HWCAP2_SVE2P1		(1UL << 36)
-+#define HWCAP2_SME2		(1UL << 37)
-+#define HWCAP2_SME2P1		(1UL << 38)
-+#define HWCAP2_SME_I16I32	(1UL << 39)
-+#define HWCAP2_SME_BI32I32	(1UL << 40)
-+#define HWCAP2_SME_B16B16	(1UL << 41)
-+#define HWCAP2_SME_F16F16	(1UL << 42)
-diff --git a/libc/sysdeps/linux/common/bits/hwcap.h b/libc/sysdeps/linux/common/bits/hwcap.h
-new file mode 100644
-index 000000000..e7b899df0
---- /dev/null
-+++ b/libc/sysdeps/linux/common/bits/hwcap.h
-@@ -0,0 +1,22 @@
-+/* Defines for bits in AT_HWCAP.
-+   Copyright (C) 2012-2023 Free Software Foundation, Inc.
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
-+#ifndef _SYS_AUXV_H
-+# error "Never include <bits/hwcap.h> directly; use <sys/auxv.h> instead."
-+#endif
-+
-+/* No bits defined for this architecture.  */
--- 
-2.30.2
-
diff --git a/package/uclibc/0002-fcntl.h-declare-f_owner_ex-for-all-architectures.patch b/package/uclibc/0002-fcntl.h-declare-f_owner_ex-for-all-architectures.patch
deleted file mode 100644
index da0135a5e3..0000000000
--- a/package/uclibc/0002-fcntl.h-declare-f_owner_ex-for-all-architectures.patch
+++ /dev/null
@@ -1,85 +0,0 @@
-From 98576ab8de710507419b016fbcfc82ed7c57f9c3 Mon Sep 17 00:00:00 2001
-From: Waldemar Brodkorb <wbx@openadk.org>
-Date: Wed, 9 Aug 2023 10:31:28 +0200
-Subject: [PATCH] fcntl.h: declare f_owner_ex for all architectures
-
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-Upstream: https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?id=98576ab8de710507419b016fbcfc82ed7c57f9c3
----
- include/fcntl.h                         | 20 ++++++++++++++++++++
- libc/sysdeps/linux/aarch64/bits/fcntl.h | 21 ---------------------
- 2 files changed, 20 insertions(+), 21 deletions(-)
-
-diff --git a/include/fcntl.h b/include/fcntl.h
-index 136f64d70..ce15ceaf6 100644
---- a/include/fcntl.h
-+++ b/include/fcntl.h
-@@ -296,6 +296,26 @@ int name_to_handle_at(int dirfd, const char *pathname,
- int open_by_handle_at(int mount_fd, struct file_handle *handle, int flags);
- #endif
- 
-+#ifdef __USE_GNU
-+# define F_SETOWN_EX	15	/* Get owner (thread receiving SIGIO).  */
-+# define F_GETOWN_EX	16	/* Set owner (thread receiving SIGIO).  */
-+/* Owner types.  */
-+enum __pid_type
-+  {
-+    F_OWNER_TID = 0,		/* Kernel thread.  */
-+    F_OWNER_PID,		/* Process.  */
-+    F_OWNER_PGRP,		/* Process group.  */
-+    F_OWNER_GID = F_OWNER_PGRP	/* Alternative, obsolete name.  */
-+  };
-+
-+/* Structure to use with F_GETOWN_EX and F_SETOWN_EX.  */
-+struct f_owner_ex
-+  {
-+    enum __pid_type type;	/* Owner type of ID.  */
-+    __pid_t pid;		/* ID of owner.  */
-+  };
-+#endif
-+
- __END_DECLS
- 
- #endif /* fcntl.h  */
-diff --git a/libc/sysdeps/linux/aarch64/bits/fcntl.h b/libc/sysdeps/linux/aarch64/bits/fcntl.h
-index c143ba9c9..dbe929351 100644
---- a/libc/sysdeps/linux/aarch64/bits/fcntl.h
-+++ b/libc/sysdeps/linux/aarch64/bits/fcntl.h
-@@ -94,8 +94,6 @@
- #ifdef __USE_GNU
- # define F_SETSIG	10	/* Set number of signal to be sent.  */
- # define F_GETSIG	11	/* Get number of signal to be sent.  */
--# define F_SETOWN_EX	15	/* Get owner (thread receiving SIGIO).  */
--# define F_GETOWN_EX	16	/* Set owner (thread receiving SIGIO).  */
- #endif
- 
- 
-@@ -170,25 +168,6 @@ struct flock64
-   };
- #endif
- 
--
--#ifdef __USE_GNU
--/* Owner types.  */
--enum __pid_type
--  {
--    F_OWNER_TID = 0,		/* Kernel thread.  */
--    F_OWNER_PID,		/* Process.  */
--    F_OWNER_PGRP,		/* Process group.  */
--    F_OWNER_GID = F_OWNER_PGRP	/* Alternative, obsolete name.  */
--  };
--
--/* Structure to use with F_GETOWN_EX and F_SETOWN_EX.  */
--struct f_owner_ex
--  {
--    enum __pid_type type;	/* Owner type of ID.  */
--    __pid_t pid;		/* ID of owner.  */
--  };
--#endif
--
- /* Define some more compatibility macros to be backward compatible with
-    BSD systems which did not managed to hide these kernel macros.  */
- #ifdef	__USE_BSD
--- 
-2.30.2
-
diff --git a/package/uclibc/uclibc.hash b/package/uclibc/uclibc.hash
index 8d87c04383..ae1f3178d9 100644
--- a/package/uclibc/uclibc.hash
+++ b/package/uclibc/uclibc.hash
@@ -1,4 +1,4 @@
-# From https://downloads.uclibc-ng.org/releases/1.0.44/uClibc-ng-1.0.44.tar.xz.sha256
-sha256  7df9d987955827382f1c2400da513456becbb6f868bdfd37737265f1cbeec994  uClibc-ng-1.0.44.tar.xz
+# From https://downloads.uclibc-ng.org/releases/1.0.44/uClibc-ng-1.0.45.tar.xz.sha256
+sha256  c2f4c6b6e19d7c9c226992a3746efd7ab932040463c15ee0bc8f4132b5777ac4  uClibc-ng-1.0.45.tar.xz
 # Locally calculated
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING.LIB
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 4e7d8de643..88623840bf 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UCLIBC_VERSION = 1.0.44
+UCLIBC_VERSION = 1.0.45
 UCLIBC_SOURCE = uClibc-ng-$(UCLIBC_VERSION).tar.xz
 UCLIBC_SITE = https://downloads.uclibc-ng.org/releases/$(UCLIBC_VERSION)
 UCLIBC_LICENSE = LGPL-2.1+

--===============4332170113439450787==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4332170113439450787==--
