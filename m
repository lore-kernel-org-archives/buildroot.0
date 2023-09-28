Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B77FE743C2
	for <buildroot@archiver.kernel.org>; Thu, 28 Sep 2023 20:40:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B88766107A;
	Thu, 28 Sep 2023 20:40:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B88766107A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DOcOQjoaHSeI; Thu, 28 Sep 2023 20:40:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4CDF61066;
	Thu, 28 Sep 2023 20:40:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B4CDF61066
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 98E4E1BF287
 for <buildroot@lists.busybox.net>; Thu, 28 Sep 2023 20:40:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7B81942D38
 for <buildroot@lists.busybox.net>; Thu, 28 Sep 2023 20:40:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B81942D38
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hXD6JI0gQGSV for <buildroot@lists.busybox.net>;
 Thu, 28 Sep 2023 20:40:27 +0000 (UTC)
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DFF6142D30
 for <buildroot@buildroot.org>; Thu, 28 Sep 2023 20:40:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DFF6142D30
Received: from ymorin.is-a-geek.org (unknown [92.184.106.19])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id C551119F574;
 Thu, 28 Sep 2023 22:40:20 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 28 Sep 2023 22:40:20 +0200
Date: Thu, 28 Sep 2023 22:40:20 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230928204020.GA14593@scaer>
References: <20230927194216.1597862-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230927194216.1597862-1-bernd@kuhls.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1695933624;
 bh=Fa3rgy7lfa2PeMl76rki+bKj0JLnquC1daHARIunkJI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aoeMCXhUr+DkopsSq9KcEsK/QhzMqNkJAPuyL5XZ4vCvyEgb4+/1CIerexBb4C4Rc
 xVHqZ0UWhHpEGnTo8JbTUA5MHu+Ib1nVxox1Ls7zA4CuHREv8RE1JzUz9lltST8ti/
 54VOwfuO4rNBLpYct5E9cmoHPvWNI8jvvd6RqjRsqN2dBFtt9cEp2QhCoMRddCJ8Ah
 HHnF9ihJinYnX0hya/O8sLMkm6gQxf3Q8MEG85WzM8qcSgPu5AcddrHVEwWuvJg2gs
 hXPf/tyGzUxYhqm/GLl/7Mi/Niz7udB5HgPrB6mGmGtO5XneoY2S/ToXlBos/BrOYc
 Kar3BVkVpZTDw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=aoeMCXhU
Subject: Re: [Buildroot] [PATCH 1/1] package/onevpl: disable tools
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

Bernd, All,

On 2023-09-27 21:42 +0200, Bernd Kuhls spake thusly:
> Fixes:
> http://autobuild.buildroot.net/results/059/059a8581fb809488ad6fa3183874395ebf3f0926/
> 
> This package is not part of any older buildroot release, no backport
> necessary.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

I've added a little blurb about why it is OK to just disable the tools
rather than add the necessary dependencies.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/onevpl/onevpl.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/onevpl/onevpl.mk b/package/onevpl/onevpl.mk
> index 2033f755c0..601e121a55 100644
> --- a/package/onevpl/onevpl.mk
> +++ b/package/onevpl/onevpl.mk
> @@ -12,6 +12,7 @@ ONEVPL_INSTALL_STAGING = YES
>  ONEVPL_DEPENDENCIES = host-pkgconf
>  
>  ONEVPL_CONF_OPTS = \
> +	-DBUILD_TOOLS=OFF \
>  	-DINSTALL_EXAMPLE_CODE=OFF
>  
>  ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
> -- 
> 2.39.2
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
