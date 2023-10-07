Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A7F0E95A60
	for <buildroot@archiver.kernel.org>; Sat,  7 Oct 2023 10:47:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E39E540AFF;
	Sat,  7 Oct 2023 10:47:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E39E540AFF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o37hgZxlL3dp; Sat,  7 Oct 2023 10:47:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1EA0840A74;
	Sat,  7 Oct 2023 10:47:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1EA0840A74
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 00F961BF419
 for <buildroot@lists.busybox.net>; Sat,  7 Oct 2023 10:47:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CE49C40A74
 for <buildroot@lists.busybox.net>; Sat,  7 Oct 2023 10:47:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE49C40A74
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aprBQQErJhvb for <buildroot@lists.busybox.net>;
 Sat,  7 Oct 2023 10:47:51 +0000 (UTC)
X-Greylist: delayed 334 seconds by postgrey-1.37 at util1.osuosl.org;
 Sat, 07 Oct 2023 10:47:50 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C022F400E7
Received: from aposti.net (aposti.net [89.234.176.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C022F400E7
 for <buildroot@buildroot.org>; Sat,  7 Oct 2023 10:47:50 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: buildroot@buildroot.org
Date: Sat,  7 Oct 2023 12:42:05 +0200
Message-Id: <20231007104205.12608-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=crapouillou.net; s=mail; t=1696675332;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=5aybNYAp/qhsmPDhC0oB8by09fF3GMCotDc7tKZHQ+4=;
 b=OHIha3fx3rwgRJ4l4pGFxAvNHOP9ZUOVPt2ObwL05qKWwdCeTQbYsmFlPeXOYbvafRwde2
 ihYsRqvXR26y5adL1D8LqrfsRq3hJ5fj4AJoHpMYxBiwFI1lBj5fizEjkKUsd+9lEAFX4l
 vF7WD9l9BdiDtv2tSI6yIc0V8EEkzPk=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net
 header.a=rsa-sha256 header.s=mail header.b=OHIha3fx
Subject: [Buildroot] [PATCH] package/lightning: fix build on mips64
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
Cc: Paul Cercueil <paul@crapouillou.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Grab commit 90f5c78f47dfb1ae4b953b0e30c7ef72a6438396 from upstream to
fix the build on mips64 and mips64el.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 .../0001-Fix-build-on-mips64el.patch          | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 package/lightning/0001-Fix-build-on-mips64el.patch

diff --git a/package/lightning/0001-Fix-build-on-mips64el.patch b/package/lightning/0001-Fix-build-on-mips64el.patch
new file mode 100644
index 0000000000..b3f087bb9e
--- /dev/null
+++ b/package/lightning/0001-Fix-build-on-mips64el.patch
@@ -0,0 +1,65 @@
+From 90f5c78f47dfb1ae4b953b0e30c7ef72a6438396 Mon Sep 17 00:00:00 2001
+From: Paul Cercueil <paul@crapouillou.net>
+Date: Thu, 5 Oct 2023 14:24:13 +0200
+Subject: [PATCH] Fix build on mips64el
+
+The "cvt_offset" field may be used for anything non-ARM in
+jit_fallback.c, so enable this field on anything non-ARM. Worst case
+scenario, this field is not used and it only occupies 4 bytes of RAM.
+
+Besides, when building for mips64el with the N32 ABI, the __WORDSIZE
+ends up being 32 and not 64 (which may be a problem in itself), which
+caused some more issues as the movi_d_w() macro referenced by
+jit_mips.c was not defined anywhere.
+
+This caused Buildroot's CI to fail when building on mips64el:
+http://autobuild.buildroot.net/results/f951d91d2ca4647170a52499a243d45d13d3bced/
+
+Upstream: http://git.savannah.gnu.org/cgit/lightning.git/commit/?id=90f5c78f47dfb1ae4b953b0e30c7ef72a6438396
+Signed-off-by: Paul Cercueil <paul@crapouillou.net>
+---
+ include/lightning/jit_private.h | 5 +----
+ lib/lightning.c                 | 4 ++--
+ 2 files changed, 3 insertions(+), 6 deletions(-)
+
+diff --git a/include/lightning/jit_private.h b/include/lightning/jit_private.h
+index 5052a36..9f8caf6 100644
+--- a/include/lightning/jit_private.h
++++ b/include/lightning/jit_private.h
+@@ -555,10 +555,7 @@ struct jit_function {
+     jit_int32_t		*regoff;
+     jit_regset_t	 regset;
+     jit_int32_t		 stack;
+-#if defined(__i386__) || defined(__x86_64__) || \
+-    defined(__powerpc__) || defined(__sparc__) || \
+-    defined(__s390__) || defined(__s390x__) || \
+-    defined(__hppa__) || defined(__alpha__)
++#if !defined(__arm__)
+     jit_int32_t		 cvt_offset;	/* allocai'd offset for x87<->xmm or
+ 					 * fpr<->gpr transfer using the stack */
+ #endif
+diff --git a/lib/lightning.c b/lib/lightning.c
+index d5ea330..39c4fc2 100644
+--- a/lib/lightning.c
++++ b/lib/lightning.c
+@@ -4285,7 +4285,7 @@ static void _htoni_ul(jit_state_t*, jit_int32_t, jit_word_t);
+ #endif
+ #  define movi_f_w(r0, i0)		_movi_f_w(_jit, r0, i0)
+ static void _movi_f_w(jit_state_t*, jit_int32_t, jit_float32_t);
+-#if __WORDSIZE == 32
++#if __WORDSIZE == 32 && !(defined(__mips__) && NEW_ABI)
+ #  define movi_d_ww(r0, r1, i0)		_movi_d_ww(_jit, r0, r1, i0)
+ static void _movi_d_ww(jit_state_t*, jit_int32_t, jit_int32_t, jit_float64_t);
+ #else
+@@ -4569,7 +4569,7 @@ _movi_f_w(jit_state_t *_jit, jit_int32_t r0, jit_float32_t i0)
+     movi(r0, data.i);
+ }
+ 
+-#if __WORDSIZE == 32
++#if __WORDSIZE == 32 && !(defined(__mips__) && NEW_ABI)
+ static void
+ _movi_d_ww(jit_state_t *_jit, jit_int32_t r0, jit_int32_t r1, jit_float64_t i0)
+ {
+-- 
+2.40.1
+
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
