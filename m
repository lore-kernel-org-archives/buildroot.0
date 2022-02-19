Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 550F2C433F5
	for <buildroot@archiver.kernel.org>; Sat, 19 Feb 2022 21:07:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C1A8260B14;
	Sat, 19 Feb 2022 21:07:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y-BMArBdv-2d; Sat, 19 Feb 2022 21:07:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D445860AEF;
	Sat, 19 Feb 2022 21:07:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EB63B1BF426
 for <buildroot@lists.busybox.net>; Sat, 19 Feb 2022 21:07:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D1A384024B
 for <buildroot@lists.busybox.net>; Sat, 19 Feb 2022 21:07:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e3R9BM6XtMzS for <buildroot@lists.busybox.net>;
 Sat, 19 Feb 2022 21:07:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0642.aruba.it (smtpcmd0642.aruba.it [62.149.156.42])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4F61740239
 for <buildroot@buildroot.org>; Sat, 19 Feb 2022 21:07:00 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.188.82])
 by Aruba Outgoing Smtp  with ESMTPSA
 id LWwTn7WZHX0z7LWwUnbccD; Sat, 19 Feb 2022 22:06:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1645304818; bh=TZWgIH9yS2v8C3MTduMSVxZp3Zsd+NtCQ5ajgh4QcbE=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=NAAAyn/PWm7S668K9oBztsYCDzxUIuJKOBIaMHcFTCnW+h/xr+A4YEVJXRT4DSjyG
 4q630J6J1AfCTaodB31P+aOmXHXXumtAMQJ6kVzmiubPk7HegU2fYwD9Cf0mqnMuwL
 El6X6IslMlw9RchWZ+uugWo3jH2fU42QS5Ll12/eBEePeCZXL15XPBM35769HFgqWf
 tcwhY2/2onqQOpQK00wIvTNvfwkjAG5bMmavmmzgEpjPojgS8nqp/e+pqORmQEm/Jp
 eyiMRzZN+dG4vgoTcqgBTCbAEkfD+VGBn5HbgTCZRiXzJxi1fnwdAs360WtgjTSm79
 WCWEz9m1DHgig==
Message-ID: <ec546e7c-39c1-5a5d-d807-c167ab5e6eb2@benettiengineering.com>
Date: Sat, 19 Feb 2022 22:06:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Michael Durrant <mdurrant@arcturusnetworks.com>,
 buildroot <buildroot@buildroot.org>
References: <20220218220905.87503-1-mdurrant@arcturusnetworks.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220218220905.87503-1-mdurrant@arcturusnetworks.com>
X-CMAE-Envelope: MS4wfPfFfIzTV1R/BXLfp+etQM4JCuACYGl8cPCauRwpVL9D6seg5moVRgIChlimrrr1irmL0Cbx/KXyp75b8rIfY4rISvSMFpJQhY5XldRNLNmjHdcliWLW
 P06ILCbpjAd5Wl7CBl2VNDRQznH0HWlpC7NNVdyuD1NyRMsEYWAkng0r8i2HGppxhhFUwqEjBKgF35slGNvNWeEUfLmBD5Bd663PrdulDd3fWwMi8vEC93cv
 Ef9U4yYgvYopwev886sT/g==
Subject: Re: [Buildroot] [PATCH v4] board/arcturus/aarch64-ucls1012a: bump
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

Hi Michael,

On 18/02/22 23:09, Michael Durrant wrote:
> - Bump Linux to version 5.4.137
> - Bump U-Boot to add new targets, version remains the same
> - Drop BR2_ROOTFS_OVERLAY and remove S09modload script because it was only used by PFE and now PFE is loaded directly by the kernel
> - Use Image.gz instead of Image to have a compressed kernel
> - Rename ucls1012a.its to br2-ucls1012a.its since post-build.sh and post-image.sh use different name. This fixes the bug that didn't allow the creation of the part0-000000.itb file.

Please wrap your commit log at 72th column. Give a try by auto-sending 
the patch to yourself and download it so you can verify commit log wraps 
at 72.

> Signed-off-by: Oleksandr Zhadan <oleks@arcturusnetworks.com>
> Signed-off-by: Michael Durrant <mdurrant@arcturusnetworks.com>

I've built the defconfig successfully using the gitlab-CI docker and 
except commit log carriage return:
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Tested-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[Giulio: build tested]

So please send a V5 with above correction including my tags ^^^ after 
your SoBs.

Thank you!

Best regards
-- 
Giulio Benetti
Benetti Engineering sas

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
