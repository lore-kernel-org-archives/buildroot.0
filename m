Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFC33C04A6A
	for <buildroot@archiver.kernel.org>; Thu, 10 Aug 2023 22:07:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 47402417CD;
	Thu, 10 Aug 2023 22:07:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 47402417CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xbStyRErV0WI; Thu, 10 Aug 2023 22:07:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 86F32414B6;
	Thu, 10 Aug 2023 22:07:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 86F32414B6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BFF811BF83B
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 22:07:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A68FA83F26
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 22:07:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A68FA83F26
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kHD80f8IiXRT for <buildroot@lists.busybox.net>;
 Thu, 10 Aug 2023 22:07:37 +0000 (UTC)
Received: from smtpcmd12143.aruba.it (smtpcmd12143.aruba.it [62.149.156.143])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 312288211D
 for <buildroot@buildroot.org>; Thu, 10 Aug 2023 22:07:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 312288211D
Received: from [192.168.1.205] ([95.47.160.93])
 by Aruba Outgoing Smtp  with ESMTPSA
 id UDocq6GEh8wqZUDocqZFvP; Fri, 11 Aug 2023 00:07:35 +0200
Message-ID: <cc3dd6f5-9a38-70bb-7df5-ecebf9ca4bb6@benettiengineering.com>
Date: Fri, 11 Aug 2023 00:07:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
To: buildroot@buildroot.org
References: <20230808231421.7f94494d@windsurf>
 <20230810220146.11261-1-giulio.benetti@benettiengineering.com>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20230810220146.11261-1-giulio.benetti@benettiengineering.com>
X-CMAE-Envelope: MS4xfFsbj5yJFVxc//34P8URxt1UF+PL16R+x1lqR8H2SDAfIHfbjXWlWUXbN952hRpKVFn5G35yFhzOxtoF0elLx5Rj7hVbO+BTH6cqiW7EJ36sGa1W3avZ
 RuenmTWM+C67rIYKIVyIfHkLLHrUy3zYWhQqSc0LCUhBijW8zSzWBw1HRAyBgHo8PvtBSydIxHAKovUJ488MYKUAwSkXmqbNu7WMrqz3iedRva4+c2NezDoA
 HJkQtZfB/5X93gxICu1e7w==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1691705255; bh=TDzVCneaG/USAJm36EoNuOFAe4MKpn0FYBOQOZGGJ60=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=QFaRw9N6JUVf28C4/vk8GDmy/rJqK/2hdN7f282fif/Eoslay5ri2anb3jKOSE2pR
 OjTNPfrS10L+LkqaVAKSiKhU1m9TJT8nFiBY/i8ATD0StElTsRUTFjSA02lLFBVg9a
 nQhxuX0W3p7K75zM3f1wKVxe0lw9A9WP5qpfR8Twq3xudsV2e56IWr5Ucp4ke8sIdt
 SlmQcufKsYX4j8tEJL01uW++aqypUJvBK5xxo6tOhrlPYNkgFbTyyT2Nm9MidPKReM
 qTwnsD5Vp//iUCSJWn/uEc3QX8U0y6/3eyMkpzgtihZfirsMkDfyMPM1PVCDa2ww3q
 Ot560gaOQi5ow==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=QFaRw9N6
Subject: Re: [Buildroot] [PATCH] configs/asus_tinker_rk3288_defconfig:
 switch to zImage and bump Linux to 6.1.44, U-Boot to 2023.07
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
Cc: Jagan Teki <jagan@amarulasolutions.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pardon,

extlinux.conf wasn't staged. Need to send V2

-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas

On 11/08/23 00:01, Giulio Benetti wrote:
> uImage is almost deprecated so let's switch to zImage. Let's also bump
> Linux version to 6.1.44, U-Boot to 2023.07 and remove
> BR2_TARGET_UBOOT_NEEDS_PYTHON3 since it's selected by
> BR2_TARGET_UBOOT_NEEDS_PYLIBFDT.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   configs/asus_tinker_rk3288_defconfig | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/configs/asus_tinker_rk3288_defconfig b/configs/asus_tinker_rk3288_defconfig
> index 40f4125880..b3e4502a45 100644
> --- a/configs/asus_tinker_rk3288_defconfig
> +++ b/configs/asus_tinker_rk3288_defconfig
> @@ -10,10 +10,9 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
>   BR2_TARGET_UBOOT=y
>   BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>   BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.10"
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.07"
>   BR2_TARGET_UBOOT_BOARD_DEFCONFIG="tinker-rk3288"
>   BR2_TARGET_UBOOT_NEEDS_DTC=y
> -BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
>   BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
>   BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
>   BR2_TARGET_UBOOT_FORMAT_DTB_IMG=y
> @@ -23,10 +22,8 @@ BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl-dtb.bin tpl/u-boot-tpl.bin"
>   # Kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.2"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.44"
>   BR2_LINUX_KERNEL_DEFCONFIG="multi_v7"
> -BR2_LINUX_KERNEL_UIMAGE=y
> -BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x02000000"
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
>   BR2_LINUX_KERNEL_INTREE_DTS_NAME="rk3288-tinker"
>   BR2_LINUX_KERNEL_INSTALL_TARGET=y

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
