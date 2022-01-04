Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 542C9C433F5
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 17:57:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 079AE813C5;
	Tue,  4 Jan 2022 17:57:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CMqrL2iBxWB5; Tue,  4 Jan 2022 17:57:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 580BC813B7;
	Tue,  4 Jan 2022 17:57:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AC9791BF2EF
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 17:57:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9C1C640129
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 17:57:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qNyuhtsGhlAg for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 17:57:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ACCC3400FE
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 17:57:00 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id z9so81606648edm.10
 for <buildroot@buildroot.org>; Tue, 04 Jan 2022 09:57:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=ciGVRQ0ZZEq8hccgtUlS+J8TAQOHH/Fu8vV+jd1ov5Y=;
 b=Qvt5KN1xj+NP1ljtA7Gi9pQV2hWs+/yH4ZKr3z5oOFboM60xomJ5LOUSOgz40Q8SM6
 7RLgFnNweeh/taN1Z1WjIfMs1K61QKMzLd2MDj6C2B/+aNSfhTNwpZYXuXYFYSEfwER7
 qdrrAAT4iQMu+k/oKGb2JvPe/X/NnC2Hy1JGb6ruHnORerZ1tAcBCTEtkSONcKV6jWqt
 OYyEAoSsM9m67uRVRjZbe+Ta05l+7PsCRf/ScVQRPrjtv1BGKg99SRmCRqluArsMTISV
 ZYm3zQMVvaeou8mXxeANjROs0q3Hmf/SSiSixYh1WqRfiYPjaI7wP59o0wu6752hwAcn
 dKtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ciGVRQ0ZZEq8hccgtUlS+J8TAQOHH/Fu8vV+jd1ov5Y=;
 b=B0dxu+UcS/YoDPwwczDz3Az0SqYTNXzwAQeuF4+c8rotTLEQzf89GDdkm9UW5HB553
 vExNQFv+5t5OGhNo6/g7q7uKozpamIiVdyXI7cHjaXs2zh44kMkaKCb0aULO/Ds5N2fq
 0ueCME0IliEYrmhSrGq7jCnq4MekFPdoV5nXmKAvqzD2Hth6SDe+ZOQFP92rv61wXX4G
 zJqns73y/VsxmvxayEG+blXKLfc8YE17avaPKTvTUlIUDqtekRvfCLWpKBkxyu/SJbrW
 YDRLaHycWOKo41EOHqztB80w5espdPpKVWRvJVDnCHMa0mLB+nZo1G3386DQOlUYVyNU
 9T+A==
X-Gm-Message-State: AOAM530oHKdyMQpV5uT6fAyW3umCligjhD64/K1ncLratV6T6fNzNIS4
 9BoAQEgP5XHYfXQzeD3kjxTlRw==
X-Google-Smtp-Source: ABdhPJxUe9GzWiViAIV9ckPKpSenB3TKmArbXjXVdpnfxJ0IEpXJvaA8CiWnTrEFfGL1b6m5wUvX9w==
X-Received: by 2002:aa7:d2d1:: with SMTP id k17mr49673545edr.250.1641319019034; 
 Tue, 04 Jan 2022 09:56:59 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id c12sm15316084edx.80.2022.01.04.09.56.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jan 2022 09:56:58 -0800 (PST)
Message-ID: <ab60d356-ff2d-941f-1487-979e3a1c00ee@mind.be>
Date: Tue, 4 Jan 2022 18:56:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>, buildroot@buildroot.org
References: <20220102080635.9405-1-abrodkin@synopsys.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220102080635.9405-1-abrodkin@synopsys.com>
Subject: Re: [Buildroot] [PATCH] configs/cubieboard2: bump U-Boot and kernel
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 02/01/2022 09:06, Alexey Brodkin via buildroot wrote:
> Bump U-Boot to version 2021.10 and kernel to 5.15.11
> Among other things fixes U-Boot build failure,
> see https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006081:
> ---------------------->8-------------------
>    HOSTLD  scripts/dtc/dtc
> /usr/bin/ld: scripts/dtc/dtc-parser.tab.o:(.bss+0x10): multiple definition of `yylloc'; scripts/dtc/dtc-lexer.lex.o:(.bss+0x0): first defined here
> collect2: error: ld returned 1 exit status
> ---------------------->8-------------------
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   configs/cubieboard2_defconfig | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/configs/cubieboard2_defconfig b/configs/cubieboard2_defconfig
> index 8924c88c54..a9356295c1 100644
> --- a/configs/cubieboard2_defconfig
> +++ b/configs/cubieboard2_defconfig
> @@ -1,16 +1,16 @@
>   BR2_arm=y
>   BR2_cortex_a7=y
>   BR2_ARM_FPU_NEON_VFPV4=y
> -# Linux headers same as kernel, a 4.18 series
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_18=y
> +# Linux headers same as kernel, a 5.15 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
>   BR2_TARGET_GENERIC_HOSTNAME="Cubieboard2"
>   BR2_TARGET_GENERIC_ISSUE="Welcome to Cubieboard2!"
>   BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
>   BR2_ROOTFS_POST_IMAGE_SCRIPT="board/cubietech/cubieboard2/post-image.sh"
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.18.14"
> -BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.11"
> +BR2_LINUX_KERNEL_DEFCONFIG="multi_v7"
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
>   BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun7i-a20-cubieboard2"
>   BR2_TARGET_ROOTFS_EXT2=y
> @@ -18,7 +18,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
>   BR2_TARGET_UBOOT=y
>   BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>   BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.09"
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
>   BR2_TARGET_UBOOT_BOARD_DEFCONFIG="Cubieboard2"
>   BR2_TARGET_UBOOT_NEEDS_DTC=y
>   BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
