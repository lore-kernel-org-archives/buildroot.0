Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 107F5C433EF
	for <buildroot@archiver.kernel.org>; Tue, 19 Jul 2022 15:45:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98B5660B3F;
	Tue, 19 Jul 2022 15:45:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 98B5660B3F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3Enn5MetEeIs; Tue, 19 Jul 2022 15:45:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90F3760B14;
	Tue, 19 Jul 2022 15:45:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 90F3760B14
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F349D1BF4D7
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 15:45:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CC96A4151E
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 15:45:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC96A4151E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5vA5TYyONExH for <buildroot@lists.busybox.net>;
 Tue, 19 Jul 2022 15:45:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 903494148B
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 903494148B
 for <buildroot@buildroot.org>; Tue, 19 Jul 2022 15:45:08 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:5d47:1bcb:9db:ce0f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id A65A513FA38;
 Tue, 19 Jul 2022 17:45:04 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 19 Jul 2022 17:45:04 +0200
Date: Tue, 19 Jul 2022 17:45:04 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Norbert Lange <nolange79@gmail.com>
Message-ID: <20220719154504.GJ2249625@scaer>
References: <20220719131605.337057-1-nolange79@gmail.com>
 <20220719131605.337057-2-nolange79@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220719131605.337057-2-nolange79@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658245506;
 bh=aLagKmmJWZodVr/XE46xqGqdg8yps0hp8+qDYGUiYCA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kpSSbjzdLWAgJraE4x7g5RBjp4yz8467XpAhWojSEbyPM9I9S8RD0wJhF9imCsWE5
 pBY+i43xHVyuAAaBydlNMgf7p/dz4xvz65qQnKZNiEcs4hUwyvP54JwaiTKwPHcRN9
 AmLC9oYHsGH2H0s+4lISZYemysasiYa+1jbYugblfxER5zTRiBf0anYh0rsOBlmcjR
 1I9MoUbRxOA4uGgZaqNmvhfn9z0Pk6PmwrsG8J2rAV3iVDeJOAmhHI9DXwtAX9a4+Q
 ehokI9YT84QBbvzJgnLdH/y94LeLiIN3qnM2mZgjTEREYyH6rJdDTNSSZYy91mTSql
 yT2NRKEu5Tkjw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=kpSSbjzd
Subject: Re: [Buildroot] [PATCH 2/2] package/systemd: allow package to be
 used without init system
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

Norbert, All,

On 2022-07-19 15:16 +0200, Norbert Lange spake thusly:
> Allow systemd to be built as normal package, this for example
> allows building systemd-boot without any init system.

How has the situation with upstream evolved since last time the topic
was raised here:
    https://lore.kernel.org/buildroot/cover.1545814334.git.yann.morin.1998@free.fr/#t
and especially the sub-thread:
    https://lore.kernel.org/buildroot/d38239f86f99924e87dcb6e045b2de3ac0cb435f.1545814334.git.yann.morin.1998@free.fr/

As far as I know (and understand), upstream has decided to tie the build
of systemd-boot (formerly the standalone gummiboot) to the build of the
rest of the systemd suite; they did not accept to make it possible to
only build systemd-boot to use it outside the systemd ecosystem.

From Buildroot's perspective, allowing to build systemd without it being
an init system, and without the possibility to just build systemd-boot,
is asking for troubles down the line.

The triviality of your patch does not make it possible to only just
build systemd-boot; instead, it still builds the whole systemd suite,
which hints that upstream did not make it possible to do separate
builds.

So, unless things have evolved substantially, I am not very fond of
alowing this, and stand by the decision that was made back then (i.e.
abide by upstream decision and tie systemd-boot to the systemd
ecosystem).

Regards,
Yann E. MORIN.

> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> ---
>  package/systemd/Config.in | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/package/systemd/Config.in b/package/systemd/Config.in
> index 9f1a778e59..e0f5dbce0d 100644
> --- a/package/systemd/Config.in
> +++ b/package/systemd/Config.in
> @@ -16,7 +16,6 @@ config BR2_PACKAGE_SYSTEMD_ARCH_SUPPORTS
>  
>  menuconfig BR2_PACKAGE_SYSTEMD
>  	bool "systemd"
> -	depends on BR2_INIT_SYSTEMD
>  	depends on BR2_PACKAGE_SYSTEMD_ARCH_SUPPORTS
>  	depends on BR2_USE_MMU
>  	depends on !BR2_STATIC_LIBS # kmod
> -- 
> 2.35.1
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
