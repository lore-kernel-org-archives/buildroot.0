Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F1F6C25B10
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 16:45:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1747C41E85;
	Thu,  9 May 2024 16:45:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B-Wbgc_5uek8; Thu,  9 May 2024 16:45:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D105405B0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D105405B0;
	Thu,  9 May 2024 16:45:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BE5421BF337
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 16:45:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 88D2061002
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 16:45:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8wY0bwPvzOQG for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 16:45:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93055606DC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 93055606DC
 for <buildroot@buildroot.org>; Thu,  9 May 2024 16:45:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7A77386CE4; Thu,  9 May 2024 16:45:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 May 2024 18:43:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a9e54f2cdf2717dcd7e87a4fb8d641a1206eeed3
X-Git-Newrev: c89bec21dbebe5fe689aac5c0674b69634b52317
X-Patchwork-Hint: ignore
Message-Id: <20240509164548.7A77386CE4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lightning: bump version to 2.2.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=c89bec21dbebe5fe689aac5c0674b69634b52317
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.gnu.org/archive/html/lightning/2024-02/msg00000.html

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lightning/0001-Fix-build-on-mips64el.patch | 65 ----------------------
 package/lightning/lightning.hash                   |  2 +-
 package/lightning/lightning.mk                     |  2 +-
 3 files changed, 2 insertions(+), 67 deletions(-)

diff --git a/package/lightning/0001-Fix-build-on-mips64el.patch b/package/lightning/0001-Fix-build-on-mips64el.patch
deleted file mode 100644
index b3f087bb9e..0000000000
--- a/package/lightning/0001-Fix-build-on-mips64el.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From 90f5c78f47dfb1ae4b953b0e30c7ef72a6438396 Mon Sep 17 00:00:00 2001
-From: Paul Cercueil <paul@crapouillou.net>
-Date: Thu, 5 Oct 2023 14:24:13 +0200
-Subject: [PATCH] Fix build on mips64el
-
-The "cvt_offset" field may be used for anything non-ARM in
-jit_fallback.c, so enable this field on anything non-ARM. Worst case
-scenario, this field is not used and it only occupies 4 bytes of RAM.
-
-Besides, when building for mips64el with the N32 ABI, the __WORDSIZE
-ends up being 32 and not 64 (which may be a problem in itself), which
-caused some more issues as the movi_d_w() macro referenced by
-jit_mips.c was not defined anywhere.
-
-This caused Buildroot's CI to fail when building on mips64el:
-http://autobuild.buildroot.net/results/f951d91d2ca4647170a52499a243d45d13d3bced/
-
-Upstream: http://git.savannah.gnu.org/cgit/lightning.git/commit/?id=90f5c78f47dfb1ae4b953b0e30c7ef72a6438396
-Signed-off-by: Paul Cercueil <paul@crapouillou.net>
----
- include/lightning/jit_private.h | 5 +----
- lib/lightning.c                 | 4 ++--
- 2 files changed, 3 insertions(+), 6 deletions(-)
-
-diff --git a/include/lightning/jit_private.h b/include/lightning/jit_private.h
-index 5052a36..9f8caf6 100644
---- a/include/lightning/jit_private.h
-+++ b/include/lightning/jit_private.h
-@@ -555,10 +555,7 @@ struct jit_function {
-     jit_int32_t		*regoff;
-     jit_regset_t	 regset;
-     jit_int32_t		 stack;
--#if defined(__i386__) || defined(__x86_64__) || \
--    defined(__powerpc__) || defined(__sparc__) || \
--    defined(__s390__) || defined(__s390x__) || \
--    defined(__hppa__) || defined(__alpha__)
-+#if !defined(__arm__)
-     jit_int32_t		 cvt_offset;	/* allocai'd offset for x87<->xmm or
- 					 * fpr<->gpr transfer using the stack */
- #endif
-diff --git a/lib/lightning.c b/lib/lightning.c
-index d5ea330..39c4fc2 100644
---- a/lib/lightning.c
-+++ b/lib/lightning.c
-@@ -4285,7 +4285,7 @@ static void _htoni_ul(jit_state_t*, jit_int32_t, jit_word_t);
- #endif
- #  define movi_f_w(r0, i0)		_movi_f_w(_jit, r0, i0)
- static void _movi_f_w(jit_state_t*, jit_int32_t, jit_float32_t);
--#if __WORDSIZE == 32
-+#if __WORDSIZE == 32 && !(defined(__mips__) && NEW_ABI)
- #  define movi_d_ww(r0, r1, i0)		_movi_d_ww(_jit, r0, r1, i0)
- static void _movi_d_ww(jit_state_t*, jit_int32_t, jit_int32_t, jit_float64_t);
- #else
-@@ -4569,7 +4569,7 @@ _movi_f_w(jit_state_t *_jit, jit_int32_t r0, jit_float32_t i0)
-     movi(r0, data.i);
- }
- 
--#if __WORDSIZE == 32
-+#if __WORDSIZE == 32 && !(defined(__mips__) && NEW_ABI)
- static void
- _movi_d_ww(jit_state_t *_jit, jit_int32_t r0, jit_int32_t r1, jit_float64_t i0)
- {
--- 
-2.40.1
-
diff --git a/package/lightning/lightning.hash b/package/lightning/lightning.hash
index 6f7c24d19c..76ad5e4cda 100644
--- a/package/lightning/lightning.hash
+++ b/package/lightning/lightning.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  0aca8242dead17d62117bcfcb078e6a9ea856cc81742813c9e8394bcce73b3e2  lightning-2.2.2.tar.gz
+sha256  c045c7a33a00affbfeb11066fa502c03992e474a62ba95977aad06dbc14c6829  lightning-2.2.3.tar.gz
 sha256  a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c  COPYING.LESSER
diff --git a/package/lightning/lightning.mk b/package/lightning/lightning.mk
index c23ae9745e..08e388392c 100644
--- a/package/lightning/lightning.mk
+++ b/package/lightning/lightning.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIGHTNING_VERSION = 2.2.2
+LIGHTNING_VERSION = 2.2.3
 LIGHTNING_SITE = $(BR2_GNU_MIRROR)/lightning
 LIGHTNING_LICENSE = LGPL-3.0+
 LIGHTNING_LICENSE_FILES = COPYING.LESSER
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
