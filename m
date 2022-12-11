Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0303C4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 15:39:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 800E44026A;
	Sun, 11 Dec 2022 15:39:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 800E44026A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7HVyeltqJQWf; Sun, 11 Dec 2022 15:39:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A441640185;
	Sun, 11 Dec 2022 15:39:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A441640185
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2C9241BF3D6
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 15:38:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 08156408C4
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 15:38:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08156408C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I5GZuBaXM8d3 for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 15:38:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F501408A0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8F501408A0
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 15:38:55 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:c8de:37ee:6661:285c])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id D70E513F846;
 Sun, 11 Dec 2022 16:38:46 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 11 Dec 2022 16:38:46 +0100
Date: Sun, 11 Dec 2022 16:38:46 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Heiko Thiery <heiko.thiery@gmail.com>
Message-ID: <20221211153846.GP1044805@scaer>
References: <20221208200339.12108-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221208200339.12108-1-heiko.thiery@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1670773132;
 bh=D9T4nEtbNubnkLS496m5hCL6C4TdgVAdsAFmVcQeuvk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sCh90i3sZhtVF0Bd9kUtVmbNOBr/qmntuZRHwYfZ7HJVAGm2KxbpUiESNnOkhdo2H
 xlcLewcoLlOxnmwnuwUG5EcXIBwVvompRNsfgTrbggv5PWoacaDLZpJohqGhH7Ua0v
 BuNecm8le1R3iTKfjPfV+//q5fiMnWtviM78j4v0X0OtXdWEMSvlbHzCEUrcx63II4
 PvnMOdDJhN/HUtx14aieDqvgYZx2EZpOXbUS+kwpbFy4BPvFZo6BHTfd8/2Jn7/7Mb
 f0Q8X53BCee4ADf9kGyeDCOs/1KbBwtQWz+kI0Z3qvQWf1o5Hhn9xOOnT0a75Z0T5f
 vE1kRLpwZo5JQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=sCh90i3s
Subject: Re: [Buildroot] [PATCH] package/pkg-meson.mk: add 'setup' to meson
 command in config step
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>,
 "Guillaume W . Bres" <guillaume.bressaix@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Heiko, All,

On 2022-12-08 21:03 +0100, Heiko Thiery spake thusly:
> When building/configure meson packages the following warning is displayed:
> WARNING: Running the setup command as meson [options] instead of meson setup [options] is ambiguous and deprecated.
> 
> This warning was introduced in meson release 0.64.0 [1].
> 
> Follow the advise and add the 'setup' argument to the meson command.

The manual is very confusing:

    https://mesonbuild.com/Commands.html#setup

    Deprecated since 0.64.0: This is the default Meson command (invoked
    if there was no COMMAND supplied). However, supplying the command is
    necessary to avoid clashes with future added commands, so "setup"
    should be used explicitly.

On first read, I understand that 'setup' is deprecated since 0.64.0. But
then, re-reading that, it can be understood that what is deprecated, is
to treat it as the default command if none is supplied. Subtle...

Applied to master, after tweaking the commit log to also refere to the
manual, thanks.

Regards,
Yann E. MORIN.

> [1] https://github.com/mesonbuild/meson/commit/3c7ab542c0c4770241eae149b0d4cd8de329aee0
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---
>  package/pkg-meson.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
> index d675f7f733..4aa6e44afa 100644
> --- a/package/pkg-meson.mk
> +++ b/package/pkg-meson.mk
> @@ -149,7 +149,7 @@ define $(2)_CONFIGURE_CMDS
>  	CC_FOR_BUILD="$$(HOSTCC)" \
>  	CXX_FOR_BUILD="$$(HOSTCXX)" \
>  	$$($$(PKG)_CONF_ENV) \
> -	$$(MESON) \
> +	$$(MESON) setup \
>  		--prefix=/usr \
>  		--libdir=lib \
>  		--default-library=$(if $(BR2_STATIC_LIBS),static,shared) \
> @@ -169,7 +169,7 @@ define $(2)_CONFIGURE_CMDS
>  	rm -rf $$($$(PKG)_SRCDIR)/build
>  	mkdir -p $$($$(PKG)_SRCDIR)/build
>  	$$(HOST_CONFIGURE_OPTS) \
> -	$$($$(PKG)_CONF_ENV) $$(MESON) \
> +	$$($$(PKG)_CONF_ENV) $$(MESON) setup \
>  		--prefix=$$(HOST_DIR) \
>  		--libdir=lib \
>  		--sysconfdir=$$(HOST_DIR)/etc \
> -- 
> 2.20.1
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
