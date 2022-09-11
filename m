Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25C13C6FA83
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 19:18:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9C63D4026F;
	Sun, 11 Sep 2022 19:17:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C63D4026F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j-ZsJ_-1Tlw3; Sun, 11 Sep 2022 19:17:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C530B4041C;
	Sun, 11 Sep 2022 19:17:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C530B4041C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 850501BF591
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 19:17:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 609E683F39
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 19:17:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 609E683F39
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kAoNe15OliKT for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 19:17:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5608283F2D
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5608283F2D
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 19:17:53 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:41d6:744a:8631:c709])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 5675E13F85F;
 Sun, 11 Sep 2022 21:17:42 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 11 Sep 2022 21:17:42 +0200
Date: Sun, 11 Sep 2022 21:17:42 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20220911191742.GG898622@scaer>
References: <20220909221559.1417171-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220909221559.1417171-1-giulio.benetti@benettiengineering.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1662923864;
 bh=x5jZcFqbtcA/IYMRFl+2XfHhchpYzOPSK+8fTFWWhrk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=T2tAQ9gndfqi50TeyxbxpTE1hAgqvwhqw6apsTRbBOzfhl5bg6eC31m3yT1TgRV+H
 L2h5bit/6q+Gtob71RvBP6RwskKodqfKhq1KZxqQlyN+TZJO9LZVDELmUG7mqMh69w
 U9xPdHlJGiD6XCbuCWECLx2LOJc6oWzQWfEe/ZXQLaI9DjM7KLawyooU8ObavCLUdi
 Y3FV+BhDFYm802iwtP2jB6guEhZKALgbTekdMie3BFhmG1vYeweCFQucIj4LJa2qcd
 GlbKXgaBDFrJND1Z06e1rnBmLIlDAjWPu62BcdpFIbOyxjSfajEQvlSg71G2k9s6P1
 DXZ+smTmnk2+w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=T2tAQ9gn
Subject: Re: [Buildroot] [PATCH] package/sox: work around gcc bug 68485
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

Giulio, All,

On 2022-09-10 00:15 +0200, Giulio Benetti spake thusly:
> With Microblaze Gcc version <= 12.x the build fails due to gcc bug 68485:
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68485. The bug show up when
> building sox with optimization but not when building with -O0. To work
> around this, if BR2_TOOLCHAIN_HAS_GCC_BUG_68458=y, we force using -O0.

Given your feedback on my review, I have amended the commit log into a
form that looks (at least to me) more appropriate. Please review it and
yell if I made a mistake.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> Fixes:
> http://autobuild.buildroot.net/results/ac4/ac4fbd55529ac7b4e635a11766f842cd25a833a1/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/sox/sox.mk | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/package/sox/sox.mk b/package/sox/sox.mk
> index 1896437ad4..d0329bf50d 100644
> --- a/package/sox/sox.mk
> +++ b/package/sox/sox.mk
> @@ -26,6 +26,14 @@ SOX_CONF_OPTS = \
>  	--with-distro="Buildroot" \
>  	--disable-stack-protector
>  
> +SOX_CFLAGS = $(TARGET_CFLAGS)
> +
> +ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_68485),y)
> +SOX_CFLAGS += -O0
> +endif
> +
> +SOX_CONF_ENV += CFLAGS="$(SOX_CFLAGS)"
> +
>  ifeq ($(BR2_PACKAGE_ALSA_LIB_PCM),y)
>  SOX_DEPENDENCIES += alsa-lib
>  SOX_CONF_OPTS += --enable-alsa
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
