Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33AFAC77B7C
	for <buildroot@archiver.kernel.org>; Thu, 11 May 2023 18:49:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C0DD8475F;
	Thu, 11 May 2023 18:49:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C0DD8475F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZLJnMCwiSTLQ; Thu, 11 May 2023 18:49:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6FC1A84364;
	Thu, 11 May 2023 18:49:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FC1A84364
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8B3F31BF28C
 for <buildroot@lists.busybox.net>; Thu, 11 May 2023 18:49:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 61FE741F91
 for <buildroot@lists.busybox.net>; Thu, 11 May 2023 18:49:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61FE741F91
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vlS6eStum9PP for <buildroot@lists.busybox.net>;
 Thu, 11 May 2023 18:49:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC45C41F4C
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CC45C41F4C
 for <buildroot@buildroot.org>; Thu, 11 May 2023 18:49:21 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([89.144.220.58]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MplXp-1qXHqU1VLp-00q7QM for <buildroot@buildroot.org>; Thu, 11 May 2023
 20:49:19 +0200
From: Daniel Lang <dalang@gmx.at>
To: buildroot@buildroot.org
Date: Thu, 11 May 2023 20:47:34 +0200
Message-Id: <20230511184734.1879218-1-dalang@gmx.at>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:spsGsoLwR8L1Z2qh3gZ8JKkY1Lw1DKU7WIYRBntkp9slCrwdC2c
 WN36kxAv7LCt6cjopEniFTPcqe2U4Si0i5uIO/88zjALhQx406ckMfwWoGm66ldBIuqJQqR
 48oh+oln9gFQmO/9IQ37/ZwQLGeCaGTaBUwebp9N/QVml064KT+K4FIcddj2AUkzTOz1VAY
 3WlMqWuOZMPsMDClZX6HA==
UI-OutboundReport: notjunk:1;M01:P0:RSy2WNmqa9E=;JDMYM1sWKNa9Y0eiXj3DdkY9U3y
 A60ol4l1fM5M5claCiaTK/xfmg+uPYW9O3W6CLRLvB5/+JNS4X/qBUNPi42uGQWkOimhKIorH
 jct9xwY7U+h6hksR0SUGJ6zoyqpSBPJRbLr0s/N4OqGDBxwVD5ywsZA2+y5mnVl1Tb/vLry0i
 VywpCe2GdqAWgLLlX5td8+P1AcPC+OU7zHmbbZS38FpuGoQ1hASz6NUeiRKHvKF7r/xrxve3E
 cAWW2GrGcNfzNNgRnvl2Y+f/Wqf2DSWzuTfvdpL7IqFQTuMtzjXTHzotkSYaontGXmOijmo/s
 YfLe3W06J1clX3WOxCeBVezBqxjJgkGM3AtP93Xt2LlR8HTXwNbHkMdZJXgKKk+Dc6RUIOW8t
 BlEHr9+PHmjb3bWEf/LidUkLo4ztDdpT9fWXmb3stQ+e3BuGF9kJK8SBlAHGOP9A0Ncofmu57
 meEJmNx3z4KgWP42dpJKtEt1GvxJIXPZ0xVqGjM6uWkr1kvODyT5rn+5VP0ONONOo+nehH56a
 9gqdKPA8jvwPBAg+I5+r9N8T4Q1iApd1EgSrQVrklZ+htQsqSFKnstI6yzreRhjsiCNIHuMCc
 zfJ1yav24+22zJuThWaRSAQLwMBaFadeC3N+lqSfETb2C/kPy6K59eyj9YiV9hrtKQ/GdfjO2
 lQkMddEKQbc0bO0LjfxswYC4o2+JDQApxb60Z7MmK0Kds6RG0p08FOKVo67eOMosSx/MhsslS
 chd3sPU7S4E50OCCfeo9ira+DnDUleH6Na2VLedJpHKxFt4mt8mVyMdU0Xt/Qjv6XGDLmIiJR
 mqBWvO/cjJenl51D78c/w/VGMsLeu9aKvY8bDaUwSrk8Wm0grvSbOkiZPu31Jsd3tIsicsh60
 80REWonRDkhAI8d1QYB8faK8N7g2LLzA2UmnrbMEKrqdt+GKlhbrakjaJmHchtrKWwnueGpU5
 BYQqqqs+smUtI5AoNFRrfF8Y3NA=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.at; s=s31663417; 
 t=1683830959; i=dalang@gmx.at;
 bh=TEnDsgofKrBRrKmvGrUATGBc0/SYjvfl2OubUiseWtI=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=C3WEhzi/t1zX3NEfOlRGl4IH0hD7plpRZHtM49xtcr0sFw9Tt7Q2f5SFxLeNw6lOe
 K7mUenvU26aWsmCjLjb+R9xBHjNmYODjc9cTmyVM9QgSieEXrvJwW1AYy04kWzjU/C
 ZByAZoT4VNv+etfXeSHWo0VtoJ6mjW9rYqyzts42435C3VXutW8NsdtCf79TVbq1ew
 U3TCBcrNywQFtyK663hKKmZJhZqCw6CcOOLpjXB3hCIjdEGIz3LfD+NRR/QjkwhihX
 9gTpkA4z+2+zUwqPQN7njLgBUugJm5ea8ipGZri8Aphkc7dF9YC1mt9O0aCrbhclEB
 eTfgqVMRlIRrg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=C3WEhzi/
Subject: [Buildroot] [PATCH] package/diffutils: bump version to 3.9
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

Drop now included patches and regenerate ignore file.

http://savannah.gnu.org/forum/forum.php?forum_id=10282

Signed-off-by: Daniel Lang <dalang@gmx.at>
---
 .checkpackageignore                           |  5 --
 ...rection.m4-fix-build-on-microblazeel.patch | 39 -------------
 .../0002-sigsegv-fix-build-on-or1k.patch      | 32 ----------
 ..._random-port-better-to-uClibc-1-0-35.patch | 39 -------------
 ...-Fix-compilation-error-on-arceb-CPUs.patch | 41 -------------
 ...ort-for-Linux-PowerPC-32-bit-with-mu.patch | 58 -------------------
 package/diffutils/diffutils.hash              |  2 +-
 package/diffutils/diffutils.mk                |  4 +-
 8 files changed, 2 insertions(+), 218 deletions(-)
 delete mode 100644 package/diffutils/0001-m4-stack-direction.m4-fix-build-on-microblazeel.patch
 delete mode 100644 package/diffutils/0002-sigsegv-fix-build-on-or1k.patch
 delete mode 100644 package/diffutils/0003-sys_random-port-better-to-uClibc-1-0-35.patch
 delete mode 100644 package/diffutils/0004-sigsegv-Fix-compilation-error-on-arceb-CPUs.patch
 delete mode 100644 package/diffutils/0005-sigsegv-Add-support-for-Linux-PowerPC-32-bit-with-mu.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 05459362ee..a1895e54ea 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -351,11 +351,6 @@ package/dhrystone/0003-exit.patch Sob Upstream
 package/dhrystone/0004-headers.patch Sob Upstream
 package/dhrystone/0005-prototypes.patch Sob Upstream
 package/dht/0001-cmake.patch Upstream
-package/diffutils/0001-m4-stack-direction.m4-fix-build-on-microblazeel.patch Upstream
-package/diffutils/0002-sigsegv-fix-build-on-or1k.patch Upstream
-package/diffutils/0003-sys_random-port-better-to-uClibc-1-0-35.patch Upstream
-package/diffutils/0004-sigsegv-Fix-compilation-error-on-arceb-CPUs.patch Upstream
-package/diffutils/0005-sigsegv-Add-support-for-Linux-PowerPC-32-bit-with-mu.patch Upstream
 package/dillo/0001-usr-local-include.patch Upstream
 package/dillo/0002-Fix-openssl-detection.patch Upstream
 package/dillo/0004-fix-build-with-gcc-10.patch Upstream
diff --git a/package/diffutils/0001-m4-stack-direction.m4-fix-build-on-microblazeel.patch b/package/diffutils/0001-m4-stack-direction.m4-fix-build-on-microblazeel.patch
deleted file mode 100644
index 6e60beecbd..0000000000
--- a/package/diffutils/0001-m4-stack-direction.m4-fix-build-on-microblazeel.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 7fd9de7f12718db0ace575c15c3a0e061ef6c542 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 11 Nov 2021 09:46:41 +0100
-Subject: [PATCH] m4/stack-direction.m4: fix build on microblazeel
-
-Fix the following build failure on microblazeel with diffutils raised
-since version 3.8 and
-https://git.savannah.gnu.org/cgit/gnulib.git/commit/?id=e54aa6196947ed22ff66bcd714e4fc7bd0c5c3b4
-
-sigsegv.c: In function 'sigsegv_handler':
-sigsegv.c:979:28: error: 'struct vma_struct' has no member named 'is_near_this'
-  979 |                       : vma.is_near_this (addr, &vma))
-      |                            ^
-
-Fixes:
- - http://autobuild.buildroot.org/results/5ecd55b7c72f9630a7acc72341ccb60e94ddb574
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: sent to bug-gnulib@gnu.org]
----
- m4/stack-direction.m4 | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/m4/stack-direction.m4 b/m4/stack-direction.m4
-index c90d69733..70286c8f5 100644
---- a/m4/stack-direction.m4
-+++ b/m4/stack-direction.m4
-@@ -37,7 +37,7 @@ AC_DEFUN([SV_STACK_DIRECTION],
-       m68* | \
-       m88k | \
-       mcore | \
--      microblaze | \
-+      microblaze* | \
-       mips* | \
-       mmix | \
-       mn10200 | \
--- 
-2.33.0
-
diff --git a/package/diffutils/0002-sigsegv-fix-build-on-or1k.patch b/package/diffutils/0002-sigsegv-fix-build-on-or1k.patch
deleted file mode 100644
index 73385fe9f7..0000000000
--- a/package/diffutils/0002-sigsegv-fix-build-on-or1k.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 496c1740e5475be85b65fdb2b143771f09ed27cb Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 11 Nov 2021 10:06:31 +0100
-Subject: sigsegv: fix build on or1k
-
-Fix the following build failure on or1k with diffutils 3.8
-https://git.savannah.gnu.org/cgit/gnulib.git/commit/?id=e54aa6196947ed22ff66bcd714e4fc7bd0c5c3b4
-sigsegv.c:979:28: error: 'struct vma_struct' has no member named 'is_near_this'
-http://autobuild.buildroot.org/results/5427e52489d29ed4f18b4a70b3c36f0f7bb0ddd9
-
-[Retrieved from:
-https://git.savannah.gnu.org/cgit/gnulib.git/commit/?id=496c1740e5475be85b65fdb2b143771f09ed27cb]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- m4/stack-direction.m4 | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/m4/stack-direction.m4 b/m4/stack-direction.m4
-index 70286c8f5..29e398d77 100644
---- a/m4/stack-direction.m4
-+++ b/m4/stack-direction.m4
-@@ -45,6 +45,7 @@ AC_DEFUN([SV_STACK_DIRECTION],
-       nios2 | \
-       nds32* | \
-       ns32k | \
-+      or1k | \
-       pdp11 | \
-       pj* | \
-       powerpc* | rs6000 | \
--- 
-cgit v1.2.1
-
diff --git a/package/diffutils/0003-sys_random-port-better-to-uClibc-1-0-35.patch b/package/diffutils/0003-sys_random-port-better-to-uClibc-1-0-35.patch
deleted file mode 100644
index f9dd12f8e6..0000000000
--- a/package/diffutils/0003-sys_random-port-better-to-uClibc-1-0-35.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 135414a7f543e4d40ad0a7cbd51885e159a6e0f4 Mon Sep 17 00:00:00 2001
-From: Paul Eggert <eggert@cs.ucla.edu>
-Date: Tue, 30 Nov 2021 17:50:01 -0800
-Subject: sys_random: port better to uClibc < 1.0.35
-
-Problem reported by Fabrice Fontaine in:
-https://lists.gnu.org/r/bug-gnulib/2021-11/msg00043.html
-* lib/sys_random.in.h [HAVE_SYS_RANDOM_H && !__GLIBC__ && __UCLIBC__]:
-Include <stddef.h>, in case this file is included before
-__UCLIBC__ is defined.
-
-[Retrieved (and backported to remove ChangeLog update) from:
-https://git.savannah.gnu.org/cgit/gnulib.git/commit/?id=135414a7f543e4d40ad0a7cbd51885e159a6e0f4]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- ChangeLog           | 9 +++++++++
- lib/sys_random.in.h | 6 ++++--
- 2 files changed, 13 insertions(+), 2 deletions(-)
-
-diff --git a/lib/sys_random.in.h b/lib/sys_random.in.h
-index 1abd6c544..8b4b934a1 100644
---- a/lib/sys_random.in.h
-+++ b/lib/sys_random.in.h
-@@ -23,8 +23,10 @@
- 
- #if @HAVE_SYS_RANDOM_H@
- 
--/* On uClibc, <sys/random.h> assumes prior inclusion of <stddef.h>.  */
--# if defined __UCLIBC__
-+/* On uClibc < 1.0.35, <sys/random.h> assumes prior inclusion of <stddef.h>.
-+   Do not use __UCLIBC__ here, as it might not be defined yet.
-+   But avoid namespace pollution on glibc systems.  */
-+# ifndef __GLIBC__
- #  include <stddef.h>
- # endif
- /* On Mac OS X 10.5, <sys/random.h> assumes prior inclusion of <sys/types.h>.
--- 
-cgit v1.2.1
-
diff --git a/package/diffutils/0004-sigsegv-Fix-compilation-error-on-arceb-CPUs.patch b/package/diffutils/0004-sigsegv-Fix-compilation-error-on-arceb-CPUs.patch
deleted file mode 100644
index 20db798f3a..0000000000
--- a/package/diffutils/0004-sigsegv-Fix-compilation-error-on-arceb-CPUs.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 1957bb5113a2bf02c7ecf0815125eec04b9476d2 Mon Sep 17 00:00:00 2001
-From: Bruno Haible <bruno@clisp.org>
-Date: Sat, 16 Apr 2022 03:01:51 +0200
-Subject: sigsegv: Fix compilation error on arceb CPUs.
-
-Reported by Fabrice Fontaine <fontaine.fabrice@gmail.com> in
-<https://lists.gnu.org/archive/html/bug-gnulib/2022-04/msg00028.html>.
-
-* m4/stack-direction.m4 (SV_STACK_DIRECTION): Treat the 'arc' variants
-like 'arc'.
-
-[Retrieved (and backported) from:
-https://git.savannah.gnu.org/cgit/gnulib.git/commit/?id=1957bb5113a2bf02c7ecf0815125eec04b9476d2]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- ChangeLog             | 8 ++++++++
- m4/stack-direction.m4 | 4 ++--
- 2 files changed, 10 insertions(+), 2 deletions(-)
-
-diff --git a/m4/stack-direction.m4 b/m4/stack-direction.m4
-index 1df823e..924c5de 100644
---- a/m4/stack-direction.m4
-+++ b/m4/stack-direction.m4
-@@ -1,4 +1,4 @@
--# stack-direction.m4 serial 7
-+# stack-direction.m4 serial 11
- dnl Copyright (C) 2002-2021 Free Software Foundation, Inc.
- dnl This file is free software, distributed under the terms of the GNU
- dnl General Public License.  As a special exception to the GNU General
-@@ -18,7 +18,7 @@ AC_DEFUN([SV_STACK_DIRECTION],
-       a29k | \
-       aarch64* | \
-       alpha* | \
--      arc | \
-+      arc | arceb | arc32 | arc64 | \
-       arm* | strongarm* | xscale* | \
-       avr | avr32 | \
-       bfin | \
--- 
-cgit v1.1
-
diff --git a/package/diffutils/0005-sigsegv-Add-support-for-Linux-PowerPC-32-bit-with-mu.patch b/package/diffutils/0005-sigsegv-Add-support-for-Linux-PowerPC-32-bit-with-mu.patch
deleted file mode 100644
index 16e0941f6c..0000000000
--- a/package/diffutils/0005-sigsegv-Add-support-for-Linux-PowerPC-32-bit-with-mu.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From 6f2f006185cdeeda997d19d651379bfc6887e394 Mon Sep 17 00:00:00 2001
-From: Joel Stanley <joel@jms.id.au>
-Date: Mon, 6 Jun 2022 17:14:12 +0930
-Subject: [PATCH] sigsegv: Add support for Linux/PowerPC (32-bit) with musl
- libc. Reported by Khem Raj <raj.khem@gmail.com> in
- <https://lists.gnu.org/archive/html/m4-patches/2022-03/msg00000.html>.
-
-* src/sigsegv.c (SIGSEGV_FAULT_STACKPOINTER): In the Linux/PowerPC
-32-bit case, handle musl libc differently.
-* modules/sigsegv (Files): Add m4/musl.m4.
-(configure.ac): Invoke gl_MUSL_LIBC.
-
-Backported from http://git.savannah.gnu.org/cgit/gnulib.git/commit/?id=2d830e4a792fcd9f614ed08a7f18584b8b21d23b
-Signed-off-by: Joel Stanley <joel@jms.id.au>
----
- lib/sigsegv.c | 25 +++++++++++++++++++++----
- 1 file changed, 21 insertions(+), 4 deletions(-)
-
-diff --git a/lib/sigsegv.c b/lib/sigsegv.c
-index da70ffa5fda1..da64d7d0b617 100644
---- a/lib/sigsegv.c
-+++ b/lib/sigsegv.c
-@@ -227,11 +227,28 @@ int libsigsegv_version = LIBSIGSEGV_VERSION;
- #  if defined __powerpc64__ || defined __powerpc64_elfv2__ /* 64-bit */
- #   define SIGSEGV_FAULT_STACKPOINTER  ((ucontext_t *) ucp)->uc_mcontext.gp_regs[1]
- #  else /* 32-bit */
--/* both should be equivalent */
--#   if 0
--#    define SIGSEGV_FAULT_STACKPOINTER  ((ucontext_t *) ucp)->uc_mcontext.regs->gpr[1]
-+#   if MUSL_LIBC
-+/* musl libc has a different structure of ucontext_t in
-+   musl/arch/powerpc/bits/signal.h.  */
-+/* The glibc comments say:
-+     "Different versions of the kernel have stored the registers on signal
-+      delivery at different offsets from the ucontext struct.  Programs should
-+      thus use the uc_mcontext.uc_regs pointer to find where the registers are
-+      actually stored."  */
-+#    if 0
-+#     define SIGSEGV_FAULT_STACKPOINTER  ((ucontext_t *) ucp)->uc_mcontext.gregs[1]
-+#    else
-+#     define SIGSEGV_FAULT_STACKPOINTER  ((ucontext_t *) ucp)->uc_regs->gregs[1]
-+#    endif
- #   else
--#    define SIGSEGV_FAULT_STACKPOINTER  ((ucontext_t *) ucp)->uc_mcontext.uc_regs->gregs[1]
-+/* Assume the structure of ucontext_t in
-+   glibc/sysdeps/unix/sysv/linux/powerpc/sys/ucontext.h.  */
-+/* Because of the union, both definitions should be equivalent.  */
-+#    if 0
-+#     define SIGSEGV_FAULT_STACKPOINTER  ((ucontext_t *) ucp)->uc_mcontext.regs->gpr[1]
-+#    else
-+#     define SIGSEGV_FAULT_STACKPOINTER  ((ucontext_t *) ucp)->uc_mcontext.uc_regs->gregs[1]
-+#    endif
- #   endif
- #  endif
- 
--- 
-2.35.1
-
diff --git a/package/diffutils/diffutils.hash b/package/diffutils/diffutils.hash
index 8cf4eb75c7..ff0e9ab278 100644
--- a/package/diffutils/diffutils.hash
+++ b/package/diffutils/diffutils.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  a6bdd7d1b31266d11c4f4de6c1b748d4607ab0231af5188fc2533d0ae2438fec  diffutils-3.8.tar.xz
+sha256  d80d3be90a201868de83d78dad3413ad88160cc53bcc36eb9eaf7c20dbf023f1  diffutils-3.9.tar.xz
 # Locally calculated
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/diffutils/diffutils.mk b/package/diffutils/diffutils.mk
index 6db68af7ec..1004437026 100644
--- a/package/diffutils/diffutils.mk
+++ b/package/diffutils/diffutils.mk
@@ -4,14 +4,12 @@
 #
 ################################################################################
 
-DIFFUTILS_VERSION = 3.8
+DIFFUTILS_VERSION = 3.9
 DIFFUTILS_SOURCE = diffutils-$(DIFFUTILS_VERSION).tar.xz
 DIFFUTILS_SITE = $(BR2_GNU_MIRROR)/diffutils
 DIFFUTILS_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 DIFFUTILS_LICENSE = GPL-3.0+
 DIFFUTILS_LICENSE_FILES = COPYING
-# We're patching m4/stack-direction.m4
-DIFFUTILS_AUTORECONF = YES
 
 # Since glibc >= 2.26, don't try to use getopt_long replacement bundled
 # with diffutils. It will conflict with the one from glibc.
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
