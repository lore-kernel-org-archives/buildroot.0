Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622CF606A319
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 18:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Q1QeBnIo
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39C2E41105;
	Wed, 21 Oct 2026 18:56:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ht_9Hj_fDBhv; Wed, 21 Oct 2026 18:56:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 80EFF4110D
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792608966;
	b=Z84jhlzgPjpa2Sm8XEdbcc5UsGR995lmhY+I+ZpMFWqv6LJU4CqnVcQQBJ1MHMbyf3uf
	 bghSEvmLqYbnDgQy3NihkdNTJAL0wRzWxm9rxmDMAkKTj99t0CE2gBHlUBaqynto8RhNj
	 Lwt5YK8aoZvQ3tpSZq2kU3GjH0IFXfbM93Vmyw8opN/9w14Mu61TT6c3RhzB3Uy3zbd0A
	 vx6i0vqCarzznhnOi4KEVS1Hnrj2dPlLextmuZSqm3yaCPbc/UHPpRVmKd2pNscOnGmvP
	 P4/FjWruzX3d4gzpp3UHwQ8nFgZvTRDCTuvtOgWPYq4GQA24lyfVPEfiuKNfBy6Y7sQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792608966;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=YdKxCnV9uMLeMY40J8AOUGn7BpulrShn0Yj4rd/G/3U=;
	b=ePNOY+6SwMSi9z0/v5cSS1Hn4CdKnlbB/QZvmiNg9QvmZhZPN7ontzKCa0idKoll93m+
	 1BT7UzbHHLPBICgeXn614iURI1rm0IUzLbEY+xoi0sYYb1cvKx2jkRdNlF1AzNvmYxZA5
	 VvW0DXLWFg13IkzfKhf6ARGz8C3XH6t6OQXqJ6pV1OBa/BEKvOth54mxJOlz5dgTMBA9Y
	 qPjFd83og7bHYypiphcHs+YgBGOD8QzszALMOYR+QJTh8FeCfN66Tw8x3xWm2BztSvmM+
	 XzxB16LjJiH5q9a6KzM2g1lQKAZWD2o/jkCJ8YumYLvKpAIzunBm85q7HT2T5sdFH2A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792608966;
	bh=YdKxCnV9uMLeMY40J8AOUGn7BpulrShn0Yj4rd/G/3U=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Q1QeBnIo7tA1CqeKXmzz3mbitd3YXNYFi4jZ28cqoLXwZRdqi9I21tDwTt9/o4+PR
	 hEMAzKdNu2nAEZjsKeYKKvS1I97PFgOLwThO6t5suN3i1oJeIP2NpqbD+3dgek97Ce
	 AYYadSnFpv0PaNHKxDxvLvpQoQ2INMrSNtsWM+W1U5iL2dy5ZBJFLN87+RGrUvPACg
	 Ax7VlFPguesr4v23j4/Cu93rI2Txfu1bRUC8Nbd26S6sP77waiy6JYvUgqDlaAkIkg
	 XgzXP05mJzoecXvBGIIqTm3DBikZGCods6uBaI+B0a2SNo+aTCkZL/77LT1ZXhwcnM
	 4DYyEo1+WBQFA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80EFF4110D;
	Wed, 21 Oct 2026 18:56:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FB8C3A4
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 18:56:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0191F60844
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 18:56:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H1Nv73656d3v for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 18:56:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B2F4F6FAAD
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792608960;
 b=kB1B3eBB0/jyJygomETHIe37oEOwiTTUBcq5T/dfbGpfwv9RtMoxxBa9GI4epahvsB1Y
 w52Jv7sr7jgVZQDCm8rVjg+1VtjT5kpeWS3OiKPWwbLY7gh733BAYMSwdgXul4OufUCQL
 b2hQRYlx0OWkq3hGWnJe62POeyGvOcNi0XNa9yLgLodvgdHlXTvuw08FxbrwzDBbVfRq8
 T9scWAUv7U7LohjJjI2iT/ijMPal7cv1pJTYhrtxIMAtP11TudqpKFG5cmxFZ6D1Bj9nw
 /97qo+18Y+w56onoJj4amMBhV+MsbcQOcJ5qJi2SLso0jUMSg1LtDHVRgnez45ZfuEA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792608960;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=2iUxD1x+eu6CfYjhAy+wT2e/sww6E8hNoaHY2HpweA0=;
 b=bgnbVD9S4DraH+0fIV3nv0ky3ZfD2q1nNfkAg6VcLntleRl2O1L/q09Sc0skmaD2LZXR
 IIEaBkf7IJXgT6797kpmBREUm8KkQphif6Jww6a0HT9m296XZPXo1Gr27FQiPHRbb3ogP
 uiwn06uxlR6wE4isjZPAU4s2WK0u/b6/3E3KlKZoOUeny6PJAt1whiyl9h0SrfTIpCrB5
 nOudZRaAuMKLg/JjyrSE9M0FIgRLsy7eM5Lw5NLYx/S+p/UOazXlk3KSVt6J2VNuQDy1Y
 bMi4lT+W0EV5sAtdF45/6PxXuzCIL8moe+LSlFl3pPZZ7IAue2nX61LGIwoZbx5DMaQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B2F4F6FAAD
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 18:56:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0AA8599A57; Wed, 21 Oct 2026 18:54:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 21 Oct 2026 20:54:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4770bb547aeedbd9d0c7d0e414471c1815735587
X-Git-Newrev: 77473256bd9a49f2120d1efedbc412aaf4501ecd
X-Patchwork-Hint: ignore
Message-Id: <20261021185437.0AA8599A57@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/musl: add upstream security patch
 for CVE-2026-107891
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/77473256bd9a49f2120d1efedbc412aaf4501ecd
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

CVE-2026-107891: musl libc: multiple integer overflow in regcomp,
possibly leading to incorrect allocation sizes and out-of-bounds heap
writes
https://www.openwall.com/lists/musl/2026/10/21/1

The upstream announcement states: "The vulnerable code has been
present since version 0.5.0. All subsequent versions up through 1.2.6
are affected." So the patch needs to be backported to all Buildroot
stable branches.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0007-regex-avoid-int-overflow-in-regcomp.patch | 171 +++++++++++++++++++++
 package/musl/musl.mk                               |   3 +
 2 files changed, 174 insertions(+)

diff --git a/package/musl/0007-regex-avoid-int-overflow-in-regcomp.patch b/package/musl/0007-regex-avoid-int-overflow-in-regcomp.patch
new file mode 100644
index 0000000000..aafb71cdfe
--- /dev/null
+++ b/package/musl/0007-regex-avoid-int-overflow-in-regcomp.patch
@@ -0,0 +1,171 @@
+From 7813e9119eb5fe681b6750b8a033a0490bca0941 Mon Sep 17 00:00:00 2001
+From: Szabolcs Nagy <nsz@port70.net>
+Date: Thu, 23 Apr 2026 21:22:18 +0000
+Subject: [PATCH] regex: avoid int overflow in regcomp
+
+regcomp has many int arith ops that may overflow. before tre_expand_ast
+int values are limited by 2x the input length n, e.g.:
+
+  input ERE        int field    max value
+  aaaaaaaaaaaa...  position     n
+  ()()()()()()...  submatch_id  n/2+1
+  ()||||||||||...  num_tags     2n-3
+
+so overflow before expand requires large n (and a lot of memory). later
+some values can become big due to repetitions:
+
+  input ERE                     int field that overflows
+  (((a{255}){255}){255}){255}   position
+  ((a|b*){255,}){255,}          num_transitions
+
+num_transitions and memory use can be big without {k,} repetitions too:
+
+  input ERE        what             max value
+  (a|a|a|a...|a)*  num_transitions  n^2/4
+  (()|a|a|...|a)*  sum tnfa tags    > n^3/16 - n^2
+
+so memory can run out quickly as n grows (with 31bit va space 1700 long
+input is enough even without {k,}) about half is tnfa and half is ast
+firstpos/lastpos data. but overflow can happen before allocations fail.
+
+fix early overflow by limiting n. the stack usage is in [n,11n] without
+repetitions, usually 7n, so the stack limit got adjusted too. the limit
+is such that almost all inputs that worked before still work.
+
+overflows during and after expand are fixed by explicit checks via a
+check_add helper and xcalloc instead of xmalloc.
+
+CVE: CVE-2026-107891
+Upstream: https://git.musl-libc.org/cgit/musl/commit/?id=7813e9119eb5fe681b6750b8a033a0490bca0941
+Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
+---
+ src/regex/regcomp.c | 41 +++++++++++++++++++++++++++++++++++------
+ 1 file changed, 35 insertions(+), 6 deletions(-)
+
+diff --git a/src/regex/regcomp.c b/src/regex/regcomp.c
+index b4b81968..a7115b12 100644
+--- a/src/regex/regcomp.c
++++ b/src/regex/regcomp.c
+@@ -1680,6 +1680,12 @@ tre_add_tags(tre_mem_t mem, tre_stack_t *stack, tre_ast_node_t *tree,
+   AST to TNFA compilation routines.
+ */
+ 
++/* check if a+b overflows for a,b in [0,INT_MAX] */
++static int check_add(unsigned a, unsigned b)
++{
++	return a + b > INT_MAX;
++}
++
+ typedef enum {
+   COPY_RECURSE,
+   COPY_SET_RESULT_PTR
+@@ -1731,6 +1737,8 @@ tre_copy_ast(tre_mem_t mem, tre_stack_t *stack, tre_ast_node_t *ast,
+ 		    /* XXX - e.g. [ab] has only one position but two
+ 		       nodes, so we are creating holes in the state space
+ 		       here.  Not fatal, just wastes memory. */
++		    if (check_add(pos, *pos_add))
++		      return REG_ESPACE;
+ 		    pos += *pos_add;
+ 		    num_copied++;
+ 		  }
+@@ -1826,6 +1834,8 @@ tre_copy_ast(tre_mem_t mem, tre_stack_t *stack, tre_ast_node_t *ast,
+ 	  break;
+ 	}
+     }
++  if (check_add(*pos_add, num_copied))
++    return REG_ESPACE;
+   *pos_add += num_copied;
+   return status;
+ }
+@@ -1870,6 +1880,8 @@ tre_expand_ast(tre_mem_t mem, tre_stack_t *stack, tre_ast_node_t *ast,
+ 		tre_literal_t *lit= node->obj;
+ 		if (!IS_SPECIAL(lit) || IS_BACKREF(lit))
+ 		  {
++		    if (check_add(lit->position, pos_add))
++		      return REG_ESPACE;
+ 		    lit->position += pos_add;
+ 		    if (lit->position > max_pos)
+ 		      max_pos = lit->position;
+@@ -1998,6 +2010,8 @@ tre_expand_ast(tre_mem_t mem, tre_stack_t *stack, tre_ast_node_t *ast,
+ 	      }
+ 
+ 	    iter_depth--;
++	    if (check_add(pos_add_total, pos_add - pos_add_last))
++	      return REG_ESPACE;
+ 	    pos_add_total += pos_add - pos_add_last;
+ 	    if (iter_depth == 0)
+ 	      pos_add = pos_add_total;
+@@ -2010,6 +2024,8 @@ tre_expand_ast(tre_mem_t mem, tre_stack_t *stack, tre_ast_node_t *ast,
+ 	}
+     }
+ 
++  if (check_add(*position, pos_add_total))
++    return REG_ESPACE;
+   *position += pos_add_total;
+ 
+   /* `max_pos' should never be larger than `*position' if the above
+@@ -2711,9 +2727,19 @@ regcomp(regex_t *restrict preg, const char *restrict regex, int cflags)
+   /* Parse context. */
+   tre_parse_ctx_t parse_ctx;
+ 
++  /* Limits: before tre_expand_ast, int values like position, subid or
++   * num_tags are bounded by 2x input length, used stack entries are
++   * bounded by 16x input length. input length is checked upfront to
++   * avoid overflows before expand. later, values that can grow big are
++   * bounds checked via check_add and xcalloc. */
++  const int input_limit = 1024000;
++  const int stack_limit = 8*input_limit;
++  if (strnlen(regex, input_limit) >= input_limit)
++    return REG_ESPACE;
++
+   /* Allocate a stack used throughout the compilation process for various
+      purposes. */
+-  stack = tre_stack_new(512, 1024000, 128);
++  stack = tre_stack_new(512, stack_limit, 128);
+   if (!stack)
+     return REG_ESPACE;
+   /* Allocate a fast memory allocator. */
+@@ -2801,9 +2827,12 @@ regcomp(regex_t *restrict preg, const char *restrict regex, int cflags)
+ 	   for example "a*" or "ab*".	Figure out a simple way to detect
+ 	   this possibility. */
+   tmp_ast_l = tree;
+-  tmp_ast_r = tre_ast_new_literal(mem, 0, 0, parse_ctx.position++);
++  tmp_ast_r = tre_ast_new_literal(mem, 0, 0, parse_ctx.position);
+   if (tmp_ast_r == NULL)
+     ERROR_EXIT(REG_ESPACE);
++  if (check_add(parse_ctx.position, 1))
++    ERROR_EXIT(REG_ESPACE);
++  parse_ctx.position++;
+ 
+   tree = tre_ast_new_catenation(mem, tmp_ast_l, tmp_ast_r);
+   if (tree == NULL)
+@@ -2813,22 +2842,22 @@ regcomp(regex_t *restrict preg, const char *restrict regex, int cflags)
+   if (errcode != REG_OK)
+     ERROR_EXIT(errcode);
+ 
+-  counts = xmalloc(sizeof(int) * parse_ctx.position);
++  counts = xcalloc(sizeof(int), parse_ctx.position);
+   if (counts == NULL)
+     ERROR_EXIT(REG_ESPACE);
+ 
+-  offs = xmalloc(sizeof(int) * parse_ctx.position);
++  offs = xcalloc(sizeof(int), parse_ctx.position);
+   if (offs == NULL)
+     ERROR_EXIT(REG_ESPACE);
+ 
+-  for (i = 0; i < parse_ctx.position; i++)
+-    counts[i] = 0;
+   tre_ast_to_tnfa(tree, NULL, counts, NULL);
+ 
+   add = 0;
+   for (i = 0; i < parse_ctx.position; i++)
+     {
+       offs[i] = add;
++      if (check_add(add, counts[i] + 1))
++        ERROR_EXIT(REG_ESPACE);
+       add += counts[i] + 1;
+       counts[i] = 0;
+     }
+-- 
+2.55.0
+
diff --git a/package/musl/musl.mk b/package/musl/musl.mk
index 5384a08abf..cb9f7f8870 100644
--- a/package/musl/musl.mk
+++ b/package/musl/musl.mk
@@ -34,6 +34,9 @@ MUSL_IGNORE_CVES += CVE-2026-6042
 # 0006-qsort-fix-shift-UB-in-shl-and-shr.patch
 MUSL_IGNORE_CVES += CVE-2026-40200
 
+# 0007-regex-avoid-int-overflow-in-regcomp.patch
+MUSL_IGNORE_CVES += CVE-2026-107891
+
 # musl does not build with LTO, so explicitly disable it
 # when using a compiler that may have support for LTO
 ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_4_7),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
