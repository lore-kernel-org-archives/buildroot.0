Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47067C77B73
	for <buildroot@archiver.kernel.org>; Sun, 21 May 2023 20:27:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9CA9417B8;
	Sun, 21 May 2023 20:27:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9CA9417B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qfPlJU_xTlJV; Sun, 21 May 2023 20:26:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 505714177B;
	Sun, 21 May 2023 20:26:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 505714177B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4EAB71BF3CB
 for <buildroot@lists.busybox.net>; Sun, 21 May 2023 20:26:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2828A82174
 for <buildroot@lists.busybox.net>; Sun, 21 May 2023 20:26:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2828A82174
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qV_DLIJY7v-M for <buildroot@lists.busybox.net>;
 Sun, 21 May 2023 20:26:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 19F2982151
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 19F2982151
 for <buildroot@buildroot.org>; Sun, 21 May 2023 20:26:55 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:a137:d754:ea62:50f7])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id F37945FF95;
 Sun, 21 May 2023 22:26:49 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 21 May 2023 22:26:49 +0200
Date: Sun, 21 May 2023 22:26:49 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20230521202649.GF621937@scaer>
References: <20230521200951.3956187-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230521200951.3956187-1-bernd.kuhls@t-online.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1684700812;
 bh=gFXMs35YtIENn+yFlPA7dRCyQ2ETcWgBHOtbUVA8L7o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EOaGvspBsVi2wUU292wgf5OaHaZfFRsF5UE9jbQMQnafCwLd/in2ESC9I49o8hXVf
 axOJXah5zu89KLUwlg4Fw5QLQ30iX+H/SHc2TuVHCzpWNeBeNwWp9FoU25YRCrfz6n
 xuaZ4jVpsqk4wV8XVl5R2JwSZuyvtMAVug+o9WFysKc79LOYqvkRaEGZhppsVsuUYY
 mv9x3DQ11B8Ukd2aQdUC3wmPPBfX5IonGhqyypWp3hXdjUQn6qgZ1Zulc+7OL/sebb
 6beGnTjpdfKQfqJj2lZM15pnaHZ1/UJVaXnITglPA46KgBf7TSLvAjjnTcTAqgKzOF
 6KJmwTjy/EzAg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=EOaGvspB
Subject: Re: [Buildroot] [PATCH 1/1] package/kodi-pvr-vbox: depends on
 tinyxml2
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

On 2023-05-21 22:09 +0200, Bernd Kuhls spake thusly:
> Upstream added the tinyxml2 dependency in the Nexus bump:
> https://github.com/kodi-pvr/pvr.vbox/commit/99ae08a5fd10771773b9d35c180674c8c8cb3e9d
> 
> Buildroot commit 7f3762ae15793c3a123453434fa8299436db818a forgot to add
> this dependency causing a configure error.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/kodi-pvr-vbox/Config.in        | 1 +
>  package/kodi-pvr-vbox/kodi-pvr-vbox.mk | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/kodi-pvr-vbox/Config.in b/package/kodi-pvr-vbox/Config.in
> index 202e3c66e8..590877e1d7 100644
> --- a/package/kodi-pvr-vbox/Config.in
> +++ b/package/kodi-pvr-vbox/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_KODI_PVR_VBOX
>  	bool "kodi-pvr-vbox"
> +	select BR2_PACKAGE_TINYXML2
>  	help
>  	  Kodi PVR addon for interfacing with VBox Communications XTi TV
>  	  Gateway
> diff --git a/package/kodi-pvr-vbox/kodi-pvr-vbox.mk b/package/kodi-pvr-vbox/kodi-pvr-vbox.mk
> index 60a8a819b0..e5e86274fc 100644
> --- a/package/kodi-pvr-vbox/kodi-pvr-vbox.mk
> +++ b/package/kodi-pvr-vbox/kodi-pvr-vbox.mk
> @@ -8,6 +8,6 @@ KODI_PVR_VBOX_VERSION = 20.4.2-Nexus
>  KODI_PVR_VBOX_SITE = $(call github,kodi-pvr,pvr.vbox,$(KODI_PVR_VBOX_VERSION))
>  KODI_PVR_VBOX_LICENSE = GPL-2.0+
>  KODI_PVR_VBOX_LICENSE_FILES = LICENSE.md
> -KODI_PVR_VBOX_DEPENDENCIES = kodi
> +KODI_PVR_VBOX_DEPENDENCIES = kodi tinyxml2
>  
>  $(eval $(cmake-package))
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
