Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0FEBC4332F
	for <buildroot@archiver.kernel.org>; Wed, 21 Dec 2022 13:07:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5B57840382;
	Wed, 21 Dec 2022 13:07:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B57840382
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id avMrsKGF_fzP; Wed, 21 Dec 2022 13:07:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DC14740441;
	Wed, 21 Dec 2022 13:07:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC14740441
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7E6BA1BF284
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 13:07:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5875E41687
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 13:07:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5875E41687
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cNLL3D5TgFig for <buildroot@lists.busybox.net>;
 Wed, 21 Dec 2022 13:06:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5301641685
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5301641685
 for <buildroot@buildroot.org>; Wed, 21 Dec 2022 13:06:59 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:a2ac:472c:b44e:1236])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id F37C3780368;
 Wed, 21 Dec 2022 14:06:53 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 21 Dec 2022 14:06:53 +0100
Date: Wed, 21 Dec 2022 14:06:53 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20221221130653.GM2909@scaer>
References: <20221220180306.17253-1-ps.report@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221220180306.17253-1-ps.report@gmx.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1671628016;
 bh=lnFy9rewhbD/fdNzKwwRCB9tlPbjm+jQ3TrIoUsnWOU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JNmHIoup8omVhpPPSLJZ9puFtyPjqxBEWNg7JLv6P3V9dxY5BiIv3FJwUbZFaJ6Ia
 UkxNIwGCUlcyn6dC9HPkpRLtTGeDZB3R2HZVL5U5N00FV/BBgig2RBTdBgd3B/gWyo
 TY09npfimhsyGJSAIjwLrFAzaTcJg3PE/fazfaCoNeNHvUagjMWS0bjlPk8yeAuahd
 7C9sXTp7bh6H8wpkVzcTn3GGRC0dCCOhE+pv1iXbM+8lJEY6KSqb/LL01mZasqerm9
 +NZpmNphA7I5DS03RLRJVcg0iEIXFPzLZEk3vRFJbMPsxbd9OQxzyBq1fPct129zhA
 kUNxos/dLAFcQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=JNmHIoup
Subject: Re: [Buildroot] [PATCH v1] Config.in: update default
 BR2_CPAN_MIRROR URL from http to https
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

Peter, All,

On 2022-12-20 19:03 +0100, Peter Seiderer spake thusly:
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Notes:
> 
> - the mirror list URL http://search.cpan.org/mirror seems outdated
>   (re-directed to https://metacpan.org/mirrors aka 'Not Found - The
>   resource you requested could not be found.').
> 
>   The closest matching URLs I found are:
> 
>   https://www.cpan.org/SITES.html
>   http://mirrors.cpan.org/map.html
>   http://mirrors.cpan.org/

I've updated the help text with those last two URLs (table and map),
extended the commit log with your good explanations above, and a few
additions.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Config.in b/Config.in
> index 3c57c591a8..c318223d1d 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -287,7 +287,7 @@ config BR2_LUAROCKS_MIRROR
>  
>  config BR2_CPAN_MIRROR
>  	string "CPAN mirror (Perl packages)"
> -	default "http://cpan.metacpan.org"
> +	default "https://cpan.metacpan.org"
>  	help
>  	  CPAN (Comprehensive Perl Archive Network) is a repository of
>  	  Perl packages. It has multiple software mirrors scattered
> -- 
> 2.39.0
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
