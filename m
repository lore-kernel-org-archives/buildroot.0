Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39425C433F5
	for <buildroot@archiver.kernel.org>; Mon, 14 Feb 2022 21:17:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D605640178;
	Mon, 14 Feb 2022 21:17:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PXzFIQorqbN8; Mon, 14 Feb 2022 21:17:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BD8E0404DA;
	Mon, 14 Feb 2022 21:17:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 036571BF275
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 21:17:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E5488404DA
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 21:17:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vdqbYeHkIP_A for <buildroot@lists.busybox.net>;
 Mon, 14 Feb 2022 21:17:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A757040178
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 21:17:29 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id vz16so575409ejb.0
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 13:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=tTFgVhiMM5jYa2UyP8AUTMnl6eKrJTo/2AHe0XLUobo=;
 b=bhT/l0ko6P61RE5ZOnvBSZJ8/wXaz+N980G/wTbvb/e4SYDmhJKvbe3oYfi+mJcGsc
 sD6E8q2wjPY420SPst2GXMoW5l7gwvVtcIq+cS8X2H2uIXadNKfzSJAcKTOCPTEGeVKY
 5Xqml7MGTGOUSfzA+fnXgGj8BOCbV4ph0GE4BGktZydKLIUViQrZOHcNhU5mPoGzjD7y
 VUTc2ZXDMYAwZlt54hhwhLFN8xaRrxQXXkkC4F8k4g0p2PLMOXztEHGNZrkxpe2Gm1vw
 eccRlxMVujdu7KTemNqyi41RA2BuQgi7Vc2O2Z4zO0kdz7swHTXgpIVy0m86GVabAWO2
 w6KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=tTFgVhiMM5jYa2UyP8AUTMnl6eKrJTo/2AHe0XLUobo=;
 b=ukrm2QKLohFsI06xWbemRPHMd9J1Whl/qNwNyuUfB7BHfGebGTT/C9AuI7fxYd65IX
 DcWn01UYaBznBLb4KWm5AW2shcA4pYriTTpqkz3Ul/8mWqqgFLPyqvlt0ydEChRXxjKt
 wDPo0/GA0HuliltncEXsNWo85bDaBW4xsSrjMD7tf0FjKchSSol55Xw7guaT+ZmkxNm9
 oKsOqO9hLIRdRPfJmjLr/H44X5wIpBXQ42lH13S2S8U2FyQwmfJR/vPe+bTgd9bavS6C
 2voU7YvEqhMS55lQG8q/n1SDggYIcUnd/4MI6EiKKG0K6KHgjVxjKcc39nRnLCXX5aGx
 2OSA==
X-Gm-Message-State: AOAM532lFitSUR6BbsUuY3rLYiyGLJfIsmwV6/LsOBVo3fFDR0cPLsCS
 vnhtB9b0EOU2MG02CRad433mFg==
X-Google-Smtp-Source: ABdhPJzGeiM9rRiBWFS3isaEk2sSBObzGlVCLGa5TJNkMeAVmahLxTIj9J9EYw3QfQLDEyJuPsdMQw==
X-Received: by 2002:a17:906:6481:: with SMTP id
 e1mr573632ejm.554.1644873447856; 
 Mon, 14 Feb 2022 13:17:27 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id r1sm9945125ejh.52.2022.02.14.13.17.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Feb 2022 13:17:27 -0800 (PST)
Message-ID: <9d793689-0558-b9b7-e109-593e3723d066@mind.be>
Date: Mon, 14 Feb 2022 22:17:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Peter Seiderer <ps.report@gmx.net>, buildroot@buildroot.org
References: <20220208222024.24167-1-ps.report@gmx.net>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220208222024.24167-1-ps.report@gmx.net>
Subject: Re: [Buildroot] [PATCH v1] package/libxkbcommon: bump version to
 1.4.0
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 08/02/2022 23:20, Peter Seiderer wrote:
> - bump version to 1.4.0
> 
> - add new option to select some tools for the target (xkbcli,
>    xkbcli-compile-keymap, xkbcli-how-to-type, xkbcli-interactive-evdev,
>    xkbcli-interactive-x11, xkbcli-interactive-wayland
> 
> For details see [1].
> 
> [1] https://lists.freedesktop.org/archives/wayland-devel/2022-February/042104.html
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libxkbcommon/Config.in         | 11 +++++++++++
>   package/libxkbcommon/libxkbcommon.hash |  4 ++--
>   package/libxkbcommon/libxkbcommon.mk   |  8 +++++++-
>   3 files changed, 20 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libxkbcommon/Config.in b/package/libxkbcommon/Config.in
> index 4e73a24abb..e9f61227a0 100644
> --- a/package/libxkbcommon/Config.in
> +++ b/package/libxkbcommon/Config.in
> @@ -7,3 +7,14 @@ config BR2_PACKAGE_LIBXKBCOMMON
>   	  specification.
>   
>   	  https://xkbcommon.org
> +
> +if BR2_PACKAGE_LIBXKBCOMMON
> +
> +config BR2_PACKAGE_LIBXKBCOMMON_TOOLS
> +	bool "tools"
> +	help
> +	  Tools: xkbcli, xkbcli-compile-keymap, xkbcli-how-to-type,
> +	  xkbcli-interactive-evdev, xkbcli-interactive-x11,
> +	  xkbcli-interactive-wayland
> +
> +endif
> diff --git a/package/libxkbcommon/libxkbcommon.hash b/package/libxkbcommon/libxkbcommon.hash
> index c00fffe706..fff2b7a943 100644
> --- a/package/libxkbcommon/libxkbcommon.hash
> +++ b/package/libxkbcommon/libxkbcommon.hash
> @@ -1,5 +1,5 @@
> -# From https://lists.freedesktop.org/archives/wayland-devel/2021-September/041976.html
> -sha256  b3c710d27a2630054e1e1399c85b7f330ef03359b460f0c1b3b587fd01fe9234  libxkbcommon-1.3.1.tar.xz
> +# From https://lists.freedesktop.org/archives/wayland-devel/2022-February/042104.html
> +sha256  106cec5263f9100a7e79b5f7220f889bc78e7d7ffc55d2b6fdb1efefb8024031  libxkbcommon-1.4.0.tar.xz
>   
>   # License file:
>   sha256  086caee279449369d41c1157911ec7696e707b93feba7280de757d3c470b2dfb  LICENSE
> diff --git a/package/libxkbcommon/libxkbcommon.mk b/package/libxkbcommon/libxkbcommon.mk
> index ee2bc1ee99..f2c49cc700 100644
> --- a/package/libxkbcommon/libxkbcommon.mk
> +++ b/package/libxkbcommon/libxkbcommon.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBXKBCOMMON_VERSION = 1.3.1
> +LIBXKBCOMMON_VERSION = 1.4.0
>   LIBXKBCOMMON_SITE = https://xkbcommon.org/download
>   LIBXKBCOMMON_SOURCE = libxkbcommon-$(LIBXKBCOMMON_VERSION).tar.xz
>   LIBXKBCOMMON_LICENSE = MIT/X11
> @@ -23,4 +23,10 @@ else
>   LIBXKBCOMMON_CONF_OPTS += -Denable-x11=false
>   endif
>   
> +ifeq ($(BR2_PACKAGE_LIBXKBCOMMON_TOOLS),y)
> +LIBXKBCOMMON_CONF_OPTS += -Denable-tools=true
> +else
> +LIBXKBCOMMON_CONF_OPTS += -Denable-tools=false
> +endif
> +
>   $(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
