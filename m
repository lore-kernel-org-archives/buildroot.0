Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00E1AC47073
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 20:11:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9FA874379B;
	Wed, 10 Jan 2024 20:11:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9FA874379B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bTy5lTO8WkNz; Wed, 10 Jan 2024 20:11:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9220F43779;
	Wed, 10 Jan 2024 20:11:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9220F43779
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1668B1BF5B3
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 20:11:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F0094613FF
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 20:11:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F0094613FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ewJYo1xVX3uy for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 20:11:33 +0000 (UTC)
Received: from smtpcmd11116.aruba.it (smtpcmd11116.aruba.it [62.149.156.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5362E605EA
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 20:11:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5362E605EA
Received: from [192.168.50.163] ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id NevBrUefInb7jNevBrhEyK; Wed, 10 Jan 2024 21:11:30 +0100
Message-ID: <243b44e3-92ca-463a-91a6-dfdc248b01b9@benettiengineering.com>
Date: Wed, 10 Jan 2024 21:11:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jesse Taube <mr.bossman075@gmail.com>, buildroot@buildroot.org
References: <20240109141132.654749-1-Mr.Bossman075@gmail.com>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20240109141132.654749-1-Mr.Bossman075@gmail.com>
X-CMAE-Envelope: MS4xfCdIvekmnyY8Nm1ZJoXb6cOyEIQ2PxQehv0SOm3AuYIiBlncsr13Pqc9DyXjUmGqolKkjNZyq5+hB4qRYDtSD/inKw4dTmxwDCHGUZhlGnj/twFpYFMD
 ZrrI6rD4TFO27nOE2kt6b5YJW5FtW8nYxP1SRUmPP1WIbEicfJKPXbDu4+JtS3WNMNJnlTiUmoWVYe8H+XIBGJyumMqvrBAp5vODCTHHHF6CL0vwCala+/+/
 V0Y3w0pcnMKc1ZljRIL8QhhBkLhox0s5C7UMA8fagyVsfGdvrBZTac7WvK9eA/ZG
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1704917490; bh=rZVEp8tH4ggoBRmmOWSYhvmiWovtA5UykkwGDoUrKcE=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=SYwju6fvPfsG/qrQbCU0IWHIx68AJ81kZ7LkLEs0TwlxNbtDWwhKuPgpG9a0hswFZ
 SUPZ504UbsI5/7uF1LM0WDDNIfF2+PuQsglHhFXvdtVNlItlliDxPd24yxHlCwHnS1
 juPkQXd09JdmTaOFU9Pgchmqz1L8IDCNCFe5Ki+AuMsglWjZY3LgfhCNnVa2+eHKC/
 /VJW5cYOH87NH09/pn6zMvVEDgQ+z62k2EzDkzPQLDFsqIpvWDU3iobwJ7txgJESUi
 /Z4JrClC5JoMDmO8SZtMEKyPMOBR0/ZQXINNj5N3eLdTKvMSh353FvIMHOUcES1qjS
 LDRzW3lc05rZA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=SYwju6fv
Subject: Re: [Buildroot] [PATCH v2] configs/imxrt1050-evk: Bump Kernel and
 U-boot
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Jesse,

On 09/01/24 15:11, Jesse Taube wrote:
> Bump Linux to 6.7 and U-Boot to 2024.01
> 
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>

Looks good to me:
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Best regards
-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas

> ---
>   configs/imxrt1050-evk_defconfig | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/configs/imxrt1050-evk_defconfig b/configs/imxrt1050-evk_defconfig
> index af060fb9f4..3eb556df06 100644
> --- a/configs/imxrt1050-evk_defconfig
> +++ b/configs/imxrt1050-evk_defconfig
> @@ -7,16 +7,16 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
>   BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/freescale/imxrt1050evk/genimage.cfg"
>   
>   # Toolchain
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_7=y
>   
>   # Kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.7"
>   BR2_LINUX_KERNEL_DEFCONFIG="imxrt"
>   BR2_LINUX_KERNEL_UIMAGE=y
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
> -BR2_LINUX_KERNEL_INTREE_DTS_NAME="imxrt1050-evk"
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="nxp/imx/imxrt1050-evk"
>   
>   # Filesystem
>   BR2_TARGET_ROOTFS_EXT2=y
> @@ -30,7 +30,7 @@ BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
>   BR2_TARGET_UBOOT=y
>   BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>   BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.10"
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.01"
>   BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imxrt1050-evk"
>   BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/freescale/imxrt1050evk/uboot.fragment"
>   BR2_TARGET_UBOOT_FORMAT_IMG=y

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
