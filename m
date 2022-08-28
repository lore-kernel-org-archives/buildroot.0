Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CA92ECAAD2
	for <buildroot@archiver.kernel.org>; Sun, 28 Aug 2022 15:15:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C6B5B40B99;
	Sun, 28 Aug 2022 15:15:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C6B5B40B99
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zEN17sAVykaQ; Sun, 28 Aug 2022 15:15:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C3E0640600;
	Sun, 28 Aug 2022 15:15:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C3E0640600
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B325F1BF97C
 for <buildroot@lists.busybox.net>; Sun, 28 Aug 2022 15:15:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8E4B540600
 for <buildroot@lists.busybox.net>; Sun, 28 Aug 2022 15:15:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E4B540600
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KjKKzlQGIdYb for <buildroot@lists.busybox.net>;
 Sun, 28 Aug 2022 15:15:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3CE4240591
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3CE4240591
 for <buildroot@buildroot.org>; Sun, 28 Aug 2022 15:15:24 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:c66a:3d95:4f85:baec])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 57BB2780503;
 Sun, 28 Aug 2022 17:15:12 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 28 Aug 2022 17:15:12 +0200
Date: Sun, 28 Aug 2022 17:15:12 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Chris Dimich <chris.dimich@boundarydevices.com>
Message-ID: <20220828151512.GD2569@scaer>
References: <20220824192604.2549356-8-chris.dimich@boundarydevices.com>
 <20220824192604.2549356-9-chris.dimich@boundarydevices.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220824192604.2549356-9-chris.dimich@boundarydevices.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661699720;
 bh=NZcep9ff9SIBHwSjkrc1f+UO5vxPOgqlz0RwVrYea2w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LNyNWjAYDx1bfWMhNAk/ShBtOB7VDAnkP2OLY1JLMi4ym7L31qwiNWzvsMyrHt9Fb
 wwPBY7WFgsfCnn885bKw2FmzSdGM2nyitwABqp3gNyjr3CKDtU4VsR+w+Uf9u6LoRX
 tebAYiQ9OCvZxoMb5WoGF29SHfnrYyROo8ytA53oQPR3dNyTvrnAgefJq4mwbJIgbj
 flQGWTaN0NkqCidRAxyTDp6p0qQA0hNxZNjd6pSuojN3Xk+dmm0fEbra060PkDDHaA
 VKJpkJochfwEHLLr7L/jlAQEGDg9p41KrWt+7MIN05cL6PV2oRDnpuZZp/ooYZc/XA
 1sOWpb4080Cig==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=LNyNWjAY
Subject: Re: [Buildroot] [PATCH 2/7] package/weston: add
 BR2_PACKAGE_WESTON_DEPRECATED_WL_SHELL config
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
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Chris, All,

On 2022-08-24 12:25 -0700, Chris Dimich spake thusly:
> In the case of the vivante sdk, the deprecated-wl-shell option needs to
> be enabled. Otherwise, apps using the sdk cannot run on weston/wayland.

Note that this option has been entirely removed upstream in e6b8f5a5e40c
(remove wl_shell), commited 2022-03-08, and present in tag 10.0.91,
which means that the next release of weston will no longer have that
option.

I am a bit relunctant at adding this in Buildroot, because that means
the vivante stuff will be broken when we bump weston, or we won't be
able to bump weston.

Besides, your series does not even make use of that new option; i.e.
nothing selects BR2_PACKAGE_WESTON_DEPRECATED_WL_SHELL.

So, I would prefer not to add that option at all, knowing that it will
soon be removed.

Regards,
Yann E. MORIN.

> Signed-off-by: Chris Dimich <chris.dimich@boundarydevices.com>
> ---
>  package/weston/Config.in | 7 +++++++
>  package/weston/weston.mk | 4 ++++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/package/weston/Config.in b/package/weston/Config.in
> index 3b4e932b7d..c560c32b50 100644
> --- a/package/weston/Config.in
> +++ b/package/weston/Config.in
> @@ -164,4 +164,11 @@ comment "demo clients needs an OpenGL ES provider, an OpenEGL-capable Wayland ba
>  		!BR2_USE_WCHAR || !BR2_PACKAGE_HAS_LIBGLES || \
>  		!BR2_PACKAGE_HAS_LIBEGL_WAYLAND || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
>  
> +config BR2_PACKAGE_WESTON_DEPRECATED_WL_SHELL
> +	bool "deprecated wl shell"
> +	help
> +	  In the case of the vivante sdk, the deprecated-wl-shell option
> +	  needs to be enabled. Otherwise, apps using the sdk cannot
> +	  run on weston/wayland.
> +
>  endif
> diff --git a/package/weston/weston.mk b/package/weston/weston.mk
> index e6c54ee7aa..ad4d81425e 100644
> --- a/package/weston/weston.mk
> +++ b/package/weston/weston.mk
> @@ -186,4 +186,8 @@ else
>  WESTON_CONF_OPTS += -Ddemo-clients=false
>  endif
>  
> +ifeq ($(BR2_PACKAGE_WESTON_DEPRECATED_WL_SHELL),y)
> +WESTON_CONF_OPTS += -Ddeprecated-wl-shell=true
> +endif
> +
>  $(eval $(meson-package))
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
