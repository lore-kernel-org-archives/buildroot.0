Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81AE8C46CD2
	for <buildroot@archiver.kernel.org>; Fri, 22 Dec 2023 23:01:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21B5242D4E;
	Fri, 22 Dec 2023 23:01:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21B5242D4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nBFATJn_TW-R; Fri, 22 Dec 2023 23:01:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 530CD42CE8;
	Fri, 22 Dec 2023 23:01:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 530CD42CE8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C45A61BF284
 for <buildroot@lists.busybox.net>; Fri, 22 Dec 2023 23:01:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AA3D260AA4
 for <buildroot@lists.busybox.net>; Fri, 22 Dec 2023 23:01:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA3D260AA4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q_t0wGrp2Qhq for <buildroot@lists.busybox.net>;
 Fri, 22 Dec 2023 23:01:41 +0000 (UTC)
Received: from smtpcmd0757.aruba.it (smtpcmd0757.aruba.it [62.149.156.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6C66860A9F
 for <buildroot@buildroot.org>; Fri, 22 Dec 2023 23:01:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C66860A9F
Received: from [192.168.50.221] ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id GoWQr1vHmDni0GoWQri0fS; Sat, 23 Dec 2023 00:01:38 +0100
Message-ID: <75870cc6-bf50-4353-a613-74f739837ae7@benettiengineering.com>
Date: Sat, 23 Dec 2023 00:01:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Nigel Wang <asd617140123@gmail.com>, buildroot@buildroot.org
References: <20231222082933.12183-1-asd617140123@gmail.com>
 <20231222082933.12183-2-asd617140123@gmail.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20231222082933.12183-2-asd617140123@gmail.com>
X-CMAE-Envelope: MS4xfNkppL5APG3vmSdn7IHHyEsd3bOaLiS3vOknHCDdvpX6vSwOEikvtpKErOr5IUcNjEKqvKmAJm6co2yMTlAeO/Moq510hng0wi65e6p8uD3WlEnwSONE
 ouF4DqSjVqgUoi9CEUFAZIL5P5JLKJ7oddRURQSdQhv1l3iPIWrCHe2hPaTb8FqbugI1ehqgqEx4UsDLJfJtIilAAnjNTGm1wxc9Rk3XEwzr2H3UsPrplPDd
 AvVQY3yHmu0JkwmxNd6OIA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1703286098; bh=2Qas9z1Azlfb+7cRjenx3d7GKOjGG7SIwFWwgEtGCT0=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=iFewsMEojTKZDoqXNO9CHaFpOcKH6IZoFY3/4YxR7eF2dd+37XtVnBkd5XFyss7TY
 dIyirhj8/6/uCr0lcLmuEVH++NPb62hgpmuHN+opJSLtWifqBvtCQAS9M/g6jf5Rtq
 85zFEDABUouBmPjU86XEspWyrtsEzywneO4pknMCVliy10ecb+J1Vkc2lLyS5LHZFn
 PJVtz0eLzEDHYEkS4H4bBtP9Y9Jn+SvqMV9nef6OUsGmOB3obkwyH/k5rVC3cNtt4h
 +BtEmkTqd2niKoUPSAV4b+EbeiDa2e+Yt0zaIXxnCLcShb52DMuVLR+JRGCmcp0oyF
 QK3zJ7aCcbncw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=iFewsMEo
Subject: Re: [Buildroot] [PATCH 2/2] configs/cubieboard4_defconfig : add
 *_defconfig for cubieboard4.
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

Hi Nigel,

On 22/12/23 09:29, Nigel Wang wrote:
> From: nigel_wang <asd617140123@gmail.com>
> 
> Signed-off-by: nigel_wang <asd617140123@gmail.com>
> ---
>   configs/cubieboard4_defconfig | 42 +++++++++++++++++++++++++++++++++++
>   1 file changed, 42 insertions(+)
>   create mode 100644 configs/cubieboard4_defconfig
> 
> diff --git a/configs/cubieboard4_defconfig b/configs/cubieboard4_defconfig
> new file mode 100644
> index 0000000000..6a5f9e3fce
> --- /dev/null
> +++ b/configs/cubieboard4_defconfig
> @@ -0,0 +1,42 @@
> +# Architecture
> +BR2_arm=y
> +BR2_cortex_a7=y

checking the A80 Datasheet I've found that it's a cortex-A15/A7 
big.LITTLE architecture, so here you have to use:
BR2_cortex_a15_a7=y

> +BR2_ARM_FPU_NEON_VFPV4=y
> +
> +# Linux headers same as kernel, a 5.15 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y

can you please bump to latest LTS Linux(6.6.8)?

> +
> +# Kernel
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.11"

ditto,

> +BR2_LINUX_KERNEL_DEFCONFIG="multi_v7"

at this point I realize this is an old version of defconfig compared
to the one found in PATCH 1/1 that has not been:
$ make savedefconfig

anyway I repeat to keep track so here please use sunxi_defconfig

> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun9i-a80-cubieboard4"
> +
> +# Bootloader
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"

bump version ^^^

> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="Cubieboard4"
> +BR2_TARGET_UBOOT_NEEDS_DTC=y
> +BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
> +BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
> +BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
> +BR2_TARGET_UBOOT_SPL=y
> +BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
> +BR2_PACKAGE_HOST_UBOOT_TOOLS=y
> +BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
> +BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/cubietech/cubieboard4/boot.cmd"

here ^^^ use extlinux.conf as you've done in 1/1

> +
> +# System
> +BR2_TARGET_GENERIC_HOSTNAME="Cubieboard4"
> +BR2_TARGET_GENERIC_ISSUE="Welcome to Cubieboard4!"
> +BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/cubietech/cubieboard4/post-image.sh"
> +BR2_PACKAGE_HOST_DOSFSTOOLS=y
> +BR2_PACKAGE_HOST_GENIMAGE=y
> +BR2_PACKAGE_HOST_MTOOLS=y

Have you built the defconfig using buildroot/utils/docker-run ?

So I wait for V3 single patch from you with a commit log and a patch 
changelog.

Thank you!

Best regards
-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
