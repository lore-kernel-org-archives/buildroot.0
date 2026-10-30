Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A69606A31C
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Is5kBOUr
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31AD760B4A;
	Fri, 30 Oct 2026 15:28:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 76cz6tD_mLuH; Fri, 30 Oct 2026 15:28:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E5C0160B69
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793374088;
	b=CTIUCvntsssUxm0gMhVswrNAA85j/TzOEJn2WonZLq6h8zW6+CUKLZrjxikzcOyKRsGi
	 UHdjzOvHA8bsmNs1Fs2sUONT2qqywq13od6/9rnkp/0BqZMyOHV4fWHEhhgcPhb4vK3u0
	 k/23uPSxOBe9dHD6owuyTmDH2Az9M0odyonIcYcdVHdEfiHKI0CmZ7oqc+7bpSEJXVim7
	 IkH+LRFtLFd7ILDi3Wm8NmY58VKPsBEfgXOlzXqIf00g5law5g/NPtgPeLyIVy4+7Wm9K
	 6RWLDafHFV+227blmQlkH4EZkn2xzEabsYU8ffcktl/EaRNjl0ogMftoeSEdYfFFSxA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793374088;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=kuuQZmXYOCiDEQxY5+67qbFOw21QpZLQPlgibwhAOng=;
	b=WUGYt/PJzofb6NJXmczkBxcWGCy2UpTJ/bge13Xjgr40k4MOUNrupR7I3ZdGqzG0rVbp
	 XBHUrlv4Tvja9g1GpZdkyYI4rAON28Y2GBc4+dp6DkRwdwCW9kSEk2FcstmeD2O0gf80l
	 p+2/v8wqbDai72WO2w0kGNqZhyYX/pGFmfb3gZIjUN1Z6mFIivOMa7m9opzRdJKtfZKEf
	 qp7nypsAUUA4zqkzMFX9+C5Dx0d4ROEdqdAeF4m5UO9P8JTdAXHlgty8ZvnbqfEdRKOOL
	 yQDT4SS3s/teCg3Lt9GGpYzrDvlJ6/7J1mN+EMbuB+xOAoo+C9t48Q19K7l5LhP+Huw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793374088;
	bh=kuuQZmXYOCiDEQxY5+67qbFOw21QpZLQPlgibwhAOng=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Is5kBOUr4ED/qGS29324+GHh+5MUOXQI64VNtkJMZolEjAicPBZDpPHq/wiZjAPPk
	 InDYdKmZVzG3pctsQcKWu5/E8VI7jR2J4G6S0I6MZ+BjlSbktKsZcvbqQpoQoOELih
	 e+SS4gh5zg7pY8JvzsJMfSIjXkKAgc5pb3cib8gxdXE5/epeKBz5X/ue3yDxSWFBd8
	 wyq1/E2HfPh0n6L3T/k3+rvrP1YXXBagRiSKTbyBp8fBseS14gjCr90VlcSPhXv6ss
	 xn/1sX39l7XC/25M0h7FwnOtqD3dY5msr1hTJfgzzlZ5EApjKMK0SdPHvf5Z8HC5xN
	 CqGKulD8bFV1g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5C0160B69;
	Fri, 30 Oct 2026 15:28:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C50E0D43
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:27:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AB9F440CAD
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:27:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3GZfS17-7zIu for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:27:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 4E1F140C71
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793374070;
 b=mM071E3vcznWMLkxMAmn6Cedo3KNQldt4MoatyFzulA5mK4sN2ZsHa4Df1OmeE5KB6R2
 o4QRD6RBJnz2IYHV2TAZBj0FvV5ohGaHBMQ2MalFK0nIyTDZGeP0aH3AAtEjjbSX7f/Qc
 k5tNaoNPJUXio033hV2IbaXccxzPRKT1dti9o5s8nrVINvJB2YC+cNtGq6c9x58NYP3T4
 6e+2y9GlQwZFK+GJ/qsUF3mzvI3iejwk1cp4ZRaQO2aogEYMYZLCKanPbGbEfN2qYK2ko
 eNc8I6rC+qpSFouG3gA8dtNSwngGlNjtPn7v21Jzr/6sAiotWFL//HXpTVVkyJo0sTA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793374070;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=ZfZUceP5KXRS3FqKEEveaK7LOG65faZeisKtyK4SS0w=;
 b=WriM034FS6sBgxaFAhdROmcwZKiw0HL4TZNlRaG0x2LzPEDxBUmcGWxnaAmGDhlzlAoz
 nywAhZ3l9MeviWjWuPsQgTXNoWis9SpZP5J6mBNqsJ4eq+kuQg3dX78lNydrwOAPni3Jr
 8QJnNkvg+lpaAqHFRoCmPRIqNhGzl07ZtvpBfooUBMZo8qnAqRYvfRn3gmDfmHbZ8oYsX
 JseoTYVi1gsOvgKl/4u8vj6o1DGD3gY78sVrO04VDcgwaBPK76/szskvSPIy2JNDias5O
 9jvNO457NL+m2EdMcwamlzrv+3x6FPKUyB/0UzVYz3U1kct0laDwlVmgJR0DPQSZviQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=M0ABVR3G; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::433"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4E1F140C71
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:27:49 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-48e0d1da913so642432f8f.1
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:27:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793374068; x=1793978868;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=ZfZUceP5KXRS3FqKEEveaK7LOG65faZeisKtyK4SS0w=;
 b=wEgVko4vyS2vKy4iWyZeTvaKmS1Mwq4DT8k4umtqQnTZ/oCX6X5E90MUBE9LRAgfpc
 iSGWrM/EpVWTrQCsh4PuSE6833wUcvQV17Fgyg+ZsfiuUWUPuzPAXlk8L5dpCHwvKBK7
 Jh8Wrbip2XqMwKjxAJv4NuHfNeobWOwD0LZYEjoVcOjWeZmCDF3ItV/NLl1Y6driJLwc
 znXRNocZOLC1DR3TbiCh82T14fxn2+OEfb7jiV3mHhzTdlF+/bkGgYzqsZYFL+4+lDM9
 B4ugYypM0ruZAeFVTDvIODj9lpwxZ3ux2c2eej+KcEvkUWmn531wwO0/ricO4+wFBQWE
 HzMA==
X-Gm-Message-State: AFq9FYIb/ZO4eNM/aD/L31U/xOQ76Gay9mRRyozXYMokO9qBhYvnSGhB
 uuEi+Jt1ifrvNCZt9H3jTaw8RLzY1zOViEVSLK9O4Y70VlodMuAT26bVnc/S+d+YRvo/pX/zLyK
 YULyyquM=
X-Gm-Gg: AYBFou2IT8RR09nsL2omKhyHq8kWBbmiUwT6c2M+j3R/NVflU6iS8SuS5j8GxOs9ars
 03MkiOVVbfjyVwk07PVC0I/NvlMWM/OaCQqc1+gyEJR7x/WSKX4bfG96G1DQMwlhB5xpXOHKY6Z
 TFYRHbxxKqbJDj0iTfR2tTfrEPrs01qFCe3x7nsZfNFV3AlO2+i4yrqJHa1EnPBfEM5qfmd2M0p
 zvyu1KzhQjVPUAp5XcjvQh2opbCp+3twxo8JwNVSDusJJKqCWi+M2hIqPtC3FHQYlMTp6zkoZrO
 czL1SRGjUEpQ4xHO3wtkOHsh2ooz+Ur+A3acx6+t8V2aUFd/IWPQTo+TzqWotFZdugj0RFgx/Li
 9NYfRhnR73eABx9ytaGrNX1ubGxvaSS859Crcb2+J5cMuoBaqEltpRVHtVxia93GcW68voujJ/+
 Y9MpkIeH3528STeFbZ90wFE52CIec20eZ+ReWeluwtRlvdCX2GjxjhKG5wpU5M2kG4Ar5l6ZdKd
 46Sd9zN27gIMjKofVoYsbk5Cesetd/9Zg9Lk0WgYPyr5K8hBw0pqS1dH5beoYPRKx3dlQvMq4Cp
 GorYGz6ga2Ax9HBn9btV7F5FZSwEhKh+MfxlzfTz4xaN4u6slD1wErOs5Sz7977wEOvSoZhItA=
 =
X-Received: by 2002:a05:6000:2dc7:b0:48a:f4d4:e1f3 with SMTP id
 ffacd0b85a97d-48e6e2d2370mr6638802f8f.13.1793374065649; 
 Fri, 30 Oct 2026 08:27:45 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71b8a84esm3995526f8f.39.2026.10.30.08.27.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:27:45 -0700 (PDT)
To: buildroot@buildroot.org,
	Fiona Klute <fiona.klute@gmx.de>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 30 Oct 2026 16:27:42 +0100
Message-ID: <20261030152744.1906934-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261021165949.3324383-1-fiona.klute@gmx.de>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/musl: add upstream security
 patch for CVE-2026-107891
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> CVE-2026-107891: musl libc: multiple integer overflow in regcomp,
> possibly leading to incorrect allocation sizes and out-of-bounds heap
> writes
> https://www.openwall.com/lists/musl/2026/10/21/1
> 
> The upstream announcement states: "The vulnerable code has been
> present since version 0.5.0. All subsequent versions up through 1.2.6
> are affected." So the patch needs to be backported to all Buildroot
> stable branches.
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  ...-regex-avoid-int-overflow-in-regcomp.patch | 171 ++++++++++++++++++
>  package/musl/musl.mk                          |   3 +
>  2 files changed, 174 insertions(+)
>  create mode 100644 package/musl/0007-regex-avoid-int-overflow-in-regcomp.patch
> 
> diff --git a/package/musl/0007-regex-avoid-int-overflow-in-regcomp.patch b/package/musl/0007-regex-avoid-int-overflow-in-regcomp.patch
> new file mode 100644
> index 0000000000..aafb71cdfe
> --- /dev/null
> +++ b/package/musl/0007-regex-avoid-int-overflow-in-regcomp.patch
> @@ -0,0 +1,171 @@
> +From 7813e9119eb5fe681b6750b8a033a0490bca0941 Mon Sep 17 00:00:00 2001
> +From: Szabolcs Nagy <nsz@port70.net>
> +Date: Thu, 23 Apr 2026 21:22:18 +0000
> +Subject: [PATCH] regex: avoid int overflow in regcomp
> +
> +regcomp has many int arith ops that may overflow. before tre_expand_ast
> +int values are limited by 2x the input length n, e.g.:
> +
> +  input ERE        int field    max value
> +  aaaaaaaaaaaa...  position     n
> +  ()()()()()()...  submatch_id  n/2+1
> +  ()||||||||||...  num_tags     2n-3
> +
> +so overflow before expand requires large n (and a lot of memory). later
> +some values can become big due to repetitions:
> +
> +  input ERE                     int field that overflows
> +  (((a{255}){255}){255}){255}   position
> +  ((a|b*){255,}){255,}          num_transitions
> +
> +num_transitions and memory use can be big without {k,} repetitions too:
> +
> +  input ERE        what             max value
> +  (a|a|a|a...|a)*  num_transitions  n^2/4
> +  (()|a|a|...|a)*  sum tnfa tags    > n^3/16 - n^2
> +
> +so memory can run out quickly as n grows (with 31bit va space 1700 long
> +input is enough even without {k,}) about half is tnfa and half is ast
> +firstpos/lastpos data. but overflow can happen before allocations fail.
> +
> +fix early overflow by limiting n. the stack usage is in [n,11n] without
> +repetitions, usually 7n, so the stack limit got adjusted too. the limit
> +is such that almost all inputs that worked before still work.
> +
> +overflows during and after expand are fixed by explicit checks via a
> +check_add helper and xcalloc instead of xmalloc.
> +
> +CVE: CVE-2026-107891
> +Upstream: https://git.musl-libc.org/cgit/musl/commit/?id=7813e9119eb5fe681b6750b8a033a0490bca0941
> +Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
> +---
> + src/regex/regcomp.c | 41 +++++++++++++++++++++++++++++++++++------
> + 1 file changed, 35 insertions(+), 6 deletions(-)
> +
> +diff --git a/src/regex/regcomp.c b/src/regex/regcomp.c
> +index b4b81968..a7115b12 100644
> +--- a/src/regex/regcomp.c
> ++++ b/src/regex/regcomp.c
> +@@ -1680,6 +1680,12 @@ tre_add_tags(tre_mem_t mem, tre_stack_t *stack, tre_ast_node_t *tree,
> +   AST to TNFA compilation routines.
> + */
> + 
> ++/* check if a+b overflows for a,b in [0,INT_MAX] */
> ++static int check_add(unsigned a, unsigned b)
> ++{
> ++	return a + b > INT_MAX;
> ++}
> ++
> + typedef enum {
> +   COPY_RECURSE,
> +   COPY_SET_RESULT_PTR
> +@@ -1731,6 +1737,8 @@ tre_copy_ast(tre_mem_t mem, tre_stack_t *stack, tre_ast_node_t *ast,
> + 		    /* XXX - e.g. [ab] has only one position but two
> + 		       nodes, so we are creating holes in the state space
> + 		       here.  Not fatal, just wastes memory. */
> ++		    if (check_add(pos, *pos_add))
> ++		      return REG_ESPACE;
> + 		    pos += *pos_add;
> + 		    num_copied++;
> + 		  }
> +@@ -1826,6 +1834,8 @@ tre_copy_ast(tre_mem_t mem, tre_stack_t *stack, tre_ast_node_t *ast,
> + 	  break;
> + 	}
> +     }
> ++  if (check_add(*pos_add, num_copied))
> ++    return REG_ESPACE;
> +   *pos_add += num_copied;
> +   return status;
> + }
> +@@ -1870,6 +1880,8 @@ tre_expand_ast(tre_mem_t mem, tre_stack_t *stack, tre_ast_node_t *ast,
> + 		tre_literal_t *lit= node->obj;
> + 		if (!IS_SPECIAL(lit) || IS_BACKREF(lit))
> + 		  {
> ++		    if (check_add(lit->position, pos_add))
> ++		      return REG_ESPACE;
> + 		    lit->position += pos_add;
> + 		    if (lit->position > max_pos)
> + 		      max_pos = lit->position;
> +@@ -1998,6 +2010,8 @@ tre_expand_ast(tre_mem_t mem, tre_stack_t *stack, tre_ast_node_t *ast,
> + 	      }
> + 
> + 	    iter_depth--;
> ++	    if (check_add(pos_add_total, pos_add - pos_add_last))
> ++	      return REG_ESPACE;
> + 	    pos_add_total += pos_add - pos_add_last;
> + 	    if (iter_depth == 0)
> + 	      pos_add = pos_add_total;
> +@@ -2010,6 +2024,8 @@ tre_expand_ast(tre_mem_t mem, tre_stack_t *stack, tre_ast_node_t *ast,
> + 	}
> +     }
> + 
> ++  if (check_add(*position, pos_add_total))
> ++    return REG_ESPACE;
> +   *position += pos_add_total;
> + 
> +   /* `max_pos' should never be larger than `*position' if the above
> +@@ -2711,9 +2727,19 @@ regcomp(regex_t *restrict preg, const char *restrict regex, int cflags)
> +   /* Parse context. */
> +   tre_parse_ctx_t parse_ctx;
> + 
> ++  /* Limits: before tre_expand_ast, int values like position, subid or
> ++   * num_tags are bounded by 2x input length, used stack entries are
> ++   * bounded by 16x input length. input length is checked upfront to
> ++   * avoid overflows before expand. later, values that can grow big are
> ++   * bounds checked via check_add and xcalloc. */
> ++  const int input_limit = 1024000;
> ++  const int stack_limit = 8*input_limit;
> ++  if (strnlen(regex, input_limit) >= input_limit)
> ++    return REG_ESPACE;
> ++
> +   /* Allocate a stack used throughout the compilation process for various
> +      purposes. */
> +-  stack = tre_stack_new(512, 1024000, 128);
> ++  stack = tre_stack_new(512, stack_limit, 128);
> +   if (!stack)
> +     return REG_ESPACE;
> +   /* Allocate a fast memory allocator. */
> +@@ -2801,9 +2827,12 @@ regcomp(regex_t *restrict preg, const char *restrict regex, int cflags)
> + 	   for example "a*" or "ab*".	Figure out a simple way to detect
> + 	   this possibility. */
> +   tmp_ast_l = tree;
> +-  tmp_ast_r = tre_ast_new_literal(mem, 0, 0, parse_ctx.position++);
> ++  tmp_ast_r = tre_ast_new_literal(mem, 0, 0, parse_ctx.position);
> +   if (tmp_ast_r == NULL)
> +     ERROR_EXIT(REG_ESPACE);
> ++  if (check_add(parse_ctx.position, 1))
> ++    ERROR_EXIT(REG_ESPACE);
> ++  parse_ctx.position++;
> + 
> +   tree = tre_ast_new_catenation(mem, tmp_ast_l, tmp_ast_r);
> +   if (tree == NULL)
> +@@ -2813,22 +2842,22 @@ regcomp(regex_t *restrict preg, const char *restrict regex, int cflags)
> +   if (errcode != REG_OK)
> +     ERROR_EXIT(errcode);
> + 
> +-  counts = xmalloc(sizeof(int) * parse_ctx.position);
> ++  counts = xcalloc(sizeof(int), parse_ctx.position);
> +   if (counts == NULL)
> +     ERROR_EXIT(REG_ESPACE);
> + 
> +-  offs = xmalloc(sizeof(int) * parse_ctx.position);
> ++  offs = xcalloc(sizeof(int), parse_ctx.position);
> +   if (offs == NULL)
> +     ERROR_EXIT(REG_ESPACE);
> + 
> +-  for (i = 0; i < parse_ctx.position; i++)
> +-    counts[i] = 0;
> +   tre_ast_to_tnfa(tree, NULL, counts, NULL);
> + 
> +   add = 0;
> +   for (i = 0; i < parse_ctx.position; i++)
> +     {
> +       offs[i] = add;
> ++      if (check_add(add, counts[i] + 1))
> ++        ERROR_EXIT(REG_ESPACE);
> +       add += counts[i] + 1;
> +       counts[i] = 0;
> +     }
> +-- 
> +2.55.0
> +
> diff --git a/package/musl/musl.mk b/package/musl/musl.mk
> index 5384a08abf..cb9f7f8870 100644
> --- a/package/musl/musl.mk
> +++ b/package/musl/musl.mk
> @@ -34,6 +34,9 @@ MUSL_IGNORE_CVES += CVE-2026-6042
>  # 0006-qsort-fix-shift-UB-in-shl-and-shr.patch
>  MUSL_IGNORE_CVES += CVE-2026-40200
>  
> +# 0007-regex-avoid-int-overflow-in-regcomp.patch
> +MUSL_IGNORE_CVES += CVE-2026-107891
> +
>  # musl does not build with LTO, so explicitly disable it
>  # when using a compiler that may have support for LTO
>  ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_4_7),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
