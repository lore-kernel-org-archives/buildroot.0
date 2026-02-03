Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8F9BE87823
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 12:24:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8142C60865;
	Tue,  3 Feb 2026 12:24:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Dt-OKo10nKL; Tue,  3 Feb 2026 12:24:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1DD3B60870
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770121462;
	bh=7jrtR/RIwjs05W3PfadE9y/XA9k6o5HEnJi5T+Fm9C0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=CHeEUi9zVXoT9mkDkrLatyQligwn7gk8ItCpidQgToEb50v2sFzt1NkjaGadQvTMh
	 O6XyTqDX2e7pt6ESTcS6FWOSvKyZFZzKbaoAmaOjnYlJsztqM0xXimQGgBVfaSGj5R
	 ZThozEChf6PBnxO/QOYifdCvR5sUfpAriAMaKYB2+4s+mX91BrHzXq5YdqFYWX/M7X
	 MQyVi0T8iASDkfXHpXnw9Z1/0iwtADfU2uJRlz2TRPdyXymggK1jkWjR034x6wLIba
	 sHwfiaUNGl/IlJSUknp/WqflAWZUeHO4X5UzD8GqyWADuZfE+lJzAiz34fGA967hBy
	 4Hn3N8UHpeDHg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1DD3B60870;
	Tue,  3 Feb 2026 12:24:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 863E1F5
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 12:24:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DD09C4043F
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 12:24:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ac8oVlVU0WQy for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 12:24:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C2AA34045B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C2AA34045B
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 12:24:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B50CA86659; Tue,  3 Feb 2026 12:24:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 3 Feb 2026 13:04:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 34749a2d3e8f95ed3eb262dc9a4319acb44f8c0b
X-Git-Newrev: 5bfd193bed7fcb8a3968935067bbe67aa2e5913e
X-Patchwork-Hint: ignore
Message-Id: <20260203122414.B50CA86659@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/safeclib: bump version to 3.9.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=5bfd193bed7fcb8a3968935067bbe67aa2e5913e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/rurban/safeclib/blob/v3.9.1/ChangeLog

Removed backports from patches 0001 & 0002.

Removed patch 0003 which is included in this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-fix-armv7-asm-inline-error-GH-115.patch   | 155 ---------------------
 ...002-vsnprintf_s-Increase-Buffer-Size-by-1.patch |  51 -------
 ...003-vsnprintf_s-Increase-Buffer-Size-by-1.patch |  49 -------
 package/safeclib/safeclib.hash                     |   4 +-
 package/safeclib/safeclib.mk                       |   2 +-
 5 files changed, 3 insertions(+), 258 deletions(-)

diff --git a/package/safeclib/0001-fix-armv7-asm-inline-error-GH-115.patch b/package/safeclib/0001-fix-armv7-asm-inline-error-GH-115.patch
deleted file mode 100644
index 75f4c2bf90..0000000000
--- a/package/safeclib/0001-fix-armv7-asm-inline-error-GH-115.patch
+++ /dev/null
@@ -1,155 +0,0 @@
-From 9c739800a8915d5f2a73c840190920e95ffa1c5c Mon Sep 17 00:00:00 2001
-From: Reini Urban <rurban@cpan.org>
-Date: Fri, 18 Feb 2022 09:46:45 +0100
-Subject: [PATCH] fix armv7 asm inline error GH #115
-
-some armv7 buildroot variants fail on asm.
-we already probe for that, so use it.
-Fixes GH #115
-
-Upstream: https://github.com/rurban/safeclib/commit/9c739800a8915d5f2a73c840190920e95ffa1c5c
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- tests/perf_private.h | 49 +++++++++++++++++++++++++-------------------
- 1 file changed, 28 insertions(+), 21 deletions(-)
-
-diff --git a/tests/perf_private.h b/tests/perf_private.h
-index 3296cb3d..843674d3 100644
---- a/tests/perf_private.h
-+++ b/tests/perf_private.h
-@@ -1,9 +1,9 @@
- /*------------------------------------------------------------------
-  * perf_private.h - Internal benchmarking tools
-  *
-- * 2020  Reini Urban
-+ * 2020,2022  Reini Urban
-  *
-- * Copyright (c) 2017, 2020 Reini Urban
-+ * Copyright (c) 2017, 2020, 2022 Reini Urban
-  * All rights reserved.
-  *
-  * Permission is hereby granted, free of charge, to any person
-@@ -55,13 +55,16 @@ static inline uint64_t timer_start();
- static inline uint64_t timer_end();
- 
- static inline clock_t rdtsc() {
--#ifdef __x86_64__
-+#ifndef ASM_INLINE
-+#define NO_CYCLE_COUNTER
-+    return clock();
-+#elif defined __x86_64__
-     uint64_t a, d;
--    __asm__ volatile("rdtsc" : "=a"(a), "=d"(d));
-+    ASM_INLINE volatile("rdtsc" : "=a"(a), "=d"(d));
-     return (clock_t)(a | (d << 32));
- #elif defined(__i386__)
-     clock_t x;
--    __asm__ volatile("rdtsc" : "=A"(x));
-+    ASM_INLINE volatile("rdtsc" : "=A"(x));
-     return x;
- #elif defined(__ARM_ARCH) && (__ARM_ARCH >= 7) && (SIZEOF_SIZE_T == 4)
-   // V7 is the earliest arch that has a standard cyclecount (some say 6)
-@@ -69,11 +72,11 @@ static inline clock_t rdtsc() {
-   uint32_t pmuseren;
-   uint32_t pmcntenset;
-   // Read the user mode perf monitor counter access permissions.
--  asm volatile("mrc p15, 0, %0, c9, c14, 0" : "=r"(pmuseren));
-+  ASM_INLINE volatile("mrc p15, 0, %0, c9, c14, 0" : "=r"(pmuseren));
-   if (pmuseren & 1) {  // Allows reading perfmon counters for user mode code.
--    asm volatile("mrc p15, 0, %0, c9, c12, 1" : "=r"(pmcntenset));
-+    ASM_INLINE volatile("mrc p15, 0, %0, c9, c12, 1" : "=r"(pmcntenset));
-     if (pmcntenset & 0x80000000ul) {  // Is it counting?
--      asm volatile("mrc p15, 0, %0, c9, c13, 0" : "=r"(pmccntr));
-+      ASM_INLINE volatile("mrc p15, 0, %0, c9, c13, 0" : "=r"(pmccntr));
-       // The counter is set up to count every 64th cycle
-       return (int64_t)(pmccntr) * 64;  // Should optimize to << 6
-     }
-@@ -83,22 +86,22 @@ static inline clock_t rdtsc() {
-   uint64_t pmccntr;
-   uint64_t pmuseren = 1UL;
-   // Read the user mode perf monitor counter access permissions.
--  //asm volatile("mrs cntv_ctl_el0,  %0" : "=r" (pmuseren));
-+  //ASM_INLINE volatile("mrs cntv_ctl_el0,  %0" : "=r" (pmuseren));
-   if (pmuseren & 1) {  // Allows reading perfmon counters for user mode code.
--    asm volatile("mrs %0, cntvct_el0" : "=r" (pmccntr));
-+    ASM_INLINE volatile("mrs %0, cntvct_el0" : "=r" (pmccntr));
-     return (uint64_t)(pmccntr) * 64;  // Should optimize to << 6
-   }
-   return (uint64_t)rdtsc();
- #elif defined(__powerpc64__) || defined(__ppc64__)
-     uint64_t tb;
--    __asm__ volatile (\
-+    ASM_INLINE volatile (\
-       "mfspr %0, 268"
-       : "=r" (tb));
-     return tb;
- #elif defined(__powerpc__) || defined(__ppc__)
-     // This returns a time-base, which is not always precisely a cycle-count.
-     uint32_t tbu, tbl, tmp;
--    __asm__ volatile (\
-+    ASM_INLINE volatile (\
-       "0:\n"
-       "mftbu %0\n"
-       "mftbl %1\n"
-@@ -109,12 +112,12 @@ static inline clock_t rdtsc() {
-     return (((uint64_t) tbu << 32) | tbl);
- #elif defined(__sparc__)
-     uint64_t tick;
--    asm(".byte 0x83, 0x41, 0x00, 0x00");
--    asm("mov   %%g1, %0" : "=r" (tick));
-+    ASM_INLINE(".byte 0x83, 0x41, 0x00, 0x00");
-+    ASM_INLINE("mov   %%g1, %0" : "=r" (tick));
-     return tick;
- #elif defined(__ia64__)
-     uint64_t itc;
--    asm("mov %0 = ar.itc" : "=r" (itc));
-+    ASM_INLINE("mov %0 = ar.itc" : "=r" (itc));
-     return itc;
- #else
- #define NO_CYCLE_COUNTER
-@@ -126,9 +129,11 @@ static inline clock_t rdtsc() {
- // 3.2.1 The Improved Benchmarking Method
- static inline uint64_t timer_start()
- {
--#if defined (__i386__) || (defined(__x86_64__) && SIZEOF_SIZE_T == 4)
-+#ifndef ASM_INLINE
-+    return (uint64_t)rdtsc();
-+#elif defined (__i386__) || (defined(__x86_64__) && SIZEOF_SIZE_T == 4)
-   uint32_t cycles_high, cycles_low;
--  __asm__ volatile
-+  ASM_INLINE volatile
-       ("cpuid\n\t"
-        "rdtsc\n\t"
-        "mov %%edx, %0\n\t"
-@@ -137,7 +142,7 @@ static inline uint64_t timer_start()
-     return ((uint64_t)cycles_high << 32) | cycles_low;
- #elif defined __x86_64__
-   uint32_t cycles_high, cycles_low;
--  __asm__ volatile
-+  ASM_INLINE volatile
-       ("cpuid\n\t"
-        "rdtsc\n\t"
-        "mov %%edx, %0\n\t"
-@@ -151,9 +156,11 @@ static inline uint64_t timer_start()
- 
- static inline uint64_t timer_end()
- {
--#if defined (__i386__) || (defined(__x86_64__) && defined (HAVE_BIT32))
-+#ifndef ASM_INLINE
-+    return (uint64_t)rdtsc();
-+#elif defined (__i386__) || (defined(__x86_64__) && defined (HAVE_BIT32))
-   uint32_t cycles_high, cycles_low;
--  __asm__ volatile
-+ ASM_INLINE volatile
-       ("rdtscp\n\t"
-        "mov %%edx, %0\n\t"
-        "mov %%eax, %1\n\t"
-@@ -162,7 +169,7 @@ static inline uint64_t timer_end()
-     return ((uint64_t)cycles_high << 32) | cycles_low;
- #elif defined __x86_64__
-   uint32_t cycles_high, cycles_low;
--  __asm__ volatile
-+  ASM_INLINE volatile
-       ("rdtscp\n\t"
-        "mov %%edx, %0\n\t"
-        "mov %%eax, %1\n\t"
diff --git a/package/safeclib/0002-vsnprintf_s-Increase-Buffer-Size-by-1.patch b/package/safeclib/0002-vsnprintf_s-Increase-Buffer-Size-by-1.patch
deleted file mode 100644
index eae11dcc0d..0000000000
--- a/package/safeclib/0002-vsnprintf_s-Increase-Buffer-Size-by-1.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 62051f9761f92dc99c8ce0552239ad10e2062168 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd@kuhls.net>
-Date: Sat, 10 Jan 2026 12:16:22 +0100
-Subject: [PATCH] vsnprintf_s: Increase Buffer Size by 1
-
-Another fix similar to https://github.com/rurban/safeclib/commit/f59a0c8c1b5cf19cd0ed7f9bfb3a1e85f54113d0
-
-In function 'safec_ntoa_format',
-    inlined from 'safec_ntoa_long' at str/vsnprintf_s.c:331:12:
-str/vsnprintf_s.c:256:24: error: writing 32 bytes into a region of size 0 [-Werror=stringop-overflow=]
-  256 |             buf[len++] = '0';
-      |             ~~~~~~~~~~~^~~~~
-str/vsnprintf_s.c: In function 'safec_ntoa_long':
-str/vsnprintf_s.c:312:10: note: at offset 32 into destination object 'buf' of size 32
-  312 |     char buf[PRINTF_NTOA_BUFFER_SIZE];
-      |          ^~~
-In function 'safec_ntoa_format',
-    inlined from 'safec_ntoa_long' at str/vsnprintf_s.c:331:12:
-str/vsnprintf_s.c:260:24: error: writing 32 bytes into a region of size 0 [-Werror=stringop-overflow=]
-  260 |             buf[len++] = '0';
-      |             ~~~~~~~~~~~^~~~~
-str/vsnprintf_s.c: In function 'safec_ntoa_long':
-str/vsnprintf_s.c:312:10: note: at offset 32 into destination object 'buf' of size 32
-  312 |     char buf[PRINTF_NTOA_BUFFER_SIZE];
-      |          ^~~
-cc1: all warnings being treated as errors
-
-Upstream: https://github.com/rurban/safeclib/pull/150
-
-[backported to version 3.7.1]
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- src/str/vsnprintf_s.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/str/vsnprintf_s.c b/src/str/vsnprintf_s.c
-index 59dbda94..ca838df1 100644
---- a/src/str/vsnprintf_s.c
-+++ b/src/str/vsnprintf_s.c
-@@ -296,7 +296,7 @@ static size_t safec_ntoa_long(out_fct_type out,  const char *funcname,
-                               unsigned long base, unsigned int prec,
-                               unsigned int width, unsigned int flags)
- {
--    char buf[PRINTF_NTOA_BUFFER_SIZE];
-+    char buf[PRINTF_NTOA_BUFFER_SIZE + 1];
-     size_t len = 0U;
- 
-     // no hash for 0 values
--- 
-2.47.3
-
diff --git a/package/safeclib/0003-vsnprintf_s-Increase-Buffer-Size-by-1.patch b/package/safeclib/0003-vsnprintf_s-Increase-Buffer-Size-by-1.patch
deleted file mode 100644
index 2dabebf3b2..0000000000
--- a/package/safeclib/0003-vsnprintf_s-Increase-Buffer-Size-by-1.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From dea3c2e1aa1b775baa690b9ef40239f881c5f068 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 13 Aug 2025 20:23:48 -0700
-Subject: [PATCH] vsnprintf_s: Increase Buffer Size by 1
-
-It is a buffer overflow warning that GCC 15.2 is catching.
-The issue is that it's trying to write to `buf[len++]` when len could
-potentially be 31, which would write to buf[31] in a buffer of size 32
-(valid indices 0-31), but the len++ post-increment means it could
-theoretically write beyond the buffer bounds.
-
-Fixes
-
-../../sources/safec-3.9.1/src/str/vsnprintf_s.c: In function 'safec_ftoa.isra':
-../../sources/safec-3.9.1/src/str/vsnprintf_s.c:523:24: error: writing 32 bytes into a region of size 31 [-Werror=stringop-overflow=]
-  523 |             buf[len++] = '0';
-      |             ~~~~~~~~~~~^~~~~
-../../sources/safec-3.9.1/src/str/vsnprintf_s.c:394:10: note: at offset [1, 32] into destination object 'buf' of size 32
-  394 |     char buf[PRINTF_FTOA_BUFFER_SIZE];
-      |          ^~~
-cc1: all warnings being treated as errors
-
-Upstream-Status: Submitted [https://github.com/rurban/safeclib/pull/148]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream: https://github.com/rurban/safeclib/commit/f59a0c8c1b5cf19cd0ed7f9bfb3a1e85f54113d0
-
-[backported to version 3.7.1]
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- src/str/vsnprintf_s.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/str/vsnprintf_s.c b/src/str/vsnprintf_s.c
-index ca838df1..8ef6989a 100644
---- a/src/str/vsnprintf_s.c
-+++ b/src/str/vsnprintf_s.c
-@@ -369,7 +369,7 @@ static size_t safec_ftoa(out_fct_type out,  const char *funcname,
-                          double value, unsigned int prec, unsigned int width,
-                          unsigned int flags)
- {
--    char buf[PRINTF_FTOA_BUFFER_SIZE];
-+    char buf[PRINTF_FTOA_BUFFER_SIZE + 1];
-     size_t len = 0U;
-     double tmp;
-     double diff = 0.0;
--- 
-2.47.3
-
diff --git a/package/safeclib/safeclib.hash b/package/safeclib/safeclib.hash
index bca5d86261..0227ff2837 100644
--- a/package/safeclib/safeclib.hash
+++ b/package/safeclib/safeclib.hash
@@ -1,5 +1,5 @@
-# From https://github.com/rurban/safeclib/releases/tag/v3.7.1
-sha256  71d3ec970f930bd980f2a41127228eeedfc53749e4c6b203329adc4ff7df32a7  safeclib-3.7.1.tar.xz
+# From https://github.com/rurban/safeclib/releases/tag/v3.9.1
+sha256  771b8de483c4f48c90c12bc2c0326571d3d094440ca29008e4cf70562c631c67  safeclib-3.9.1.tar.xz
 
 # Hash for license file
 sha256  c33e77efd5781e3d59a2bb648c82d2a615035ef0d24cf58880380e3af906510b  COPYING
diff --git a/package/safeclib/safeclib.mk b/package/safeclib/safeclib.mk
index bc58c1a38c..6478796a7e 100644
--- a/package/safeclib/safeclib.mk
+++ b/package/safeclib/safeclib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAFECLIB_VERSION = 3.7.1
+SAFECLIB_VERSION = 3.9.1
 SAFECLIB_SITE = \
 	https://github.com/rurban/safeclib/releases/download/v$(SAFECLIB_VERSION)
 SAFECLIB_SOURCE = safeclib-$(SAFECLIB_VERSION).tar.xz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
