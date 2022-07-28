Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C321C04A68
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 23:04:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6257B4063C;
	Thu, 28 Jul 2022 23:04:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6257B4063C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id foeIV2e6gzIS; Thu, 28 Jul 2022 23:04:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5D6B240190;
	Thu, 28 Jul 2022 23:04:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D6B240190
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CB3811BF360
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 23:04:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A599F40190
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 23:04:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A599F40190
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S51ifStOm-Pf for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 23:04:44 +0000 (UTC)
X-Greylist: delayed 00:07:02 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E1FBE400DB
Received: from smtpcmd12131.aruba.it (smtpcmd12131.aruba.it [62.149.156.131])
 by smtp2.osuosl.org (Postfix) with ESMTP id E1FBE400DB
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 23:04:43 +0000 (UTC)
Received: from [192.168.50.173] ([146.241.73.23])
 by Aruba Outgoing Smtp  with ESMTPSA
 id HCRnoUWUmPF2eHCRnoxFEo; Fri, 29 Jul 2022 00:57:39 +0200
Message-ID: <46cc99e2-004a-42d5-0967-12f4ed7b03ac@benettiengineering.com>
Date: Fri, 29 Jul 2022 00:57:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.0
Content-Language: en-US
To: Kelvin Zhang <kelvin.zhang@amlogic.com>, buildroot@buildroot.org
References: <20220704053911.2840122-1-kelvin.zhang@amlogic.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220704053911.2840122-1-kelvin.zhang@amlogic.com>
X-CMAE-Envelope: MS4xfIKtcOD699DJqVPkRtlT+8AwGn82S7zbYSHR30SSuLRbSFuPjh60MY+mL2fP2ENfrEvIuvWUE+bgJMY/QjDjopAmiAQnkl64BQdKn/vuWeeI9zMKciw8
 fWwq9iFTbPuQz28Xq+qs43a8Rw5+smAibgDgGUZAeXOwsMOngad/fbAa2y1dcMMLbsFMk97uiw15+BSpFMeGdCmyTPBmWSObJnc6vxgCR8aerZVxgWqBBoqd
 wqkubny5LeEqNQwNdFDYZ9HmlIv/Nb++X10xFpVcyO4XuxZpOfs+YygscN62y2JU
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1659049059; bh=YbGdy0sZU7UATtlo67pkasER/4oafurD8fh+aQxHbZw=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=Bgq8z7GXTXZLOaPydqfzoKzpmjfHSGzSi3cVkKcGwoPHYn7q4WHPdDWUqXLT7+8ds
 dJo8ey7LY5C4i+Dd1nzL2yES7+q/9E+Ex0t+GNO9YD7ihBjHscfTtaocyxVT2V7qf0
 GA2cZ6oyZ2XH2Qc/tTo9V+RkX4+4p+b936POwAmiQDaYEQ/QlllaKio+Bv1klJ8PjY
 TWzUMc2IoYIU015jCVDKtrDVrS6EqQJqoX7GOWE6VW4ZZ8P9pxQ/WyRh7+rfQzrJor
 bE3bRKmXCj6na2r4pwj9DK9DQd+Cs3X+sdfcq/g9DrSrw6JZ+VQ4r9YOsduuoVoZPe
 7IXiJm7KFXTOw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=Bgq8z7GX
Subject: Re: [Buildroot] [PATCH 1/1] configs/meson-g12a-u212: new board
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
Cc: Victor Wan <victor.wan@amlogic.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Kelvin,

On 04/07/22 07:39, Kelvin Zhang wrote:
> This commit adds a new defconfig for the Amlogic U212 board.
> 
> U212 is a reference board manufactured by Amlogic
> with the following specifications:
> 
>    - Amlogic S905X2 Quad-Core ARM Cortex-A53 SoC
>    - 2GB DDR3 SDRAM
>    - 16GB eMMC
>    - 10/100/1000 Ethernet MAC (10/100 Internal PHY)
>    - 1x USB2 + 1x USB3
>    - SDcard
>    - Audio HAT Connector / SPDIF
>    - HDMI 2.1
>    - Infrared receiver
>    - SDIO WiFi Module
> 
> Amlogic S905X2 SoC is designed for smart OTT/IP STB,
> which belongs to Amlogic G12A SoC family.
> 
> More info about this chip:
> https://www.amlogic.com/#Products/396/index.html

This is a good commit log, but you should provide a readme.txt file
describing how to build and program the sd-card(I presume).

> Signed-off-by: Kelvin Zhang <kelvin.zhang@amlogic.com>
> ---
>   configs/meson-g12a-u212_defconfig | 10 ++++++++++
>   1 file changed, 10 insertions(+)
>   create mode 100644 configs/meson-g12a-u212_defconfig
> 
> 
> base-commit: 23e1e04d5448e17da7ec0a65199740dodad1cf923a0
> 
> diff --git a/configs/meson-g12a-u212_defconfig b/configs/meson-g12a-u212_defconfig
> new file mode 100644
> index 0000000000..a933b1f8f3
> --- /dev/null
> +++ b/configs/meson-g12a-u212_defconfig
> @@ -0,0 +1,10 @@
> +BR2_aarch64=y
> +BR2_TOOLCHAIN_BUILDROOT_CXX=y

Why is this ^^^ option needed?

> +BR2_GCC_ENABLE_LTO=y

I would let the user to decide if using LTO or not, so please remove it.

> +BR2_LINUX_KERNEL=y

Here you should specify the Linux version, otherwise every time
Buildroot changes the latest Linux version it will be used, but this
way the board won't be stable at all.
So add:
BR2_LINUX_KERNEL_CUSTOM_VERSION=y
BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.57" (for example)

> +BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
> +BR2_LINUX_KERNEL_XZ=y
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="amlogic/meson-g12a-u200"
> +BR2_TARGET_ROOTFS_INITRAMFS=y

Is initramfs mandatory for the system? If not I would let the user to
decide if building the initramfs or not.

> +BR2_TARGET_ROOTFS_TAR_XZ=y

I see u-boot or other bootloader is missing, so please explain how boot
process works in readme.txt file I've requested you above, or even
better you could provide u-boot support too. It would be good also to
have a final sd-card .img file that here is missing.

Otherwise, if this defconfig is only meant for building Linux and the
rootfs then please specify it in the commit log.

I've tried to build this defconfig with Buildroot's utils/docker-run and
you're missing:
BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
that lead to linux build failure with latest Linux 5.17.15, so please,
when specifying the custom linux version, check with utils/docker-run
that all host dependencies are satisfied.

After enabling BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL it built fine.

Wait for V2 patch then.

Thank you!

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
