Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1289C433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 15:13:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1CEB8813E2;
	Sat,  8 Jan 2022 15:13:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IrRuhggnsPIi; Sat,  8 Jan 2022 15:13:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 57C698176B;
	Sat,  8 Jan 2022 15:13:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 56FFE1BF5A1
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 15:13:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 454AC8149C
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 15:13:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OflzvAxbQDea for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 15:13:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F3440813EA
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 15:13:26 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 a83-20020a1c9856000000b00344731e044bso4595234wme.1
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 07:13:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=E85qDMNFQUhYTv1ZLnSWjXZiPcwz4opHrQzf18jJ0gE=;
 b=NuHTA7Hp7CFLlFJnX4kW/lM65q1Gt5ZvQlIyLu14SdhdHuqbpI1ReEixRUqnYLza4D
 Fb22GR/4e7/CwoLDJva8X5UzLiqUZ9NHBTri3G/OdI0hQcXK1d2Fq8xdXNf9BmpyfnLr
 eWEKaZCaGmB11Mt+t6EQ+sQMkHpJkwbyTx1bgHhWKOnRB9Ci86V8Dar9Wc9fjrCRdjkI
 FTb8UECoUgkcylrj1mn1p5Q+L1OOWVnmoSORR6Y1tJfv9o3jrY6pN9ycQeVzaUzAfacl
 yfZ2qzK0NGSmgBrN3Y6kkH94HuZlPXPl45d9F6ItDUW/cBWIcaPiaa3mz38OgI7SHQkK
 caxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=E85qDMNFQUhYTv1ZLnSWjXZiPcwz4opHrQzf18jJ0gE=;
 b=pLpZ12Lue+mHDmab1IiHXlNVxBKRgZYmmr6VAVnd9aWcYxmR+YZKsETJiI4Zy1ocP9
 BbhRtWFJvHRy4t5wqJYKaqzdciiYLjLuZceeUHocT6zRmNU+uG2rWswI4ovi50w9qETD
 DKjy7zERjfII4LLujIdbaiD1Enh/A4VRrADyG2OG0wmi66LzFur+lKNNh8dQk5edSrqk
 eMQ9/H4icH2DGSymnLpvRjwTR5Uyr5Stpon+JeT+xf5MfQj0AXZWI6rh04hwxdYayQYN
 +SalAd+RfvBm1VG/8myvzVoiuSmNmWlUnkiwQ8c5z27Zd1D6VIXFGuRH2Fom4ZciwP0a
 LNxw==
X-Gm-Message-State: AOAM530s0WOPcbbP1IZqKIMMOxl0zZ4bgwyASISPdVT8COIDw0sNwlZ3
 mPV+PG16oOvLEEbrLQl76btriQ==
X-Google-Smtp-Source: ABdhPJw+v5AnL377McZ6kVpHKz6ZjM+Jth1Zwy9QKVaZgCipp2CzCUktB/DgNkhG5Rfowyb902L0Xw==
X-Received: by 2002:a1c:1dd0:: with SMTP id d199mr5656300wmd.121.1641654805060; 
 Sat, 08 Jan 2022 07:13:25 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id c7sm2021932wri.21.2022.01.08.07.13.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Jan 2022 07:13:24 -0800 (PST)
Message-ID: <377ced22-7ea9-db41-4e7c-1df864d48308@mind.be>
Date: Sat, 8 Jan 2022 16:13:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20220108092554.989783-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220108092554.989783-1-bernd.kuhls@t-online.de>
Subject: Re: [Buildroot] [PATCH 1/1] package/eudev/: bump version to 3.2.11
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 08/01/2022 10:25, Bernd Kuhls wrote:
> Switch upstream URL to github due to changes in project ownership:
> https://github.com/eudev-project/eudev/commit/06ac38e2b876427dfa2ef47e74b46b99927dfe34
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/eudev/Config.in  | 2 +-
>   package/eudev/eudev.hash | 4 +---
>   package/eudev/eudev.mk   | 4 ++--
>   3 files changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/package/eudev/Config.in b/package/eudev/Config.in
> index 0e5bd0cee9..6e7bbe4648 100644
> --- a/package/eudev/Config.in
> +++ b/package/eudev/Config.in
> @@ -16,7 +16,7 @@ config BR2_PACKAGE_EUDEV
>   	  Upstart, older kernels, various toolchains and anything else
>   	  required by users and various distributions.
>   
> -	  https://wiki.gentoo.org/wiki/Project:Eudev
> +	  https://github.com/eudev-project/eudev
>   
>   if BR2_PACKAGE_EUDEV
>   
> diff --git a/package/eudev/eudev.hash b/package/eudev/eudev.hash
> index fda0481351..fe6c7ef008 100644
> --- a/package/eudev/eudev.hash
> +++ b/package/eudev/eudev.hash
> @@ -1,5 +1,3 @@
> -# From http://dev.gentoo.org/~blueness/eudev/
> -md5  60b135a189523f333cea5f71a3345c8d  eudev-3.2.10.tar.gz
>   # Locally calculated
> -sha256  87bb028d470fd1b85169349b44c55d5b733733dc2d50ddf1196e026725ead034  eudev-3.2.10.tar.gz
> +sha256  19847cafec67897da855fde56f9dc7d92e21c50e450aa79068a7e704ed44558b  eudev-3.2.11.tar.gz
>   sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
> diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
> index 5d18b388c7..705370689d 100644
> --- a/package/eudev/eudev.mk
> +++ b/package/eudev/eudev.mk
> @@ -4,8 +4,8 @@
>   #
>   ################################################################################
>   
> -EUDEV_VERSION = 3.2.10
> -EUDEV_SITE = http://dev.gentoo.org/~blueness/eudev
> +EUDEV_VERSION = 3.2.11
> +EUDEV_SITE = https://github.com/eudev-project/eudev/releases/download/v$(EUDEV_VERSION)
>   EUDEV_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
>   EUDEV_LICENSE_FILES = COPYING
>   EUDEV_INSTALL_STAGING = YES
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
