Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC618C5479D
	for <buildroot@archiver.kernel.org>; Wed, 11 Jan 2023 18:15:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4827341950;
	Wed, 11 Jan 2023 18:15:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4827341950
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hCN7L0b9a77x; Wed, 11 Jan 2023 18:15:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F1054197C;
	Wed, 11 Jan 2023 18:15:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F1054197C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1AA5B1BF331
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 18:15:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E904860AE7
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 18:15:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E904860AE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tmmty_C2Emzb for <buildroot@lists.busybox.net>;
 Wed, 11 Jan 2023 18:15:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 98CDA606F9
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 98CDA606F9
 for <buildroot@buildroot.org>; Wed, 11 Jan 2023 18:15:42 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 5773F5FFA9;
 Wed, 11 Jan 2023 19:15:35 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 11 Jan 2023 19:15:35 +0100
Date: Wed, 11 Jan 2023 19:15:35 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230111181535.GR151997@scaer>
References: <20220728014402.142320-1-james.hilliard1@gmail.com>
 <20220728014402.142320-2-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220728014402.142320-2-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1673460939;
 bh=I+U3guyUnkGTQC1WH9WuQ6LYPMVEOV8nx4wyzTDbxlw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=buu0MIgv/RyLzGN21nJ4hMywuQ1JRJqWECtfzkaMZQKzTR/Z2pVAWhDESwzYRgFvo
 eFfSoyC+lBQJz8GUejXar8YWTHmc2ha8GIx2bZ74LvLAjQkK2QSYR5uoCogqcGJ39d
 LeOZo4oGeeRPMYLgnoWchxcPuCWjh7vgfHLiDgoURRFPvquDKzmU9DIfOPxXEJi33j
 qbNGErqexq2dym/H8EnTTnLmsgk1asgHXAAGDgoPOcL4SjGdDKtI4jtlhIv/Xj7D5B
 B/DO0nu57bzCT2D8CWl52g96KhcIvLC8tBWJL7dj/HE2+Q1MY5Ddb6V1/T9YqdwKMl
 3tf/qL5uK+COw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=buu0MIgv
Subject: Re: [Buildroot] [PATCH 2/2] package/pkg-meson: generate relocatable
 pkgconfigs
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
 Samuel Martin <s.martin49@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2022-07-27 19:44 -0600, James Hilliard spake thusly:
> This format prevents pkgconfig path issues when using meson's
> built-in install functionality.

"pkgconfig path issues" is vague: this is not helping understand why
this change is needed.

Please explain what is currently broken, and how that patch fixes the
issue. If there were a pointer to one or a few autobuild issues, that
would also help, and would answers Romain's question: what package(s)
is(are) impacted?

If I look at the pointer Romain provided, it states:

    https://mesonbuild.com/Pkgconfig-module.html#relocatable-pkgconfig-files

    By default, the files generated by pkg.generate contain a hardcoded
    prefix path.

Sure, I can see how that could be an issue. However, we already have two
ways to fix that:

  - for per-package directory, we have a generic fixup that replaces the
    PPD base with the one for the current package, see:
      - package/pkg-generic.mk lines 95-onward and 109-onward.
      - b06294e9897e core/pkg-generic: fixup all PPD paths in a generic fashion

  - for the SDK, we have a similar fixup, see:
      - Makefile lines 597-onward
      - support/misc/relocate-sdk.sh

So, if those fixups are not enough, can you describe what they are
missing, so that we can extend them?

This does not mean we can't apply this change (I even think it would be
OK), but we really need to understand why we need it.

Regards,
Yann E. MORIN.

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/pkg-meson.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
> index 156b005fdd..1830c7b10c 100644
> --- a/package/pkg-meson.mk
> +++ b/package/pkg-meson.mk
> @@ -134,6 +134,7 @@ define $(2)_CONFIGURE_CMDS
>  	CXX_FOR_BUILD="$$(HOSTCXX)" \
>  	$$($$(PKG)_CONF_ENV) \
>  	$$(MESON) \
> +		--pkgconfig.relocatable \
>  		--prefix=/usr \
>  		--libdir=lib \
>  		--default-library=$(if $(BR2_STATIC_LIBS),static,shared) \
> @@ -154,6 +155,7 @@ define $(2)_CONFIGURE_CMDS
>  	mkdir -p $$($$(PKG)_SRCDIR)/build
>  	$$(HOST_CONFIGURE_OPTS) \
>  	$$($$(PKG)_CONF_ENV) $$(MESON) \
> +		--pkgconfig.relocatable \
>  		--prefix=$$(HOST_DIR) \
>  		--libdir=lib \
>  		--sysconfdir=$$(HOST_DIR)/etc \
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
