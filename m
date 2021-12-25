Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4D14C433F5
	for <buildroot@archiver.kernel.org>; Sat, 25 Dec 2021 15:31:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73461812D0;
	Sat, 25 Dec 2021 15:31:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id al-4ZlDHubdK; Sat, 25 Dec 2021 15:31:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D4D71812BF;
	Sat, 25 Dec 2021 15:31:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8C67B1BF32E
 for <buildroot@lists.busybox.net>; Sat, 25 Dec 2021 15:31:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 84B07812B4
 for <buildroot@lists.busybox.net>; Sat, 25 Dec 2021 15:31:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IOr4K534wCrb for <buildroot@lists.busybox.net>;
 Sat, 25 Dec 2021 15:31:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B224D812A1
 for <buildroot@buildroot.org>; Sat, 25 Dec 2021 15:31:33 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:b527:fd15:94c1:e7d4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id DA8A113F87C;
 Sat, 25 Dec 2021 16:31:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1640446291;
 bh=Cdm6jBDTVcS0gcVZGS/xiuItbddmhIa5EVw2vTP0Hb0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rLXJNlZWOkUMWTv+z3SZM7cFdotZvwfDyb4QtW5665qRLGkmsr5qQpEygvxTROBr6
 8whn0uhxB7qukjA1IfmBPUNMQoxX/vst6YmcKMspyMCqxHnJzSkvxLJwCKVC0dJZ4c
 AYoOjELgLDNBN80hs5u8Ct5xxHu6KAQzKbLgPxB/75R5nNTxXlR1l9lirfMEeiilOV
 e1Ha1F1EhcnEHLKzuyq+XjDsH4bPwj8T55Yz7XlZ8CeD5UCI3oU6w4GkMrKUKjj9c/
 t6kulxE8iTcSfKnDE80J55udBLKQ+sLz8e5/RWk2Mo0OMLPJSEQ16aNDncaCpHWp92
 df0ONSH31kmVw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 25 Dec 2021 16:31:24 +0100
Date: Sat, 25 Dec 2021 16:31:24 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Yunhao Tian <t123yh.xyz@gmail.com>
Message-ID: <20211225153124.GS2603@scaer>
References: <20211225050854.1138268-1-t123yh.xyz@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211225050854.1138268-1-t123yh.xyz@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/cage: only enable XWayland if
 wlroots has X11
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
Cc: Adrian Perez de Castro <aperez@igalia.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Yunhao, All,

On 2021-12-25 13:08 +0800, Yunhao Tian spake thusly:
> Cage requires wlroots to be built with X11 enabled
> in order to enable XWayland, otherwise it will fail
> with error:
> 
> "ERROR: Problem encountered: Cannot build Cage with
> XWayland support: wlroots has been built without it"
> 
> Signed-off-by: Yunhao Tian <t123yh.xyz@gmail.com>
> ---
>  package/cage/cage.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/cage/cage.mk b/package/cage/cage.mk
> index a661857a95..6f1046eb2f 100644
> --- a/package/cage/cage.mk
> +++ b/package/cage/cage.mk
> @@ -11,7 +11,7 @@ CAGE_LICENSE_FILES = LICENSE
>  CAGE_DEPENDENCIES = host-pkgconf wlroots
>  CAGE_CONF_OPTS = -Dman-pages=disabled
>  
> -ifeq ($(BR2_PACKAGE_XORG7),y)
> +ifeq ($(BR2_PACKAGE_XORG7)$(BR2_PACKAGE_WLROOTS_X11),yy)

BR2_PACKAGE_WLROOTS_X11 already depends on BR2_PACKAGE_XORG7, so keeping
BR2_PACKAGE_XORG7 in this codition is redundant, so I dropped it.

Applied to master, thanks.

Regards,
Yann E. MORIN.

>  CAGE_CONF_OPTS += -Dxwayland=true
>  else
>  CAGE_CONF_OPTS += -Dxwayland=false
> -- 
> 2.25.1
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
