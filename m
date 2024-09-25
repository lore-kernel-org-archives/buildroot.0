Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90FB9CCF9E7
	for <buildroot@archiver.kernel.org>; Wed, 25 Sep 2024 17:32:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3CF4C80F58;
	Wed, 25 Sep 2024 17:32:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1HKeQg3HYUqG; Wed, 25 Sep 2024 17:32:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F04E80F6E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F04E80F6E;
	Wed, 25 Sep 2024 17:32:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D67231BF4E7
 for <buildroot@lists.busybox.net>; Wed, 25 Sep 2024 17:32:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1CB3E409A8
 for <buildroot@lists.busybox.net>; Wed, 25 Sep 2024 17:32:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZK_iVUftIm9R for <buildroot@lists.busybox.net>;
 Wed, 25 Sep 2024 17:32:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B07CE4099C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B07CE4099C
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B07CE4099C
 for <buildroot@buildroot.org>; Wed, 25 Sep 2024 17:32:08 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:5d8d:eab4:d280:c2c4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 7111F6014E;
 Wed, 25 Sep 2024 19:32:02 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 25 Sep 2024 19:32:02 +0200
Date: Wed, 25 Sep 2024 19:32:02 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Baruch Siach <baruch@tkos.co.il>
Message-ID: <ZvRJEtRs7CrOPhr8@landeda>
References: <6dfb1699dfbfa78e9b6c13701e0ab88dfcc5e8ce.1727283179.git.baruch@tkos.co.il>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6dfb1699dfbfa78e9b6c13701e0ab88dfcc5e8ce.1727283179.git.baruch@tkos.co.il>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1727285525;
 bh=d3/YdDuHJOVBB8JyeyeOpZtcomq/qY2tFihguW1gfBw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jvVCXK3tdD3AMydrJsKdm1jdSAEmMMnyaeroYgkTyIhsngG5EaH2eLwyQk/T/DDGq
 L4ahEplEER6lPbjou9x7UjJagx+BMd3EUKl+txZW6pxDyRN8bcUU6IRKZnycdyQ0Sp
 FIGCYABu3bvbwpvTcYkDAlUG88oEv1/NxMqWQbj+kfTUFXySSj3X+DxO3AVGYEXqZ6
 G+bscI3GITfP9J9hDLUNACSweHzgx3NPmb7HYv6UxttHAmUTtDgEYBShBqA8kENm+N
 dDzXUjSaihqNwdI1aGg4NNKQuxiDpDzKRjXa1cS5b285f1JNGDouclYJkZF+AUsLVC
 OChLj9NFydFSA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=jvVCXK3t
Subject: Re: [Buildroot] [PATCH] Revert "package/cURL: fix static link whith
 openSSL"
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Baruch, All,

On 2024-09-25 19:52 +0300, Baruch Siach via buildroot spake thusly:
> This reverts commit 61d322c3d258072460fddbab0b39c8bf4cc3e0bc.

This is not a revert. A revert is for when the commit was faulty or
wrong, at the time it was applied.

However, in this case, the commit was correct back then. It is just that
what it does is no longer needed now.

I've rephrased the commit log accordingly.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> Upstream curl commit f057de5a1a950 ("libcurl.pc: add `Requires.private`,
> `Requires` for static linking") deals with proper pkg-config
> configuration since version 8.9.0.  Our local libcurl.pc modification is
> no longer needed.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/libcurl/libcurl.mk | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
> index b81e3551951b..9bf7724e7d54 100644
> --- a/package/libcurl/libcurl.mk
> +++ b/package/libcurl/libcurl.mk
> @@ -190,11 +190,6 @@ LIBCURL_CONF_OPTS += \
>  	--disable-tftp
>  endif
>  
> -define LIBCURL_FIX_DOT_PC
> -	printf 'Requires: openssl\n' >>$(@D)/libcurl.pc.in
> -endef
> -LIBCURL_POST_PATCH_HOOKS += $(if $(BR2_PACKAGE_LIBCURL_OPENSSL),LIBCURL_FIX_DOT_PC)
> -
>  ifeq ($(BR2_PACKAGE_LIBCURL_CURL),)
>  define LIBCURL_TARGET_CLEANUP
>  	rm -rf $(TARGET_DIR)/usr/bin/curl
> -- 
> 2.45.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
