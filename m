Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECCAAEB64DA
	for <buildroot@archiver.kernel.org>; Sat, 24 Jun 2023 20:41:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5CDD440A8F;
	Sat, 24 Jun 2023 20:41:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5CDD440A8F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xmqB4AkMZt4A; Sat, 24 Jun 2023 20:41:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7D83240A5B;
	Sat, 24 Jun 2023 20:41:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7D83240A5B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 165AB1BF3D8
 for <buildroot@lists.busybox.net>; Sat, 24 Jun 2023 20:41:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E3CFD40A5B
 for <buildroot@lists.busybox.net>; Sat, 24 Jun 2023 20:41:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3CFD40A5B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IzufxXOj3BBL for <buildroot@lists.busybox.net>;
 Sat, 24 Jun 2023 20:41:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7180B40127
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7180B40127
 for <buildroot@buildroot.org>; Sat, 24 Jun 2023 20:41:35 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:36ab:e848:bc86:4439])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 59D27B00563;
 Sat, 24 Jun 2023 22:41:27 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 24 Jun 2023 22:41:27 +0200
Date: Sat, 24 Jun 2023 22:41:27 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20230624204127.GA24952@scaer>
References: <20230622213917.3772910-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230622213917.3772910-1-dario.binacchi@amarulasolutions.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1687639292;
 bh=uUHjan2FGdcfmPsetLS0YuXezI9l/gShQKgORWIcWA0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=L3udDcRjeuUbO9CSi6TDfjae9Y+rp0xqwXXWk791DZ8F4+sM3Qho4DEtzETsf3xlo
 8MtxSeJz/d7/7Y1zbvN+rmg+X6nIjvNrzsaoJRjRwZNhzGTxPpBvi344VKyRQH9aQh
 sRjOTJRHqCsWoVJPy/auBoNmhqMvutqCQO4k1SGKs3KywFlbMVtWbnNfbpUvwINcKJ
 Kz4D48Pi1QXyepWmBEhxR1BbrDwP4EMScdOzqKPArJfcuRHPHu2z4eAvZC6wK/k3Zq
 eT88fNAS1MR9Wc6UiP+g2C0auxtOx6RKeXJzVU8GAhegUKxdik7PqB+cXyuq8gUMky
 OKVJlUXp0Efag==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=L3udDcRj
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/gstreamer1/gst1-plugins-good: add adaptivedemux2
 plugin option
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
Cc: Peter Seiderer <ps.report@gmx.net>, linux-amarula@amarulasolutions.com,
 michael@amarulasolutions.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Dario, All,

On 2023-06-22 23:39 +0200, Dario Binacchi spake thusly:
> Currently there is no explicit way to enable/disable the adaptivedemux2
> plugin. Create a menu entry allowing users to disable or enable the plugin,
> like we have for other features.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> 
> ---
> 
> Changes in v2:
> - Move the option below the 'comment "plugins with external dependencies"'.
> - Add plugin dependencies (i.e. libsoup libxml2) in gst1-plugins-good.mk.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  package/gstreamer1/gst1-plugins-good/Config.in            | 7 +++++++
>  package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk | 7 +++++++
>  2 files changed, 14 insertions(+)
> 
> diff --git a/package/gstreamer1/gst1-plugins-good/Config.in b/package/gstreamer1/gst1-plugins-good/Config.in
> index d7ec16e80014..9d849580c52f 100644
> --- a/package/gstreamer1/gst1-plugins-good/Config.in
> +++ b/package/gstreamer1/gst1-plugins-good/Config.in
> @@ -258,6 +258,13 @@ config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_Y4M
>  
>  comment "plugins with external dependencies"
>  
> +config BR2_PACKAGE_GST1_PLUGINS_GOOD_ADAPTIVEMUX2
> +	bool "Adaptive Streaming 2 support"

Looking arouund, it looks like the other prompts use the plugin name
with an optional description between parenthesis. So I tweaked this
prompt accordingly.

> +	select BR2_PACKAGE_LIBXML2
> +	select BR2_PACKAGE_LIBSOUP
> +	help
> +	  Adaptive Streaming 2 plugin

A help text that jsut repeats the prompt is plain useless, so I dropped
it. (yes, we do have a lot of that in three; it's historical bagage, and
there's no reason to add more...)

Applied to master, thanks.

Regards,
Yann E. MORIN.

>  config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_LAME
>  	bool "lame (*.mp3 audio encoder)"
>  	select BR2_PACKAGE_LAME
> diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
> index bbcd3aecabd1..41f4c727f3a8 100644
> --- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
> +++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
> @@ -58,6 +58,13 @@ GST1_PLUGINS_GOOD_CONF_OPTS += -Dorc=enabled
>  GST1_PLUGINS_GOOD_DEPENDENCIES += orc
>  endif
>  
> +ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_ADAPTIVEMUX2),y)
> +GST1_PLUGINS_GOOD_CONF_OPTS += -Dadaptivedemux2=enabled
> +GST1_PLUGINS_GOOD_DEPENDENCIES += libsoup libxml2
> +else
> +GST1_PLUGINS_GOOD_CONF_OPTS += -Dadaptivedemux2=disabled
> +endif
> +
>  ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_ALPHA),y)
>  GST1_PLUGINS_GOOD_CONF_OPTS += -Dalpha=enabled
>  else
> -- 
> 2.32.0
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
