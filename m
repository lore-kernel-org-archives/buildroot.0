Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63722F8FA69
	for <buildroot@archiver.kernel.org>; Tue, 21 Apr 2026 12:09:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1020441F63;
	Tue, 21 Apr 2026 12:09:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8xNInODVzgNp; Tue, 21 Apr 2026 12:09:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7AA141F7C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776773357;
	bh=a2W52DTnNCvWoro/U7A6XmA8LSuqDWheTTBqUD4g0Uk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=AFNwlmhqRQUK/jTeNYVmV7cKfCA4vP+g4EO4J0xqGo23s0Kvtp9gaLVMIOXFK84jE
	 cbCot1fxGF7wjlIQgWilKEK4OUokgqKWmBLJtXLBPGOOoJxRb/FrDAH2jjSBqp5pBD
	 leMySgk8VcZenuU5pUGAjIHbkzLHtx35CsgsacT2gN2taz01WBONUnWMuT+PMMARoj
	 Z3iy+ShofBR5454m5CJQYDVw0geEZl3E+cP1h2TelZHaPEC698/DaiC+11pejOU7uX
	 wp9NN6M2yBg5bKCFi4ivYgjtmUJ5m8RS9DhMTKICcJwVSjVuCaVRpBM+x63NuvyN4F
	 h8Fka2btER+Ug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7AA141F7C;
	Tue, 21 Apr 2026 12:09:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 13BC3257
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 12:09:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ED8A840B16
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 12:09:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id euHsiBp9_1EW for <buildroot@buildroot.org>;
 Tue, 21 Apr 2026 12:09:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AEF1640B3C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AEF1640B3C
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 12:09:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5617A821E1; Tue, 21 Apr 2026 12:09:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 21 Apr 2026 13:54:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b5ff02164f5a793fd9abeae997ed54614830e89b
X-Git-Newrev: e96e63dc0edfc08ccd2ec1bf67d5235b995e9379
X-Patchwork-Hint: ignore
Message-Id: <20260421120915.5617A821E1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/musl: add upstream security
 patches for CVE-2026-40200
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e96e63dc0edfc08ccd2ec1bf67d5235b995e9379
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixes CVE-2026-40200: musl libc: stack corruption in qsort with
sufficiently large inputs
https://www.openwall.com/lists/musl/2026/04/10/3

Fixes: https://nvd.nist.gov/vuln/detail/CVE-2026-40200

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...eonardo-heap-corruption-from-bug-in-doubl.patch | 48 +++++++++++
 ...preclude-oob-array-writes-independent-of-.patch | 97 ++++++++++++++++++++++
 .../0006-qsort-fix-shift-UB-in-shl-and-shr.patch   | 43 ++++++++++
 package/musl/musl.mk                               |  5 ++
 4 files changed, 193 insertions(+)

diff --git a/package/musl/0004-qsort-fix-leonardo-heap-corruption-from-bug-in-doubl.patch b/package/musl/0004-qsort-fix-leonardo-heap-corruption-from-bug-in-doubl.patch
new file mode 100644
index 0000000000..1f179552df
--- /dev/null
+++ b/package/musl/0004-qsort-fix-leonardo-heap-corruption-from-bug-in-doubl.patch
@@ -0,0 +1,48 @@
+From 228da39e38c1cae13cbe637e771412c1984dba5d Mon Sep 17 00:00:00 2001
+From: Rich Felker <dalias@aerifal.cx>
+Date: Thu, 9 Apr 2026 22:51:30 -0400
+Subject: [PATCH] qsort: fix leonardo heap corruption from bug in doubleword
+ ctz primitive
+
+the pntz function, implementing a "count trailing zeros" variant for a
+bit vector consisting of two size_t words, erroneously returned zero
+rather than the number of bits in the low word when the first bit set
+was the low bit of the high word.
+
+as a result, a loop in the trinkle function which should have a
+guaranteed small bound on the number of iterations, could run
+unboundedly, thereby overflowing a stack-based working-space array
+which was sized for the bound.
+
+CVE-2026-40200 has been assigned for this issue.
+
+CVE: CVE-2026-40200
+Upstream: https://git.musl-libc.org/cgit/musl/commit/?id=228da39e38c1cae13cbe637e771412c1984dba5d
+Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
+---
+ src/stdlib/qsort.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/src/stdlib/qsort.c b/src/stdlib/qsort.c
+index ab79dc6f..13219ab3 100644
+--- a/src/stdlib/qsort.c
++++ b/src/stdlib/qsort.c
+@@ -34,11 +34,11 @@
+ 
+ typedef int (*cmpfun)(const void *, const void *, void *);
+ 
++/* returns index of first bit set, excluding the low bit assumed to always
++ * be set, starting from low bit of p[0] up through high bit of p[1] */
+ static inline int pntz(size_t p[2]) {
+-	int r = ntz(p[0] - 1);
+-	if(r != 0 || (r = 8*sizeof(size_t) + ntz(p[1])) != 8*sizeof(size_t)) {
+-		return r;
+-	}
++	if (p[0] != 1) return ntz(p[0] - 1);
++	if (p[1]) return 8*sizeof(size_t) + ntz(p[1]);
+ 	return 0;
+ }
+ 
+-- 
+2.53.0
+
diff --git a/package/musl/0005-qsort-hard-preclude-oob-array-writes-independent-of-.patch b/package/musl/0005-qsort-hard-preclude-oob-array-writes-independent-of-.patch
new file mode 100644
index 0000000000..1604ae9dc4
--- /dev/null
+++ b/package/musl/0005-qsort-hard-preclude-oob-array-writes-independent-of-.patch
@@ -0,0 +1,97 @@
+From b3291b9a9f77f1f993d2b4f8c68a26cf09221ae7 Mon Sep 17 00:00:00 2001
+From: Rich Felker <dalias@aerifal.cx>
+Date: Thu, 9 Apr 2026 23:40:53 -0400
+Subject: [PATCH] qsort: hard-preclude oob array writes independent of any
+ invariants
+
+while the root cause of CVE-2026-40200 was a faulty ctz primitive, the
+fallout of the bug would have been limited to erroneous sorting or
+infinite loop if not for the stores to a stack-based array that
+depended on trusting invariants in order not to go out of bounds.
+
+increase the size of the array to a power of two so that we can mask
+indices into it to force them into range. in the absence of any
+further bug, the masking is a no-op, but it does not have any
+measurable performance cost, and it makes spatial memory safety
+trivial to prove (and for readers not familiar with the algorithms to
+trust).
+
+CVE: CVE-2026-40200
+Upstream: https://git.musl-libc.org/cgit/musl/commit/?id=b3291b9a9f77f1f993d2b4f8c68a26cf09221ae7
+Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
+---
+ src/stdlib/qsort.c | 20 +++++++++++++-------
+ 1 file changed, 13 insertions(+), 7 deletions(-)
+
+diff --git a/src/stdlib/qsort.c b/src/stdlib/qsort.c
+index 13219ab3..e4bce9f7 100644
+--- a/src/stdlib/qsort.c
++++ b/src/stdlib/qsort.c
+@@ -89,10 +89,16 @@ static inline void shr(size_t p[2], int n)
+ 	p[1] >>= n;
+ }
+ 
++/* power-of-two length for working array so that we can mask indices and
++ * not depend on any invariant of the algorithm for spatial memory safety.
++ * the original size was just 14*sizeof(size_t)+1 */
++#define AR_LEN  (16 * sizeof(size_t))
++#define AR_MASK (AR_LEN - 1)
++
+ static void sift(unsigned char *head, size_t width, cmpfun cmp, void *arg, int pshift, size_t lp[])
+ {
+ 	unsigned char *rt, *lf;
+-	unsigned char *ar[14 * sizeof(size_t) + 1];
++	unsigned char *ar[AR_LEN];
+ 	int i = 1;
+ 
+ 	ar[0] = head;
+@@ -104,16 +110,16 @@ static void sift(unsigned char *head, size_t width, cmpfun cmp, void *arg, int p
+ 			break;
+ 		}
+ 		if(cmp(lf, rt, arg) >= 0) {
+-			ar[i++] = lf;
++			ar[i++ & AR_MASK] = lf;
+ 			head = lf;
+ 			pshift -= 1;
+ 		} else {
+-			ar[i++] = rt;
++			ar[i++ & AR_MASK] = rt;
+ 			head = rt;
+ 			pshift -= 2;
+ 		}
+ 	}
+-	cycle(width, ar, i);
++	cycle(width, ar, i & AR_MASK);
+ }
+ 
+ static void trinkle(unsigned char *head, size_t width, cmpfun cmp, void *arg, size_t pp[2], int pshift, int trusty, size_t lp[])
+@@ -121,7 +127,7 @@ static void trinkle(unsigned char *head, size_t width, cmpfun cmp, void *arg, si
+ 	unsigned char *stepson,
+ 	              *rt, *lf;
+ 	size_t p[2];
+-	unsigned char *ar[14 * sizeof(size_t) + 1];
++	unsigned char *ar[AR_LEN];
+ 	int i = 1;
+ 	int trail;
+ 
+@@ -142,7 +148,7 @@ static void trinkle(unsigned char *head, size_t width, cmpfun cmp, void *arg, si
+ 			}
+ 		}
+ 
+-		ar[i++] = stepson;
++		ar[i++ & AR_MASK] = stepson;
+ 		head = stepson;
+ 		trail = pntz(p);
+ 		shr(p, trail);
+@@ -150,7 +156,7 @@ static void trinkle(unsigned char *head, size_t width, cmpfun cmp, void *arg, si
+ 		trusty = 0;
+ 	}
+ 	if(!trusty) {
+-		cycle(width, ar, i);
++		cycle(width, ar, i & AR_MASK);
+ 		sift(head, width, cmp, arg, pshift, lp);
+ 	}
+ }
+-- 
+2.53.0
+
diff --git a/package/musl/0006-qsort-fix-shift-UB-in-shl-and-shr.patch b/package/musl/0006-qsort-fix-shift-UB-in-shl-and-shr.patch
new file mode 100644
index 0000000000..455a0677e2
--- /dev/null
+++ b/package/musl/0006-qsort-fix-shift-UB-in-shl-and-shr.patch
@@ -0,0 +1,43 @@
+From 5122f9f3c99fee366167c5de98b31546312921ab Mon Sep 17 00:00:00 2001
+From: Luca Kellermann <mailto.luca.kellermann@gmail.com>
+Date: Fri, 10 Apr 2026 03:03:22 +0200
+Subject: [PATCH] qsort: fix shift UB in shl and shr
+
+if shl() or shr() are called with n==8*sizeof(size_t), n is adjusted
+to 0. the shift by (sizeof(size_t) * 8 - n) that then follows will
+consequently shift by the width of size_t, which is UB and in practice
+produces an incorrect result.
+
+return early in this case. the bitvector p was already shifted by the
+required amount.
+
+CVE: CVE-2026-40200
+Upstream: https://git.musl-libc.org/cgit/musl/commit/?id=5122f9f3c99fee366167c5de98b31546312921ab
+Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
+---
+ src/stdlib/qsort.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/stdlib/qsort.c b/src/stdlib/qsort.c
+index e4bce9f7..28607450 100644
+--- a/src/stdlib/qsort.c
++++ b/src/stdlib/qsort.c
+@@ -71,6 +71,7 @@ static inline void shl(size_t p[2], int n)
+ 		n -= 8 * sizeof(size_t);
+ 		p[1] = p[0];
+ 		p[0] = 0;
++		if (!n) return;
+ 	}
+ 	p[1] <<= n;
+ 	p[1] |= p[0] >> (sizeof(size_t) * 8 - n);
+@@ -83,6 +84,7 @@ static inline void shr(size_t p[2], int n)
+ 		n -= 8 * sizeof(size_t);
+ 		p[0] = p[1];
+ 		p[1] = 0;
++		if (!n) return;
+ 	}
+ 	p[0] >>= n;
+ 	p[0] |= p[1] << (sizeof(size_t) * 8 - n);
+-- 
+2.53.0
+
diff --git a/package/musl/musl.mk b/package/musl/musl.mk
index 29a9c90ce1..5384a08abf 100644
--- a/package/musl/musl.mk
+++ b/package/musl/musl.mk
@@ -29,6 +29,11 @@ MUSL_INSTALL_STAGING = YES
 # 0003-fix-pathological-slowness-incorrect-mappings-in-icon.patch
 MUSL_IGNORE_CVES += CVE-2026-6042
 
+# 0004-qsort-fix-leonardo-heap-corruption-from-bug-in-doubl.patch
+# 0005-qsort-hard-preclude-oob-array-writes-independent-of-.patch
+# 0006-qsort-fix-shift-UB-in-shl-and-shr.patch
+MUSL_IGNORE_CVES += CVE-2026-40200
+
 # musl does not build with LTO, so explicitly disable it
 # when using a compiler that may have support for LTO
 ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_4_7),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
