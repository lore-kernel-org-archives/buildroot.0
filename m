Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0658FC004D4
	for <buildroot@archiver.kernel.org>; Sat, 21 Jan 2023 13:13:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 385E44146F;
	Sat, 21 Jan 2023 13:13:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 385E44146F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fM76Whor2PKR; Sat, 21 Jan 2023 13:13:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C014414C4;
	Sat, 21 Jan 2023 13:13:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C014414C4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 798811BF40B
 for <buildroot@lists.busybox.net>; Sat, 21 Jan 2023 13:13:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 62B3960773
 for <buildroot@lists.busybox.net>; Sat, 21 Jan 2023 13:13:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62B3960773
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LLlhZBSf-uMd for <buildroot@lists.busybox.net>;
 Sat, 21 Jan 2023 13:13:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B7FC607C7
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9B7FC607C7
 for <buildroot@buildroot.org>; Sat, 21 Jan 2023 13:13:44 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id C6CDD5FFA6;
 Sat, 21 Jan 2023 14:13:37 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 21 Jan 2023 14:13:37 +0100
Date: Sat, 21 Jan 2023 14:13:37 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Lang Daniel <d.lang@abatec.at>
Message-ID: <20230121131337.GB558596@scaer>
References: <VI1P190MB049394F865BD2222D7D40CAB9FC49@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <VI1P190MB049394F865BD2222D7D40CAB9FC49@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1674306821;
 bh=rjjX97kGoTgW5hxkpmZe0TgB5HKHtmO3ySR6AD35NQo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=U6G0V14Yk+PCD+bpnNXtKre03dvcAAi/LcqhEL8UMcj8WOIEfv7ZNRp4mtKSLYUdJ
 D/x+gSwY2BTZx9mxbLmCpCyw/NZqXwlIbtk3vo7iaty0WpfOQ+s4uaEUNI3VbUeAWJ
 Nh37OjT0v6wGVVSVc8FaCILwxldHSiu5DfgKGhpFLc+I+eFSDgv+Vn1DttggM8AGeq
 5XJ3+EUJg4nGmRzI7CD1n4MQiawb7wYBbckTl6GjH4Ot49RwIDvBetxBMiQCy2/9A9
 Y4Ar0mvwrRS6o8zAlkbJDQSsS7kPCOHTDnKJ49V7G/OhAgPSDRnHiAUYLpthPEUG+S
 mLqyc/4qAgrTw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=U6G0V14Y
Subject: Re: [Buildroot] [PATCH 01/45] package/adwaita-icon-theme: switch to
 https download
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
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Daniel, All,

On 2023-01-19 09:48 +0000, Lang Daniel via buildroot spake thusly:
> Signed-off-by: Daniel Lang <d.lang@abatec.at>

All 45 patches applied to master, thanks.

However, for 5 of them, I had to fix a surprising non-break space that
sneaked in somehow: atkmm, glibmm, gsettings-desktop-schemas, gupnp, and
libsecret. Can you have a look on your side if you can find some obvious
reason?

Regards,
Yann E. MORIN.

> ---
>  package/adwaita-icon-theme/adwaita-icon-theme.hash | 2 +-
>  package/adwaita-icon-theme/adwaita-icon-theme.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/adwaita-icon-theme/adwaita-icon-theme.hash b/package/adwaita-icon-theme/adwaita-icon-theme.hash
> index ce6acb8d9a..ae28a7a152 100644
> --- a/package/adwaita-icon-theme/adwaita-icon-theme.hash
> +++ b/package/adwaita-icon-theme/adwaita-icon-theme.hash
> @@ -1,4 +1,4 @@
> -# From http://ftp.gnome.org/pub/gnome/sources/adwaita-icon-theme/3.22/adwaita-icon-theme-3.22.0.sha256sum
> +# From https://download.gnome.org/sources/adwaita-icon-theme/3.27/adwaita-icon-theme-3.27.2.sha256sum
>  sha256  a594e7440971f860cc61b1b8291be15ffc1b8dd06a9f11485a5a7faf189bcf6b  adwaita-icon-theme-3.37.2.tar.xz
>  # locally computed
>  sha256  51f83b2b4e9ed2beebc9b8eed2ecad29314a58ed8c5184b22ad8f9df703d3ce5  COPYING
> diff --git a/package/adwaita-icon-theme/adwaita-icon-theme.mk b/package/adwaita-icon-theme/adwaita-icon-theme.mk
> index 3950cfa636..6b71c41d52 100644
> --- a/package/adwaita-icon-theme/adwaita-icon-theme.mk
> +++ b/package/adwaita-icon-theme/adwaita-icon-theme.mk
> @@ -6,7 +6,7 @@
>  
>  ADWAITA_ICON_THEME_VERSION_MAJOR = 3.37
>  ADWAITA_ICON_THEME_VERSION = $(ADWAITA_ICON_THEME_VERSION_MAJOR).2
> -ADWAITA_ICON_THEME_SITE = http://ftp.gnome.org/pub/gnome/sources/adwaita-icon-theme/$(ADWAITA_ICON_THEME_VERSION_MAJOR)
> +ADWAITA_ICON_THEME_SITE = https://download.gnome.org/sources/adwaita-icon-theme/$(ADWAITA_ICON_THEME_VERSION_MAJOR)
>  ADWAITA_ICON_THEME_SOURCE = adwaita-icon-theme-$(ADWAITA_ICON_THEME_VERSION).tar.xz
>  ADWAITA_ICON_THEME_INSTALL_STAGING = YES
>  ADWAITA_ICON_THEME_LICENSE = LGPL-3.0 or CC-BY-SA-3.0
> -- 
> 2.25.1
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
