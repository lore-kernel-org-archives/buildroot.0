Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AACE5E77188
	for <buildroot@archiver.kernel.org>; Sun, 22 Dec 2024 12:55:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 737D04088E;
	Sun, 22 Dec 2024 12:55:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hBMUq1SHndM6; Sun, 22 Dec 2024 12:55:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4333841449
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4333841449;
	Sun, 22 Dec 2024 12:55:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 573E6D3
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 12:55:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 37B9E606F6
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 12:55:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FMAQ7_V0TTEM for <buildroot@buildroot.org>;
 Sun, 22 Dec 2024 12:55:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 00D0160A58
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 00D0160A58
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 00D0160A58
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 12:55:21 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 7D0C013F8B5;
 Sun, 22 Dec 2024 13:55:15 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:56068])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 22 Dec 2024 13:55:15 +0100
MIME-Version: 1.0
Date: Sun, 22 Dec 2024 13:55:15 +0100
From: Julien Olivain <ju.o@free.fr>
To: kilian.zinnecker@mail.de
Cc: buildroot@buildroot.org, quentin.schulz@cherry.de, niklas.cassel@wdc.com
In-Reply-To: <20241221140503.9861-2-kilian.zinnecker@mail.de>
References: <20241221140503.9861-1-kilian.zinnecker@mail.de>
 <20241221140503.9861-2-kilian.zinnecker@mail.de>
User-Agent: Webmail Free/1.6.9
Message-ID: <cd5ccf08e1964b460b5892c84f7e610a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1734872118;
 bh=cpbZp06UJKmd/YA71ZtH5XbZUilscGmuv6gcR3C+c0E=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=f9IXuxWLwk1mavdFDWtSSTbxAFgZ5KqEP+NLGElC4ErDAkLxuGAQvoGajLPDMiAWm
 TQ5G3hM6WxJ0oMQapZyrQrNRQ1FnuPvyEnAuRCX/YB4zE5OQlFoktEFBgJeAWqaxKP
 H0NYmGqwmJDnKmJuuWa996UBVwUDNkumGsZT2//DUYK4aUwnnUosXXjW8DFYMUDADJ
 PWDqDSLvk9+R0jdFFgAFr1ES6WxZbjEC4PMHEcf1p/dq14MoXicglM3TQqrXw+kzFo
 5mgE0iREYu3+fZQd8X0Rh+FcyEtsL+VuzQNh4AXSW+46hstllOdzBY7ZDmB1JuKlph
 crB+NrBgYiihQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=f9IXuxWL
Subject: Re: [Buildroot] [PATCH v2 1/1] configs/rock5b: Switch to mainline
 TrustedFirmware
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

On 21/12/2024 15:05, kilian.zinnecker--- via buildroot wrote:
> From: Kilian Zinnecker <kilian.zinnecker@mail.de>
> 
> The Rock 5b board support currently uses a binary trusted firmware
> blob from the rockchip-rkbin package. Recently, the Rock 5b's SoC,
> i.e., the rk3588, received mainline TrustedFirmware-A support:
> 
> https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/21840
> https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/29363
> 
> This support was recently released as part of the v2.12 version of
> the TrustedFirmware-A. This patch changes the defconfig from using
> the rockchip-rkbin atf binary blob to building the TrustedFirmware-A
> v2.12 for the rk3588 from source.
> 
> Signed-off-by: Kilian Zinnecker <kilian.zinnecker@mail.de>

Applied to master, thanks.

> ---
>  configs/rock5b_defconfig | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/configs/rock5b_defconfig b/configs/rock5b_defconfig
> index f898e86c8c..47a7acc083 100644
> --- a/configs/rock5b_defconfig
> +++ b/configs/rock5b_defconfig
> @@ -23,9 +23,15 @@ BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
>  BR2_LINUX_KERNEL_NEEDS_HOST_PYTHON3=y
>  BR2_PACKAGE_LINUX_FIRMWARE=y
>  BR2_PACKAGE_LINUX_FIRMWARE_RTL_8169=y
> +BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
> +BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF=y
>  BR2_PACKAGE_ROCKCHIP_RKBIN=y
>  
> BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILENAME="bin/rk35/rk3588_ddr_lp4_2112MHz_lp5_2736MHz_v1.12.bin"
> -BR2_PACKAGE_ROCKCHIP_RKBIN_BL31_FILENAME="bin/rk35/rk3588_bl31_v1.40.elf"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.12"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="rk3588"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="bl31/bl31.elf"
>  BR2_TARGET_ROOTFS_EXT2=y
>  BR2_TARGET_ROOTFS_EXT2_4=y
>  BR2_TARGET_ROOTFS_EXT2_SIZE="250M"
> --
> 2.47.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
