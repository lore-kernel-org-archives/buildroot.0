Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C05E5C19F2D
	for <buildroot@archiver.kernel.org>; Sat, 13 Aug 2022 21:43:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 36EB4401A1;
	Sat, 13 Aug 2022 21:43:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 36EB4401A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wXJCq_Ctm32M; Sat, 13 Aug 2022 21:43:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 488D64015E;
	Sat, 13 Aug 2022 21:43:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 488D64015E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4EFBA1BF846
 for <buildroot@lists.busybox.net>; Sat, 13 Aug 2022 21:43:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2870B409C3
 for <buildroot@lists.busybox.net>; Sat, 13 Aug 2022 21:43:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2870B409C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zTbsO6Oz35vw for <buildroot@lists.busybox.net>;
 Sat, 13 Aug 2022 21:43:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62EEA409A9
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 62EEA409A9
 for <buildroot@buildroot.org>; Sat, 13 Aug 2022 21:43:24 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ac43:2f79:1c81:6f7d])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 11CFD60134;
 Sat, 13 Aug 2022 23:43:16 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 13 Aug 2022 23:43:16 +0200
Date: Sat, 13 Aug 2022 23:43:16 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220813214316.GA2830119@scaer>
References: <20220813105152.1403602-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220813105152.1403602-1-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1660427001;
 bh=HLTYzS5hHcNdzuErs5WuwFsKGoQEZqjKT2CXdHcpm9Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=T5HjvejBAZiGAUSLPob/rhjNUXSc3JpNtXBSNB7j9fy3D+ZHpcwFASABzQVpu2ZGv
 YRRrhsu38g/rf1wjXhocFuNNcCc2gcnwV6z6gHdxGR7EU+MK1uU+gip6zXGxmNtWGm
 kDGjY3fpDM7Kc+Wd0fzLmBl1UEW7IZ9fpHzU2C8NY8ajciLRa0+oCqUgWK9lxLMtfM
 Sv7am6ABuODV6m2EHk/VkH7Fbn2KtIt16gxQ7SANJGmVIYc7BwXH2sdOUjLirlGjN1
 4DWjs95yEp2PpXqhZ3gbJFoprocrVYciSS6tdy7X+DodTLWYZfezeMPH2j8mWyupBD
 AIUldDMN+twJQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=T5HjvejB
Subject: Re: [Buildroot] [PATCH] package/binutils: handle gprofng as an
 optional feature
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2022-08-13 12:51 +0200, Thomas Petazzoni via buildroot spake thusly:
> binutils 2.39 added support for gprofng, a new profiler (see
> https://www.phoronix.com/news/GNU-Profiler-gprofng).
> 
> This new profiler is enabled by default, but it requires bison on the
> host.
> 
> In order to handle this, this commit:
> 
>  - Adds a new option BR2_BINUTILS_GPROFNG, which allows to
>    enable/disable gprofng in host-binutils

I was wondering if we should not just unconditionally build it. The
overhead of building host-bison and its dependencies is probably very
low when compared to the rest of the toolchain, especially with TLPB.

But OK, option it is...

> diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
> index a3fece27dc..e4cb19896d 100644
> --- a/package/binutils/binutils.mk
> +++ b/package/binutils/binutils.mk
[--SNIP--]
> @@ -91,6 +92,13 @@ HOST_BINUTILS_CONF_OPTS = \
>  	$(BINUTILS_DISABLE_GDB_CONF_OPTS) \
>  	$(BINUTILS_EXTRA_CONFIG_OPTIONS)
>  
> +ifeq ($(BR2_BINUTILS_GPROFNG),y)
> +HOST_BINUTILS_DEPENDENCIES += host-bison
> +HOST_INBUTILS_CONF_OPTS += --enable-gprofng
> +else
> +HOST_INBUTILS_CONF_OPTS += --disable-gprofng

    $ make check-package
    package/binutils/binutils.mk:97: possible typo: HOST_INBUTILS_CONF_OPTS -> *BINUTILS*
    package/binutils/binutils.mk:99: possible typo: HOST_INBUTILS_CONF_OPTS -> *BINUTILS*

Untested code? ;-)

Applied to next, with the above fixed, thanks.

Regards,
Yann E. MORIN.

> +endif
> +
>  # binutils run configure script of subdirs at make time, so ensure
>  # our TARGET_CONFIGURE_ARGS are taken into consideration for those
>  BINUTILS_MAKE_ENV = $(TARGET_CONFIGURE_ARGS)
> -- 
> 2.37.1
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
