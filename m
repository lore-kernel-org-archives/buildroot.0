Return-Path: <SRS0=/l1z=NI=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3D70C4320E
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 21:19:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B06B16102A
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 21:19:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B06B16102A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73D3E80CD8;
	Tue, 17 Aug 2021 21:19:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CxAIEzNhpo_w; Tue, 17 Aug 2021 21:19:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA3D480CE3;
	Tue, 17 Aug 2021 21:19:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 42E4B1BF396
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 21:19:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3EFD360666
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 21:19:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6hP1zAETKEIC for <buildroot@lists.busybox.net>;
 Tue, 17 Aug 2021 21:19:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0F6F2605E9
 for <buildroot@buildroot.org>; Tue, 17 Aug 2021 21:19:47 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id b15so326888ejg.10
 for <buildroot@buildroot.org>; Tue, 17 Aug 2021 14:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=T8BiDyGzhvdM+OKXiWeAGkO5XiTGen5jfSFZwjWs3Sk=;
 b=PdOx+oj00R9hzlrxrPRQHUG/8jOdYxVfVcrKUbNwVgNIvzSOg4YvULZHEgetwuw6fj
 IizmHPT9YHje27RnAXnItcQmOAYHWqL8x1mvsRvHmC8WWEpTpYib0jWUL1fiK8+FgFKc
 WMgOGcHvP/UIbwFyB28r6KjGIhjskraet7+VX2BAydPyPleAWnqukcTOxP+K7eGwynga
 fMvVxtNjAezFoJ5wF5tkN1RQ8YQxbo1j58Ed+6B8YkMPJTlbmdhskjEBJ5KRWx0hKG8J
 cet75StkPjECOl3KbnQJT24JXbLGChcTrvDfNdC6bkvEbh/vxYYQNlnL08JFxOHJoRll
 HJTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=T8BiDyGzhvdM+OKXiWeAGkO5XiTGen5jfSFZwjWs3Sk=;
 b=K6TDerm907NdSm6G4gBJWgmEGcrAorIg6dSvjDy5HyJhEPpAKWX+rVqbZCyvKWTk73
 igdmfOgSfLpXwxoKbMP8i60YbMS9FTXgcUodaizMXxkn92R6g1fI7hDtDcMpB4oyRDBz
 5ioP7DEv/DhAiWDFmhrZGAj4ELuBsewdAcTrNW7+cPmUBsnuuaSrVoRTBkNviGcL6lKa
 mv85SnvVfqwh+eJ7ULFgsgCbws4YrxJ+LhYRjUkVvSxqbKnIcpOZSSyGMcM++8aeOtf8
 l2HhDR3XLGvE09hN9cR7hVddOQOZ/SsLJJn55yhjKefq3SOu53J2LIQqwP2JjOM7mH2O
 iVGw==
X-Gm-Message-State: AOAM533iwvXw/lTblsiBNIbmhyr4+46wWZJdnpwfidiOahhqvTDmoRre
 iuT6Hr1ju9ns/dRzNmgLylsRCQ==
X-Google-Smtp-Source: ABdhPJx+j/jl5cCfma3njvtFmIGdQrRiVJqVxHUq+Ns7OxfMW2OWAgIghqkbKjnXlnB/aiBJMuri9w==
X-Received: by 2002:a17:906:c043:: with SMTP id
 bm3mr6016884ejb.420.1629235186191; 
 Tue, 17 Aug 2021 14:19:46 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id q8sm1561829edv.95.2021.08.17.14.19.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Aug 2021 14:19:45 -0700 (PDT)
To: Ludovic Desroches <ludovic.desroches@microchip.com>,
 buildroot@buildroot.org
References: <20210816120418.427-1-ludovic.desroches@microchip.com>
 <20210816120418.427-3-ludovic.desroches@microchip.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <aeca7e19-f3f0-c66b-8033-f6bb1da29ab2@mind.be>
Date: Tue, 17 Aug 2021 23:19:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210816120418.427-3-ludovic.desroches@microchip.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 2/3] configs/acmesystems_*: bump
 at91bootstrap3 version
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: thomas.petazzoni@bootlin.com, eugen.hristev@microchip.com,
 Biagio Montaruli <biagio.hkr@gmail.com>, Edgar Bonet <bonet@grenoble.cnrs.fr>,
 nicolas.ferre@microchip.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 16/08/2021 14:04, Ludovic Desroches via buildroot wrote:
> Signed-off-by: Ludovic Desroches <ludovic.desroches@microchip.com>
> ---
>  configs/acmesystems_acqua_a5_256mb_defconfig    | 2 +-
>  configs/acmesystems_acqua_a5_512mb_defconfig    | 2 +-
>  configs/acmesystems_aria_g25_128mb_defconfig    | 2 +-
>  configs/acmesystems_aria_g25_256mb_defconfig    | 2 +-
>  configs/acmesystems_arietta_g25_128mb_defconfig | 2 +-
>  configs/acmesystems_arietta_g25_256mb_defconfig | 2 +-
>  6 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/configs/acmesystems_acqua_a5_256mb_defconfig b/configs/acmesystems_acqua_a5_256mb_defconfig
> index 00b99c0ad8..f8129f3780 100644
> --- a/configs/acmesystems_acqua_a5_256mb_defconfig
> +++ b/configs/acmesystems_acqua_a5_256mb_defconfig
> @@ -19,7 +19,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
>  BR2_TARGET_AT91BOOTSTRAP3=y
>  BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
>  BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
> -BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="5232adb1c42636e1e9cf495a6abd1a8d66475f83"
> +BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.10.3"

 The point of having a fixed version is so that we are sure that it's only
updated after actually testin on a board. If you make such a wholesale change, I
assume you haven't actually tested it on all those boards... So you could just
as well have set BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION_3X...

 That said, we really have to do this because all the defconfigs are broken at
the moment, so applied the series to master, thanks.

 Regards,
 Arnout

>  BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="acqua-256m"
>  BR2_PACKAGE_HOST_DOSFSTOOLS=y
>  BR2_PACKAGE_HOST_GENIMAGE=y
> diff --git a/configs/acmesystems_acqua_a5_512mb_defconfig b/configs/acmesystems_acqua_a5_512mb_defconfig
> index f4af2501b8..e399d4a9ff 100644
> --- a/configs/acmesystems_acqua_a5_512mb_defconfig
> +++ b/configs/acmesystems_acqua_a5_512mb_defconfig
> @@ -19,7 +19,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
>  BR2_TARGET_AT91BOOTSTRAP3=y
>  BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
>  BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
> -BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="5232adb1c42636e1e9cf495a6abd1a8d66475f83"
> +BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.10.3"
>  BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="acqua-512m"
>  BR2_PACKAGE_HOST_DOSFSTOOLS=y
>  BR2_PACKAGE_HOST_GENIMAGE=y
> diff --git a/configs/acmesystems_aria_g25_128mb_defconfig b/configs/acmesystems_aria_g25_128mb_defconfig
> index cf62b5b72e..8bc8c4dcef 100644
> --- a/configs/acmesystems_aria_g25_128mb_defconfig
> +++ b/configs/acmesystems_aria_g25_128mb_defconfig
> @@ -29,7 +29,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
>  BR2_TARGET_AT91BOOTSTRAP3=y
>  BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
>  BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
> -BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.8.13"
> +BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.10.3"
>  BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="aria-128m"
>  
>  # Tools to build sdcard.img
> diff --git a/configs/acmesystems_aria_g25_256mb_defconfig b/configs/acmesystems_aria_g25_256mb_defconfig
> index 496ccd6853..d161b118ae 100644
> --- a/configs/acmesystems_aria_g25_256mb_defconfig
> +++ b/configs/acmesystems_aria_g25_256mb_defconfig
> @@ -29,7 +29,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
>  BR2_TARGET_AT91BOOTSTRAP3=y
>  BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
>  BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
> -BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.8.13"
> +BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.10.3"
>  BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="aria-256m"
>  
>  # Tools to build sdcard.img
> diff --git a/configs/acmesystems_arietta_g25_128mb_defconfig b/configs/acmesystems_arietta_g25_128mb_defconfig
> index 17ef7e757c..62bcbd44cb 100644
> --- a/configs/acmesystems_arietta_g25_128mb_defconfig
> +++ b/configs/acmesystems_arietta_g25_128mb_defconfig
> @@ -29,7 +29,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
>  BR2_TARGET_AT91BOOTSTRAP3=y
>  BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
>  BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
> -BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.8.13"
> +BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.10.3"
>  BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="arietta-128m"
>  
>  # Tools to build sdcard.img
> diff --git a/configs/acmesystems_arietta_g25_256mb_defconfig b/configs/acmesystems_arietta_g25_256mb_defconfig
> index aa0236bbb3..94258444a2 100644
> --- a/configs/acmesystems_arietta_g25_256mb_defconfig
> +++ b/configs/acmesystems_arietta_g25_256mb_defconfig
> @@ -29,7 +29,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
>  BR2_TARGET_AT91BOOTSTRAP3=y
>  BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
>  BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
> -BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.8.13"
> +BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.10.3"
>  BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="arietta-256m"
>  
>  # Tools to build sdcard.img
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
