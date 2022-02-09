Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E606CC433EF
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 22:54:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6A14940523;
	Wed,  9 Feb 2022 22:54:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AfOPGBWMYbOY; Wed,  9 Feb 2022 22:54:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1B36D40538;
	Wed,  9 Feb 2022 22:54:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 045091BF3F0
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 22:54:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E4032403A7
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 22:54:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id frq5oZDCas7T for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 22:54:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0986.aruba.it (smtpcmd0986.aruba.it [62.149.156.86])
 by smtp2.osuosl.org (Postfix) with ESMTP id 38E3E405C5
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 22:54:32 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id Hvr5nYzCuks1JHvr5nJcm1; Wed, 09 Feb 2022 23:54:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644447271; bh=LqEAOx7d3WYOTKpmzhlEhecH3jwnYcQG1Lu9cdtnRkg=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=mYvuwbloybqhx6pWgjD9L3MntYYoFn0snY8l3OXQxMFSj5Om8DoVflOcHQw+k22YR
 BUiVXA+f4yZq4nJXIDiDVUm5A0f5fgiyn68pknkZk4FyujirfqrKQxlxsRUdn8/pOe
 NFIBRTbnemiHbRfgJ+tzTDcGi5+su91GPZkCO5JE+4xLMIWTzlNJHl+OgNLfRVvbgy
 jsl6GMl5ty60FsQc43G4nHPleWvxuoCbTriknyMl9oqx5c8h8JDNeI6TYajs/GMDue
 7mXIf9Ki2be0iEiZAA2Oh4fIIbpM6F/n78dW6P3wpz6lTljM1C4XUy95agkzqKh5bq
 v5HyQP1lAY7iA==
Message-ID: <eaae641b-4b6a-b904-d04b-46eb4a0a42a6@benettiengineering.com>
Date: Wed, 9 Feb 2022 23:54:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Michael PDQ <mdurrant@arcturusnetworks.com>,
 buildroot <buildroot@buildroot.org>
References: <20220209221731.51116-1-mdurrant@arcturusnetworks.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220209221731.51116-1-mdurrant@arcturusnetworks.com>
X-CMAE-Envelope: MS4wfB6yoIcb+RqWAbTpwVrrIrIb8Z0gVVMMNi/R6A/w00bntnN1y5l/pLy8kJAnQJXXghHErz6NYyF69aJ89ERPmGmQpa2LfEg7vSeCvj7GrUTNbvCItTNx
 m+5StrEw0axgFdoH+O6mWXdhhHSCeHp8+CbQouk8ZRru5ld6u3wYVYqdYq3n6zvCLRGpVeyQmG5/mAIVxrriicu7ZOKryoEnOUX7yIxQP+3yb+CSUaev0+br
 QHRnctzWxDHhoxoU5HSUPg==
Subject: Re: [Buildroot] [PATCH v2] board/arcturus/aarch64-ucls1012a: bump
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Oleksander,

On 09/02/22 23:17, Michael PDQ wrote:
> From: Oleksandr G Zhadan <oleks@arcturusnetworks.com>
> 
[0]
> ---
> V1->V2:
> - Bump the kernel to "Linux version 5.4.137"
> - Bootloader version is still "U-Boot 2019.10" but new targets added.
> - Remove the /etc/init.d/S09modload script to load the pfe firmware
>    module because now the pfe firmware module is loaded by the kernel
> - New compressed Image.gz is used
> 
> ---

Please move the 2 SoBs above [0], otherwise they will be dropped since 
everything after the 3 dashes will be dropped and it's only useful for 
patch reviewing.

> Signed-off-by: Oleksandr Zhadan<oleks@arcturusnetworks.com>
> Signed-off-by: Michael Durrant<mdurrant@arcturusnetworks.com>
> ---
>   board/arcturus/aarch64-ucls1012a/post-build.sh     |  2 --
>   board/arcturus/aarch64-ucls1012a/readme.txt        |  5 +++--
>   .../rootfs_overlay/etc/init.d/S09modload           | 14 --------------
>   configs/arcturus_ucls1012a_defconfig               |  9 ++++-----
>   4 files changed, 7 insertions(+), 23 deletions(-)
>   delete mode 100755 board/arcturus/aarch64-ucls1012a/rootfs_overlay/etc/init.d/S09modload
> 
> diff --git a/board/arcturus/aarch64-ucls1012a/post-build.sh b/board/arcturus/aarch64-ucls1012a/post-build.sh
> index f8ba78095f..ca3862988d 100755
> --- a/board/arcturus/aarch64-ucls1012a/post-build.sh
> +++ b/board/arcturus/aarch64-ucls1012a/post-build.sh
> @@ -1,5 +1,3 @@
>   #!/bin/sh
>   
> -mkdir -p ${TARGET_DIR}/lib/firmware
> -cp -f ${BUILD_DIR}/linux-custom/firmware/ppfe/* ${TARGET_DIR}/lib/firmware/
>   cp -f ${BUILD_DIR}/linux-custom/br2-ucls1012a.its ${BINARIES_DIR}/
> diff --git a/board/arcturus/aarch64-ucls1012a/readme.txt b/board/arcturus/aarch64-ucls1012a/readme.txt
> index 483d5e9aef..cb91716b34 100644
> --- a/board/arcturus/aarch64-ucls1012a/readme.txt
> +++ b/board/arcturus/aarch64-ucls1012a/readme.txt
> @@ -23,14 +23,15 @@ Result of the build
>   After building, you should obtain this tree:
>   
>       output/images/
> +    +-- Image.gz

This change ^^^ is worth to be mention in commit log

>       +-- arc-ucls1012a.dtb
> -    +-- Image
> +    +-- br2-ucls1012a.its

Is there a reason why .its file changes name? If yes can you please 
write it in commit log?

>       +-- part0-000000.itb
>       +-- rootfs.cpio
>       +-- rootfs.cpio.gz
>       +-- rootfs.tar
>       +-- u-boot.bin
> -    +-- ucls1012a.its
> +

This ^^^ newline is useless, please drop it

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

You're removing this script and...

> diff --git a/configs/arcturus_ucls1012a_defconfig b/configs/arcturus_ucls1012a_defconfig
> index fd33ebf1f6..2a9c1e0582 100644
> --- a/configs/arcturus_ucls1012a_defconfig
> +++ b/configs/arcturus_ucls1012a_defconfig
> @@ -1,22 +1,21 @@
>   # Architecture
>   BR2_aarch64=y
>   
> -# Linux headers same as kernel, a 4.14 series
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_14=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
>   
>   # System settings
>   BR2_TARGET_GENERIC_HOSTNAME="ucls1012a"
>   BR2_TARGET_GENERIC_ISSUE="Welcome to uCLS1012A-SOM"
>   BR2_SYSTEM_DHCP="eth0"
> -BR2_ROOTFS_OVERLAY="board/arcturus/aarch64-ucls1012a/rootfs_overlay"

...the overlay directory, can you explain why in commit log?

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

This ^^^ is the reason of renaming to Image.gz but it's worth mention it 
in commit log

>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
>   BR2_LINUX_KERNEL_INTREE_DTS_NAME="arcturus/arc-ucls1012a"
>   
> @@ -28,7 +27,7 @@ BR2_TARGET_ROOTFS_CPIO_GZIP=y
>   BR2_TARGET_UBOOT=y
>   BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>   BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
> -BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,ArcturusNetworks,uCLS1012A-uboot,v.20.31)/uboot-v.20.31.tar.gz"
> +BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,ArcturusNetworks,uCLS1012A-uboot,v.22.06)/uboot-v.22.06.tar.gz"
>   BR2_TARGET_UBOOT_BOARD_DEFCONFIG="UCLS1012A_QSPI128"
>   
>   # Tools

I've built it successfully in gitlab-ci docker, so I think you only need 
to fix those few stuff and send a V3 so I can re-test and give you my 
Reviewed-by and Tested-by:

Thank you!

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
