Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DC98C433EF
	for <buildroot@archiver.kernel.org>; Sat, 26 Feb 2022 10:53:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5419F404E0;
	Sat, 26 Feb 2022 10:53:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZePK-PHEz3Jj; Sat, 26 Feb 2022 10:53:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 36C9A4010E;
	Sat, 26 Feb 2022 10:53:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BC0C71BF484
 for <buildroot@lists.busybox.net>; Sat, 26 Feb 2022 10:53:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AA06F401A3
 for <buildroot@lists.busybox.net>; Sat, 26 Feb 2022 10:53:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ctGsuvL1sarZ for <buildroot@lists.busybox.net>;
 Sat, 26 Feb 2022 10:53:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd01-g.aruba.it (smtpcmd01-g.aruba.it [62.149.158.217])
 by smtp2.osuosl.org (Postfix) with ESMTP id A1C5C4010E
 for <buildroot@buildroot.org>; Sat, 26 Feb 2022 10:53:29 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.7.124])
 by Aruba Outgoing Smtp  with ESMTPSA
 id NuhcnT8XOroAhNuhdnImiZ; Sat, 26 Feb 2022 11:53:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1645872809; bh=KggUfjkA5M2O0JRBg7+VyKZI/oMJ4GnnD0upRS3HB58=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=FvBNSB9B6llyvaDRISsaFszHSz7X/sTHFZtBy3c7T2lNOGmpwAUvNlUtq53unZt15
 QFVfcRp0XN3YuCDOzEDDPiS4UvcBD6blsba1ATok/a+UxSy3Pq1V7hIAJe4MTxi+t9
 iwNOgU208ECsfyI22/oiG80mipC9RnElPbhPsNHrXZISa98eilYCr3aZ8qSDOBGFRh
 kj3tP+aMzBAc/ym51GGdDfSOepdlibXuhm5LJ1sUflDST5IS5A7ElrNGuPMNgBU6uI
 G+CBZKUiUavlZls+Gy9PXkjzmt18J9YkveheWJ7SwYC+XtxcBGWfW4LcWwtF+1+sfx
 9gVfJYxJgjpXQ==
Message-ID: <9e70bc4b-875c-a01a-1931-a5de940b18df@benettiengineering.com>
Date: Sat, 26 Feb 2022 11:53:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Sergey Matyukevich <geomatsi@gmail.com>, buildroot@buildroot.org
References: <20220225072622.3584480-1-geomatsi@gmail.com>
 <20220225072622.3584480-6-geomatsi@gmail.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220225072622.3584480-6-geomatsi@gmail.com>
X-CMAE-Envelope: MS4wfK6qvR9HX1ye6pgsR00/ONpuICtq+bfDLSp5kKB1HyoHmcHxxLemXX7vfzcWAm+4TZw+7MNlLsuW1oGtDXubaDTFQBNvj5mqxImdqRQYxCubK0LCJnKz
 GWDNm1OVxsReHQs2qHFXuXhvkRWN5YwFWLgFmtsbLH7t/eQDxMe9VIb7l68v6dW9TTQK1nMrj1Fpmu/QkfxE17/1eA3Vvj1nwJaUXyESYxLdwSlz4XrnWAcG
 8YNYxBBN8sHBBKKDBhhppHrjCngfgnU/OqfvN9kiWrU=
Subject: Re: [Buildroot] [PATCH v2 5/6]
 configs/linksprite_pcduino_defconfig: update Linux/U-Boot versions
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
Cc: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Sergey,

On 25/02/22 08:26, Sergey Matyukevich wrote:
> Bump Linux kernel to 5.16.1 and U-Boot to 2022.01. Select option
> BR2_TARGET_UBOOT_NEEDS_OPENSSL since U-Boot requires openssl.
> Drop redundant U-Boot options.
> 
> Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>

Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Tested-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[Giulio: build tested only]

Best regards
-- 
Giulio Benetti
Benetti Engineering sas

> ---
>   configs/linksprite_pcduino_defconfig | 9 ++++-----
>   1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/configs/linksprite_pcduino_defconfig b/configs/linksprite_pcduino_defconfig
> index 05b25aede4..806c4f0697 100644
> --- a/configs/linksprite_pcduino_defconfig
> +++ b/configs/linksprite_pcduino_defconfig
> @@ -19,12 +19,12 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
>   BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
>   
>   # Linux headers same as kernel, a 5.10 series
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_16=y
>   
>   # Kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.10"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.16.1"
>   BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
>   BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun4i-a10-pcduino"
> @@ -40,13 +40,12 @@ BR2_TARGET_ROOTFS_EXT2_4=y
>   BR2_TARGET_UBOOT=y
>   BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>   BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.10"
> -BR2_TARGET_UBOOT_USE_DEFCONFIG=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.01"
>   BR2_TARGET_UBOOT_BOARD_DEFCONFIG="Linksprite_pcDuino"
>   BR2_TARGET_UBOOT_NEEDS_DTC=y
> +BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
>   BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
>   BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
> -BR2_TARGET_UBOOT_FORMAT_BIN=y
>   BR2_TARGET_UBOOT_SPL=y
>   BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
