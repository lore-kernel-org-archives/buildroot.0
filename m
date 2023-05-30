Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CC21C77B7A
	for <buildroot@archiver.kernel.org>; Tue, 30 May 2023 07:49:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F26F641793;
	Tue, 30 May 2023 07:49:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F26F641793
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ykU_4Xorubly; Tue, 30 May 2023 07:49:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B45EC41765;
	Tue, 30 May 2023 07:49:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B45EC41765
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BC9661BF376
 for <buildroot@lists.busybox.net>; Tue, 30 May 2023 07:49:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9CFCA60F7D
 for <buildroot@lists.busybox.net>; Tue, 30 May 2023 07:49:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9CFCA60F7D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6Cr681r3gQTN for <buildroot@lists.busybox.net>;
 Tue, 30 May 2023 07:49:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93BAC611A0
Received: from smtpdh16-2.aruba.it (smtpdh16-2.aruba.it [62.149.155.101])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 93BAC611A0
 for <buildroot@buildroot.org>; Tue, 30 May 2023 07:49:46 +0000 (UTC)
Received: from [172.25.4.80] ([151.79.164.54])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 3u6wqnRcskWI33u6wqqe1G; Tue, 30 May 2023 09:49:42 +0200
Message-ID: <99176d5e-ba5c-9b31-34f8-2241f4933417@benettiengineering.com>
Date: Tue, 30 May 2023 09:49:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US, it
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
References: <20230528153156.1685512-1-dario.binacchi@amarulasolutions.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20230528153156.1685512-1-dario.binacchi@amarulasolutions.com>
X-CMAE-Envelope: MS4xfMIAqGOqh1y9uqrnwSCCIhMTpUJEO6nmGeHogffRRp64VOxm0MVEDyVTggSbXma6GhkDJQlA3Ap42rjlNOBohLybi7j/QZFl1zSpuzlTO12XAc4FXkKf
 4fvbfTptMJ2/KNgpjWxthumSrsDc5o+pjrtY3GXBQRB/TqKFH2I22QsnTnl8Liv435sfsFEA5+oAJbPY4CV3nDLr7EMQy2pczWRuozOUZ5SGb5bx8hM/i0o+
 ymknAM2gpuR9likwwJmZN4pR5qd/hxVWbHysy/R0r96a1ooU2ZP6se18JT6tfMT3I0QqmNxfYIC+8zNBUVbXHA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1685432982; bh=iLoA30VYkbydUxpzJHyKovaWwiV2w6ax+9ICXXZujPY=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=N66CzZ+LIdl1lyojtAA7g1P4KgP8t3E0iV5j+EEsT7CCcZFIBe4VmDITLN1hrFsau
 HRvbIGeiZnvJJ1d1S6Go1OhvXaBa1NjSdYti2gzqb6Az8o+Xdaoc+aeBPQV4A/+KHo
 5aLMlgrH0XxPKnHlyT1YEsEN8NwR2S3R2422hgcR+ll6lzsv4ufmTz0Dz/pP1UL2HT
 XH2fIEvvjEf6N2ecFTbli42kylKpPCB2byeLpcisOxtZNPWdJt8xR3nDXUQlkbuDuU
 79NaVbjzuRrhY3W8TJPEzBcA8IZUppLDxIibvMK875Jp7kVbUphd/V3iDcgBsbzLDd
 GK+0Ahn4H9GsA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=N66CzZ+L
Subject: Re: [Buildroot] [PATCH 1/1] configs/stm32f4xx_defconfig: off
 network utils from busybox
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
Cc: Christophe Priouzeau <christophe.priouzeau@foss.st.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Dario,

On 28/05/23 17:31, Dario Binacchi wrote:
> Kernel is built without network support, so network utils are useless.
> This has a positive impact on the size of busybox and xipImage, making
> them smaller.

good idea,

> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

I've built tested stm32f469_disco_sd_defconfig successfully, so:
Reviewed-by: Giulio Benetti <giulio.benetti@benettiegineering.com>

-- 
CEO/CTO@Benetti Engineering sas

> ---
>   .../common/stm32f4xx/busybox.fragment         | 21 +++++++++++++++++++
>   .../common/stm32f4xx/stm32-post-build.sh      |  3 +++
>   configs/stm32f429_disco_xip_defconfig         |  1 +
>   configs/stm32f469_disco_sd_defconfig          |  1 +
>   configs/stm32f469_disco_xip_defconfig         |  1 +
>   5 files changed, 27 insertions(+)
>   create mode 100644 board/stmicroelectronics/common/stm32f4xx/busybox.fragment
> 
> diff --git a/board/stmicroelectronics/common/stm32f4xx/busybox.fragment b/board/stmicroelectronics/common/stm32f4xx/busybox.fragment
> new file mode 100644
> index 000000000000..d0bf2cb99dbb
> --- /dev/null
> +++ b/board/stmicroelectronics/common/stm32f4xx/busybox.fragment
> @@ -0,0 +1,21 @@
> +# CONFIG_FEATURE_HWIB is not set
> +# CONFIG_HOSTNAME is not set
> +# CONFIG_DNSDOMAINNAME is not set
> +# CONFIG_FEATURE_HTTPD_PORT_DEFAULT is not set
> +# CONFIG_IFCONFIG is not set
> +# CONFIG_FEATURE_IFCONFIG_HW is not set
> +# CONFIG_FEATURE_IFCONFIG_BROADCAST_PLUS is not set
> +# CONFIG_IFUP is not set
> +# CONFIG_IFDOWN is not set
> +# CONFIG_IP is not set
> +# CONFIG_IPADDR is not set
> +# CONFIG_IPLINK is not set
> +# CONFIG_IPROUTE is not set
> +# CONFIG_NC is not set
> +# CONFIG_NETSTAT is not set
> +# CONFIG_PING is not set
> +# CONFIG_ROUTE is not set
> +# CONFIG_TC is not set
> +# CONFIG_TELNET is not set
> +# CONFIG_WGET is not set
> +# CONFIG_UDHCPC is not set
> diff --git a/board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh b/board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh
> index 2ac9c653c327..4fcce6150071 100755
> --- a/board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh
> +++ b/board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh
> @@ -1,4 +1,7 @@
>   #!/bin/sh
>   
> +# Busybox is built without network support
> +sed -i '/hostname/d' ${TARGET_DIR}/etc/inittab
> +
>   # Kernel is built without devpts support
>   sed -i '/^devpts/d' ${TARGET_DIR}/etc/fstab
> diff --git a/configs/stm32f429_disco_xip_defconfig b/configs/stm32f429_disco_xip_defconfig
> index 5640d9dc4d32..d4e000487a80 100644
> --- a/configs/stm32f429_disco_xip_defconfig
> +++ b/configs/stm32f429_disco_xip_defconfig
> @@ -14,6 +14,7 @@ BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="xipImage"
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
>   BR2_LINUX_KERNEL_INTREE_DTS_NAME="stm32f429-disco"
>   BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
> +BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES="board/stmicroelectronics/common/stm32f4xx/busybox.fragment"
>   # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
>   BR2_TARGET_ROOTFS_INITRAMFS=y
>   # BR2_TARGET_ROOTFS_TAR is not set
> diff --git a/configs/stm32f469_disco_sd_defconfig b/configs/stm32f469_disco_sd_defconfig
> index 662ce3b3d068..8b10bc674176 100644
> --- a/configs/stm32f469_disco_sd_defconfig
> +++ b/configs/stm32f469_disco_sd_defconfig
> @@ -14,6 +14,7 @@ BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="zImage"
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
>   BR2_LINUX_KERNEL_INTREE_DTS_NAME="stm32f469-disco"
>   BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
> +BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES="board/stmicroelectronics/common/stm32f4xx/busybox.fragment"
>   # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
>   BR2_TARGET_ROOTFS_EXT2=y
>   BR2_TARGET_ROOTFS_EXT2_SIZE="32M"
> diff --git a/configs/stm32f469_disco_xip_defconfig b/configs/stm32f469_disco_xip_defconfig
> index ae2780556ad1..e362a9985116 100644
> --- a/configs/stm32f469_disco_xip_defconfig
> +++ b/configs/stm32f469_disco_xip_defconfig
> @@ -14,6 +14,7 @@ BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="xipImage"
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
>   BR2_LINUX_KERNEL_INTREE_DTS_NAME="stm32f469-disco"
>   BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
> +BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES="board/stmicroelectronics/common/stm32f4xx/busybox.fragment"
>   # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
>   BR2_TARGET_ROOTFS_INITRAMFS=y
>   # BR2_TARGET_ROOTFS_TAR is not set


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
