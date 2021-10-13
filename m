Return-Path: <SRS0=94yL=PB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9906DC433F5
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 20:22:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7208A608FE
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 20:22:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7208A608FE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 413248295A;
	Wed, 13 Oct 2021 20:22:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 82oFkr6qFS8L; Wed, 13 Oct 2021 20:22:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8CEC781D65;
	Wed, 13 Oct 2021 20:22:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B1D181BF361
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 20:22:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A1ABF40804
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 20:22:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cG_qudhMXWsY for <buildroot@lists.busybox.net>;
 Wed, 13 Oct 2021 20:22:28 +0000 (UTC)
X-Greylist: delayed 00:07:03 by SQLgrey-1.8.0
Received: from smtpcmd0756.aruba.it (smtpcmd0756.aruba.it [62.149.156.56])
 by smtp4.osuosl.org (Postfix) with ESMTP id E1D3040548
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 20:22:27 +0000 (UTC)
Received: from [192.168.126.129] ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id akenm0jPN4n4rakenm9ubh; Wed, 13 Oct 2021 22:15:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1634156121; bh=f6T6+Pi/BYphH3FircPaJzJIDhC1Q9vRDR+xV4zj5x8=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=nwjHuoBW6p+hBJJulX+Kefih+qm9MuMUhj0RWdf8fjw/mlCC7MfgZHbtp+zLaiuTQ
 X+HEtjzSyC6Pgnx8AlfVtLsg3xWnrM+2hK1gBehhDi9yT9qq07nyA0mhhASoit1cdr
 BW56jIGmkqJ44hVqlSlvYabY/kLwxuruRC1PYlUZUNg+CwlrFl75YnJYKmsqMrPuJp
 PIANjww6nbQsPU73lqPRdy+bfez5R1tiKfXs7NWuYRUkIC0I46J4yjQKr4KE34NOFF
 xggaJIabBlyBC91DPYC22KKpyOngCugdVpIRyg2VlM9kkxfN3eJA3xZ7K+1MpSA3Yk
 0+gIIfMsk2Vng==
To: buildroot@buildroot.org
References: <20211013191838.1560429-1-giulio.benetti@benettiengineering.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <337d0eeb-a062-da60-5b86-754a61da7b66@benettiengineering.com>
Date: Wed, 13 Oct 2021 22:15:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211013191838.1560429-1-giulio.benetti@benettiengineering.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfK4L4pvLrCS/pN7skVdyDOjelSajYY3j6yj/6jaTgqDvFn5Kj4T3lP5YcI6VxTUq2zCcLdVXRIvi3v7ErKKfocmSzgTrWwi0z91oARVTtl/ocE3IJM0B
 TWuMu8nrY1ZZ61OrK2POaJ3Fp/q2Z2nMqOQD2u5lLSH42mLGY+kvWp2pY2pF+CBvD1Xz0tloNxpyP2t9S4slz+Yp2jX3c5yrA+HoVk1RPciAa+1ZinFwL9yN
 L5e4jLxjEnzotQqRv9LZfg==
Subject: Re: [Buildroot] [PATCH] configs/asus_tinker_rk3288: bump to Linux
 kernel 5.14 and u-boot 2021.10
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

Pardon, please drop this patch. I send a v2 dropping the uboot patch 
that now is useless.

Best regards
-- 
Giulio Benetti
Benetti Engineering sas

On 10/13/21 9:18 PM, Giulio Benetti wrote:
> This bumps to linux/linux-headers 5.14 and u-boot version 2021.10.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   configs/asus_tinker_rk3288_defconfig | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/configs/asus_tinker_rk3288_defconfig b/configs/asus_tinker_rk3288_defconfig
> index e95a19a757..9f4a959a06 100644
> --- a/configs/asus_tinker_rk3288_defconfig
> +++ b/configs/asus_tinker_rk3288_defconfig
> @@ -3,14 +3,14 @@ BR2_arm=y
>   BR2_cortex_a17=y
>   BR2_ARM_FPU_NEON_VFPV4=y
>   
> -# Linux headers same as kernel, a 5.0 series
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_0=y
> +# Linux headers same as kernel, a 5.14 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_14=y
>   
>   # Bootloader
>   BR2_TARGET_UBOOT=y
>   BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>   BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.01"
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
>   BR2_TARGET_UBOOT_BOARD_DEFCONFIG="tinker-rk3288"
>   BR2_TARGET_UBOOT_NEEDS_DTC=y
>   BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
> @@ -22,7 +22,7 @@ BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl-dtb.bin"
>   # Kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.0"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.14"
>   BR2_LINUX_KERNEL_DEFCONFIG="multi_v7"
>   BR2_LINUX_KERNEL_UIMAGE=y
>   BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x02000000"
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
