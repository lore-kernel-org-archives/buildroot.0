Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68E59C54EBD
	for <buildroot@archiver.kernel.org>; Sun,  8 Jan 2023 21:45:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E5F8240120;
	Sun,  8 Jan 2023 21:45:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E5F8240120
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TW3jxETqKijL; Sun,  8 Jan 2023 21:45:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 40F3E40160;
	Sun,  8 Jan 2023 21:45:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 40F3E40160
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 32E271BF352
 for <buildroot@lists.busybox.net>; Sun,  8 Jan 2023 21:45:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1989D40908
 for <buildroot@lists.busybox.net>; Sun,  8 Jan 2023 21:45:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1989D40908
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gabjg8VxgLjv for <buildroot@lists.busybox.net>;
 Sun,  8 Jan 2023 21:45:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA6F740903
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DA6F740903
 for <buildroot@buildroot.org>; Sun,  8 Jan 2023 21:45:05 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 9D78E5FF3F;
 Sun,  8 Jan 2023 22:44:54 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 08 Jan 2023 22:44:54 +0100
Date: Sun, 8 Jan 2023 22:44:54 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230108214454.GH151997@scaer>
References: <20230107010437.2471513-1-james.hilliard1@gmail.com>
 <20230107010437.2471513-2-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230107010437.2471513-2-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1673214303;
 bh=iA2TPTIAWoLNi9+MxpPRg/05E+xEV7i/1smF4wGP9Uw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gdx3HX8I1Beg3QGY9U+CGlU0ivh74+ZnKnhWnPYekKNGDBYLqTY5Ur8aTWelpdctR
 cey6/PDwSPdd94U391NzuV+jEjauJkrHzARIIiKS84iNNqspux3pxkqwZ/7YBbVBeI
 Q/Crfgn06ldszIQBxogjv/QZonsRCxOCKlu+P6hhYc9OSAxwQw8qzbSBiW+VWFaZ8P
 vq8eV5/ETlIm8b+GWcmg6CGL8JOMLjXvnqh6h5zmFZDQSfg1rjgkroqbbW3tbahJLb
 2DydRxvgGm7PZHFv+nXoptp/FXo9mlIcy7fdgoeX7mdG9/HhjzoI9VaTPczk1L+A+q
 AUXbMf3+8XjWg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=gdx3HX8I
Subject: Re: [Buildroot] [PATCH 2/4] package/zstd: disable ccache for host
 package
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
Cc: Anders F =?utf-8?Q?Bj=C3=B6rklund?= <anders.f.bjorklund@gmail.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>, Dominik Michael Rauh <dmrauh@posteo.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

+Dominik +Anders

On 2023-01-06 18:04 -0700, James Hilliard spake thusly:
> We need to disable ccache when building host-zstd as the upcoming
> ccache update depends on host-zstd.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/zstd/zstd.mk | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
> index e8f6315222..cb4f4cc611 100644
> --- a/package/zstd/zstd.mk
> +++ b/package/zstd/zstd.mk
> @@ -98,12 +98,16 @@ endef
>  HOST_ZSTD_OPTS += PREFIX=$(HOST_DIR)
>  
>  define HOST_ZSTD_BUILD_CMDS
> -	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) $(HOST_ZSTD_OPTS) \
> +	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) \
> +	CC="$(HOSTCC_NOCCACHE)" CXX="$(HOSTCXX_NOCCACHE)" \
> +	$(MAKE) $(HOST_ZSTD_OPTS) \
>  		-C $(@D) zstd-release lib-release
>  endef
>  
>  define HOST_ZSTD_INSTALL_CMDS
> -	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) $(HOST_ZSTD_OPTS) \
> +	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) \
> +	CC="$(HOSTCC_NOCCACHE)" CXX="$(HOSTCXX_NOCCACHE)" \
> +	$(MAKE) $(HOST_ZSTD_OPTS) \

Rather than duplicating the environment in both _CMDS, I've introduce
HOST_ZSTD_ENV.

Applied to master, thanks.

Regards,
Yann E. MORIN.

>  		-C $(@D) install
>  endef
>  
> -- 
> 2.34.1
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
