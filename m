Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D01AC43334
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 12:51:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC80683FC2;
	Mon,  6 Jun 2022 12:51:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fni2xPHKI6Rg; Mon,  6 Jun 2022 12:51:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C108483FA3;
	Mon,  6 Jun 2022 12:51:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5A1071BF339
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 12:51:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4937C83FA3
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 12:51:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CBKrKDj0X6jL for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 12:51:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EC3E482B3E
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 12:51:03 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id v19so18672885edd.4
 for <buildroot@buildroot.org>; Mon, 06 Jun 2022 05:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=WgUfCTN46W/bNSbP89QinGiB1bcz6Rb04mcKzoJ5ftU=;
 b=I9ZP6pVi5MNE+jSpcHks3W7Wovcl/L3NB+EWaAI2xS9I7wsWCrUDu1VaI9/fYCMoCn
 hknWPeT7329SIJsTVrYxy6Z4fuOppYhQlwcDzmzv2eD39Zs90t8k/eCZfQRgZzuX+7+r
 PgmfNZnFk+0YYgRC92nAtGSL2a97lGub/jl6n6yLoIFuYrMGlBOX8T7JXjEuWkuGAoTZ
 4C8Fxeo9Ahv1dxFQVTJSY+VL7y0RU/+DGtsCsNh89dWTA+Hi5AVnSrn0my2SbFk3N662
 Lx26LPbOX9QagKmXZep0sgMZ53mbwHXqP1M8uJNeGIlScn2sOW1d1Cv+FSO303871ZTh
 daJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=WgUfCTN46W/bNSbP89QinGiB1bcz6Rb04mcKzoJ5ftU=;
 b=Yy7Dh6B8frWwFNpNwumoXj3m5Pu2sPSu1SE+SPP6ADifMg1z/8QaMkCKn9RMgyA7XL
 Zz8BgnAve/QXvtueMOuS20EQBPUEhwv+wSJv4eDusZiX3RIwn4aURr2h+YR/5R4NHTEt
 tzsDdvqD14wvdnJaTotuQNlx8Iv9nvlXIQ2U/DtUS9/xKaI2uxdYEK7xnHqeu+MRS0qP
 vr7wCi1IRluQQEsxxD9iaO53jG0pJ4j1N2RWc8j5njNvKcsrz99OEBfDzZraC2HaNtd0
 36FrfQbrdpkIHO45O54n6MQm6pCUQVWUk8iSKEbUdi+Oj9zrjsrKHFi4rCBJbyT9hiIk
 niZg==
X-Gm-Message-State: AOAM531of438fmT5y/H2d8krzWGnC+Mc75k0iRiMnR8UjnlRrTjX6nhn
 duO5BpEZoTDX1L5DQiD+xyi6TQ==
X-Google-Smtp-Source: ABdhPJzTK7KucWzd5tkJOZ7IslaiY/xk0y/kyWu0ADvSO6zkxzLJKW2Z0QnyjchGYvp5FUGavoiubg==
X-Received: by 2002:a05:6402:3899:b0:42d:d79e:acef with SMTP id
 fd25-20020a056402389900b0042dd79eacefmr26621686edb.12.1654519862015; 
 Mon, 06 Jun 2022 05:51:02 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 o13-20020a17090608cd00b006fedcb78854sm6288525eje.164.2022.06.06.05.51.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jun 2022 05:51:01 -0700 (PDT)
Message-ID: <92da4b94-b41c-c9c0-1ad1-394417374f3a@mind.be>
Date: Mon, 6 Jun 2022 14:50:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
To: Roger Knecht <rknecht@pm.me>, buildroot@buildroot.org
References: <20220604124523.22056-1-rknecht@pm.me>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220604124523.22056-1-rknecht@pm.me>
Subject: Re: [Buildroot] [PATCH v2] configs/docker_*: add build config for
 docker images
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Roger,

On 04/06/2022 14:45, Roger Knecht via buildroot wrote:
> Buildroot is not only great to build embedded systems but also to
> create minimal docker images. Adding a default configuration for
> docker images makes it easier to use.

  Thank you for your contribution. However, I feel it adds little to no value. 
The docker configurations are absolutely trivial, and they also don't add any 
testing surface. This compared to other boards, which find a combination of 
bootloader, kernel and image generation options that actually work, and which 
actually does add to the testing surface since the build of the kernel or 
bootloader sometimes breaks with newer toolchains or host OSes.

  I've discussed with other maintainers, and they share this opinion.

  Therefore, I marked the patch as Changes Requested in patchwork.


> 
> How to build a Docker image with Buildroot:
> $ make docker_x86_64_defconfig
> $ make
> 
> Create a Docker image from Buildroot rootfs:
> $ docker image import output/images/rootfs.tar buildroot-image:latest
> 
> Run Docker container:
> $ docker run --rm -it buildroot-image:latest /bin/sh

  This part should be in a README file (board/docker/readme.txt).

  Regards,
  Arnout

> 
> Signed-off-by: Roger Knecht <rknecht@pm.me>
> ---
> v2:
>   - Added Docker defconfig for ARM(64)
> 
>   DEVELOPERS                       | 3 +++
>   configs/docker_aarch64_defconfig | 8 ++++++++
>   configs/docker_arm_defconfig     | 8 ++++++++
>   configs/docker_x86_64_defconfig  | 8 ++++++++
>   configs/docker_x86_defconfig     | 9 +++++++++
>   5 files changed, 36 insertions(+)
>   create mode 100644 configs/docker_aarch64_defconfig
>   create mode 100644 configs/docker_arm_defconfig
>   create mode 100644 configs/docker_x86_64_defconfig
>   create mode 100644 configs/docker_x86_defconfig
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index c33959fa45..ed46867afa 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2474,6 +2474,9 @@ F:	package/chocolate-doom/
>   F:	package/irssi/
>   F:	package/vnstat/
> 
> +N:	Roger Knecht <rknecht@pm.me>
> +F:	configs/docker_*
> +
>   N:	Romain Naour <romain.naour@gmail.com>
>   F:	board/qemu/
>   F:	configs/qemu_*
> diff --git a/configs/docker_aarch64_defconfig b/configs/docker_aarch64_defconfig
> new file mode 100644
> index 0000000000..33577190c5
> --- /dev/null
> +++ b/configs/docker_aarch64_defconfig
> @@ -0,0 +1,8 @@
> +# Architecture
> +BR2_aarch64=y
> +
> +# Filesystem
> +BR2_TARGET_ROOTFS_TAR=y
> +
> +# Init
> +BR2_INIT_NONE=y
> diff --git a/configs/docker_arm_defconfig b/configs/docker_arm_defconfig
> new file mode 100644
> index 0000000000..e17892fdf4
> --- /dev/null
> +++ b/configs/docker_arm_defconfig
> @@ -0,0 +1,8 @@
> +# Architecture
> +BR2_arm=y
> +
> +# Filesystem
> +BR2_TARGET_ROOTFS_TAR=y
> +
> +# Init
> +BR2_INIT_NONE=y
> diff --git a/configs/docker_x86_64_defconfig b/configs/docker_x86_64_defconfig
> new file mode 100644
> index 0000000000..e571e8162a
> --- /dev/null
> +++ b/configs/docker_x86_64_defconfig
> @@ -0,0 +1,8 @@
> +# Architecture
> +BR2_x86_64=y
> +
> +# Filesystem
> +BR2_TARGET_ROOTFS_TAR=y
> +
> +# Init
> +BR2_INIT_NONE=y
> diff --git a/configs/docker_x86_defconfig b/configs/docker_x86_defconfig
> new file mode 100644
> index 0000000000..33bb25a309
> --- /dev/null
> +++ b/configs/docker_x86_defconfig
> @@ -0,0 +1,9 @@
> +# Architecture
> +BR2_i386=y
> +BR2_x86_i686=y
> +
> +# Filesystem
> +BR2_TARGET_ROOTFS_TAR=y
> +
> +# Init
> +BR2_INIT_NONE=y
> --
> 2.17.1
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
