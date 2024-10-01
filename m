Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84AB5CEACFC
	for <buildroot@archiver.kernel.org>; Tue,  1 Oct 2024 19:34:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AB0B740AEE;
	Tue,  1 Oct 2024 19:34:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uy_kNX9ztOCT; Tue,  1 Oct 2024 19:34:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 09AEF40B0C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 09AEF40B0C;
	Tue,  1 Oct 2024 19:34:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A58101BF28C
 for <buildroot@lists.busybox.net>; Tue,  1 Oct 2024 19:34:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 94AB08133B
 for <buildroot@lists.busybox.net>; Tue,  1 Oct 2024 19:34:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YLNFBcdoAk_v for <buildroot@lists.busybox.net>;
 Tue,  1 Oct 2024 19:34:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 64D77812C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64D77812C1
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 64D77812C1
 for <buildroot@busybox.net>; Tue,  1 Oct 2024 19:34:16 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a8d43657255so105145566b.0
 for <buildroot@busybox.net>; Tue, 01 Oct 2024 12:34:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727811254; x=1728416054;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BKTEVf3bRYzmEZxzecvzhu3eO/VtPfNyI+HSxIVwTFM=;
 b=uBLw3zQtw/o0dCibruxsNpKQJJmxdIxhF2xQ12dNJ+Eq46XI0qWReSOQh10J1BGSPe
 BASYR0sxU7otn1rY1mw7Zajd6AIVrR8PN0DIncYR3rX+WgQGkTa6rknI4wrWLB+U/3JQ
 F8Tz/VdGExvaD2myljKS0yan8Uu+6q/aiUPftK4y+99TGUIOZf0TCxyEOEOeWca93iE9
 lxeJxIunhucdU+NiU9rxlP14hrTSwiCU1CrVXIF2dHqJRrquGCQc+1uzPuhE7ww9rrSq
 uUMqil1thZPjkYGAnEf5NP08pox+/swxieDWs18+Ci+RLgX1HV1H3zyHQqiWiXwNIFMb
 YqWw==
X-Gm-Message-State: AOJu0Yx07uykiKLpji67PUcll8et2zTov52TVPtlyce2d4Ydc9v/HpJR
 s2QGtgb5VFBRbSmTBr7JGscQyPHbtZMs8A4Tfk7hGuQwib5Bf1/a0a9MPxLeISNezHOyPYuZjHI
 FoA==
X-Google-Smtp-Source: AGHT+IE+u9JJl38Xz6MW3lps+x2v7vanUUiPHAn7I6EjYYt4BcGSLBN0gFYZpg+pqpLWkHUot6J3BQ==
X-Received: by 2002:a17:907:eac:b0:a8a:ead3:8515 with SMTP id
 a640c23a62f3a-a98f838ec4bmr59862166b.65.1727811254048; 
 Tue, 01 Oct 2024 12:34:14 -0700 (PDT)
Received: from vm-2404.. (206.34.66.37.rev.sfr.net. [37.66.34.206])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c2775d0bsm772279866b.11.2024.10.01.12.34.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Oct 2024 12:34:13 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Tue,  1 Oct 2024 21:33:54 +0200
Message-ID: <20241001193355.3966100-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1727811254; x=1728416054; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BKTEVf3bRYzmEZxzecvzhu3eO/VtPfNyI+HSxIVwTFM=;
 b=M8VeMMizas7U3uGVsWhwogI7syR6BUSF2sWuVjuQ6GLa8kCAVA3Dth7WO++oLq3Idb
 bTi6U/n/G78spDzhMzWiJc/V2/Z/PqOZUYFeIb+5m7BFRS1LfdukSYdAQszP969rktc/
 VC++h7VtgbLYfq8m2ml7UqWRBdM3PFDw4Y3B5YOWc4vHLyDyHm2adZt4h8hp5LMCL6vx
 rFo9eRhqmyN2TiePfBh6l6E9kZmdyvn7OZ3syN8/W829WhCcu7npZ5D8WF3JaB6BL1FW
 n8sGsg6T9/+iHC/caV29zY3MLm49jeLJQcJH+pOZTF6qYnrlx8IQAnjgVNyg1r+sz65m
 6JyA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=M8VeMMiz
Subject: [Buildroot] [PATCH] package/perl: bump to version 5.40.0
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

remove merged patch

diff README:
    -Perl is Copyright (C) 1993 - 2024 by Larry Wall and others.
    +Perl is Copyright (C) 1993 - 2023 by Larry Wall and others.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 ...ixup-regex-engine-build-under-Uusedl.patch | 554 ------------------
 package/perl/perl.hash                        |  14 +-
 package/perl/perl.mk                          |   6 +-
 3 files changed, 10 insertions(+), 564 deletions(-)
 delete mode 100644 package/perl/0001-regcomp-c-regexec-c-fixup-regex-engine-build-under-Uusedl.patch

diff --git a/package/perl/0001-regcomp-c-regexec-c-fixup-regex-engine-build-under-Uusedl.patch b/package/perl/0001-regcomp-c-regexec-c-fixup-regex-engine-build-under-Uusedl.patch
deleted file mode 100644
index f0837c2d3..000000000
--- a/package/perl/0001-regcomp-c-regexec-c-fixup-regex-engine-build-under-Uusedl.patch
+++ /dev/null
@@ -1,554 +0,0 @@
-From ba6e2c38aafc23cf114f3ba0d0ff3baead34328b Mon Sep 17 00:00:00 2001
-From: Yves Orton <demerphq@gmail.com>
-Date: Tue, 1 Aug 2023 23:12:46 +0200
-Subject: [PATCH] regcomp*.c, regexec.c - fixup regex engine build under
- -Uusedl
-
-The regex engine is built a bit different from most of the perl
-codebase. It is compiled as part of the main libperl.so and it is
-also compiled (with DEBUGGING enabled) as part of the re extension.
-When perl itself is compiled with DEBUGGING enabled then the code
-in the re.so extension and the code in libperl.so is the same.
-
-This all works fine and dandy until you have a static build where the
-re.so is linked into libperl.so, which results in duplicate symbols
-being defined. These symbols come in two flaviours: "auxiliary" and
-"debugging" related symbols.
-
-We have basically three cases:
-
-1. USE_DYNAMIC_LOADING is defined. In this case we are doing a dynamic
-   build and re.so will be separate from libperl.so, so it even if this
-   is a DEBUGGING enabled build debug and auxiliary functions can be
-   compiled into *both* re.so and libperl.so. This is basically the
-   "standard build".
-
-2. USE_DYNAMIC_LOADING is not defined, and DEBUGGING is not defined
-   either. In this case auxiliary functions should only be compiled in
-   libperl.so, and the debug functions should only be compiled into
-   re.so
-
-3. USE_DYNAMIC_LOADING is not defined, and DEBUGGING *is* defined. In
-   this case auxiliary functions AND debug functions should only be
-   compiled into libperl.so
-
-It is possible to detect the different build options by looking at the
-defines 'USE_DYNAMIC_LOADING', 'PERL_EXT_RE_DEBUG' and
-'DEBUGGING_RE_ONLY'. 'USE_DYNAMIC_LOADING' is NOT defined when we are
-building a static perl. 'PERL_EXT_RE_DEBUG' is defined only when we are
-building re.so, and 'DEBUGGING_RE_ONLY' is defined only when we are
-building re.so in a perl that is not itself already a DEBUGGING enabled
-perl. The file ext/re/re_top.h responsible for setting up
-DEBUGGING_RE_ONLY.
-
-This patch uses 'PERL_EXT_RE_DEBUG', 'DEBUGGING_RE_ONLY' and
-'USE_DYNAMIC_LOADING' to define in regcomp.h two further define flags
-'PERL_RE_BUILD_DEBUG' and 'PERL_RE_BUILD_AUX'.
-
-The 'PERL_RE_BUILD_DEBUG' flag determines if the debugging functions
-should be compiled into libperl.so or re.so or both. The
-'PERL_RE_BUILD_AUX' flag determines if the auxiliary functions should be
-compiled into just libperl.so or into it and re.so. We then use these
-flags to guard the different types of functions so that we can build in
-all three modes without duplicate symbols.
-
-Upstream: https://github.com/Perl/perl5/commit/ba6e2c38aafc23cf114f3ba0d0ff3baead34328b
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- regcomp.c         |  13 +-
- regcomp.h         |  14 ++-
- regcomp_debug.c   | 308 +++++++++++++++++++++++-----------------------
- regcomp_invlist.c |   3 +-
- regexec.c         |   3 +-
- 5 files changed, 181 insertions(+), 160 deletions(-)
-
-diff --git a/regcomp.c b/regcomp.c
-index d3c135fbfad1..6e35d95d2ac6 100644
---- a/regcomp.c
-+++ b/regcomp.c
-@@ -290,6 +290,7 @@ S_edit_distance(const UV* src,
- /* END of edit_distance() stuff
-  * ========================================================= */
- 
-+#ifdef PERL_RE_BUILD_AUX
- /* add a data member to the struct reg_data attached to this regex, it should
-  * always return a non-zero return. the 's' argument is the type of the items
-  * being added and the n is the number of items. The length of 's' should match
-@@ -340,6 +341,7 @@ Perl_reg_add_data(RExC_state_t* const pRExC_state, const char* const s, const U3
-     assert(count>0);
-     return count;
- }
-+#endif /* PERL_RE_BUILD_AUX */
- 
- /*XXX: todo make this not included in a non debugging perl, but appears to be
-  * used anyway there, in 'use re' */
-@@ -7443,6 +7445,7 @@ S_regatom(pTHX_ RExC_state_t *pRExC_state, I32 *flagp, U32 depth)
- }
- 
- 
-+#ifdef PERL_RE_BUILD_AUX
- void
- Perl_populate_anyof_bitmap_from_invlist(pTHX_ regnode *node, SV** invlist_ptr)
- {
-@@ -7502,6 +7505,7 @@ Perl_populate_anyof_bitmap_from_invlist(pTHX_ regnode *node, SV** invlist_ptr)
-         }
-     }
- }
-+#endif /* PERL_RE_BUILD_AUX */
- 
- /* Parse POSIX character classes: [[:foo:]], [[=foo=]], [[.foo.]].
-    Character classes ([:foo:]) can also be negated ([:^foo:]).
-@@ -9095,6 +9099,7 @@ S_dump_regex_sets_structures(pTHX_ RExC_state_t *pRExC_state,
- #undef IS_OPERATOR
- #undef IS_OPERAND
- 
-+#ifdef PERL_RE_BUILD_AUX
- void
- Perl_add_above_Latin1_folds(pTHX_ RExC_state_t *pRExC_state, const U8 cp, SV** invlist)
- {
-@@ -9182,6 +9187,8 @@ Perl_add_above_Latin1_folds(pTHX_ RExC_state_t *pRExC_state, const U8 cp, SV** i
-          }
-     }
- }
-+#endif /* PERL_RE_BUILD_AUX */
-+
- 
- STATIC void
- S_output_posix_warnings(pTHX_ RExC_state_t *pRExC_state, AV* posix_warnings)
-@@ -12105,6 +12112,7 @@ S_optimize_regclass(pTHX_
- 
- #undef HAS_NONLOCALE_RUNTIME_PROPERTY_DEFINITION
- 
-+#ifdef PERL_RE_BUILD_AUX
- void
- Perl_set_ANYOF_arg(pTHX_ RExC_state_t* const pRExC_state,
-                 regnode* const node,
-@@ -12261,6 +12269,7 @@ Perl_set_ANYOF_arg(pTHX_ RExC_state_t* const pRExC_state,
-     RExC_rxi->data->data[n] = (void*)rv;
-     ARG1u_SET(node, n);
- }
-+#endif /* PERL_RE_BUILD_AUX */
- 
- SV *
- 
-@@ -12999,6 +13008,8 @@ S_regtail_study(pTHX_ RExC_state_t *pRExC_state, regnode_offset p,
- }
- #endif
- 
-+
-+#ifdef PERL_RE_BUILD_AUX
- SV*
- Perl_get_ANYOFM_contents(pTHX_ const regnode * n) {
- 
-@@ -13047,7 +13058,7 @@ Perl_get_ANYOFHbbm_contents(pTHX_ const regnode * n) {
-                                       UTF_CONTINUATION_MARK | 0));
-     return cp_list;
- }
--
-+#endif /* PERL_RE_BUILD_AUX */
- 
- 
- SV *
-diff --git a/regcomp.h b/regcomp.h
-index 31c91e6a68e8..017a9f843514 100644
---- a/regcomp.h
-+++ b/regcomp.h
-@@ -1554,7 +1554,19 @@ typedef enum {
- #define EVAL_OPTIMISTIC_FLAG    128
- #define EVAL_FLAGS_MASK         (EVAL_OPTIMISTIC_FLAG-1)
- 
--
-+/* We define PERL_RE_BUILD_DEBUG if we are NOT compiling the re extension and
-+ * we are under DEBUGGING, or if we are ARE compiling the re extension
-+ * and this is not a DEBUGGING enabled build (identified by
-+ * DEBUGGING_RE_ONLY being defined)
-+ */
-+#if ( defined(USE_DYNAMIC_LOADING) && defined(DEBUGGING)) || \
-+    ( defined(PERL_EXT_RE_BUILD) && defined(DEBUGGING_RE_ONLY)) || \
-+    (!defined(PERL_EXT_RE_BUILD) && defined(DEBUGGING))
-+#define PERL_RE_BUILD_DEBUG
-+#endif
-+#if ( defined(USE_DYNAMIC_LOADING) || !defined(PERL_EXT_RE_BUILD) )
-+#define PERL_RE_BUILD_AUX
-+#endif
- 
- #endif /* PERL_REGCOMP_H_ */
- 
-diff --git a/regcomp_debug.c b/regcomp_debug.c
-index 93db7a89cf48..96598c49c0bc 100644
---- a/regcomp_debug.c
-+++ b/regcomp_debug.c
-@@ -18,8 +18,7 @@
- #include "unicode_constants.h"
- #include "regcomp_internal.h"
- 
--#ifdef DEBUGGING
--
-+#ifdef PERL_RE_BUILD_DEBUG
- int
- Perl_re_printf(pTHX_ const char *fmt, ...)
- {
-@@ -159,13 +158,160 @@ Perl_debug_peep(pTHX_ const char *str, const RExC_state_t *pRExC_state,
-    });
- }
- 
--#endif /* DEBUGGING */
-+const regnode *
-+Perl_dumpuntil(pTHX_ const regexp *r, const regnode *start, const regnode *node,
-+            const regnode *last, const regnode *plast,
-+            SV* sv, I32 indent, U32 depth)
-+{
-+    const regnode *next;
-+    const regnode *optstart= NULL;
-+
-+    RXi_GET_DECL(r, ri);
-+    DECLARE_AND_GET_RE_DEBUG_FLAGS;
-+
-+    PERL_ARGS_ASSERT_DUMPUNTIL;
-+
-+#ifdef DEBUG_DUMPUNTIL
-+    Perl_re_printf( aTHX_  "--- %d : %d - %d - %d\n", indent, node-start,
-+        last ? last-start : 0, plast ? plast-start : 0);
-+#endif
-+
-+    if (plast && plast < last)
-+        last= plast;
-+
-+    while (node && (!last || node < last)) {
-+        const U8 op = OP(node);
-+
-+        if (op == CLOSE || op == SRCLOSE || op == WHILEM)
-+            indent--;
-+        next = regnext((regnode *)node);
-+        const regnode *after = regnode_after((regnode *)node,0);
-+
-+        /* Where, what. */
-+        if (op == OPTIMIZED) {
-+            if (!optstart && RE_DEBUG_FLAG(RE_DEBUG_COMPILE_OPTIMISE))
-+                optstart = node;
-+            else
-+                goto after_print;
-+        } else
-+            CLEAR_OPTSTART;
-+
-+        regprop(r, sv, node, NULL, NULL);
-+        Perl_re_printf( aTHX_  "%4" IVdf ":%*s%s", (IV)(node - start),
-+                      (int)(2*indent + 1), "", SvPVX_const(sv));
-+
-+        if (op != OPTIMIZED) {
-+            if (next == NULL)           /* Next ptr. */
-+                Perl_re_printf( aTHX_  " (0)");
-+            else if (REGNODE_TYPE(op) == BRANCH
-+                     && REGNODE_TYPE(OP(next)) != BRANCH )
-+                Perl_re_printf( aTHX_  " (FAIL)");
-+            else
-+                Perl_re_printf( aTHX_  " (%" IVdf ")", (IV)(next - start));
-+            Perl_re_printf( aTHX_ "\n");
-+        }
-+
-+      after_print:
-+        if (REGNODE_TYPE(op) == BRANCHJ) {
-+            assert(next);
-+            const regnode *nnode = (OP(next) == LONGJMP
-+                                   ? regnext((regnode *)next)
-+                                   : next);
-+            if (last && nnode > last)
-+                nnode = last;
-+            DUMPUNTIL(after, nnode);
-+        }
-+        else if (REGNODE_TYPE(op) == BRANCH) {
-+            assert(next);
-+            DUMPUNTIL(after, next);
-+        }
-+        else if ( REGNODE_TYPE(op)  == TRIE ) {
-+            const regnode *this_trie = node;
-+            const U32 n = ARG1u(node);
-+            const reg_ac_data * const ac = op>=AHOCORASICK ?
-+               (reg_ac_data *)ri->data->data[n] :
-+               NULL;
-+            const reg_trie_data * const trie =
-+                (reg_trie_data*)ri->data->data[op<AHOCORASICK ? n : ac->trie];
-+#ifdef DEBUGGING
-+            AV *const trie_words
-+                           = MUTABLE_AV(ri->data->data[n + TRIE_WORDS_OFFSET]);
-+#endif
-+            const regnode *nextbranch= NULL;
-+            I32 word_idx;
-+            SvPVCLEAR(sv);
-+            for (word_idx= 0; word_idx < (I32)trie->wordcount; word_idx++) {
-+                SV ** const elem_ptr = av_fetch_simple(trie_words, word_idx, 0);
-+
-+                Perl_re_indentf( aTHX_  "%s ",
-+                    indent+3,
-+                    elem_ptr
-+                    ? pv_pretty(sv, SvPV_nolen_const(*elem_ptr),
-+                                SvCUR(*elem_ptr), PL_dump_re_max_len,
-+                                PL_colors[0], PL_colors[1],
-+                                (SvUTF8(*elem_ptr)
-+                                 ? PERL_PV_ESCAPE_UNI
-+                                 : 0)
-+                                | PERL_PV_PRETTY_ELLIPSES
-+                                | PERL_PV_PRETTY_LTGT
-+                            )
-+                    : "???"
-+                );
-+                if (trie->jump) {
-+                    U16 dist= trie->jump[word_idx+1];
-+                    Perl_re_printf( aTHX_  "(%" UVuf ")\n",
-+                               (UV)((dist ? this_trie + dist : next) - start));
-+                    if (dist) {
-+                        if (!nextbranch)
-+                            nextbranch= this_trie + trie->jump[0];
-+                        DUMPUNTIL(this_trie + dist, nextbranch);
-+                    }
-+                    if (nextbranch && REGNODE_TYPE(OP(nextbranch))==BRANCH)
-+                        nextbranch= regnext((regnode *)nextbranch);
-+                } else {
-+                    Perl_re_printf( aTHX_  "\n");
-+                }
-+            }
-+            if (last && next > last)
-+                node= last;
-+            else
-+                node= next;
-+        }
-+        else if ( op == CURLY ) {   /* "next" might be very big: optimizer */
-+            DUMPUNTIL(after, after + 1); /* +1 is NOT a REGNODE_AFTER */
-+        }
-+        else if (REGNODE_TYPE(op) == CURLY && op != CURLYX) {
-+            assert(next);
-+            DUMPUNTIL(after, next);
-+        }
-+        else if ( op == PLUS || op == STAR) {
-+            DUMPUNTIL(after, after + 1); /* +1 NOT a REGNODE_AFTER */
-+        }
-+        else if (REGNODE_TYPE(op) == EXACT || op == ANYOFHs) {
-+            /* Literal string, where present. */
-+            node = (const regnode *)REGNODE_AFTER_varies(node);
-+        }
-+        else {
-+            node = REGNODE_AFTER_opcode(node,op);
-+        }
-+        if (op == CURLYX || op == OPEN || op == SROPEN)
-+            indent++;
-+        if (REGNODE_TYPE(op) == END)
-+            break;
-+    }
-+    CLEAR_OPTSTART;
-+#ifdef DEBUG_DUMPUNTIL
-+    Perl_re_printf( aTHX_  "--- %d\n", (int)indent);
-+#endif
-+    return node;
-+}
-+
-+#endif  /* PERL_RE_BUILD_DEBUG */
- 
- /*
-  - regdump - dump a regexp onto Perl_debug_log in vaguely comprehensible form
-  */
- #ifdef DEBUGGING
--
- static void
- S_regdump_intflags(pTHX_ const char *lead, const U32 flags)
- {
-@@ -907,8 +1053,8 @@ Perl_regprop(pTHX_ const regexp *prog, SV *sv, const regnode *o, const regmatch_
- #endif  /* DEBUGGING */
- }
- 
--#ifdef DEBUGGING
- 
-+#ifdef DEBUGGING
- STATIC void
- S_put_code_point(pTHX_ SV *sv, UV c)
- {
-@@ -1517,154 +1663,4 @@ S_put_charclass_bitmap_innards(pTHX_ SV *sv,
- 
-     return did_output_something;
- }
--
--
--const regnode *
--Perl_dumpuntil(pTHX_ const regexp *r, const regnode *start, const regnode *node,
--            const regnode *last, const regnode *plast,
--            SV* sv, I32 indent, U32 depth)
--{
--    const regnode *next;
--    const regnode *optstart= NULL;
--
--    RXi_GET_DECL(r, ri);
--    DECLARE_AND_GET_RE_DEBUG_FLAGS;
--
--    PERL_ARGS_ASSERT_DUMPUNTIL;
--
--#ifdef DEBUG_DUMPUNTIL
--    Perl_re_printf( aTHX_  "--- %d : %d - %d - %d\n", indent, node-start,
--        last ? last-start : 0, plast ? plast-start : 0);
--#endif
--
--    if (plast && plast < last)
--        last= plast;
--
--    while (node && (!last || node < last)) {
--        const U8 op = OP(node);
--
--        if (op == CLOSE || op == SRCLOSE || op == WHILEM)
--            indent--;
--        next = regnext((regnode *)node);
--        const regnode *after = regnode_after((regnode *)node,0);
--
--        /* Where, what. */
--        if (op == OPTIMIZED) {
--            if (!optstart && RE_DEBUG_FLAG(RE_DEBUG_COMPILE_OPTIMISE))
--                optstart = node;
--            else
--                goto after_print;
--        } else
--            CLEAR_OPTSTART;
--
--        regprop(r, sv, node, NULL, NULL);
--        Perl_re_printf( aTHX_  "%4" IVdf ":%*s%s", (IV)(node - start),
--                      (int)(2*indent + 1), "", SvPVX_const(sv));
--
--        if (op != OPTIMIZED) {
--            if (next == NULL)           /* Next ptr. */
--                Perl_re_printf( aTHX_  " (0)");
--            else if (REGNODE_TYPE(op) == BRANCH
--                     && REGNODE_TYPE(OP(next)) != BRANCH )
--                Perl_re_printf( aTHX_  " (FAIL)");
--            else
--                Perl_re_printf( aTHX_  " (%" IVdf ")", (IV)(next - start));
--            Perl_re_printf( aTHX_ "\n");
--        }
--
--      after_print:
--        if (REGNODE_TYPE(op) == BRANCHJ) {
--            assert(next);
--            const regnode *nnode = (OP(next) == LONGJMP
--                                   ? regnext((regnode *)next)
--                                   : next);
--            if (last && nnode > last)
--                nnode = last;
--            DUMPUNTIL(after, nnode);
--        }
--        else if (REGNODE_TYPE(op) == BRANCH) {
--            assert(next);
--            DUMPUNTIL(after, next);
--        }
--        else if ( REGNODE_TYPE(op)  == TRIE ) {
--            const regnode *this_trie = node;
--            const U32 n = ARG1u(node);
--            const reg_ac_data * const ac = op>=AHOCORASICK ?
--               (reg_ac_data *)ri->data->data[n] :
--               NULL;
--            const reg_trie_data * const trie =
--                (reg_trie_data*)ri->data->data[op<AHOCORASICK ? n : ac->trie];
--#ifdef DEBUGGING
--            AV *const trie_words
--                           = MUTABLE_AV(ri->data->data[n + TRIE_WORDS_OFFSET]);
--#endif
--            const regnode *nextbranch= NULL;
--            I32 word_idx;
--            SvPVCLEAR(sv);
--            for (word_idx= 0; word_idx < (I32)trie->wordcount; word_idx++) {
--                SV ** const elem_ptr = av_fetch_simple(trie_words, word_idx, 0);
--
--                Perl_re_indentf( aTHX_  "%s ",
--                    indent+3,
--                    elem_ptr
--                    ? pv_pretty(sv, SvPV_nolen_const(*elem_ptr),
--                                SvCUR(*elem_ptr), PL_dump_re_max_len,
--                                PL_colors[0], PL_colors[1],
--                                (SvUTF8(*elem_ptr)
--                                 ? PERL_PV_ESCAPE_UNI
--                                 : 0)
--                                | PERL_PV_PRETTY_ELLIPSES
--                                | PERL_PV_PRETTY_LTGT
--                            )
--                    : "???"
--                );
--                if (trie->jump) {
--                    U16 dist= trie->jump[word_idx+1];
--                    Perl_re_printf( aTHX_  "(%" UVuf ")\n",
--                               (UV)((dist ? this_trie + dist : next) - start));
--                    if (dist) {
--                        if (!nextbranch)
--                            nextbranch= this_trie + trie->jump[0];
--                        DUMPUNTIL(this_trie + dist, nextbranch);
--                    }
--                    if (nextbranch && REGNODE_TYPE(OP(nextbranch))==BRANCH)
--                        nextbranch= regnext((regnode *)nextbranch);
--                } else {
--                    Perl_re_printf( aTHX_  "\n");
--                }
--            }
--            if (last && next > last)
--                node= last;
--            else
--                node= next;
--        }
--        else if ( op == CURLY ) {   /* "next" might be very big: optimizer */
--            DUMPUNTIL(after, after + 1); /* +1 is NOT a REGNODE_AFTER */
--        }
--        else if (REGNODE_TYPE(op) == CURLY && op != CURLYX) {
--            assert(next);
--            DUMPUNTIL(after, next);
--        }
--        else if ( op == PLUS || op == STAR) {
--            DUMPUNTIL(after, after + 1); /* +1 NOT a REGNODE_AFTER */
--        }
--        else if (REGNODE_TYPE(op) == EXACT || op == ANYOFHs) {
--            /* Literal string, where present. */
--            node = (const regnode *)REGNODE_AFTER_varies(node);
--        }
--        else {
--            node = REGNODE_AFTER_opcode(node,op);
--        }
--        if (op == CURLYX || op == OPEN || op == SROPEN)
--            indent++;
--        if (REGNODE_TYPE(op) == END)
--            break;
--    }
--    CLEAR_OPTSTART;
--#ifdef DEBUG_DUMPUNTIL
--    Perl_re_printf( aTHX_  "--- %d\n", (int)indent);
--#endif
--    return node;
--}
--
--#endif  /* DEBUGGING */
-+#endif /* DEBUGGING */
-diff --git a/regcomp_invlist.c b/regcomp_invlist.c
-index 9ea3f431817d..82f82305846a 100644
---- a/regcomp_invlist.c
-+++ b/regcomp_invlist.c
-@@ -18,7 +18,7 @@
- #include "unicode_constants.h"
- #include "regcomp_internal.h"
- 
--
-+#ifdef PERL_RE_BUILD_AUX
- void
- Perl_populate_bitmap_from_invlist(pTHX_ SV * invlist, const UV offset, const U8 * bitmap, const Size_t len)
- {
-@@ -70,6 +70,7 @@ Perl_populate_invlist_from_bitmap(pTHX_ const U8 * bitmap, const Size_t bitmap_l
-         }
-     }
- }
-+#endif /* PERL_RE_BUILD_AUX */
- 
- /* This section of code defines the inversion list object and its methods.  The
-  * interfaces are highly subject to change, so as much as possible is static to
-diff --git a/regexec.c b/regexec.c
-index c404d9aa3d73..de0b7c461918 100644
---- a/regexec.c
-+++ b/regexec.c
-@@ -4428,7 +4428,8 @@ S_regtry(pTHX_ regmatch_info *reginfo, char **startposp)
- */
- #define REPORT_CODE_OFF 29
- #define INDENT_CHARS(depth) ((int)(depth) % 20)
--#ifdef DEBUGGING
-+
-+#ifdef PERL_RE_BUILD_DEBUG
- int
- Perl_re_exec_indentf(pTHX_ const char *fmt, U32 depth, ...)
- {
diff --git a/package/perl/perl.hash b/package/perl/perl.hash
index 91abcdeb9..aba284403 100644
--- a/package/perl/perl.hash
+++ b/package/perl/perl.hash
@@ -1,12 +1,12 @@
-# Hashes from: https://www.cpan.org/src/5.0/perl-5.38.2.tar.xz.{md5,sha1,sha256}.txt
-md5  d3957d75042918a23ec0abac4a2b7e0a  perl-5.38.2.tar.xz
-sha1  af1d5f9e0499f3cfa4736433631aebf7624714da  perl-5.38.2.tar.xz
-sha256  d91115e90b896520e83d4de6b52f8254ef2b70a8d545ffab33200ea9f1cf29e8  perl-5.38.2.tar.xz
+# Hashes from: https://www.cpan.org/src/5.0/perl-5.40.0.tar.xz.{md5,sha1,sha256}.txt
+md5  cfe14ef0709b9687f9c514042e8e1e82  perl-5.40.0.tar.xz
+sha1  4a3af1f62afc611aa1552adc6c7ec389e9723bce  perl-5.40.0.tar.xz
+sha256  d5325300ad267624cb0b7d512cfdfcd74fa7fe00c455c5b51a6bd53e5e199ef9  perl-5.40.0.tar.xz
 
-# Hash from: https://github.com/arsv/perl-cross/releases/download/1.5.2/perl-cross-1.5.2.hash
-sha256  584dc54c48dca25e032b676a15bef377c1fed9de318b4fc140292a5dbf326e90  perl-cross-1.5.2.tar.gz
+# Hash from: https://github.com/arsv/perl-cross/releases/download/1.6/perl-cross-1.6.hash
+sha256  5abf198ee50ce9e69eb68fede68c87f65241caa744e4203e97490fa59b45ed69  perl-cross-1.6.tar.gz
 
 # Locally calculated
 sha256  dd90d4f42e4dcadf5a7c09eea0189d93c7b37ae560c91f0f6d5233ed3b9292a2  Artistic
 sha256  d77d235e41d54594865151f4751e835c5a82322b0e87ace266567c3391a4b912  Copying
-sha256  9519aaeeac509b3fa8778155a63545b6086f8313546b93fe9958d1c434d476a8  README
+sha256  05fcf86432bd78754c7e325d4be44a5968344c01cc08c004b685172ea508ec23  README
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 9de0425e8..0f7038a04 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 # When updating the version here, also update utils/scancpan
-PERL_VERSION_MAJOR = 38
-PERL_VERSION = 5.$(PERL_VERSION_MAJOR).2
+PERL_VERSION_MAJOR = 40
+PERL_VERSION = 5.$(PERL_VERSION_MAJOR).0
 PERL_SITE = https://www.cpan.org/src/5.0
 PERL_SOURCE = perl-$(PERL_VERSION).tar.xz
 PERL_LICENSE = Artistic or GPL-1.0+
@@ -15,7 +15,7 @@ PERL_CPE_ID_VENDOR = perl
 PERL_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 PERL_INSTALL_STAGING = YES
 
-PERL_CROSS_VERSION = 1.5.2
+PERL_CROSS_VERSION = 1.6
 # DO NOT refactor with the github helper (the result is not the same)
 PERL_CROSS_SITE = https://github.com/arsv/perl-cross/releases/download/$(PERL_CROSS_VERSION)
 PERL_CROSS_SOURCE = perl-cross-$(PERL_CROSS_VERSION).tar.gz
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
