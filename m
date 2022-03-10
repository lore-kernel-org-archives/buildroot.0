Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B755C433F5
	for <buildroot@archiver.kernel.org>; Thu, 10 Mar 2022 20:45:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 209FB8479B;
	Thu, 10 Mar 2022 20:45:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zroD7MB6fCfE; Thu, 10 Mar 2022 20:45:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 163CC84776;
	Thu, 10 Mar 2022 20:45:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 682041BF331
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 20:45:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 56CD684776
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 20:45:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0kl_9pRVjizI for <buildroot@lists.busybox.net>;
 Thu, 10 Mar 2022 20:45:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 874D5840C7
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 20:45:28 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id dr20so14641025ejc.6
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 12:45:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=MD+TmyUfiXc9C7WnIJ6/S8XtJ8yrPwnr1dSF1oxfwkU=;
 b=az0wvsDC6iPwW1gfpVd6+lGtpHdYGw1kPAuNsbB+jpnkmWHATDzFmEtI8Ng/UuQ1Mb
 TPsTT2zDzzMPw9jpUP9fdkd50zP7DXiQlxIFF0py2Vy+IxrwsCR3i+Q53Ef9vt1DA/yR
 ONuVZWDXWQUDCLJ162Ubj8636Qdj6P6yh0qnpplzXR/aLt1NbmuaKJ2kupWeoI/x343j
 ALub85SJ6fCvuMj6Ws1WUAvpX45FRmqDkDPHictleUwJULUMoyTV7s1WyM4Mh++rMS5C
 yW3KAFF+Rde+2nn83SFles+Vie4Yz1mW7IRrGmqd3YLJzH+BY/YP/65B38SPGhVcA7d1
 M03Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=MD+TmyUfiXc9C7WnIJ6/S8XtJ8yrPwnr1dSF1oxfwkU=;
 b=0kGwl2sE8fH77ciQOCmoCOWP2iXMHm0l0BV/s2blI4a2dfmAGg8IWCLvY8fdTSim9f
 hvr4RpVuDZNfBqNmUb0zDDm5kY/n98ZnmeVix1vAAOZ4pFR980FpnWJcN7+voe2TsMif
 xpNas3NZFuesZ4XDpAM6otjucEbcYJZozYSow1Hjmvx6Ie5ddD7epXcSJ10wlTFS1IT0
 m5fvJsDlw99IapTJ1qEYJUQxNz7BFFdBmBqE+8n0GCYnGYNxrcrdkGGvrgu077EWz9WN
 2AROlAqGYkS00X88bd77YQxGM6gkpvwUOqj3egKOKrAbtKHnQBKx4c7LJzrJsPG7kaUP
 3xIw==
X-Gm-Message-State: AOAM532p6ygXn0pzFqN7/DdOmrNqgaoOUzl7vHfVUpcP1q6jBhnpZykh
 LG5W5UylpCo6Or5BxIuSavcKSPPFWcsW2A==
X-Google-Smtp-Source: ABdhPJyt7ckBYbw4HUkRKY1vR3umsapy8jP6KbGOGskkltFm2jgm8QCDRDvX6mWxWnpiKO+oNsRklg==
X-Received: by 2002:a17:907:6d0e:b0:6d7:c85:5bf5 with SMTP id
 sa14-20020a1709076d0e00b006d70c855bf5mr5813678ejc.31.1646945126507; 
 Thu, 10 Mar 2022 12:45:26 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 e5-20020a170906374500b006d5825520a7sm2178984ejc.71.2022.03.10.12.45.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Mar 2022 12:45:26 -0800 (PST)
Message-ID: <06ac030e-ecab-f78b-5137-08d1237337d8@mind.be>
Date: Thu, 10 Mar 2022 21:45:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Michael Durrant <mdurrant@arcturusnetworks.com>,
 buildroot <buildroot@buildroot.org>
References: <20220222153741.15815-1-mdurrant@arcturusnetworks.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220222153741.15815-1-mdurrant@arcturusnetworks.com>
Subject: Re: [Buildroot] [PATCH v5] board/arcturus/aarch64-ucls1012a: bump
 u-boot and kernel version
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 22/02/2022 16:37, Michael Durrant wrote:
> - Bump Linux to version 5.4.137
> - Bump U-Boot to add new targets, version remains the same
> - Drop BR2_ROOTFS_OVERLAY and remove S09modload script because it was
>    only used by PFE and now PFE is loaded directly by the kernel
> - Use Image.gz instead of Image to have a compressed kernel
> - Rename ucls1012a.its to br2-ucls1012a.its since post-build.sh and
>    post-image.sh use different name. This fixes the bug that didn't
>    allow the creation of the part0-000000.itb file.
> 
> Signed-off-by: Oleksandr Zhadan <oleks@arcturusnetworks.com>
> Signed-off-by: Michael Durrant <mdurrant@arcturusnetworks.com>
> Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Tested-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> V1->V2:
> - Bump the kernel to "Linux version 5.4.137"
> - Bootloader version is still "U-Boot 2019.10" but new targets added.
> - Remove the /etc/init.d/S09modload script to load the pfe firmware
>    module because now the pfe firmware module is loaded by the kernel
> - New compressed Image.gz is used
> V2->V3:
> - Moved SoB to top of patch
> - The use of Image.gz replace Image to force use of compression.
> - Our scripts use br2-ucls1012a.its in error ucls1012a.its was used
>    in original readme.
> - Removing extra newline
> - The NXP Packet Forward Engine (PFE) firmware loader was the only
>    file used in the overlay.  As the PFE is now loaded directly by
>    the kernel the BR2_ROOTFS_OVERLAY script has been removed.
> V3->V4:
> - Improved commit log by listing all the changed as suggested by Giulio.
> - Updated header version comment in defconfig to reflect 5.4 series.
> V4->V5:
> - Adding Reviewed-by & Tested-by by Giulio.
> - Wrapping commit log.
> ---
>   board/arcturus/aarch64-ucls1012a/post-build.sh     |  1 -
>   board/arcturus/aarch64-ucls1012a/readme.txt        |  4 ++--
>   .../rootfs_overlay/etc/init.d/S09modload           | 14 --------------
>   configs/arcturus_ucls1012a_defconfig               | 10 +++++-----
>   4 files changed, 7 insertions(+), 22 deletions(-)
>   delete mode 100755 board/arcturus/aarch64-ucls1012a/rootfs_overlay/etc/init.d/S09modload
> 
> diff --git a/board/arcturus/aarch64-ucls1012a/post-build.sh b/board/arcturus/aarch64-ucls1012a/post-build.sh
> index f8ba78095f..372df59c61 100755
> --- a/board/arcturus/aarch64-ucls1012a/post-build.sh
> +++ b/board/arcturus/aarch64-ucls1012a/post-build.sh
> @@ -1,5 +1,4 @@
>   #!/bin/sh
>   
>   mkdir -p ${TARGET_DIR}/lib/firmware
> -cp -f ${BUILD_DIR}/linux-custom/firmware/ppfe/* ${TARGET_DIR}/lib/firmware/
>   cp -f ${BUILD_DIR}/linux-custom/br2-ucls1012a.its ${BINARIES_DIR}/
> diff --git a/board/arcturus/aarch64-ucls1012a/readme.txt b/board/arcturus/aarch64-ucls1012a/readme.txt
> index 483d5e9aef..b486ecebc7 100644
> --- a/board/arcturus/aarch64-ucls1012a/readme.txt
> +++ b/board/arcturus/aarch64-ucls1012a/readme.txt
> @@ -24,13 +24,13 @@ After building, you should obtain this tree:
>   
>       output/images/
>       +-- arc-ucls1012a.dtb
> -    +-- Image
> +    +-- Image.gz
>       +-- part0-000000.itb
>       +-- rootfs.cpio
>       +-- rootfs.cpio.gz
>       +-- rootfs.tar
>       +-- u-boot.bin
> -    +-- ucls1012a.its
> +    +-- br2-ucls1012a.its
>   
>   Flashing
>   --------
> diff --git a/board/arcturus/aarch64-ucls1012a/rootfs_overlay/etc/init.d/S09modload b/board/arcturus/aarch64-ucls1012a/rootfs_overlay/etc/init.d/S09modload
> deleted file mode 100755
> index c87ffda14f..0000000000
> --- a/board/arcturus/aarch64-ucls1012a/rootfs_overlay/etc/init.d/S09modload
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -#!/bin/sh
> -#
> -case "$1" in
> -       start)
> -                modprobe pfe
> -                ;;
> -        stop)
> -                ;;
> -        restart|reload)
> -                ;;
> -        *)
> -                echo "Usage: $0 {start|stop|restart}"
> -                exit 1
> -esac
> diff --git a/configs/arcturus_ucls1012a_defconfig b/configs/arcturus_ucls1012a_defconfig
> index fd33ebf1f6..124cc3ff94 100644
> --- a/configs/arcturus_ucls1012a_defconfig
> +++ b/configs/arcturus_ucls1012a_defconfig
> @@ -1,22 +1,22 @@
>   # Architecture
>   BR2_aarch64=y
>   
> -# Linux headers same as kernel, a 4.14 series
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_14=y
> +# Linux headers same as kernel, a 5.4 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
>   
>   # System settings
>   BR2_TARGET_GENERIC_HOSTNAME="ucls1012a"
>   BR2_TARGET_GENERIC_ISSUE="Welcome to uCLS1012A-SOM"
>   BR2_SYSTEM_DHCP="eth0"
> -BR2_ROOTFS_OVERLAY="board/arcturus/aarch64-ucls1012a/rootfs_overlay"
>   BR2_ROOTFS_POST_BUILD_SCRIPT="board/arcturus/aarch64-ucls1012a/post-build.sh"
>   BR2_ROOTFS_POST_IMAGE_SCRIPT="board/arcturus/aarch64-ucls1012a/post-image.sh"
>   
>   # Kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,ArcturusNetworks,uCLS1012A-kernel,v.20.31)/linux-v.20.31.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,ArcturusNetworks,uCLS1012A-kernel,v.22.06)/linux-v.22.06.tar.gz"
>   BR2_LINUX_KERNEL_DEFCONFIG="ucls1012a"
> +BR2_LINUX_KERNEL_IMAGEGZ=y
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
>   BR2_LINUX_KERNEL_INTREE_DTS_NAME="arcturus/arc-ucls1012a"
>   
> @@ -28,7 +28,7 @@ BR2_TARGET_ROOTFS_CPIO_GZIP=y
>   BR2_TARGET_UBOOT=y
>   BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>   BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
> -BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,ArcturusNetworks,uCLS1012A-uboot,v.20.31)/uboot-v.20.31.tar.gz"
> +BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,ArcturusNetworks,uCLS1012A-uboot,v.22.06)/uboot-v.22.06.tar.gz"
>   BR2_TARGET_UBOOT_BOARD_DEFCONFIG="UCLS1012A_QSPI128"
>   
>   # Tools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
