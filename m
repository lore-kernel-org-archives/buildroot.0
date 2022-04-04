Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1F2DC433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 17:58:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 63D4940520;
	Mon,  4 Apr 2022 17:58:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mexMTF1RBBuN; Mon,  4 Apr 2022 17:58:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5E6254017C;
	Mon,  4 Apr 2022 17:58:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BE51F1BF35C
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 17:58:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BC6C981934
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 17:58:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aXxwImLss1Tt for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 17:58:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B57C7817EB
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 17:58:52 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id r13so21615718ejd.5
 for <buildroot@buildroot.org>; Mon, 04 Apr 2022 10:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=OUMal9x6SSeXFHLhTz8hGBiJIJXdrINvZlD51Wijim4=;
 b=TcvW02j27/nVb+HtyrqFGS4t6Y90v4THh/nXhK1rsmGqPWUUFKK89LXdt77A4kFJm3
 j509FLp3JN+ZZtp7xA7HeVuJ6eWbTwcavGbrYyC9+qDFjXN0Nuq/HC33z6QWKPO7JM9B
 DttSWHKzcCKBvPxTaKaZDhFFbuLVuqcp0f+04TBXSpPQy6tTUsoVugNEkarY4+i1yKnj
 hPr6xBrARWXHumVMvfRELYwIV9k8bvgMNyLVAD3QPZhPcITKOtRnhvVy/p5m+rUTDbbv
 scCTOgRQQkV3mdH1yBjCnkP3cDx6SfDtZEeqeNsQwUZzfBG4/l/gkScjmrlX/+4FZxH5
 xUoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=OUMal9x6SSeXFHLhTz8hGBiJIJXdrINvZlD51Wijim4=;
 b=t2cVrlNp1523PDjeRUmyR1/JIVEW1rW7JwJvG6PvmmxfOt1gkXw9mAtpi8pMHRQRo+
 ZU7SZwaOLAHHoHeS0CDpY1FsW4TyvedmWJ0OU7qVBlqeqOfkCPI9ffekJ5RK76mCtLqk
 T7+pKxvBv4+lFH/0YlsbCMXdSLA1WFf8BtGvvtMeb5DFGAIr3MMWThgMJZVbhcL004Dv
 ULGmO4qN2GwlXDubzTuM0yYgCYvUcRRtTO2qA9MBOCleHOWlhhKPhJ9kzDp7SAJ0THAX
 +ZAclHqaYSTNS5tS8/7JDStH1NKcX5n8HFOWwT2G6Gvw8TNafhczlHx3LpP0RwgDO7lH
 bqpQ==
X-Gm-Message-State: AOAM531eXrtF4HZNlu/DcQR+M91ZdEpxeKA38KiuRJj9UP/8bRzf6qf9
 Xdjx9Q0gYQbNBn9e/gW6TwNwzg==
X-Google-Smtp-Source: ABdhPJzPorUgKlXFpwjELadvepxbhOJEo5hVS2rQT29dkANc8rMx+FI5S+NYytCYmOJxRYyvP6j0Xg==
X-Received: by 2002:a17:907:9614:b0:6e7:9ff0:38d0 with SMTP id
 gb20-20020a170907961400b006e79ff038d0mr1227766ejc.313.1649095130612; 
 Mon, 04 Apr 2022 10:58:50 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 k23-20020a1709062a5700b006ccd8fdc300sm4525205eje.180.2022.04.04.10.58.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Apr 2022 10:58:49 -0700 (PDT)
Message-ID: <18ef2499-bc59-7403-84d9-2cee63998ef7@mind.be>
Date: Mon, 4 Apr 2022 19:58:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Neal Frager <neal.frager@amd.com>, buildroot@buildroot.org
References: <20220331192030.3871720-1-neal.frager@amd.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220331192030.3871720-1-neal.frager@amd.com>
Subject: Re: [Buildroot] [PATCH v1 1/1] configs/zynq_qmtech_defconfig: move
 post-image.sh to board/qmtech/zynq
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 31/03/2022 21:20, Neal Frager via buildroot wrote:
> This patch creates a post-image.sh in the board/qmtech/zynq
> directory, so that the zynq_qmtech_defconfig can be updated
> independently from the other zynq defconfigs.

  Since you're not actually making any change that makes a difference between 
the qmtech and other zynq boards, I don't see the point. In the other mail you 
mention something like "because the device tree is not in mainline", but that 
doesn't really change anything, does it? Other then maybe the device tree having 
a different name, but that's already handled by the script.

  Instead of forking, it would be preferable to still use the same script and 
genimage but just make it configurable.

  That said, making things configurable may also unnecessarily complicate 
things. It's a difficult balance to make. And impossible for me to evaluate 
without seeing what changes need to be made to the other zynq scripts.

  So, for now I've marked it as Rejected. Feel free to re-post as part of a 
series that also updates the zynq defconfigs, or replace it with a patch that 
makes board/zynq/genimage.cfg configurable in the way it needs to be.

  Regards,
  Arnout


> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
>   board/qmtech/zynq/genimage.cfg  | 27 +++++++++++++++++++++++++++
>   board/qmtech/zynq/post-image.sh | 13 +++++++++++++
>   configs/zynq_qmtech_defconfig   |  2 +-
>   3 files changed, 41 insertions(+), 1 deletion(-)
>   create mode 100644 board/qmtech/zynq/genimage.cfg
>   create mode 100755 board/qmtech/zynq/post-image.sh
> 
> diff --git a/board/qmtech/zynq/genimage.cfg b/board/qmtech/zynq/genimage.cfg
> new file mode 100644
> index 0000000000..67baca795e
> --- /dev/null
> +++ b/board/qmtech/zynq/genimage.cfg
> @@ -0,0 +1,27 @@
> +image boot.vfat {
> +	vfat {
> +		files = {
> +			"boot.bin",
> +			"u-boot.img",
> +			"devicetree.dtb",
> +			"uImage"
> +		}
> +
> +		file uramdisk.image.gz {
> +			image = "rootfs.cpio.uboot"
> +		}
> +	}
> +
> +	size = 32M
> +}
> +
> +image sdcard.img {
> +	hdimage {
> +	}
> +
> +	partition boot {
> +		partition-type = 0xC
> +		bootable = "true"
> +		image = "boot.vfat"
> +	}
> +}
> diff --git a/board/qmtech/zynq/post-image.sh b/board/qmtech/zynq/post-image.sh
> new file mode 100755
> index 0000000000..54c5493b4e
> --- /dev/null
> +++ b/board/qmtech/zynq/post-image.sh
> @@ -0,0 +1,13 @@
> +#!/bin/sh
> +
> +# By default U-Boot loads DTB from a file named "devicetree.dtb", so
> +# let's use a symlink with that name that points to the *first*
> +# devicetree listed in the config.
> +
> +FIRST_DT=$(sed -n \
> +           's/^BR2_LINUX_KERNEL_INTREE_DTS_NAME="\([a-z0-9\-]*\).*"$/\1/p' \
> +           ${BR2_CONFIG})
> +
> +[ -z "${FIRST_DT}" ] || ln -fs ${FIRST_DT}.dtb ${BINARIES_DIR}/devicetree.dtb
> +
> +support/scripts/genimage.sh -c board/qmtech/zynq/genimage.cfg
> diff --git a/configs/zynq_qmtech_defconfig b/configs/zynq_qmtech_defconfig
> index 4db3f68b1f..dc3b22c876 100644
> --- a/configs/zynq_qmtech_defconfig
> +++ b/configs/zynq_qmtech_defconfig
> @@ -5,7 +5,7 @@ BR2_ARM_ENABLE_VFP=y
>   BR2_GLOBAL_PATCH_DIR="board/qmtech/zynq/patches"
>   BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
>   BR2_TARGET_GENERIC_GETTY_PORT="ttyPS0"
> -BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qmtech/zynq/post-image.sh"
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
>   BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xilinx-v2019.2.01)/linux-xilinx-v2019.2.01.tar.gz"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
