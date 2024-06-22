Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2FD0C27C53
	for <buildroot@archiver.kernel.org>; Sat, 22 Jun 2024 17:40:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0A0F1400DD;
	Sat, 22 Jun 2024 17:40:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rmCxh-X8LRvh; Sat, 22 Jun 2024 17:40:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC7FC405C1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CC7FC405C1;
	Sat, 22 Jun 2024 17:40:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BE2CB1BF5DB
 for <buildroot@lists.busybox.net>; Sat, 22 Jun 2024 17:40:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B778F4056F
 for <buildroot@lists.busybox.net>; Sat, 22 Jun 2024 17:40:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5nvZGFw7WDMq for <buildroot@lists.busybox.net>;
 Sat, 22 Jun 2024 17:40:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7FEFA40563
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7FEFA40563
 for <buildroot@buildroot.org>; Sat, 22 Jun 2024 17:40:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 625077FC34; Sat, 22 Jun 2024 17:40:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 22 Jun 2024 19:38:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 50bdb2a3b7ace71065dc0b8a81bebc173f84a8c4
X-Git-Newrev: 127ddbe5118f68395c0305fb9ff44342bfc1d64b
X-Patchwork-Hint: ignore
Message-Id: <20240622174039.625077FC34@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uclibc: update to 1.0.49
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=127ddbe5118f68395c0305fb9ff44342bfc1d64b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

git shortlog v1.0.49...v1.0.48
Dmitry Chestnykh (6):
      Correct uClibc compilation.
      Fix uClibc build for nds32 with gcc-14.
      Fix riscv32 build with gcc-14.
      riscv32: Fix `struct ucontext` definition.
      Fix wrong `struct ucontext_t` typedef for all arches.
      Cast to proper types inside atomic macroses.

Fabrice Fontaine (1):
      libc/sysdeps/linux/common/utime.c: fix riscv32 build

Joe Damato (1):
      epoll.h: Add epoll ioctls

Max Filippov (9):
      iconv: fix type mismatches
      ldso: FDPIC: fix type mismatches
      ldso: arm: fix build with gcc-14
      malloc/memalign: avoid integer overflow
      fix kernel_stat64 definition
      linuxthreads: enable unwinding over signal frames
      xtensa: use compiler-provided XCHAL macros
      xtensa: make _init and _fini hidden
      xtensa: add FDPIC support

Waldemar Brodkorb (9):
      futimesat: add missing header
      sparc64: Fix incorrect sigreturn stub function implementation
      csky: allow time64
      m68k: fix noMMU ELF compile with gcc 14.x
      Revert "nds32: sync with binutils 2.37, gcc 11.2 and linux 5.10.93 changes"
      m68k: fix for m68000 cpu
      config: make ctor/dtor visible again
      config: enable TIME64 by default
      bump version for 1.0.49 release

Yuriy Kolerov (1):
      libc: cast free() argument to void * in wchar.c

Patches applied upstream.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../uclibc/0001-futimesat-add-missing-header.patch | 26 ----------------
 .../uclibc/0002-fix-kernel_stat64-definition.patch | 35 ----------------------
 package/uclibc/uclibc.hash                         |  4 +--
 package/uclibc/uclibc.mk                           |  2 +-
 4 files changed, 3 insertions(+), 64 deletions(-)

diff --git a/package/uclibc/0001-futimesat-add-missing-header.patch b/package/uclibc/0001-futimesat-add-missing-header.patch
deleted file mode 100644
index f8af3290fa..0000000000
--- a/package/uclibc/0001-futimesat-add-missing-header.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 4bcf25e75df857806623ff80924675bf849a60d2 Mon Sep 17 00:00:00 2001
-From: Waldemar Brodkorb <wbx@openadk.org>
-Date: Wed, 8 May 2024 10:08:08 +0200
-Subject: [PATCH] futimesat: add missing header
-
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-Upstream: https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?id=4bcf25e75df857806623ff80924675bf849a60d2
----
- libc/sysdeps/linux/common/futimesat.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/libc/sysdeps/linux/common/futimesat.c b/libc/sysdeps/linux/common/futimesat.c
-index fd19fea7c..bf36550dd 100644
---- a/libc/sysdeps/linux/common/futimesat.c
-+++ b/libc/sysdeps/linux/common/futimesat.c
-@@ -7,6 +7,7 @@
-  */
- 
- #include <sys/syscall.h>
-+#include <sys/stat.h>
- #include <sys/time.h>
- 
- #ifdef __NR_futimesat
--- 
-2.30.2
-
diff --git a/package/uclibc/0002-fix-kernel_stat64-definition.patch b/package/uclibc/0002-fix-kernel_stat64-definition.patch
deleted file mode 100644
index 5a87586af8..0000000000
--- a/package/uclibc/0002-fix-kernel_stat64-definition.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 186878405324e96f61d896a149f623e0c792c972 Mon Sep 17 00:00:00 2001
-From: Max Filippov <jcmvbkbc@gmail.com>
-Date: Tue, 14 May 2024 23:18:56 -0700
-Subject: [PATCH] fix kernel_stat64 definition
-
-The commit 74ca8d6f5d2e ("remove UCLIBC_HAS_LFS") removed conditional
-compilation dependent on __UCLIBC_HAS_LFS__, assuming it to be always
-defined, but removed the wrong branch in the definition of
-kernel_stat64.
-Fix kernel_stat64 definition to be stat64.
-
-Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
-Tested-by: Chris Packham <judge.packham@gmail.com>
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-Upstream: https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?id=186878405324e96f61d896a149f623e0c792c972
----
- libc/sysdeps/linux/common-generic/bits/kernel_stat.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libc/sysdeps/linux/common-generic/bits/kernel_stat.h b/libc/sysdeps/linux/common-generic/bits/kernel_stat.h
-index 7a97bb4d7..e874a4a9f 100644
---- a/libc/sysdeps/linux/common-generic/bits/kernel_stat.h
-+++ b/libc/sysdeps/linux/common-generic/bits/kernel_stat.h
-@@ -18,7 +18,7 @@
-  * However that requires more #ifndef in relevant wrappers,
-  * further uglifying them
-  */
--#define kernel_stat64	stat
-+#define kernel_stat64	stat64
- 
- #endif	/*  _BITS_STAT_STRUCT_H */
- 
--- 
-2.30.2
-
diff --git a/package/uclibc/uclibc.hash b/package/uclibc/uclibc.hash
index 7097bbf99a..1067ea9b0f 100644
--- a/package/uclibc/uclibc.hash
+++ b/package/uclibc/uclibc.hash
@@ -1,4 +1,4 @@
-# From https://downloads.uclibc-ng.org/releases/1.0.47/uClibc-ng-1.0.48.tar.xz.sha256
-sha256  3bf5fc6cc5cbc454b6c478424755c6f71e7c15578a2c966f02606aa5c5596e21  uClibc-ng-1.0.48.tar.xz
+# From https://downloads.uclibc-ng.org/releases/1.0.49/uClibc-ng-1.0.49.tar.xz.sha256
+sha256  340f9d5dd1159c69c3380654e39e567cbb304afcd3f9dfa2e9833f0fa13f5bbe  uClibc-ng-1.0.49.tar.xz
 # Locally calculated
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING.LIB
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index b7aba27b00..31f9899f00 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UCLIBC_VERSION = 1.0.48
+UCLIBC_VERSION = 1.0.49
 UCLIBC_SOURCE = uClibc-ng-$(UCLIBC_VERSION).tar.xz
 UCLIBC_SITE = https://downloads.uclibc-ng.org/releases/$(UCLIBC_VERSION)
 UCLIBC_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
