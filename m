Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339FF606A319
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 17:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=jVZKqFTd
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CABF6082B;
	Wed, 21 Oct 2026 17:00:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uHqhMpM8vcHK; Wed, 21 Oct 2026 17:00:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org BA8AF608BD
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792602013;
	b=d6FifLgjyIDcYyA2tm2Q8fw4mdIneIVq4C2SYTrcWGtAYTzSPtL263YkzKX/I1oE2wmK
	 J5QfFGt7MsWr9E9G+t1XOGxYqfJVO79WH6vEJeWKtfkKyguxQUX+Hh2wZsNczY2GQZ0qR
	 TAyxWWOWSVD/nVw14oEJP4ljscV1+LrYxWSjGP4ipIGBbE1TUXYPbGqtzG7PRBfXkBBVg
	 maeFai6vRYvCtQKO5K4Qz3oekqr/I3nlrjW2PFCCAwv+UDbqlIxpyRqnkm2N+6f3WD/6F
	 bK8VArjBGh8BSdsyYGdghMXCWIze0f4hftncQG/uycjGx1HHqRXYBxJY83gzYRRXaXA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792602013;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=W7cuXS1+sKNlM6OZbX43+0QoPySx5Z5c0QwDE1Rhh64=;
	b=qpZhs6aRrV7UYTydcUnwQuojp+0M20J1RDinzXf2NoiDSJyjg7CrDMgsgFIRwi1RUyow
	 apqW6noAtAx7LH2byjRsNLOFWwGBbXcjhaWXWkHzDnReiMiZ0CfVgEbbmOwdDeZD9qciS
	 VKWK8ljIZtFfkjk1qyXPj/9GOTyoljAeCo4wRwbDBAdUt4xY40XVzypY24ALT1DA8UIKG
	 ZbAQmuvthzXLhtaJ/jagL5fVuBo31UZ9YxyL4Q7+wQDHwp3X1UHbsbkUpdvrLc2C7GQ9l
	 Vhct6phmnuZdyXk+P5TOvFg2HRvYxT3aODo8Le36DKgkhYoJW8OwOM0nlD/Nl+TGgrw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792602013;
	bh=W7cuXS1+sKNlM6OZbX43+0QoPySx5Z5c0QwDE1Rhh64=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=jVZKqFTdlTN3FKrdsTK2zZuuIZYtFBI5WDUdHFrTPu5y4Kp7By2EGkcuoVwsFF3YS
	 /kDK5DHDB4v7s+lz7vcqlzZUwNVKDNJv2e854Pd93Cz852h7nSwR9yr1cNHJqg3q3h
	 0NNEw+SuiWq1BI+F/jvm5WDS5xzvIuuRLyN9ThfyBj+rvZAYUq7WeuefcTa/k5yVnD
	 0BSf3yocItTVMKiExxOMdgqrOr2MOcis2hRuaaHP/yk5My6eaLNO+2mBlOEOC1nJX8
	 DP4/rfV6U0EqZMERIH9IiZc7O3Ju49f8HcBOzSvltO2V+CqGsrkPn58wWsEqyHQ9zg
	 mq74Uyy/MlHnQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA8AF608BD;
	Wed, 21 Oct 2026 17:00:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C06DC930
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 17:00:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 95663405AE
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 17:00:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WzfK_BvCYRxl for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 17:00:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 99CF74058E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792602010;
 b=r3R2lL+uwBjAx9FNHk2E3tND3uBn2B6PPdi5pfkO2NtvaTv42GjXC4WuAM+Dzge73deU
 /w8r/8o8tZN+QucLrQCo2x635lt9UzxL4RReJaQqNI/AK/7k0vxDUtt6qR7f+ksx8ivYT
 K4wGjYOSQ6ejO8tAh6JOg9jsiW0pX//P1SL4gVDDeBAtaoqh3F6U0KLkl3YTweLptecU5
 hexZnJ1pKK6Wn2AZ3skDdceqWX2FU4bEEbWM8dvyuKs5SJ34Fd+MRmU4Mp4aNowO81vgk
 sbve/XTCR6M5ryb+JJl7QC+FjRni+B78hOy5F1D7O7AQHhm8FhHlK3JP3wVc15RI8Dw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792602010;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=LcCgQhy+B6pt6J88GQHVGLnJd0qXZQ9J4KZXTYLf1TA=;
 b=W7vCo7PvDn5zaWp/KWFgVA5prky37W21OkO7jx9rAGoYPM+JDQYJeSaiubaFBUpRp0eN
 FAVMnDu9bLHus1jUXEbx6OmoE0pGXuT7zqF3vR7zYDQ3d2YEUu/v3/uAB0QOkyDf7Aorp
 1NwoRDV7xd7EdtQ9DLA+3xfisDVwsJjFNWrIYLaeKMHDXZM/n+RwFebWB22bAQe5Yz6w2
 VMfnm84IbHZZn0PzzkOXH6Kpqnx/7S3nv7VoR71f9cEk76nH6pkt5MouJFfuJgi/WBArt
 gkIBbHbP5hkl4R38dmgqoPEupZM8C5kcnOSdL6iTbJ6QzILmqHj9Ix676RaMTlQ/RDw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmx.de;
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=kOBChnvn; 
 arc=none smtp.remote-ip=212.227.17.20
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 99CF74058E
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 17:00:08 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MUXpQ-1xAfji3c3c-00Ptz8; Wed, 21
 Oct 2026 19:00:07 +0200
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fiona Klute <fiona.klute@gmx.de>
Date: Wed, 21 Oct 2026 18:59:49 +0200
Message-ID: <20261021165949.3324383-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:5sXU2w6OpHnFmwr0gyDGd41BU+wz/MbAW24JkxO+Ed7omD4P6Ob
 YaxDNx4HUFfjD7fzPx+aH3cWLVoNUaXYZTYGyw3HVtEk7fZU3WR1CcfXqF0s9n6oJxi1+y6
 racgBXgH0o17Nw5iFfIOKaZi+b5jUheRAdOuXhuei0EFPm8jXy86APOUPBPZ/I7O/ha8M1d
 H0HfcqZPlSP3pjBN6h+Rw==
UI-OutboundReport: notjunk:1;M01:P0:L0DgAW0/E0w=;5hw4zpr6HfVDyMhHr+erC/Zs8yr
 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
 1yZelSXmGgI=
Subject: [Buildroot] [PATCH 1/1] package/musl: add upstream security patch
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

CVE-2026-107891: musl libc: multiple integer overflow in regcomp,
possibly leading to incorrect allocation sizes and out-of-bounds heap
writes
https://www.openwall.com/lists/musl/2026/10/21/1

The upstream announcement states: "The vulnerable code has been
present since version 0.5.0. All subsequent versions up through 1.2.6
are affected." So the patch needs to be backported to all Buildroot
stable branches.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 ...-regex-avoid-int-overflow-in-regcomp.patch | 171 ++++++++++++++++++
 package/musl/musl.mk                          |   3 +
 2 files changed, 174 insertions(+)
 create mode 100644 package/musl/0007-regex-avoid-int-overflow-in-regcomp.patch

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
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
