Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 759DAC433EF
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 10:48:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1278960BBF;
	Sun, 13 Feb 2022 10:48:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gpuey65ARl00; Sun, 13 Feb 2022 10:48:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C7B960B50;
	Sun, 13 Feb 2022 10:48:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6DD7F1BF2C9
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 10:48:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 69F3881854
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 10:48:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dcPBoExOEpSU for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 10:48:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 84C9A81846
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 10:48:21 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id qk11so11376760ejb.2
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 02:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=jqZmqez6s4c+4B/cLAEUKhBZkzA3q6u4FkX9jUPf0N4=;
 b=VbjtsEn94xVt/AQ600DRunqw2v6RrjsSlcfbMs+dCKHRvrp+Me4MkQsFhgb6zQxD6b
 EabCENiscpGBi1EPUCXk1O9NIfFr9kibKouyAs79rZjCnGfn+WVxk3HVZdcwsQoA7bZN
 jT7NEz1o4I55lM2Kn2amIAHlmYjqipKUP+Xsh/vWvm4qkP04WIeHL2DQZBM6lfgNV/Pr
 kbNfy7cI+iIJMBxhiC0o2gL90tGCHihwkpSIB7xCig3uwnQZjpXYVEC/8YTI8bmSGdEV
 YEh5fq6rqRoojUnlqQoBpvQmqS6Ibihz1SjWxkrBWJJoI31alC02/PiBJj6BUUF1vDsl
 aJsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=jqZmqez6s4c+4B/cLAEUKhBZkzA3q6u4FkX9jUPf0N4=;
 b=2Kdbsh9Wz5wFGpnZvHP51L3lNNqTbnGYn1T2Lh0hM25aLIaDUSnunxl9roJ2crN2lV
 i2reyBKc8krEdxlg/AtQ/qOPFrVN468517QQs/SgLgL8VYUlETKeCEyHhQcLZUdV7J6u
 GFEdWnvgK+Hr1+z86gJ4Pg93c6xA56nxAsMEzbbG76EccUDD8RMulN+vP8kciSYl4o4l
 xXcyHsArdL5pzkq6CFIOoO+hQt5DM4kRRW1FmPMUL8u6STfw2hN6u+dLuVWi3P9zFmbK
 gr4FJKx/TSThl+Q0vQrbSKdt3fgGU5+CYQ/Qk/PCadMo9JzVbrfR+rAnnWvedyrMe8Rr
 MOiw==
X-Gm-Message-State: AOAM533CYiUKJ2fP3rxTVwVAKzqMrUbdRNFj6z8KHLsbhzF8nDS6dOcd
 pGVHUUIyCu6/5bfOw+iTsZTmtw==
X-Google-Smtp-Source: ABdhPJyDw/Z9buwQyBdYSSx3DiDZaU4jFs8rCO2OHMlsZq1N4OvVhYIxJQYKCdcg8XLA7P0Iyiv0fg==
X-Received: by 2002:a17:906:5306:: with SMTP id
 h6mr3294379ejo.481.1644749299839; 
 Sun, 13 Feb 2022 02:48:19 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id r22sm13248201edt.51.2022.02.13.02.48.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Feb 2022 02:48:19 -0800 (PST)
Message-ID: <4f066fcb-2d9a-488c-1e95-d8e24dbb935c@mind.be>
Date: Sun, 13 Feb 2022 11:48:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20220202155821.4038299-1-giulio.benetti@benettiengineering.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220202155821.4038299-1-giulio.benetti@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH]
 configs/microchip_sam9x60ek_mmc_dev_defconfig: expand rootfs size to 120M
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
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 02/02/2022 16:58, Giulio Benetti wrote:
> Default 60M for rootfs are not enough and generate a build failure, so
> let's expand rootfs size to 120M.
> 
> Fixes:
> https://gitlab.com/ymorin/buildroot/-/jobs/2035821088
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   configs/microchip_sam9x60ek_mmc_dev_defconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/configs/microchip_sam9x60ek_mmc_dev_defconfig b/configs/microchip_sam9x60ek_mmc_dev_defconfig
> index da1bd33dd3..00ccd784b5 100644
> --- a/configs/microchip_sam9x60ek_mmc_dev_defconfig
> +++ b/configs/microchip_sam9x60ek_mmc_dev_defconfig
> @@ -7,6 +7,7 @@ BR2_TARGET_GENERIC_HOSTNAME="sam9x60ek"
>   BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
>   BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
>   BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/microchip/sam9x60ek_mmc/genimage.cfg"
> +BR2_TARGET_ROOTFS_EXT2_SIZE=120M
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
>   BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4microchip,linux,linux4microchip-2021.10)/linux-linux4microchip-2021.10.tar.gz"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
