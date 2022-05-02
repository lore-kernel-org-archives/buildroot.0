Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C9D1C433EF
	for <buildroot@archiver.kernel.org>; Mon,  2 May 2022 21:05:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D90E607A1;
	Mon,  2 May 2022 21:05:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s2t6Fg_NN1xi; Mon,  2 May 2022 21:05:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B26660EB9;
	Mon,  2 May 2022 21:05:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7EFBF1BF2BC
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 21:05:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6D0F5415E2
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 21:05:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dEC91TsKC3fw for <buildroot@lists.busybox.net>;
 Mon,  2 May 2022 21:05:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EA894415E0
 for <buildroot@buildroot.org>; Mon,  2 May 2022 21:05:02 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id g6so30024225ejw.1
 for <buildroot@buildroot.org>; Mon, 02 May 2022 14:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=EPodvwUEPRGqtnKIcQVL1iYiOURCGkVrx71EKhVAxZ4=;
 b=WsH6sT3aZD5uqB9wEaJCqtc0aDbitKozknEcVboMaJRJwAGCM9NYnzHSLaJgayZJFy
 WGStEMdpU0YYSiWrF4wXpTIhsRSBV9yO/jFI5K5tWpYhx8yOxuYyAb3l28K9j5c1QugT
 HNseinXvkQLNEX0VXCVRwMUcIOMnJI+HEQC5Je2QGs56XmOHWuYd5bfHq6eks3BgxtFs
 LPMwcDaGrWkEfbfORK5M4knTm8mDBs9lXqDLWpURi9bS/d8GskkX7Zrn5fQOd7+8uDGl
 O4afGR2QMCsh8dUJORhoz1LqUVxB/tYRaEP5JWLly5QgS4X5VdMh+1GgbH65QThKJpzk
 DWig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=EPodvwUEPRGqtnKIcQVL1iYiOURCGkVrx71EKhVAxZ4=;
 b=RHMo6YUssqVYwQMYo+I3xZOZpW8Hq8A/0ViQKGXu5iJIBPL4XMBOS5KjHCtNo9THBe
 WXByIYkWrtNbRpyrjCK9gagiYN7sqrnK9cq5BFiyADN6hfHPnm+wqxPlMiyy+UAbi2TZ
 Y6LxLs3VMX87XD5jQS5XiyzeyvF1Iq3tUTO5rtbvmEbRAfZ1wDNb6GpLM77WSOvzkaEL
 B0QL0B6SYGOtuHvIEQtWNL9aNhF8KxGWBuPXR1gRUWeSddYOihRiUvT6hRhKYqdQ/G5K
 krgGAJsy6d1d/NPPIxdOesHr8SW+a974JD/O5ZtdJdKM3oNmcCUMtCuiwiT8nJtCJZB0
 W7rg==
X-Gm-Message-State: AOAM533BawofELl+J0dQNfgMVj7ifp4sTMlr5Nnd4AsQvTu7eR34iNxQ
 4pxBbhfw23EVDSovAGFNA2sKkA==
X-Google-Smtp-Source: ABdhPJx79riHI/AX10dEr8I/V+G7ZTs4i58kD8BrqI40bLdf8hS7RSzR3Yru2d/fE7VdNHZesv4lAA==
X-Received: by 2002:a17:907:1c9c:b0:6f4:2918:5672 with SMTP id
 nb28-20020a1709071c9c00b006f429185672mr10138892ejc.439.1651525501178; 
 Mon, 02 May 2022 14:05:01 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 ia17-20020a170907a07100b006f3ef214de6sm3935094ejc.76.2022.05.02.14.05.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 May 2022 14:05:00 -0700 (PDT)
Message-ID: <31b74e77-f90d-7482-68fd-344dbb4da82d@mind.be>
Date: Mon, 2 May 2022 23:04:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: Sen Hastings <sen@phobosdpl.com>, buildroot@buildroot.org
References: <6e9f3387-0127-9da0-59d0-2e4123b6be68@phobosdpl.com>
Organization: Essensium/Mind
In-Reply-To: <6e9f3387-0127-9da0-59d0-2e4123b6be68@phobosdpl.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/systemd: add setting for
 systemd default.target
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: nolange79@gmail.com, yann.morin.1998@free.fr
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Sen,

On 26/04/2022 23:43, Sen Hastings wrote:
> This adds the option to set systemd's default.target in
> the System Configuration subheading if systemd is
> specified as the init system.
> 
> The argument for default.target is specified pre-build
> as opposed to overriding the hardcoded "multi-user.target"
> symlink with post-build scripts or a rootfs overlay
> 
> Signed-off-by: Sen Hastings <sen@phobosdpl.com>
> ---
>   package/systemd/systemd.mk |  2 +-
>   system/Config.in           | 11 +++++++++++
>   2 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index 58a1376b51..2ab5fe47ce 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -571,7 +571,7 @@ SYSTEMD_CONF_OPTS +=
> -Dfallback-hostname=$(SYSTEMD_FALLBACK_HOSTNAME)

  The whitespace in your patch was completely destroyed. I had to apply the 
changes manually. Please try to use git send-email to send patches.

>   endif
>    define SYSTEMD_INSTALL_INIT_HOOK
> -	ln -fs multi-user.target \
> +	ln -fs $(BR2_PACKAGE_SYSTEMD_DEFAULT_TARGET) \

  To make sure it is always properly quoted, I changed this into
"$(call qstrip,$(BR2_PACKAGE_SYSTEMD_DEFAULT_TARGET))"

>   		$(TARGET_DIR)/usr/lib/systemd/system/default.target
>   endef
>   diff --git a/system/Config.in b/system/Config.in
> index a4ffbfa18c..888c24ce81 100644
> --- a/system/Config.in
> +++ b/system/Config.in
> @@ -154,6 +154,17 @@ source "$BR2_BASE_DIR/.br2-external.in.init"
>    endchoice
>   +config BR2_PACKAGE_SYSTEMD_DEFAULT_TARGET
> +	string "The default unit systemd starts at bootup"

  We put the systemd sub-options in package/systemd/Config.in. However, this is 
indeed more a "distro" configuration than a package configuration, so there's 
something to be said to have it here. I kept it here.


  Applied to master, thanks.

  Regards,
  Arnout


> +	default "multi-user.target"
> +	depends on BR2_INIT_SYSTEMD
> +	help
> +	  Specify the name of the unit configuration file to be started
> +	  at bootup by systemd. Should end in ".target".
> +	  ex: multi-user.target
> +
> +	
> https://www.freedesktop.org/software/systemd/man/systemd.special.html#default.target
> +
>   choice
>   	prompt "/dev management" if !BR2_INIT_SYSTEMD
>   	default BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
