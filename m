Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0C45C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 08:50:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 46AE684B21;
	Sat, 23 Jul 2022 08:50:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 46AE684B21
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZNcmrXglYW1R; Sat, 23 Jul 2022 08:50:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 19E7C84B12;
	Sat, 23 Jul 2022 08:50:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 19E7C84B12
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 065891BF957
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 08:49:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E41FB83F65
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 08:49:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E41FB83F65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mzoicy2hm36A for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 08:49:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DF0C483F42
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 08:49:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF0C483F42
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 655CA842C0; Sat, 23 Jul 2022 08:36:12 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 10:34:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d7ec0f7e97019c9b198f49d8c46ed9ee95fab375
X-Git-Newrev: 67a1e8a5522f07c7a288847a1e7c684d565e675c
X-Patchwork-Hint: ignore
Message-Id: <20220723083612.655CA842C0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gnu-efi: bump to version 3.0.14
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

commit: https://git.buildroot.net/buildroot/commit/?id=67a1e8a5522f07c7a288847a1e7c684d565e675c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patch 0001-Make.defaults-don-t-override-ARCH-when-cross-compili.patch
is refreshed to accommodate with conflicting upstream changes.

Patch 0002-Revert-efilink-fix-build-with-gcc-4.8.patch is dropped as
it is upstream as of commit
8b2da2c2247af28bd681a9c8e3231559964c80a6 ("Revert "efilink: fix build
with gcc 4.8"").

A new patch is needed to fix the build on mips64.

While at it, fix the hash file to use the new spacing convention.

Fixes:

  http://autobuild.buildroot.net/results/a9a7372615e3fbe4b8abda946706d1ccadf28931/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...ts-don-t-override-ARCH-when-cross-compili.patch | 10 ++--
 ...002-Revert-efilink-fix-build-with-gcc-4.8.patch | 38 --------------
 ...also-support-__mips64-to-recognize-mips64.patch | 60 ++++++++++++++++++++++
 package/gnu-efi/gnu-efi.hash                       |  8 +--
 package/gnu-efi/gnu-efi.mk                         |  2 +-
 5 files changed, 70 insertions(+), 48 deletions(-)

diff --git a/package/gnu-efi/0001-Make.defaults-don-t-override-ARCH-when-cross-compili.patch b/package/gnu-efi/0001-Make.defaults-don-t-override-ARCH-when-cross-compili.patch
index c256541781..2eb9c5a062 100644
--- a/package/gnu-efi/0001-Make.defaults-don-t-override-ARCH-when-cross-compili.patch
+++ b/package/gnu-efi/0001-Make.defaults-don-t-override-ARCH-when-cross-compili.patch
@@ -1,4 +1,4 @@
-From 3452721eafae90749f4af63264c412f398460b15 Mon Sep 17 00:00:00 2001
+From b2dbeec5063265eb0121342c24a900a4888712a7 Mon Sep 17 00:00:00 2001
 From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 Date: Sun, 20 Jan 2019 21:07:11 +0100
 Subject: [PATCH] Make.defaults: don't override ARCH when cross-compiling
@@ -15,18 +15,18 @@ Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Make.defaults b/Make.defaults
-index ba743f1..a0e5632 100755
+index 47ed361..7420344 100755
 --- a/Make.defaults
 +++ b/Make.defaults
 @@ -67,7 +67,7 @@ ARCH         ?= $(shell $(HOSTCC) -dumpmachine | cut -f1 -d- | sed -e s,i[345678
  
  # Get ARCH from the compiler if cross compiling 
  ifneq ($(CROSS_COMPILE),)
--  override ARCH := $(shell $(CC) -dumpmachine | cut -f1 -d-| sed -e s,i[3456789]86,ia32, -e 's,armv7.*,arm,' )
-+  ARCH := $(shell $(CC) -dumpmachine | cut -f1 -d-| sed -e s,i[3456789]86,ia32, -e 's,armv7.*,arm,' )
+-  override ARCH := $(shell $(CC) -dumpmachine | cut -f1 -d-| sed -e s,i[3456789]86,ia32, -e 's,armv[67].*,arm,' )
++  ARCH := $(shell $(CC) -dumpmachine | cut -f1 -d-| sed -e s,i[3456789]86,ia32, -e 's,armv[67].*,arm,' )
  endif
  
  # FreeBSD (and possibly others) reports amd64 instead of x86_64
 -- 
-2.14.1
+2.36.1
 
diff --git a/package/gnu-efi/0002-Revert-efilink-fix-build-with-gcc-4.8.patch b/package/gnu-efi/0002-Revert-efilink-fix-build-with-gcc-4.8.patch
deleted file mode 100644
index 5a08c24254..0000000000
--- a/package/gnu-efi/0002-Revert-efilink-fix-build-with-gcc-4.8.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 1f7b2e5bd6603b30202a66b6317a41e2be85742b Mon Sep 17 00:00:00 2001
-From: Esben Haabendal <esben@haabendal.dk>
-Date: Tue, 26 Mar 2019 13:37:02 +0100
-Subject: [PATCH] Revert "efilink: fix build with gcc 4.8"
-
-This reverts commit 6335e5c697c57d8b5854b8202de3733bcb151ca6, as it breaks
-gcc builds with '-nostdinc' flag.
-
-The fix in 1a53d8f88a452847b25f9689f9a08dbcf82c86e4
-(Fix for problem with undeclared intptr_t type), which is also merged
-fixes the same problem, without causing breakage.
-
-Signed-off-by: Esben Haabendal <esben@haabendal.dk>
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-[Upstream status:
-https://sourceforge.net/p/gnu-efi/code/merge-requests/6/]
----
- inc/efilink.h | 4 ----
- 1 file changed, 4 deletions(-)
-
-diff --git a/inc/efilink.h b/inc/efilink.h
-index b69a6fd..cc5aa2d 100644
---- a/inc/efilink.h
-+++ b/inc/efilink.h
-@@ -1,10 +1,6 @@
- #ifndef _EFI_LINK_H
- #define _EFI_LINK_H
- 
--#if defined(__GNUC__)
--#include <stdint.h>
--#endif
--
- /*++
- 
- Copyright (c) 1998  Intel Corporation
--- 
-2.20.1
-
diff --git a/package/gnu-efi/0002-inc-efi-.h-also-support-__mips64-to-recognize-mips64.patch b/package/gnu-efi/0002-inc-efi-.h-also-support-__mips64-to-recognize-mips64.patch
new file mode 100644
index 0000000000..818dd1d7f6
--- /dev/null
+++ b/package/gnu-efi/0002-inc-efi-.h-also-support-__mips64-to-recognize-mips64.patch
@@ -0,0 +1,60 @@
+From 2c0ad0d7547558be59ef10dd289e619373341704 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Thu, 21 Jul 2022 09:47:49 +0200
+Subject: [PATCH] inc/efi*.h: also support __mips64 to recognize mips64
+
+gcc built-in define for the MIPS64 architecture is __mips64, not
+__mips64__, so the current condition did not match for gcc. See
+https://gcc.gnu.org/git/?p=gcc.git;a=blob;f=gcc/config/mips/mips.h;h=47aac9d3d61245c4d3df5dbd0bbcd833190de7c3;hb=2d280e7eafc086e9df85f50ed1a6526d6a3a204d#l431
+in the gcc source.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Upstream: https://sourceforge.net/p/gnu-efi/mailman/message/37683797/
+---
+ inc/efi.h      | 2 +-
+ inc/efilib.h   | 2 +-
+ inc/efirtlib.h | 2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/inc/efi.h b/inc/efi.h
+index 43c832e..b193932 100644
+--- a/inc/efi.h
++++ b/inc/efi.h
+@@ -48,7 +48,7 @@ Revision History
+ #include "aarch64/efibind.h"
+ #elif defined (_M_ARM) || defined(__arm__)
+ #include "arm/efibind.h"
+-#elif defined (_M_MIPS64) || defined(__mips64__)
++#elif defined (_M_MIPS64) || defined(__mips64__) || defined(__mips64)
+ #include "mips64el/efibind.h"
+ #elif defined (__riscv) && __riscv_xlen == 64
+ #include "riscv64/efibind.h"
+diff --git a/inc/efilib.h b/inc/efilib.h
+index 9f748ad..a2b39b2 100644
+--- a/inc/efilib.h
++++ b/inc/efilib.h
+@@ -31,7 +31,7 @@ Revision History
+ #include "aarch64/efilibplat.h"
+ #elif defined (_M_ARM) || defined(__arm__)
+ #include "arm/efilibplat.h"
+-#elif defined (_M_MIPS64) || defined(__mips64__)
++#elif defined (_M_MIPS64) || defined(__mips64__) || defined(__mips64)
+ #include "mips64el/efilibplat.h"
+ #elif defined (__riscv) && __riscv_xlen == 64
+ #include "riscv64/efilibplat.h"
+diff --git a/inc/efirtlib.h b/inc/efirtlib.h
+index 8643061..518859e 100644
+--- a/inc/efirtlib.h
++++ b/inc/efirtlib.h
+@@ -30,7 +30,7 @@ Revision History
+ #include "aarch64/efilibplat.h"
+ #elif defined (_M_ARM) || defined(__arm__)
+ #include "arm/efilibplat.h"
+-#elif defined (_M_MIPS64) || defined(__mips64__)
++#elif defined (_M_MIPS64) || defined(__mips64__) || defined(__mips64)
+ #include "mips64el/efilibplat.h"
+ #elif defined (__riscv) && __riscv_xlen == 64
+ #include "riscv64/efilibplat.h"
+-- 
+2.36.1
+
diff --git a/package/gnu-efi/gnu-efi.hash b/package/gnu-efi/gnu-efi.hash
index bf9792b290..599d234436 100644
--- a/package/gnu-efi/gnu-efi.hash
+++ b/package/gnu-efi/gnu-efi.hash
@@ -1,6 +1,6 @@
 # From http://sourceforge.net/projects/gnu-efi/files
-md5 960a8379b6f95ee73d7778b70bf2a089 gnu-efi-3.0.10.tar.bz2
-sha1 a51b81eda97c0acbf3ac86123f298d3c0e396ce5 gnu-efi-3.0.10.tar.bz2
+md5  e2902ad09d53d7a94dc96a449dbb4058  gnu-efi-3.0.14.tar.bz2
+sha1  e46b3726478838e85d0a79d0a0d3508c4f2995cf  gnu-efi-3.0.14.tar.bz2
 # Locally computed
-sha256 f12082a3a5f0c3e38c67262a9f34245d139ac2cdfc0a0bdcf03c9b1f56fa4fed  gnu-efi-3.0.10.tar.bz2
-sha256 42d352e9c28dd446fd0209cd6f75588c8e41f0934540bb382bbd61c752360265  README.efilib
+sha256  b73b643a0d5697d1f396d7431448e886dd805668789578e3e1a28277c9528435  gnu-efi-3.0.14.tar.bz2
+sha256  42d352e9c28dd446fd0209cd6f75588c8e41f0934540bb382bbd61c752360265  README.efilib
diff --git a/package/gnu-efi/gnu-efi.mk b/package/gnu-efi/gnu-efi.mk
index 06bf254738..13e925302d 100644
--- a/package/gnu-efi/gnu-efi.mk
+++ b/package/gnu-efi/gnu-efi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNU_EFI_VERSION = 3.0.10
+GNU_EFI_VERSION = 3.0.14
 GNU_EFI_SOURCE = gnu-efi-$(GNU_EFI_VERSION).tar.bz2
 GNU_EFI_SITE = http://downloads.sourceforge.net/project/gnu-efi
 GNU_EFI_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
