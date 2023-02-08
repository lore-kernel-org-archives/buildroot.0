Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2809C05027
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 13:46:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 26BEC610DA;
	Wed,  8 Feb 2023 13:46:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 26BEC610DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mIctpf_QjDms; Wed,  8 Feb 2023 13:46:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7454E610E4;
	Wed,  8 Feb 2023 13:46:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7454E610E4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 538271BF3FD
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 13:46:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 29A6181FAB
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 13:46:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29A6181FAB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id apaHZLBzHBOc for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 13:46:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9CD6381FA7
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9CD6381FA7
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 13:46:44 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 32CB36000C;
 Wed,  8 Feb 2023 13:46:40 +0000 (UTC)
Date: Wed, 8 Feb 2023 14:46:39 +0100
To: Athaariq Ardhiansyah <buildroot@athaariq.my.id>
Message-ID: <20230208144639.764af681@windsurf>
In-Reply-To: <20220926051956.3272067-1-buildroot@athaariq.my.id>
References: <20220926051956.3272067-1-buildroot@athaariq.my.id>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675864001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1hIOU6Q7qR52exTeZ/y/3gTP6BaxXsASPebqw+cV6ew=;
 b=Pe+FcgArNLxmhTv7YsT0P6DcXjjCKKuV/axN6/6/WVjABaRBhng+1HWHgyyKWnSHVONPP+
 gQvM6BK3Lt9jssjcZ0PNlTG0D1yuP2GvEn6RlPjdakqwWGE8ihO1sUwZttSOVFDz1JZJQg
 AUi8NOG2tMmDzFgNbQN9dZawFftjdbqOuKrQnuCKr2zrZfbVb/74I/WBc15baCc1VHrOCL
 +EUbhNXWmpYwQwcu50cec+Kf6ETzyZLtS9FCJCQ6MkDps1mVKGL1hnYw+4wi0SCWXAzabf
 qmQIOzRlkjAXl1eqHGyHg7ZSxb19xFka76snhdM1IehvrzwWCjH2ouVZvnJnDg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Pe+FcgAr
Subject: Re: [Buildroot] [PATCH 1/1] board/raspberrypi4: bump kernel version
 to 5.15.68
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Martin Bark <martin@barkynet.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Athaariq,

On Mon, 26 Sep 2022 05:20:15 +0000 (UTC)
Athaariq Ardhiansyah <buildroot@athaariq.my.id> wrote:

> First of all, kernel support for Raspberry Pi is way too old relative to stable version. Second, we actually have several bug fixes regarding the kernel including HDMI hotplug and more problems on graphic stacks. However, I only have Raspberry Pi 4B so I cannot test the changes for other Raspberry Pi models. For anyone who has those boards, please help us to bump and test the kernel.
> 
> Signed-off-by: Athaariq Ardhiansyah <buildroot@athaariq.my.id>

Thanks for your patch. It would indeed be nice to update our
RaspberryPi defconfigs, but there are a number of questions which need
to be answered before we can apply your patch.

First of all, a small detail: your commit log must be wrapped at ~80
columns. Also, it shouldn't use 1st person sentence "I only have".

> diff --git a/board/raspberrypi/linux.fragment b/board/raspberrypi/linux.fragment
> new file mode 100644
> index 0000000000..798b2e91da
> --- /dev/null
> +++ b/board/raspberrypi/linux.fragment
> @@ -0,0 +1,7 @@
> +# Dynamic CPU Clock
> +CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE=n
> +CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND=y
> +
> +# Fix Kernel Module won't Load
> +CONFIG_MODULE_COMPRESS_XZ=n
> +CONFIG_MODULE_COMPRESS_NONE=y

Why is this Linux kernel configuration fragment needed? There is no
explanation in your commit log. Changing the default CPU governor
should not be needed, and the second chunk about kernel module
compression is a bit strange and deserves some explanation.

> diff --git a/configs/raspberrypi4_64_defconfig b/configs/raspberrypi4_64_defconfig
> index 5942f7c4e1..6d90a8f004 100644
> --- a/configs/raspberrypi4_64_defconfig
> +++ b/configs/raspberrypi4_64_defconfig
> @@ -6,13 +6,14 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
>  
>  BR2_SYSTEM_DHCP="eth0"
>  
> -# Linux headers same as kernel, a 5.10 series
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
> +# Linux headers same as kernel, a 5.15 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
>  
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,0b54dbda3cca2beb51e236a25738784e90853b64)/linux-0b54dbda3cca2beb51e236a25738784e90853b64.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,155b736f0ff883415d374ba743473f5ef146814b)/linux-155b736f0ff883415d374ba743473f5ef146814b.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
> +BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/raspberrypi4-64/linux.fragment"
>  
>  # Build the DTB from the kernel sources
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
> @@ -23,6 +24,9 @@ BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
>  BR2_PACKAGE_RPI_FIRMWARE=y
>  BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4=y
>  BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE="board/raspberrypi4-64/config_4_64bit.txt"
> +BR2_PACKAGE_BRCMFMAC_SDIO_FIRMWARE_RPI=y
> +BR2_PACKAGE_BRCMFMAC_SDIO_FIRMWARE_RPI_BT=y
> +BR2_PACKAGE_BRCMFMAC_SDIO_FIRMWARE_RPI_WIFI=y

Why is this being added?

>  # Required tools to create the SD image
>  BR2_PACKAGE_HOST_DOSFSTOOLS=y
> diff --git a/configs/raspberrypi4_defconfig b/configs/raspberrypi4_defconfig
> index 4e5580c140..f0947c329c 100644
> --- a/configs/raspberrypi4_defconfig
> +++ b/configs/raspberrypi4_defconfig
> @@ -6,13 +6,14 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
>  
>  BR2_SYSTEM_DHCP="eth0"
>  
> -# Linux headers same as kernel, a 5.10 series
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
> +# Linux headers same as kernel, a 5.15 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
>  
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,0b54dbda3cca2beb51e236a25738784e90853b64)/linux-0b54dbda3cca2beb51e236a25738784e90853b64.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,155b736f0ff883415d374ba743473f5ef146814b)/linux-155b736f0ff883415d374ba743473f5ef146814b.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
> +BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/raspberrypi4/linux.fragment"
>  
>  # Build the DTB from the kernel sources
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
> @@ -23,6 +24,10 @@ BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
>  BR2_PACKAGE_RPI_FIRMWARE=y
>  BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4=y
>  BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE="board/raspberrypi4/config_4.txt"
> +BR2_PACKAGE_BRCMFMAC_SDIO_FIRMWARE_RPI=y
> +BR2_PACKAGE_BRCMFMAC_SDIO_FIRMWARE_RPI_BT=y
> +BR2_PACKAGE_BRCMFMAC_SDIO_FIRMWARE_RPI_WIFI=y
> +BR2_PACKAGE_RPI_USERLAND=y

Why is rpi-userland being added here, and not to the other defconfig above?

Also, you're updating rpi-firmware, rpi-userland and RaspberryPi
defconfigs in the same commit. Is this because they need to be updated
in sync? If that's the case, is there a potential problem if we update
rpi-firmware/rpi-userland, but not the defconfigs for RaspberryPi 1/2/3 ?

Thanks a lot for your feedback!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
