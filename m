Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15836C433F5
	for <buildroot@archiver.kernel.org>; Mon, 17 Jan 2022 20:06:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9ACBF60C04;
	Mon, 17 Jan 2022 20:06:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EhiOLZi-1Ubm; Mon, 17 Jan 2022 20:06:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92B8360BFB;
	Mon, 17 Jan 2022 20:06:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A5DDA1BF2A6
 for <buildroot@lists.busybox.net>; Mon, 17 Jan 2022 20:06:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 92B7D401B1
 for <buildroot@lists.busybox.net>; Mon, 17 Jan 2022 20:06:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ijxbaa3GXMz3 for <buildroot@lists.busybox.net>;
 Mon, 17 Jan 2022 20:06:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd02102.aruba.it (smtpcmd02102.aruba.it [62.149.158.102])
 by smtp2.osuosl.org (Postfix) with ESMTP id 23B47400E5
 for <buildroot@buildroot.org>; Mon, 17 Jan 2022 20:06:48 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.178.108])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 9YH9nCpz2BBmw9YH9nwGFJ; Mon, 17 Jan 2022 21:06:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1642450007; bh=kV4PoAQNTwk8tkRFX+tp8smWmGOBFJUHnrs4AU3KOno=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=d8bCg49qmM2U7Rrdp8ZrSMWSv1iwAMCbj2926tZ0Jzx51cJiqD+4Jskz3ipyiLdGO
 sT+gT6eNYFDK+2VL93D+I/1AbuUYbP1tcGfIhoIolkugZ4idLlGgOORMwrPEdj5y2S
 n9/JQlgEAi4U8fHxRtxbVikwcYhoApWbtUhSW5DwOTKnexd1LUr35W9ee1rzkC0Dsd
 ekmaTpztC6ZKFQhY7YlJ2SVHPIRFDSXCpy0NePVK7fRZ8y6rDdfszRPaeeu/FtcgZX
 ctes/I9erRABMlw7Rd4iMY7T5eeDwQiX4IT5tidQbnD7ku5CT9stukixW3+iAa2d21
 Y78bTqsaovkdw==
To: Danilo Bargen <mail@dbrgn.ch>, buildroot@buildroot.org
References: <20220116211557.71866ff6@c3po>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <44c15385-c790-6867-fc1f-b24c922b7e40@benettiengineering.com>
Date: Mon, 17 Jan 2022 21:06:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220116211557.71866ff6@c3po>
Content-Language: en-US
X-CMAE-Envelope: MS4wfJnAUvzuQSw2IKMGZE0Zoh3GJYgrbe4z9NgddOPvL34JW9MmYT8wmC0gI6lR1+9RT2/oS5xEgxO/n73eVJjnM6EahkAnUqsMLJPDpJR8z1scf9K8+jAs
 4/GM44m9R4TB9pnccTj4EkG2ifOUZC/EJqzviezpzoCNZ0vg4EGdYco0HaC4IuTCjhDRVinEQwADLCvJ0j1A7py1FuafxO24T8ANNnqbdE3uncYadDC89MYA
Subject: Re: [Buildroot] [PATCH 1/1] configs/pcengines_apu2_defconfig: bump
 kernel to 5.16
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

Hi Danilo,

On 16/01/22 21:15, Danilo Bargen wrote:
> This fixes the compile errors that were present with the previous kernel
> version (4.19).

Is there a build failure log url that you can point?

I would also mention that you are refactoring defconfig file in commit log.

Thank you!
Best regards
-- 
Giulio Benetti
Benetti Engineering sas

> Signed-off-by: Danilo Bargen <mail@dbrgn.ch>
> ---
>   configs/pcengines_apu2_defconfig | 22 ++++++++++++++++------
>   1 file changed, 16 insertions(+), 6 deletions(-)
> 
> --
> 2.34.1
> 
> diff --git a/configs/pcengines_apu2_defconfig
> b/configs/pcengines_apu2_defconfig index 68cebb8f6a..eb30f6aee7 100644
> --- a/configs/pcengines_apu2_defconfig
> +++ b/configs/pcengines_apu2_defconfig
> @@ -1,16 +1,26 @@
> +# Architecture
>   BR2_x86_64=y
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
> -BR2_TARGET_GENERIC_HOSTNAME="apu2"
> -BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
> -BR2_SYSTEM_DHCP="eth0"
> +
> +# Kernel
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_16=y
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.16"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.16"
>   BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>   BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/pcengines/apu2/linux.config"
> +
> +# Default hostname and TTY
> +BR2_TARGET_GENERIC_HOSTNAME="apu2"
> +BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
> +
> +# Networking
> +BR2_SYSTEM_DHCP="eth0"
> +
> +# Rootfs
>   BR2_TARGET_ROOTFS_EXT2=y
>   BR2_TARGET_ROOTFS_ISO9660=y
>   BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU="board/pcengines/apu2/isolinux.cfg"
>   BR2_TARGET_ROOTFS_ISO9660_HYBRID=y
> -# BR2_TARGET_ROOTFS_TAR is not set
> +
> +# Bootloader
>   BR2_TARGET_SYSLINUX=y
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
