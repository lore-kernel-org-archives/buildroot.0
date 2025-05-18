Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32452C3ABD8
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 14:41:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B937681EE1;
	Sun, 18 May 2025 14:41:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CHOid1Yda3vt; Sun, 18 May 2025 14:41:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B2C3C81EC4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B2C3C81EC4;
	Sun, 18 May 2025 14:41:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E2281DF
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:41:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C7C4160619
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:41:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1MkZHKDwmx_L for <buildroot@buildroot.org>;
 Sun, 18 May 2025 14:41:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EE8D0608D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE8D0608D9
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EE8D0608D9
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:41:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2958F1C0FC0; Sun, 18 May 2025 16:41:33 +0200 (CEST)
Message-ID: <34b22e48-c185-469a-908e-2d754b34aaa5@rnout.be>
Date: Sun, 18 May 2025 16:41:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Cc: Brandon Maier <brandon.maier@collins.com>
References: <20250514190529.680618-1-james.hilliard1@gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250514190529.680618-1-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747579293; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=eDGE1ZDZD0AE8uhfunXU3cFub+LGB2y6WZJig5lCnGU=;
 b=Qpylq5o2C6gXahMzPeK+ryvSe2GqqFgX6Gshb8P0+DS98lSf2GMrgH4uFNji8V/gj6PpFi
 fdGPuidoh++qPDuYUyC0Iy7SPADtmfoWNylUNNigFRbAXHQpkRzSIEcvUJZ0n8OMgG6Odh
 Sye5C0hgkB8V5QbZRaHTfc61dWtgiQl7n3LgrQrPA7p5QSli+voXyYzIvUsO/A8QTCW7IV
 HVKcCLswwhb2RzqWjSwV6bC13X1TKx6XZN7SgCvmGJysT2TAXySJQXXO//eEqVK9pkriyR
 E/797qeXMhmnED5IZ+j9OumL24UdeQiLST1Zl5PrhZvuod7JRYHrGM8Skf7tEg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=Qpylq5o2
Subject: Re: [Buildroot] [PATCH 1/1] package/unifdef: fix build with gcc 15
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 14/05/2025 21:05, James Hilliard wrote:
> Add a patch fixing compilation on hosts with gcc 15.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   ...0002-Don-t-use-C23-constexpr-keyword.patch | 60 +++++++++++++++++++
>   1 file changed, 60 insertions(+)
>   create mode 100644 package/unifdef/0002-Don-t-use-C23-constexpr-keyword.patch
> 
> diff --git a/package/unifdef/0002-Don-t-use-C23-constexpr-keyword.patch b/package/unifdef/0002-Don-t-use-C23-constexpr-keyword.patch
> new file mode 100644
> index 0000000000..5b5c9690da
> --- /dev/null
> +++ b/package/unifdef/0002-Don-t-use-C23-constexpr-keyword.patch
> @@ -0,0 +1,60 @@
> +From d616741e6b0d5b57b66447e85ad32b283b28adde Mon Sep 17 00:00:00 2001
> +From: Sam James <sam@gentoo.org>
> +Date: Sun, 17 Nov 2024 01:26:27 +0000
> +Subject: [PATCH] Don't use C23 constexpr keyword
> +
> +This fixes building with upcoming GCC 15 which defaults to -std=gnu23.
> +
> +Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> +Upstream: https://github.com/fanf2/unifdef/pull/19
> +---
> + unifdef.c | 10 +++++-----
> + 1 file changed, 5 insertions(+), 5 deletions(-)
> +
> +diff --git a/unifdef.c b/unifdef.c
> +index dc145a2..4bd3bda 100644
> +--- a/unifdef.c
> ++++ b/unifdef.c
> +@@ -202,7 +202,7 @@ static int              depth;			/* current #if nesting */
> + static int              delcount;		/* count of deleted lines */
> + static unsigned         blankcount;		/* count of blank lines */
> + static unsigned         blankmax;		/* maximum recent blankcount */
> +-static bool             constexpr;		/* constant #if expression */
> ++static bool             is_constexpr;		/* constant #if expression */
> + static bool             zerosyms;		/* to format symdepth output */
> + static bool             firstsym;		/* ditto */
> +
> +@@ -1086,7 +1086,7 @@ eval_unary(const struct ops *ops, long *valp, const char **cpp)
> + 			*valp = (value[sym] != NULL);
> + 			lt = *valp ? LT_TRUE : LT_FALSE;
> + 		}
> +-		constexpr = false;
> ++		is_constexpr = false;
> + 	} else if (!endsym(*cp)) {
> + 		debug("eval%d symbol", prec(ops));
> + 		sym = findsym(&cp);
> +@@ -1103,7 +1103,7 @@ eval_unary(const struct ops *ops, long *valp, const char **cpp)
> + 			lt = *valp ? LT_TRUE : LT_FALSE;
> + 			cp = skipargs(cp);
> + 		}
> +-		constexpr = false;
> ++		is_constexpr = false;
> + 	} else {
> + 		debug("eval%d bad expr", prec(ops));
> + 		return (LT_ERROR);
> +@@ -1170,10 +1170,10 @@ ifeval(const char **cpp)
> + 	long val = 0;
> +
> + 	debug("eval %s", *cpp);
> +-	constexpr = killconsts ? false : true;
> ++	is_constexpr = killconsts ? false : true;
> + 	ret = eval_table(eval_ops, &val, cpp);
> + 	debug("eval = %d", val);
> +-	return (constexpr ? LT_IF : ret == LT_ERROR ? LT_IF : ret);
> ++	return (is_constexpr ? LT_IF : ret == LT_ERROR ? LT_IF : ret);
> + }
> +
> + /*
> +--
> +2.34.1
> +

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
