Return-Path: <SRS0=Jxa3=PY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ACF9C433F5
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 21:11:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B360060ED4
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 21:11:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B360060ED4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E84D407A5;
	Fri,  5 Nov 2021 21:11:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T9NJvONuP4Jg; Fri,  5 Nov 2021 21:11:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40725407A0;
	Fri,  5 Nov 2021 21:11:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DD4201BF5B5
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 21:11:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CC63380EB4
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 21:11:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5XuFR70z-NFB for <buildroot@lists.busybox.net>;
 Fri,  5 Nov 2021 21:11:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D3F9380E4C
 for <buildroot@buildroot.org>; Fri,  5 Nov 2021 21:11:51 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9d6e:5497:a761:f603])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 3B7335FF20;
 Fri,  5 Nov 2021 22:11:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1636146710;
 bh=lqPEIWLHO0OqRkizOXS/QK67Sh1dXFL+Uh5l0AeZNyk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rWPTi+2HB/rS7dWqUrp8G0dDIMlWEILBy4arEQW8E8JKlrmo3g2yqArC8YKA2ZAtT
 5E1f4mkqTwRELY2kDZBNCO4/JJ2oVYIkxU9Cj5wk4GRHrhH/Vk8ZQqA5eIHeW7KAkV
 hvYIcA+df7OiI4OEhxOaAVT3CYNY/oQnzv8v1ZDJnCZ1OqEblaF4n+XRyoVWSNe7na
 WU7jMzshdfmAYyDkyfvR8qSSrmWQylIYAAL+Jvaal15qlwRnAzbwPk383gYiZaRd9K
 k8j+2WKYMW+0U6+XD4iJ54VqIldrx53zBFuiIDO/ds0nqVtWPg9t7gtODgK9kwHQH7
 FNsJ0t05r8Fpg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 05 Nov 2021 22:11:43 +0100
Date: Fri, 5 Nov 2021 22:11:43 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20211105211143.GE2400@scaer>
References: <20211025084310.4055707-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211025084310.4055707-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/weston: remove launcher-libseat
 meson option
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2021-10-25 02:43 -0600, James Hilliard spake thusly:
> This option only exists in main and is not in a release.

Indeed. We have weston 9.0.0, released 2020-09-04, but the option was
added much later, in 2021-04-14.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> Fixes:
> output/build/weston-9.0.0/meson.build:1:0: ERROR: Unknown options: "launcher-libseat"
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/weston/weston.mk | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/package/weston/weston.mk b/package/weston/weston.mk
> index 69ee11d23c..6dd5439291 100644
> --- a/package/weston/weston.mk
> +++ b/package/weston/weston.mk
> @@ -26,13 +26,6 @@ else
>  WESTON_CONF_OPTS += -Dsimple-clients=
>  endif
>  
> -ifeq ($(BR2_PACKAGE_SEATD),y)
> -WESTON_CONF_OPTS += -Dlauncher-libseat=true
> -WESTON_DEPENDENCIES += seatd
> -else
> -WESTON_CONF_OPTS += -Dlauncher-libseat=false
> -endif
> -
>  ifeq ($(BR2_PACKAGE_DBUS)$(BR2_PACKAGE_SYSTEMD),yy)
>  WESTON_CONF_OPTS += -Dlauncher-logind=true
>  WESTON_DEPENDENCIES += dbus systemd
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
