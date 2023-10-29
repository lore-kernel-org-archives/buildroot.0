Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA70FC4332F
	for <buildroot@archiver.kernel.org>; Sun, 29 Oct 2023 08:41:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86C0E7040D;
	Sun, 29 Oct 2023 08:41:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 86C0E7040D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Sk0lxniQ8WuE; Sun, 29 Oct 2023 08:41:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ADC2F70456;
	Sun, 29 Oct 2023 08:41:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ADC2F70456
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1D22E1BF8C7
 for <buildroot@lists.busybox.net>; Sun, 29 Oct 2023 08:39:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E821843111
 for <buildroot@lists.busybox.net>; Sun, 29 Oct 2023 08:39:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E821843111
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IV3-xXFy7jfD for <buildroot@lists.busybox.net>;
 Sun, 29 Oct 2023 08:39:43 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9A6FF400A6
 for <buildroot@buildroot.org>; Sun, 29 Oct 2023 08:39:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9A6FF400A6
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:de1f:355b:eff2:ec6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id DC3C9200588;
 Sun, 29 Oct 2023 09:39:39 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 29 Oct 2023 09:39:39 +0100
Date: Sun, 29 Oct 2023 09:39:39 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20231029083939.GI687180@scaer>
References: <20231027180709.47696-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231027180709.47696-1-bernd@kuhls.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1698568782;
 bh=OYbUXQoIHXEVNhuSKZfuvYkOigRoEapENepsjIzHsU4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Mws7rvDrNmS6Nu88gBvSnYhisNnvEeSXDrOdBAumkuRElSefbuu6JSPf5pQVa+kCl
 8OPADalqz8ZTO7WCnARlUMLEFybGjr0y58fH6fUSIjVEXh7KDzRHZiDyPJOWiLOuBi
 D3KSS9Pnifq1AZTE0h7aRMXY+vG5r9s6dso/MpMZ6pWsz2n8WMyJjR/1mWXI9S2L3t
 6ZZu8qV7QMT57vZ3LZ9QKeZAKslDyEywEMlfhjog5g+N89qVPJmstIacz+kd2SLeJF
 8dIuQtFGSgIFkFJYRjcH+kPwBOfsJompETxvxc4uQoYRA6M88X05lyK3OAZaJjxdn0
 zyyPboSc89KGw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Mws7rvDr
Subject: Re: [Buildroot] [PATCH 1/1] package/kodi-pvr-iptvsimple: bump
 version to 20.11.1-Nexus
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

Bernd, All,

On 2023-10-27 20:07 +0200, Bernd Kuhls spake thusly:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash | 2 +-
>  package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash
> index 8f60721163..0895b2e910 100644
> --- a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash
> +++ b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  c2014b11dd928a1d4789279d7f3ce25af8af4047194e8406f9dfd99d16fe2ee2  kodi-pvr-iptvsimple-20.11.0-Nexus.tar.gz
> +sha256  5c8bd2f04b3114311294e1dc064e592f712a62ff283a451bc8c19878f05286bd  kodi-pvr-iptvsimple-20.11.1-Nexus.tar.gz
>  sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
> diff --git a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
> index 1ea3975be5..7314e855d9 100644
> --- a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
> +++ b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -KODI_PVR_IPTVSIMPLE_VERSION = 20.11.0-Nexus
> +KODI_PVR_IPTVSIMPLE_VERSION = 20.11.1-Nexus
>  KODI_PVR_IPTVSIMPLE_SITE = $(call github,kodi-pvr,pvr.iptvsimple,$(KODI_PVR_IPTVSIMPLE_VERSION))
>  KODI_PVR_IPTVSIMPLE_LICENSE = GPL-2.0+
>  KODI_PVR_IPTVSIMPLE_LICENSE_FILES = LICENSE.md
> -- 
> 2.39.2
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
