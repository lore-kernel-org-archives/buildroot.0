Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12A7DC54EED
	for <buildroot@archiver.kernel.org>; Sun, 29 Jan 2023 22:29:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8AB388175F;
	Sun, 29 Jan 2023 22:29:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8AB388175F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NChPgSmDmKhI; Sun, 29 Jan 2023 22:29:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C97D181638;
	Sun, 29 Jan 2023 22:28:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C97D181638
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D7F021BF46D
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 22:28:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BB53E41605
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 22:28:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB53E41605
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CW7AgyhALJN7 for <buildroot@lists.busybox.net>;
 Sun, 29 Jan 2023 22:28:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4DD5B4159C
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4DD5B4159C
 for <buildroot@buildroot.org>; Sun, 29 Jan 2023 22:28:56 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 32F3D5FF88;
 Sun, 29 Jan 2023 23:28:47 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 29 Jan 2023 23:28:46 +0100
Date: Sun, 29 Jan 2023 23:28:46 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230129222846.GB2632@scaer>
References: <20230127141058.2180747-1-james.hilliard1@gmail.com>
 <20230127141058.2180747-6-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230127141058.2180747-6-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1675031333;
 bh=nsOA5PZuWaBUlv6t9wr7DN61BmWGPVrb4GanCtJutns=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qRpdp05rxqalGS1g5mMMW6bbhtX80NRMrM5Q9Zc6p0p9leLFuP3LbfHyS+ohOjnRS
 8Ehhda0zalejCyjFhnN/1SJTX+cn8VyKrAXYYe9Ep7hYCjWDncP06VJW38Iwynds2Q
 w7OYynjRH0sckIcnTI+Mnb59fzgw0jwLAY8SHwFkWYoa03rqwb489iv4+U+97BjAkS
 Cv2PrAgQqVgojr2JzRUadG55vIt8BCBd4KYQMgq3Sfnr/S2CQIUNdlR6P8PfqoTrCP
 T8yExlR4M/kM7lVIFK9ogov+/K6RAqNXq3uKZ4MM7g7FZMoZNt8TpO76sT/JKI1jDK
 VvdsyiR7ChPYQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=qRpdp05r
Subject: Re: [Buildroot] [PATCH v4 06/13] package/fxdiv: new package
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
Cc: Stefan Hager <stefan.hager@ginzinger.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2023-01-27 07:10 -0700, James Hilliard spake thusly:
> This package is required by tensorflow-lite.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks, but see below...

> ---
[--SNIP--]
> diff --git a/DEVELOPERS b/DEVELOPERS
> index a711f9f1ee..b600c2914e 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2703,6 +2703,7 @@ F:	package/ti-gfx/
>  
>  N:	Stefan Hager <stefan.hager@ginzinger.com>
>  F:	package/cpuinfo/
> +F:	package/fxdiv/

I again have moved that to James entry, since the patch is from James
not Stefan (and Stefan does not already have any entry).

Stefan, if you want to also adopt that package and/or neon2sse, then
just send a patch to that effect.

[--SNIP--]
> diff --git a/package/fxdiv/fxdiv.mk b/package/fxdiv/fxdiv.mk
> new file mode 100644
> index 0000000000..56aaf11f88
> --- /dev/null
> +++ b/package/fxdiv/fxdiv.mk
> @@ -0,0 +1,17 @@
> +################################################################################
> +#
> +# fxdiv
> +#
> +################################################################################
> +
> +FXDIV_VERSION = 63058eff77e11aa15bf531df5dd34395ec3017c8
> +FXDIV_SITE = $(call github,Maratyszcza,FXdiv,$(FXDIV_VERSION))
> +FXDIV_LICENSE = MIT
> +FXDIV_LICENSE_FILES = LICENSE
> +FXDIV_INSTALL_STAGING = YES

I added:    # Only installs a header

Applied to master, thanks.

Regards,
Yann E. MORIN.

> +FXDIV_INSTALL_TARGET = NO
> +FXDIV_CONF_OPTS = \
> +	-DFXDIV_BUILD_TESTS=OFF \
> +	-DFXDIV_BUILD_BENCHMARKS=OFF
> +
> +$(eval $(cmake-package))
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
