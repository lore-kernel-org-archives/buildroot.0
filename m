Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A052DC433F5
	for <buildroot@archiver.kernel.org>; Thu, 14 Apr 2022 19:54:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47FCB81865;
	Thu, 14 Apr 2022 19:54:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NcQdkGR7cpaG; Thu, 14 Apr 2022 19:54:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B16A8176B;
	Thu, 14 Apr 2022 19:54:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2BEB91BF290
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 19:54:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 17B298176B
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 19:54:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q0dW2NmggAfU for <buildroot@lists.busybox.net>;
 Thu, 14 Apr 2022 19:54:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B6E928174A
 for <buildroot@buildroot.org>; Thu, 14 Apr 2022 19:54:23 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id b15so7686509edn.4
 for <buildroot@buildroot.org>; Thu, 14 Apr 2022 12:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=UsaXa2/dznGpfrmhkrzIAhi3/ez1dBrfbcfCW6VzzHk=;
 b=SwuX3E3nT4hDSRoiT8MQZRbhuJbaSSylZ/ZK4ryDc2ElGqpVOITPRAtnDhwo6B2v08
 MYSNXFhmKRZ1GJydrAvfEop3n73qHQZvtDx0UUL0K3L9nk92CGVQzEXmHPR2Kr2FViRG
 xKBLQFuga5XL3NkkVlI8JdF9ropQCgIuILOtF3YiT2R5EW0VD9aZ/WQcOtCbBoDoX8sr
 cDwz8hn8PvhthuZb1AmM3wzpDqJxo3eurjIgm049MychexpM8/zWoaHwKl+SDB0rZxp9
 njea41a3eO+kqSK4mjVfVAq+Y+3sjG9IenAorDRc7Tc+ISgHgTUhou/l7/dLBMTM57QO
 DERA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=UsaXa2/dznGpfrmhkrzIAhi3/ez1dBrfbcfCW6VzzHk=;
 b=ACSnuRxLZSVljLX3SSITd/hnZ/bUJec39gLXSZLhbyci6DQA7D2iD2bMBMJcB4ABTx
 Id83XcZtM7HcFRmXB1668qSBqdN/Ra3E59pXHDUyOLv8f4liTeWeTygTYBRYIavRyrgX
 2VkatLJUv3N2xwA6aE64hbmXaY7uMfYJIfoww5O0de5Nf3JAIPGfdqukxmGaKGehYGmN
 Snr6rBkcEUQ4zyRsdNhT6qr1D5tmKawHIJXOQMBJzKh494Zf5fLcQ2v5LJ2onQQ3inBF
 8YKZyEIUoaROj6onwo9+/ZWN886mHwTEAgSHZf5dzyeqzNAFu+laPVq3va+Ushy9HyEv
 Dmzg==
X-Gm-Message-State: AOAM530eSebVcc27z16sn+zJf0SFzXNmabscbGpptIEtUTVyvZN2MU8h
 92WlezSp+zK5WOwGqlAefMSw+vIU7oTHJg==
X-Google-Smtp-Source: ABdhPJxqksIZ/Wb32XtrZJCryxw69d6Hd4KpGZvleuqZUrz6CYDbqTShg/bGRnsVCC7HZlPRlWsEKg==
X-Received: by 2002:a05:6402:1d4d:b0:421:aa8b:3124 with SMTP id
 dz13-20020a0564021d4d00b00421aa8b3124mr2187219edb.383.1649966061734; 
 Thu, 14 Apr 2022 12:54:21 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 h22-20020a056402281600b004206bd9d0c6sm1525715ede.8.2022.04.14.12.54.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Apr 2022 12:54:21 -0700 (PDT)
Message-ID: <23538a24-16fe-5302-0cba-c97e67a8ab97@mind.be>
Date: Thu, 14 Apr 2022 21:54:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Neal Frager <neal.frager@amd.com>, buildroot@buildroot.org
References: <20220408145531.1641356-1-neal.frager@amd.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220408145531.1641356-1-neal.frager@amd.com>
Subject: Re: [Buildroot] [PATCH v1 1/4] configs/zynq_zc706_defconfig: bump
 to Xilinx 2021.2
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
Cc: luca@lucaceresoli.net, giulio.benetti@benettiengineering.com, ju.o@free.fr
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 08/04/2022 16:55, Neal Frager via buildroot wrote:
> This patch bumps configs/zynq_zc706_defconfig to Xilinx software release 2021.2
> which includes the following updates:
>    - U-Boot bumped to 2021.01
>    - Linux bumped to 5.10
>    - rootfs changed from CPIO to EXT4
>    - extlinux.conf for distro boot support
> 
> This patch has been build and run tested on a ZC706 evaluation board.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
>   board/zynq/extlinux.conf        |  4 ++++
>   board/zynq/genimage.cfg         | 11 ++++++++---
>   board/zynq/post-build.sh        |  8 ++++++++
>   board/zynq/post-image.sh        | 14 ++++++++------
>   board/zynq/zc706/uboot.fragment |  1 +
>   configs/zynq_zc706_defconfig    | 20 +++++++++++---------
>   6 files changed, 41 insertions(+), 18 deletions(-)
>   create mode 100644 board/zynq/extlinux.conf
>   create mode 100755 board/zynq/post-build.sh
>   create mode 100644 board/zynq/zc706/uboot.fragment
> 
> diff --git a/board/zynq/extlinux.conf b/board/zynq/extlinux.conf
> new file mode 100644
> index 0000000000..b9345906e6
> --- /dev/null
> +++ b/board/zynq/extlinux.conf
> @@ -0,0 +1,4 @@
> +label linux
> +  kernel /uImage
> +  devicetree /system.dtb
> +  append console=ttyPS0,115200 root=/dev/mmcblk0p2 rw rootwait
> diff --git a/board/zynq/genimage.cfg b/board/zynq/genimage.cfg
> index 67baca795e..78eb9275dd 100644
> --- a/board/zynq/genimage.cfg
> +++ b/board/zynq/genimage.cfg
> @@ -3,12 +3,12 @@ image boot.vfat {
>   		files = {
>   			"boot.bin",
>   			"u-boot.img",
> -			"devicetree.dtb",
> +			"system.dtb",
>   			"uImage"
>   		}
>   
> -		file uramdisk.image.gz {
> -			image = "rootfs.cpio.uboot"
> +		file extlinux/extlinux.conf {
> +			image = extlinux.conf
>   		}
>   	}
>   
> @@ -24,4 +24,9 @@ image sdcard.img {
>   		bootable = "true"
>   		image = "boot.vfat"
>   	}
> +
> +	partition rootfs {
> +		partition-type = 0x83
> +		image = "rootfs.ext4"
> +	}
>   }
> diff --git a/board/zynq/post-build.sh b/board/zynq/post-build.sh
> new file mode 100755
> index 0000000000..9fd8bbf2c8
> --- /dev/null
> +++ b/board/zynq/post-build.sh
> @@ -0,0 +1,8 @@
> +#!/bin/sh
> +
> +# genimage will need to find the extlinux.conf
> +# in the binaries directory
> +
> +BOARD_DIR="$(dirname $0)"
> +
> +install -m 0644 -D $BOARD_DIR/extlinux.conf $BINARIES_DIR/extlinux.conf
> diff --git a/board/zynq/post-image.sh b/board/zynq/post-image.sh
> index 0cf92e0aa9..bf88aa7cd1 100755
> --- a/board/zynq/post-image.sh
> +++ b/board/zynq/post-image.sh
> @@ -1,13 +1,15 @@
>   #!/bin/sh
>   
> -# By default U-Boot loads DTB from a file named "devicetree.dtb", so
> +# By default U-Boot loads DTB from a file named "system.dtb", so
>   # let's use a symlink with that name that points to the *first*
>   # devicetree listed in the config.
>   
> -FIRST_DT=$(sed -n \
> -           's/^BR2_LINUX_KERNEL_INTREE_DTS_NAME="\([a-z0-9\-]*\).*"$/\1/p' \
> -           ${BR2_CONFIG})
> +FIRST_DT=$(sed -nr \
> +               -e 's|^BR2_LINUX_KERNEL_INTREE_DTS_NAME="([-_/[:alnum:]\\.]*).*"$|\1|p' \
> +               ${BR2_CONFIG})
>   
> -[ -z "${FIRST_DT}" ] || ln -fs ${FIRST_DT}.dtb ${BINARIES_DIR}/devicetree.dtb
> +[ -z "${FIRST_DT}" ] || ln -fs ${FIRST_DT}.dtb ${BINARIES_DIR}/system.dtb
>   
> -support/scripts/genimage.sh -c board/zynq/genimage.cfg
> +BOARD_DIR="$(dirname $0)"
> +
> +support/scripts/genimage.sh -c $BOARD_DIR/genimage.cfg
> diff --git a/board/zynq/zc706/uboot.fragment b/board/zynq/zc706/uboot.fragment
> new file mode 100644
> index 0000000000..ad5efa6204
> --- /dev/null
> +++ b/board/zynq/zc706/uboot.fragment
> @@ -0,0 +1 @@
> +CONFIG_DEFAULT_DEVICE_TREE="zynq-zc706"
> diff --git a/configs/zynq_zc706_defconfig b/configs/zynq_zc706_defconfig
> index e8019177d2..6c2a858f14 100644
> --- a/configs/zynq_zc706_defconfig
> +++ b/configs/zynq_zc706_defconfig
> @@ -2,26 +2,28 @@ BR2_arm=y
>   BR2_cortex_a9=y
>   BR2_ARM_ENABLE_NEON=y
>   BR2_ARM_ENABLE_VFP=y
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
> -BR2_TARGET_GENERIC_GETTY_PORT="ttyPS0"
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
>   BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
>   BR2_LINUX_KERNEL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xilinx-v2017.3)/linux-xilinx-v2017.3.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/Xilinx/linux-xlnx.git"

  This is not so nice, we prefer the tarball download (it's a lot faster if the 
repo has never been cloned before, and not much slower if the git repo was 
already cloned; in addition, it's subject to github rate limiting).

> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="xlnx_rebase_v5.10_2021.2"
>   BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
>   BR2_LINUX_KERNEL_UIMAGE=y
>   BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
>   BR2_LINUX_KERNEL_INTREE_DTS_NAME="zynq-zc706"
> -BR2_TARGET_ROOTFS_CPIO=y
> -BR2_TARGET_ROOTFS_CPIO_GZIP=y
> -BR2_TARGET_ROOTFS_CPIO_UIMAGE=y
> +BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
>   BR2_TARGET_UBOOT=y
>   BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>   BR2_TARGET_UBOOT_CUSTOM_GIT=y
>   BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/Xilinx/u-boot-xlnx.git"

  Actually you could switch this to tarball as well.

  Regards,
  Arnout


> -BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="xilinx-v2018.2"
> -BR2_TARGET_UBOOT_BOARD_DEFCONFIG="zynq_zc706"
> +BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="xlnx_rebase_v2021.01_2021.2"
> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynq_virt"
> +BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/zynq/zc706/uboot.fragment"
>   BR2_TARGET_UBOOT_NEEDS_DTC=y
>   BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
>   BR2_TARGET_UBOOT_FORMAT_IMG=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
