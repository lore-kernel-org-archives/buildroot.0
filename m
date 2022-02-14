Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5326C433F5
	for <buildroot@archiver.kernel.org>; Mon, 14 Feb 2022 20:57:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 94E6B40131;
	Mon, 14 Feb 2022 20:57:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4y0X17iriLHC; Mon, 14 Feb 2022 20:56:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9C0DB4016F;
	Mon, 14 Feb 2022 20:56:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 957B41BF348
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 20:56:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8265B8151E
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 20:56:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ca9Z96bjhmhm for <buildroot@lists.busybox.net>;
 Mon, 14 Feb 2022 20:56:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 639A68144A
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 20:56:56 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 l67-20020a1c2546000000b00353951c3f62so199713wml.5
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 12:56:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=4Dp51VeMreYPIW0ACTTVj2vJ0F+UUP8hbws/xYZTZ/Y=;
 b=igYSmUzteId/PL3Xpac4XsaN6JEbHoo/OWMAT28Spv4H/lR7Q1OEMLZyLmKFyReNhk
 O6licbN5SLHCetmWnPXzAyip22r1uks/rHICO2z7bTE+cageUnH6HQohwx5gRag5ysSI
 5/H+AkJ1SSVckEhMxkr6qy6LwSFU5fAEcMQ6/ayclsVE/8o23PvOojON24w9MsE8hpVv
 zCXibgiV18iAuh1JYK+qmMXKp7P5Wlw73rY1R+XYj+UvqBbhAlf+A2s5e3NfQG9iNuUq
 lfv8gl3sPNyer1M1VySiwaQ8/gKf0gvPYK08L8UkcbvODoqbdTsx9y1iJWshJvQSYbwH
 zr4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=4Dp51VeMreYPIW0ACTTVj2vJ0F+UUP8hbws/xYZTZ/Y=;
 b=WSyhX6eufjnjOjX0ag1rnYorz6CcdE6V6zn6G7pOpgBZ2G6nVpHA5QuyfTzutHwMKx
 kUNeVyxgpy9IJw8M3IU/taXR5xzjbAf+t5YQrc7goL6FVERdey1nFJOoZRWZ/4SRuR2L
 of06KGqNqRce+t6EezJe4RawUAlXx2Gn0Apk/BfhBcI2qIkOLdUMa7S8KTMh+PsWiSH0
 DdAZACWCY4EaeEf3tMPyPOSStKyRUW3I//V3Z7mv5d9JYvKLNJ33pDH45CpnPnVTQuG+
 kjM4zeH9A9jOkBMLboN40RPZ5+SH0vUJf1orN3yU5KQTv6b/SsANGvD6wNYgfCQGNfsL
 +m8g==
X-Gm-Message-State: AOAM530SDA0EJGhWOQA2dpFFcMDPJhr6ktCfBvl4LlqgpwQFecDUVrSj
 po1/K3gGkNNO01dU1eR37RXqyw==
X-Google-Smtp-Source: ABdhPJzAiR490Fr9SYqhDvGc9TVLkzo2JEMbg/UyvyRI+ma/xme8DfIa+A/xCd2fjRtkkvF1xGkTEg==
X-Received: by 2002:a7b:cf18:: with SMTP id l24mr464625wmg.35.1644872214424;
 Mon, 14 Feb 2022 12:56:54 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id u15sm34635369wrs.18.2022.02.14.12.56.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Feb 2022 12:56:53 -0800 (PST)
Message-ID: <b28d9200-dc7a-d0e0-9468-c4c60726f1f9@mind.be>
Date: Mon, 14 Feb 2022 21:56:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20220202171035.1740791-1-giulio.benetti@benettiengineering.com>
 <20220202171035.1740791-2-giulio.benetti@benettiengineering.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220202171035.1740791-2-giulio.benetti@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH] configs/roc_pc_rk3399_defconfig: expand
 rootfs size to 120M
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
Cc: Danilo Bargen <mail@dbrgn.ch>, Suniel Mahesh <sunil@amarulasolutions.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 02/02/2022 18:10, Giulio Benetti wrote:
> Default 60M for rootfs are not enough and generate a build failure, so
> let's expand rootfs size to 120M.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   configs/roc_pc_rk3399_defconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/configs/roc_pc_rk3399_defconfig b/configs/roc_pc_rk3399_defconfig
> index dfbc5e4f47..ae7cf19a80 100644
> --- a/configs/roc_pc_rk3399_defconfig
> +++ b/configs/roc_pc_rk3399_defconfig
> @@ -45,7 +45,7 @@ BR2_TARGET_GENERIC_HOSTNAME="roc-rk3399-pc"
>   BR2_TARGET_GENERIC_ISSUE="Welcome to ROC-RK3399-PC!"
>   BR2_TARGET_ROOTFS_EXT2=y
>   BR2_TARGET_ROOTFS_EXT2_4=y
> -BR2_TARGET_ROOTFS_EXT2_SIZE="64M"
> +BR2_TARGET_ROOTFS_EXT2_SIZE="120M"

  Even though I proposed to move the default to 120M, that's for next anyway, 
and this defconfig should be fixed on master, so applied to master, thanks.

  Regards,
  Arnout

>   BR2_PACKAGE_HOST_DOSFSTOOLS=y
>   BR2_PACKAGE_HOST_GENIMAGE=y
>   BR2_PACKAGE_HOST_MTOOLS=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
