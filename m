Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00906606A31E
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=oK3RlR1j
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF19981546;
	Fri, 30 Oct 2026 14:18:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5IEk0XXNTAyY; Fri, 30 Oct 2026 14:18:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A674F81570
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369928;
	b=dQZK2a9OeXNTO7jUahM6SoB9kGmHwCyvboxhSAb6IK+fpIMMl61RKrdnF86csKljy6gu
	 cCNF/kI6sqEYKnPCl9AHchbfhAC7PdLr4VwTQYZwYtTkz+dckjZVO2HG7gXor1N3IYtkm
	 B4f2TIpdWOCbjdV2cLO1eM6KxSZsBHScUH6hH8qvssk+qCtjavCtK4vAPbwvRWjO47j1/
	 Bk7sYJJOnTDIUXqdX3mlMMif3j4Z9rO3JBrN8IrsQedjdK3sJ2jYXek74DM1qjDHVMkcb
	 2s39qiEpAlS8I2ZWzuO5kTGPMK6gThi1bWIuxZwveHx1jeOm5wezTppByaZw8zvrz3Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369928;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=rio+WHqPA4wPkAXOb1klnawWWHpovgjwzXrlRSRejU8=;
	b=hrUGE1sLRADJaoYIoMmMjE9szIy3kLDP0gahRdUncqHZjsSfVkRTSZk4swUygI3cd+59
	 bM8mz1dC0M7H4IQfHeK4KNhP1chG2wZWSwQOoKgK9qYSD9tEAnDCSk9Qt8okWp+0gDuv6
	 m4RrV/+aVPd6eArO82oUQHjZtuelbMLXgoMB+H8mIOqSNxskgSCAQRfDCq3wF+XLMIE49
	 KeeWkpmWQkFxS3E9EFrArNgYubif8ekFOssr3iOuDqIuNxAKMmKWjoNa911SEsEJvMus6
	 6NVLTqmAsU7xBNU4YqdTXU1ie3WQ0zm7X/s2mOXQNO1dFqAxWK30MxbiN6hiEp/QWvw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369928;
	bh=rio+WHqPA4wPkAXOb1klnawWWHpovgjwzXrlRSRejU8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=oK3RlR1jv8c6IN1GqXLChb0ySzRBne5EMRyEwZvRRCgSG6QmfPFECzsLierO3RJm4
	 vyyUbSsopMmZXCjrojZ2CX09KtJZFWmir4yT0Ug7++oa2zaHtOCHMn9tfgqw7i9xL5
	 eXrkk/jOW+SE3Cs5DmDBV7BM1lZG9Ic/oM1YVf8fzwT/9Ye928pPoN/Y8eacF7NkRh
	 mVi8d7aB82aL0gczoXoE1eqbd6lNoCm+PkpaCgmqPsYTUkAQtfNVvHNu7j/Sd9Gjzg
	 t2G1mo1PhI7nZXYou6zA1j3gsxUAOkNfIbkAaVUqDYi9sXhLDkdeKVw5uxTKBrYnat
	 bK9pQtt8mOgHw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A674F81570;
	Fri, 30 Oct 2026 14:18:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 311A5D47
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 23239810B7
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6e9K_liDTvdn for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:18:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 30852812C5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369885;
 b=aFrM8OD0Lf39DkdhsMlOpIcelnK8WiOALoMWBpt/aQyV04G/6mKffcOQenlrRNGKL8If
 K9KyxS1j1NZ7tK1bzO4/K97geyBNpyINF933dyo1zIqq1XJCBDJO73Xg9eXMHnG7CcfRt
 Z9N3A1onl7+5aBMr6+FjIA71zBjgB1Eip+iUOoddAimvfSGFT8XDZAXzNvudUgr2wf3t8
 Bs4u/kW26U85Rql0ADqvdWWfq4flwcg1pvDRhzUlfBJQtOcHvxzMLw88r2jZWdwbrXWlE
 u0j3k6QwXpWlzw4Qc465nx6dt101ucrupDBRfC7yJQb6F9uvwRchNbFYBRIaoLMs3SQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369885;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=DrmAKsdAfIB2BOynp8AoBBs8zXn+ZT23BxIGvOiInOM=;
 b=noqHM8kqKOjHeVxh9ERfm3hkvrM6dq/4P5aIf495YlRuyzbLtSgkH71XP8hax7APTukM
 KYNTDTAEFKySmVobTYWsNoF1psxXmHD3G410iAnmQUYf6/a0telXDna2GRHcMgFAHDMDf
 o2/foGJfzOAM8X3uYiFZkrWBXhjdTnQ4bVy68+BBt0uPQtdyvyCWFAcivuliQvBi9g1IU
 dig/KsC4jBG4pEmIX/6xGgd+lbiz758cC5zBBAbY2DxvRrZdePjeuCAvfqy7E9Eja5YCB
 cWbXb0cvfn56xisekV5sMPfH9OACrXhay272SVtYD7qmbdqWRKeo4OWzs4+PqqWae2A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 30852812C5
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4F79F9D388; Fri, 30 Oct 2026 14:16:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:21:06 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 31aa81e84f6c26670e59880ebfe6338c5bd6bacf
X-Git-Newrev: 49ff530efe939e59479ac06a090963d7443055e0
X-Patchwork-Hint: ignore
Message-Id: <20261030141637.4F79F9D388@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/musl: add
 upstream security patch for CVE-2026-107891
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1982966017258106465=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============1982966017258106465==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/49ff530efe939e59479ac06a090963d7443055e0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

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
(cherry picked from commit 77473256bd9a49f2120d1efedbc412aaf4501ecd)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
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

--===============1982966017258106465==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1982966017258106465==--
