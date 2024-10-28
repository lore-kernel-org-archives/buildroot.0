Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41A34D13588
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 10:36:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71B6C4056B;
	Mon, 28 Oct 2024 10:36:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WHP7TrLRn1KW; Mon, 28 Oct 2024 10:36:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D62AC4056D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D62AC4056D;
	Mon, 28 Oct 2024 10:36:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 170314EC0
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 10:36:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EC48960668
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 10:36:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 78mSOaziZyvR for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 10:36:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A456260602
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A456260602
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 10:36:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9C91682D9F; Mon, 28 Oct 2024 10:36:13 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 28 Oct 2024 11:35:54 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 7cb57554b8c1a0b612bd119bb0cc4a6207d8ae4f
X-Git-Newrev: f51525bca2865ac47bfdc96bc09987ad3797a20a
X-Patchwork-Hint: ignore
Message-Id: <20241028103613.9C91682D9F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/lightning: fix
 build on mips64 with n32 ABI
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f51525bca2865ac47bfdc96bc09987ad3797a20a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Grab commit 778d326740f9893c398f959b419629935b613099 from upstream to
fix the build on mips64 and mips64el when the n32 ABI is used.

Fixes:

  http://autobuild.buildroot.net/results/27123bf0ddc84599bceb02ac987327817d498659/

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 90167378de35a640ed07f18ded1e0a88aba11396)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...001-mips-Fix-build-on-MIPS64-with-n32-ABI.patch | 133 +++++++++++++++++++++
 1 file changed, 133 insertions(+)

diff --git a/package/lightning/0001-mips-Fix-build-on-MIPS64-with-n32-ABI.patch b/package/lightning/0001-mips-Fix-build-on-MIPS64-with-n32-ABI.patch
new file mode 100644
index 0000000000..19582d143f
--- /dev/null
+++ b/package/lightning/0001-mips-Fix-build-on-MIPS64-with-n32-ABI.patch
@@ -0,0 +1,133 @@
+From 66a9a994c03d65fc37d701a60b26506bede49ae1 Mon Sep 17 00:00:00 2001
+From: Paul Cercueil <paul@crapouillou.net>
+Date: Sun, 2 Jun 2024 22:35:24 +0200
+Subject: [PATCH] mips: Fix build on MIPS64 with n32 ABI
+
+The build on MIPS64 with n32 ABI was broken for a few reasons.
+
+- The _movi_d_w() functions had a different prototype in jit_mips-fpu.c
+  than in lightning.c;
+- The movi_d_w() was still provided by lightning.c even though
+  jit_mips-fpu.c provides its own version;
+- The "ww" opcodes were allowed, which was probably not meant to happen.
+
+Fixes a build issue reported by Buildroot:
+http://autobuild.buildroot.net/results/27123bf0ddc84599bceb02ac987327817d498659/
+
+Signed-off-by: Paul Cercueil <paul@crapouillou.net>
+Upstream: http://git.savannah.gnu.org/cgit/lightning.git/commit/?id=778d326740f9893c398f959b419629935b613099
+---
+ lib/jit_mips-fpu.c |  4 ++--
+ lib/jit_mips.c     |  3 +--
+ lib/lightning.c    | 43 +++++++++++++++++++++----------------------
+ 3 files changed, 24 insertions(+), 26 deletions(-)
+
+diff --git a/lib/jit_mips-fpu.c b/lib/jit_mips-fpu.c
+index 61db30e..8ad97e9 100644
+--- a/lib/jit_mips-fpu.c
++++ b/lib/jit_mips-fpu.c
+@@ -349,7 +349,7 @@ static void _movi_f(jit_state_t*,jit_int32_t,jit_float32_t*);
+ #    define movi64(r0, i0)		_movi64(_jit, r0, i0)
+ static void _movi64(jit_state_t*,jit_int32_t,jit_int64_t);
+ #    define movi_d_w(r0, i0)		_movi_d_w(_jit, r0, i0)
+-static void _movi_d_w(jit_state_t*,jit_int32_t,jit_int64_t);
++static void _movi_d_w(jit_state_t*,jit_int32_t,jit_float64_t);
+ #  elif __WORDSIZE == 64
+ #    define movi64(r0, i0)		movi(r0, i0)
+ #  endif
+@@ -1152,7 +1152,7 @@ _movi64(jit_state_t *_jit, jit_int32_t r0, jit_int64_t i0)
+ }
+ 
+ static void
+-_movi_d_w(jit_state_t *_jit, jit_int32_t r0, jit_int64_t i0)
++_movi_d_w(jit_state_t *_jit, jit_int32_t r0, jit_float64_t i0)
+ {
+     union {
+ 	jit_int64_t	l;
+diff --git a/lib/jit_mips.c b/lib/jit_mips.c
+index 4fb6c34..6eb41a0 100644
+--- a/lib/jit_mips.c
++++ b/lib/jit_mips.c
+@@ -2184,8 +2184,7 @@ _emit_code(jit_state_t *_jit)
+ 	    case jit_code_movi_w_d:
+ 		movi_w_d(rn(node->u.w), node->v.w);
+ 		break;
+-#endif
+-#if __WORDSIZE == 32
++#else
+ 	    case jit_code_movr_ww_d:
+ 		movr_ww_d(rn(node->u.w), rn(node->v.w), rn(node->w.w));
+ 		break;
+diff --git a/lib/lightning.c b/lib/lightning.c
+index b40d35b..2c10928 100644
+--- a/lib/lightning.c
++++ b/lib/lightning.c
+@@ -4331,12 +4331,12 @@ static void _htoni_ul(jit_state_t*, jit_int32_t, jit_word_t);
+ #endif
+ #  define movi_f_w(r0, i0)		_movi_f_w(_jit, r0, i0)
+ static void _movi_f_w(jit_state_t*, jit_int32_t, jit_float32_t);
+-#if __WORDSIZE == 32 && !(defined(__mips__) && NEW_ABI)
+-#  define movi_d_ww(r0, r1, i0)		_movi_d_ww(_jit, r0, r1, i0)
+-static void _movi_d_ww(jit_state_t*, jit_int32_t, jit_int32_t, jit_float64_t);
+-#else
++#if __WORDSIZE == 64
+ #  define movi_d_w(r0, i0)		_movi_d_w(_jit, r0, i0)
+ static void _movi_d_w(jit_state_t*, jit_int32_t, jit_float64_t);
++#elif !(defined(__mips__) && NEW_ABI)
++#  define movi_d_ww(r0, r1, i0)		_movi_d_ww(_jit, r0, r1, i0)
++static void _movi_d_ww(jit_state_t*, jit_int32_t, jit_int32_t, jit_float64_t);
+ #endif
+ #define cloi(r0, i0)			_cloi(_jit, r0, i0)
+ static void _cloi(jit_state_t*, jit_int32_t, jit_word_t);
+@@ -4803,7 +4803,23 @@ _movi_f_w(jit_state_t *_jit, jit_int32_t r0, jit_float32_t i0)
+     movi(r0, data.i);
+ }
+ 
+-#if __WORDSIZE == 32 && !(defined(__mips__) && NEW_ABI)
++#if __WORDSIZE == 64
++static void
++_movi_d_w(jit_state_t *_jit, jit_int32_t r0, jit_float64_t i0)
++{
++    union {
++	jit_int64_t	l;
++	jit_float64_t	d;
++    } data;
++    data.d = i0;
++#  if defined(__ia64__)
++    /* Should be used only in this case (with out0 == 120) */
++    if (r0 >= 120)
++	r0 = _jitc->rout + (r0 - 120);
++#  endif
++    movi(r0, data.l);
++}
++#elif !(defined(__mips__) && NEW_ABI)
+ static void
+ _movi_d_ww(jit_state_t *_jit, jit_int32_t r0, jit_int32_t r1, jit_float64_t i0)
+ {
+@@ -4821,23 +4837,6 @@ _movi_d_ww(jit_state_t *_jit, jit_int32_t r0, jit_int32_t r1, jit_float64_t i0)
+     movi(r0, data.i[1]);
+ #  endif
+ }
+-
+-#else
+-static void
+-_movi_d_w(jit_state_t *_jit, jit_int32_t r0, jit_float64_t i0)
+-{
+-    union {
+-	jit_int64_t	l;
+-	jit_float64_t	d;
+-    } data;
+-    data.d = i0;
+-#  if defined(__ia64__)
+-    /* Should be used only in this case (with out0 == 120) */
+-    if (r0 >= 120)
+-	r0 = _jitc->rout + (r0 - 120);
+-#  endif
+-    movi(r0, data.l);
+-}
+ #endif
+ 
+  void
+-- 
+2.43.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
