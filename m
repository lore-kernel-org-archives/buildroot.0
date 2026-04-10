Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D15AF9D0D3
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 15:42:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3268242B20;
	Tue, 14 Apr 2026 15:42:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2iro-oIO2LK3; Tue, 14 Apr 2026 15:42:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D349942B3B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776181373;
	bh=JvTQUbc2fGBLPHHza2IYBFTIfVxqidSkdC+wGqVa7Yw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=U1Rz8ftOJc/Im7d+D0BO1pHmI9RPaAQ4QGIWSsQJCMs0h+i19RvirhFv7bpMfiFfB
	 a7ZoxZ6STxjByxoXvN8Aj1pBgUW1HiE+soK7N+jhYjNowNdYreSWFNN2hIWbjhRHPQ
	 dzBs0XSkHCCnLGUketYQFPkxcGs3ey1wPhBwddOknWpp/jw2uxOW8HPMAWyZqY0ouF
	 hX+pUiXsvXnYcJmOxK3zdeodJAdNxvhFsWmyXjiCaoiORvQcQJDsBAnJ2J/q/Gu2Mj
	 otQaF5dsDkEML5irdGNUF0h0dEgf1dpgtZpgvZXkmO9t5/ToWr80v1pk6gitJMh/Zh
	 /MyDiqxjSa0tw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D349942B3B;
	Tue, 14 Apr 2026 15:42:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 92A6B283
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:42:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 078DE84D41
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:42:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uMlT_urC0l6N for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 15:42:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9569A84D42
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9569A84D42
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:42:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 34240814AF; Tue, 14 Apr 2026 15:42:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 Apr 2026 12:20:16 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: e7b033076e28a1d9d019b932f8a1d7a434aa3dd7
X-Git-Newrev: 7e9471e5caf1fa6480abf1a02cf1bd5c3a3aa40b
X-Patchwork-Hint: ignore
Message-Id: <20260414154237.34240814AF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/musl: bump to
 version 1.2.6
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4997540009413431033=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4997540009413431033==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7e9471e5caf1fa6480abf1a02cf1bd5c3a3aa40b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

For release announce, see:
https://www.openwall.com/lists/musl/2026/03/20/1

For change log, see:
https://git.musl-libc.org/cgit/musl/tree/WHATSNEW?h=v1.2.6#n2444

This upstream relase includes fix for the CVE-2025-26519 and several other
issues buildroot previously needed to apply its own patches for.
Sha256 of the COPYRIGHT file has changed due to a contributor name change,
licence remains otherwise the same. See:
https://git.musl-libc.org/cgit/musl/commit/COPYRIGHT?id=2fc56aaa9f660ebd735d1595c3501b792af42eb8

Signed-off-by: Daniel Brát <danek.brat@gmail.com>
[Julien: add links in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 9018402c2c0bd92be0664df82d943e11fe782a6b)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...visibility-for-C-entry-point-function-_st.patch | 42 ----------------------
 ...rroneous-input-validation-in-EUC-KR-decod.patch | 42 ----------------------
 ...n-UTF-8-output-code-path-against-input-de.patch | 41 ---------------------
 package/musl/0006-m68k-fix-poll.patch              | 26 --------------
 package/musl/musl.hash                             |  6 ++--
 package/musl/musl.mk                               |  6 +---
 6 files changed, 4 insertions(+), 159 deletions(-)

diff --git a/package/musl/0003-use-hidden-visibility-for-C-entry-point-function-_st.patch b/package/musl/0003-use-hidden-visibility-for-C-entry-point-function-_st.patch
deleted file mode 100644
index 6359565cd7..0000000000
--- a/package/musl/0003-use-hidden-visibility-for-C-entry-point-function-_st.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 9c78557af0a5e521cdb46a4ca7630f2987d2523e Mon Sep 17 00:00:00 2001
-From: Rich Felker <dalias@aerifal.cx>
-Date: Sat, 10 Aug 2024 19:49:24 -0400
-Subject: [PATCH] use hidden visibility for C entry point function _start_c
-
-the file-level crt_arch.h asm fragments generally make direct
-(non-PLT) calls from _start to _start_c, which is only valid when
-there is a local, non-interposable definition for _start_c. generally,
-the linker is expected to know that local definitions in a main
-executable (as opposed to shared library) output are non-interposable,
-making this work, but historically there have been linker bugs in this
-area, and microblaze is reportedly still broken, flagging the
-relocation for the call as a textrel.
-
-the equivalent _dlstart_c, called from the same crt_arch.h asm
-fragments, has always used hidden visibility without problem, and
-semantically it should be hidden, so make it hidden. this ensures the
-direct call is always valid regardless of whether the linker properly
-special-cases main executable output.
-
-Upstream: https://git.musl-libc.org/cgit/musl/commit/?id=9c78557af0a5e521cdb46a4ca7630f2987d2523e
-Signed-off-by: J. Neuschäfer <j.neuschaefer@gmx.net>
----
- crt/crt1.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/crt/crt1.c b/crt/crt1.c
-index 8fe8ab5d..10601215 100644
---- a/crt/crt1.c
-+++ b/crt/crt1.c
-@@ -11,7 +11,7 @@ weak void _fini();
- int __libc_start_main(int (*)(), int, char **,
- 	void (*)(), void(*)(), void(*)());
-
--void _start_c(long *p)
-+hidden void _start_c(long *p)
- {
- 	int argc = p[0];
- 	char **argv = (void *)(p+1);
---
-2.45.2
-
diff --git a/package/musl/0004-iconv-fix-erroneous-input-validation-in-EUC-KR-decod.patch b/package/musl/0004-iconv-fix-erroneous-input-validation-in-EUC-KR-decod.patch
deleted file mode 100644
index a0418e1df8..0000000000
--- a/package/musl/0004-iconv-fix-erroneous-input-validation-in-EUC-KR-decod.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From e5adcd97b5196e29991b524237381a0202a60659 Mon Sep 17 00:00:00 2001
-From: Rich Felker <dalias@aerifal.cx>
-Date: Sun, 9 Feb 2025 10:07:19 -0500
-Subject: [PATCH] iconv: fix erroneous input validation in EUC-KR decoder
-
-as a result of incorrect bounds checking on the lead byte being
-decoded, certain invalid inputs which should produce an encoding
-error, such as "\xc8\x41", instead produced out-of-bounds loads from
-the ksc table.
-
-in a worst case, the loaded value may not be a valid unicode scalar
-value, in which case, if the output encoding was UTF-8, wctomb would
-return (size_t)-1, causing an overflow in the output pointer and
-remaining buffer size which could clobber memory outside of the output
-buffer.
-
-bug report was submitted in private by Nick Wellnhofer on account of
-potential security implications.
-
-CVE: CVE-2025-26519
-Upstream: https://git.musl-libc.org/cgit/musl/commit/?id=e5adcd97b5196e29991b524237381a0202a60659
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- src/locale/iconv.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/locale/iconv.c b/src/locale/iconv.c
-index 9605c8e9..008c93f0 100644
---- a/src/locale/iconv.c
-+++ b/src/locale/iconv.c
-@@ -502,7 +502,7 @@ size_t iconv(iconv_t cd, char **restrict in, size_t *restrict inb, char **restri
- 			if (c >= 93 || d >= 94) {
- 				c += (0xa1-0x81);
- 				d += 0xa1;
--				if (c >= 93 || c>=0xc6-0x81 && d>0x52)
-+				if (c > 0xc6-0x81 || c==0xc6-0x81 && d>0x52)
- 					goto ilseq;
- 				if (d-'A'<26) d = d-'A';
- 				else if (d-'a'<26) d = d-'a'+26;
--- 
-2.39.5
-
diff --git a/package/musl/0005-iconv-harden-UTF-8-output-code-path-against-input-de.patch b/package/musl/0005-iconv-harden-UTF-8-output-code-path-against-input-de.patch
deleted file mode 100644
index 8250790d4f..0000000000
--- a/package/musl/0005-iconv-harden-UTF-8-output-code-path-against-input-de.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From c47ad25ea3b484e10326f933e927c0bc8cded3da Mon Sep 17 00:00:00 2001
-From: Rich Felker <dalias@aerifal.cx>
-Date: Wed, 12 Feb 2025 17:06:30 -0500
-Subject: [PATCH] iconv: harden UTF-8 output code path against input decoder
- bugs
-
-the UTF-8 output code was written assuming an invariant that iconv's
-decoders only emit valid Unicode Scalar Values which wctomb can encode
-successfully, thereby always returning a value between 1 and 4.
-
-if this invariant is not satisfied, wctomb returns (size_t)-1, and the
-subsequent adjustments to the output buffer pointer and remaining
-output byte count overflow, moving the output position backwards,
-potentially past the beginning of the buffer, without storing any
-bytes.
-
-CVE: CVE-2025-26519
-Upstream: https://git.musl-libc.org/cgit/musl/commit/?id=c47ad25ea3b484e10326f933e927c0bc8cded3da
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- src/locale/iconv.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/src/locale/iconv.c b/src/locale/iconv.c
-index 008c93f0..52178950 100644
---- a/src/locale/iconv.c
-+++ b/src/locale/iconv.c
-@@ -545,6 +545,10 @@ size_t iconv(iconv_t cd, char **restrict in, size_t *restrict inb, char **restri
- 				if (*outb < k) goto toobig;
- 				memcpy(*out, tmp, k);
- 			} else k = wctomb_utf8(*out, c);
-+			/* This failure condition should be unreachable, but
-+			 * is included to prevent decoder bugs from translating
-+			 * into advancement outside the output buffer range. */
-+			if (k>4) goto ilseq;
- 			*out += k;
- 			*outb -= k;
- 			break;
--- 
-2.39.5
-
diff --git a/package/musl/0006-m68k-fix-poll.patch b/package/musl/0006-m68k-fix-poll.patch
deleted file mode 100644
index cafee534e4..0000000000
--- a/package/musl/0006-m68k-fix-poll.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From b09e3174a695d1db60b2abc442d29ed3f87f0358 Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Wed, 7 Aug 2024 08:51:03 +0300
-Subject: m68k: fix POLLWRNORM and POLLWRBAND
-
-As noted in commit f5011c62c3 ("fix POLLWRNORM and POLLWRBAND on mips")
-m68k uses a different definition.
-
-Signed-off-by: Daniel Palmer <daniel@0x0f.com>
-Upstream: https://git.musl-libc.org/cgit/musl/commit/?id=b09e3174a695d1db60b2abc442d29ed3f87f0358
----
- arch/m68k/bits/poll.h | 2 ++
- 1 file changed, 2 insertions(+)
- create mode 100644 arch/m68k/bits/poll.h
-
-diff --git a/arch/m68k/bits/poll.h b/arch/m68k/bits/poll.h
-new file mode 100644
-index 00000000..00063f41
---- /dev/null
-+++ b/arch/m68k/bits/poll.h
-@@ -0,0 +1,2 @@
-+#define POLLWRNORM POLLOUT
-+#define POLLWRBAND 256
--- 
-cgit v1.2.1
-
diff --git a/package/musl/musl.hash b/package/musl/musl.hash
index b105320bac..e3cc652f5b 100644
--- a/package/musl/musl.hash
+++ b/package/musl/musl.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature from
-# http://musl.libc.org/releases/musl-1.2.5.tar.gz.asc
-sha256  a9a118bbe84d8764da0ea0d28b3ab3fae8477fc7e4085d90102b8596fc7c75e4  musl-1.2.5.tar.gz
-sha256  f9bc4423732350eb0b3f7ed7e91d530298476f8fec0c6c427a1c04ade22655af  COPYRIGHT
+# http://musl.libc.org/releases/musl-1.2.6.tar.gz.asc
+sha256  d585fd3b613c66151fc3249e8ed44f77020cb5e6c1e635a616d3f9f82460512a  musl-1.2.6.tar.gz
+sha256  b870108ec5e7790e9f9919064f1b9421d62d5f9b0e6c230c6adf7ea2da62e97b  COPYRIGHT
diff --git a/package/musl/musl.mk b/package/musl/musl.mk
index 13a49a15eb..bea9029455 100644
--- a/package/musl/musl.mk
+++ b/package/musl/musl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MUSL_VERSION = 1.2.5
+MUSL_VERSION = 1.2.6
 MUSL_SITE = http://musl.libc.org/releases
 MUSL_LICENSE = MIT
 MUSL_LICENSE_FILES = COPYRIGHT
@@ -26,10 +26,6 @@ MUSL_ADD_TOOLCHAIN_DEPENDENCY = NO
 
 MUSL_INSTALL_STAGING = YES
 
-# 0004-iconv-fix-erroneous-input-validation-in-EUC-KR-decod.patch
-# 0005-iconv-harden-UTF-8-output-code-path-against-input-de.patch
-MUSL_IGNORE_CVES += CVE-2025-26519
-
 # musl does not build with LTO, so explicitly disable it
 # when using a compiler that may have support for LTO
 ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_4_7),y)

--===============4997540009413431033==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4997540009413431033==--
