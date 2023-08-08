Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81166C001B0
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 15:06:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1017160792;
	Tue,  8 Aug 2023 15:06:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1017160792
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tB-zdrxLt9zI; Tue,  8 Aug 2023 15:06:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE8FA60FD0;
	Tue,  8 Aug 2023 15:06:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE8FA60FD0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 605991BF37C
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 15:06:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4329C40BCB
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 15:06:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4329C40BCB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M8jmdWV5SLdL for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 15:06:23 +0000 (UTC)
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3A9594044A
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 15:06:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A9594044A
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 69D78352BD69; Tue,  8 Aug 2023 17:06:20 +0200 (CEST)
Date: Tue, 8 Aug 2023 17:06:20 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZNJZ7Huyn6K+Pgwy@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-21-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1691507180; bh=E9aHxZ1yXHiseTAGl+vLAi6OW915KKyhLzgHTendXSA=;
 h=Date:From:To:Subject:From;
 b=KaU/jlSn2Gryh8f+DnMBTruFgXGFyKfq1bIxuL0xMFoQcUyLgyLuokPEAp8T6Jue7
 9VMjKyp7fYfAR95dQGl+TRh+8WcnGd2XAnM+QTJytaj8g1I+316PbbqUWMVJAlPs8W
 06DfkswAiewy1OisPCvdpdSy46mClLjc96A6RBr/xzRyVnLR/t36h7T63UVrNF9OIK
 5BbFWynYUnuUHondzn+I3OgZvqUpTs8HJWCde9T01yxDRkeyCYJyby6slTof0IAMTv
 j1UaC80uBY4p38JRG/4Da9vNJQOSDeS1Y9RpgiVqZ7SC4yKt+7xaZSDzNkXS/yptFS
 oiTvgKOppOBmQ==
Subject: [Buildroot] [PATCH v3] package/uclibc: update to 1.0.44
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- mostly stability improvements
- patch is included so remove it
- add a hotfix for aarch64 missing hwcap header

Fixes:
 - http://autobuild.buildroot.net/results/823/823aac32b0ff365ebb3d99073f34276362a2c530
 - http://autobuild.buildroot.net/results/0eb/0eb921e07a3d13bd76e76ab6bafad3a13632f8bf
 - http://autobuild.buildroot.net/results/f4f/f4f37179a732d1bd4a31c929608a963f291e21a2

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
v1 -> v2:                                                                                                                                                                                                           
 - add Fixes for haveged and stress-ng
v2 -> v3:
 - add a patch to fix glorytun compile when using aarch64
---
 .../0001-aarch64-add-hwcap-header-file.patch  | 163 ++++++++++++++++++
 .../0001-gettimeofday-fix-static-build.patch  |  29 ----
 package/uclibc/uclibc.hash                    |   4 +-
 package/uclibc/uclibc.mk                      |   2 +-
 4 files changed, 166 insertions(+), 32 deletions(-)
 create mode 100644 package/uclibc/0001-aarch64-add-hwcap-header-file.patch
 delete mode 100644 package/uclibc/0001-gettimeofday-fix-static-build.patch

diff --git a/package/uclibc/0001-aarch64-add-hwcap-header-file.patch b/package/uclibc/0001-aarch64-add-hwcap-header-file.patch
new file mode 100644
index 0000000000..058e3242f9
--- /dev/null
+++ b/package/uclibc/0001-aarch64-add-hwcap-header-file.patch
@@ -0,0 +1,163 @@
+From becd0cbc4168534e311f47dda6f67450ad0006b5 Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Tue, 8 Aug 2023 13:47:27 +0200
+Subject: [PATCH] aarch64: add hwcap header file
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+Upstream: https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?id=becd0cbc4168534e311f47dda6f67450ad0006b5
+---
+ include/sys/auxv.h                      |  1 +
+ libc/sysdeps/linux/aarch64/bits/hwcap.h | 99 +++++++++++++++++++++++++
+ libc/sysdeps/linux/common/bits/hwcap.h  | 22 ++++++
+ 3 files changed, 122 insertions(+)
+ create mode 100644 libc/sysdeps/linux/aarch64/bits/hwcap.h
+ create mode 100644 libc/sysdeps/linux/common/bits/hwcap.h
+
+diff --git a/include/sys/auxv.h b/include/sys/auxv.h
+index f35196423..b07026457 100644
+--- a/include/sys/auxv.h
++++ b/include/sys/auxv.h
+@@ -20,6 +20,7 @@
+ 
+ #include <features.h>
+ #include <elf.h>
++#include <bits/hwcap.h>
+ 
+ __BEGIN_DECLS
+ 
+diff --git a/libc/sysdeps/linux/aarch64/bits/hwcap.h b/libc/sysdeps/linux/aarch64/bits/hwcap.h
+new file mode 100644
+index 000000000..20061f5d1
+--- /dev/null
++++ b/libc/sysdeps/linux/aarch64/bits/hwcap.h
+@@ -0,0 +1,99 @@
++/* Defines for bits in AT_HWCAP.  AArch64 Linux version.
++   Copyright (C) 2016-2023 Free Software Foundation, Inc.
++
++   The GNU C Library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public
++   License as published by the Free Software Foundation; either
++   version 2.1 of the License, or (at your option) any later version.
++
++   The GNU C Library is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with the GNU C Library; if not, see
++   <https://www.gnu.org/licenses/>.  */
++
++#if !defined (_SYS_AUXV_H)
++# error "Never include <bits/hwcap.h> directly; use <sys/auxv.h> instead."
++#endif
++
++/* The following must match the kernel's <asm/hwcap.h> and update the
++   list together with sysdeps/unix/sysv/linux/aarch64/dl-procinfo.c.  */
++#define HWCAP_FP		(1 << 0)
++#define HWCAP_ASIMD		(1 << 1)
++#define HWCAP_EVTSTRM		(1 << 2)
++#define HWCAP_AES		(1 << 3)
++#define HWCAP_PMULL		(1 << 4)
++#define HWCAP_SHA1		(1 << 5)
++#define HWCAP_SHA2		(1 << 6)
++#define HWCAP_CRC32		(1 << 7)
++#define HWCAP_ATOMICS		(1 << 8)
++#define HWCAP_FPHP		(1 << 9)
++#define HWCAP_ASIMDHP		(1 << 10)
++#define HWCAP_CPUID		(1 << 11)
++#define HWCAP_ASIMDRDM		(1 << 12)
++#define HWCAP_JSCVT		(1 << 13)
++#define HWCAP_FCMA		(1 << 14)
++#define HWCAP_LRCPC		(1 << 15)
++#define HWCAP_DCPOP		(1 << 16)
++#define HWCAP_SHA3		(1 << 17)
++#define HWCAP_SM3		(1 << 18)
++#define HWCAP_SM4		(1 << 19)
++#define HWCAP_ASIMDDP		(1 << 20)
++#define HWCAP_SHA512		(1 << 21)
++#define HWCAP_SVE		(1 << 22)
++#define HWCAP_ASIMDFHM		(1 << 23)
++#define HWCAP_DIT		(1 << 24)
++#define HWCAP_USCAT		(1 << 25)
++#define HWCAP_ILRCPC		(1 << 26)
++#define HWCAP_FLAGM		(1 << 27)
++#define HWCAP_SSBS		(1 << 28)
++#define HWCAP_SB		(1 << 29)
++#define HWCAP_PACA		(1 << 30)
++#define HWCAP_PACG		(1UL << 31)
++
++#define HWCAP2_DCPODP		(1 << 0)
++#define HWCAP2_SVE2		(1 << 1)
++#define HWCAP2_SVEAES		(1 << 2)
++#define HWCAP2_SVEPMULL		(1 << 3)
++#define HWCAP2_SVEBITPERM	(1 << 4)
++#define HWCAP2_SVESHA3		(1 << 5)
++#define HWCAP2_SVESM4		(1 << 6)
++#define HWCAP2_FLAGM2		(1 << 7)
++#define HWCAP2_FRINT		(1 << 8)
++#define HWCAP2_SVEI8MM		(1 << 9)
++#define HWCAP2_SVEF32MM		(1 << 10)
++#define HWCAP2_SVEF64MM		(1 << 11)
++#define HWCAP2_SVEBF16		(1 << 12)
++#define HWCAP2_I8MM		(1 << 13)
++#define HWCAP2_BF16		(1 << 14)
++#define HWCAP2_DGH		(1 << 15)
++#define HWCAP2_RNG		(1 << 16)
++#define HWCAP2_BTI		(1 << 17)
++#define HWCAP2_MTE		(1 << 18)
++#define HWCAP2_ECV		(1 << 19)
++#define HWCAP2_AFP		(1 << 20)
++#define HWCAP2_RPRES		(1 << 21)
++#define HWCAP2_MTE3		(1 << 22)
++#define HWCAP2_SME		(1 << 23)
++#define HWCAP2_SME_I16I64	(1 << 24)
++#define HWCAP2_SME_F64F64	(1 << 25)
++#define HWCAP2_SME_I8I32	(1 << 26)
++#define HWCAP2_SME_F16F32	(1 << 27)
++#define HWCAP2_SME_B16F32	(1 << 28)
++#define HWCAP2_SME_F32F32	(1 << 29)
++#define HWCAP2_SME_FA64		(1 << 30)
++#define HWCAP2_WFXT		(1UL << 31)
++#define HWCAP2_EBF16		(1UL << 32)
++#define HWCAP2_SVE_EBF16	(1UL << 33)
++#define HWCAP2_CSSC		(1UL << 34)
++#define HWCAP2_RPRFM		(1UL << 35)
++#define HWCAP2_SVE2P1		(1UL << 36)
++#define HWCAP2_SME2		(1UL << 37)
++#define HWCAP2_SME2P1		(1UL << 38)
++#define HWCAP2_SME_I16I32	(1UL << 39)
++#define HWCAP2_SME_BI32I32	(1UL << 40)
++#define HWCAP2_SME_B16B16	(1UL << 41)
++#define HWCAP2_SME_F16F16	(1UL << 42)
+diff --git a/libc/sysdeps/linux/common/bits/hwcap.h b/libc/sysdeps/linux/common/bits/hwcap.h
+new file mode 100644
+index 000000000..e7b899df0
+--- /dev/null
++++ b/libc/sysdeps/linux/common/bits/hwcap.h
+@@ -0,0 +1,22 @@
++/* Defines for bits in AT_HWCAP.
++   Copyright (C) 2012-2023 Free Software Foundation, Inc.
++
++   The GNU C Library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public
++   License as published by the Free Software Foundation; either
++   version 2.1 of the License, or (at your option) any later version.
++
++   The GNU C Library is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with the GNU C Library; if not, see
++   <https://www.gnu.org/licenses/>.  */
++
++#ifndef _SYS_AUXV_H
++# error "Never include <bits/hwcap.h> directly; use <sys/auxv.h> instead."
++#endif
++
++/* No bits defined for this architecture.  */
+-- 
+2.30.2
+
diff --git a/package/uclibc/0001-gettimeofday-fix-static-build.patch b/package/uclibc/0001-gettimeofday-fix-static-build.patch
deleted file mode 100644
index 2ef5059f05..0000000000
--- a/package/uclibc/0001-gettimeofday-fix-static-build.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From b19f8f360970ffd0c1a6ac41e07c66dc39790b16 Mon Sep 17 00:00:00 2001
-From: Waldemar Brodkorb <wbx@openadk.org>
-Date: Wed, 10 May 2023 08:35:25 +0200
-Subject: [PATCH] gettimeofday: fix static build
-
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-Upstream: https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?id=b19f8f360970ffd0c1a6ac41e07c66dc39790b16
----
- libc/sysdeps/linux/common/gettimeofday.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/libc/sysdeps/linux/common/gettimeofday.c b/libc/sysdeps/linux/common/gettimeofday.c
-index e5141088e..12473a8e6 100755
---- a/libc/sysdeps/linux/common/gettimeofday.c
-+++ b/libc/sysdeps/linux/common/gettimeofday.c
-@@ -9,8 +9,9 @@
- #include <sys/syscall.h>
- #include <sys/time.h>
- 
-+#ifdef SHARED
- #include "ldso.h"
--
-+#endif
- 
- 
- #ifdef __VDSO_SUPPORT__
--- 
-2.30.2
-
diff --git a/package/uclibc/uclibc.hash b/package/uclibc/uclibc.hash
index cdca75b113..8d87c04383 100644
--- a/package/uclibc/uclibc.hash
+++ b/package/uclibc/uclibc.hash
@@ -1,4 +1,4 @@
-# From https://downloads.uclibc-ng.org/releases/1.0.43/uClibc-ng-1.0.43.tar.xz.sha256
-sha256  8c1f550f14728a9c06ff1fb3e85069f7f10f4d684b03e163f4d9d41727124047  uClibc-ng-1.0.43.tar.xz
+# From https://downloads.uclibc-ng.org/releases/1.0.44/uClibc-ng-1.0.44.tar.xz.sha256
+sha256  7df9d987955827382f1c2400da513456becbb6f868bdfd37737265f1cbeec994  uClibc-ng-1.0.44.tar.xz
 # Locally calculated
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING.LIB
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 80c9caf07f..4e7d8de643 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UCLIBC_VERSION = 1.0.43
+UCLIBC_VERSION = 1.0.44
 UCLIBC_SOURCE = uClibc-ng-$(UCLIBC_VERSION).tar.xz
 UCLIBC_SITE = https://downloads.uclibc-ng.org/releases/$(UCLIBC_VERSION)
 UCLIBC_LICENSE = LGPL-2.1+
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
