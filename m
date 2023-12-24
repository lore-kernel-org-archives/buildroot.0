Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7814CC46CD2
	for <buildroot@archiver.kernel.org>; Sun, 24 Dec 2023 16:57:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2854240018;
	Sun, 24 Dec 2023 16:57:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2854240018
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WsXuLNstWJ_6; Sun, 24 Dec 2023 16:57:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C7719404AB;
	Sun, 24 Dec 2023 16:57:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C7719404AB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C3AF41BF304
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 16:57:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A9EC981BCB
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 16:57:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A9EC981BCB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sAL6h5ky6QMY for <buildroot@lists.busybox.net>;
 Sun, 24 Dec 2023 16:57:30 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 74D1081B9D
 for <buildroot@buildroot.org>; Sun, 24 Dec 2023 16:57:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 74D1081B9D
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 8E5B5B00583;
 Sun, 24 Dec 2023 17:57:24 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 24 Dec 2023 17:57:24 +0100
Date: Sun, 24 Dec 2023 17:57:24 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <ZYhi9J9kSDngX5jI@landeda>
References: <20231223212948.2512412-1-ju.o@free.fr>
 <20231223212948.2512412-2-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231223212948.2512412-2-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1703437048;
 bh=/KJZYSJK0qDPALBRd4AFbgDj/ItZsoOwZoNer+qrRb0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qa69ELNkWMQhl6DHWctAQZL2acpgmDM7JkGSgaUU1nbxCKxKVHiVLS4pfs52ZpJgc
 g17RpPZo7rzJ5Az382vh31IHdc614nXxJd5EsdthhIINQ6hJpHCuERQA/s7bkTl3SJ
 9QtuHkXBKFrWFweCdyCZck8GI/xUs72eo3bT2hbJ9PAzl00Ikm7KCDXv7tNisU0oKv
 WwoKXHsw3djAGpLR7B+l2oCJ5kG9eG5xaWyah39/WZl3J/ileEkTpH9lIZFimi7lGy
 2LzASTz7MZQcslsDrjZlV8FDD6Ay+nb9m9h7bOzjSBGU/MqeF09ux/ph7RJLwPc5dg
 qUYGXzY8XAy3Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=qa69ELNk
Subject: Re: [Buildroot] [PATCH v2 2/2] configs/qemu_riscv64_virt_efi: new
 defconfig
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Julien, All,

On 2023-12-23 22:29 +0100, Julien Olivain spake thusly:
> This defconfig enables edk2 UEFI shell and grub2 riscv64-efi boot
> of a Linux Kernel.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

After tracking the EDK2 build issue with per-package the whole day, and
conluding that it was not specific to this defconfig, I applied to
master, thanks!

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2:
> - Remove BR2_TOOLCHAIN_EXTERNAL=y in defconfig.
>   (it was an incorrect leftover from a test)
> - Add BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1 in defconfig.
> 
> Patch series tested on branch master at commit 1667987 with commands:
> 
>     make check-package
>     ...
>     0 warnings generated
> 
>     make qemu_riscv64_virt_efi_defconfig
>     make
>     output/images/start-qemu.sh
> 
> Once logged as root in emulator:
> 
>     dmesg | grep -i efi
>     mount -t efivarfs efivarfs /sys/firmware/efi/efivars
>     ls -al /sys/firmware/efi/efivars
> ---
>  DEVELOPERS                                    |  2 ++
>  .../riscv64-virt-efi/assemble-flash-images    | 11 ++++++
>  board/qemu/riscv64-virt-efi/genimage.cfg      | 34 ++++++++++++++++++
>  board/qemu/riscv64-virt-efi/grub.cfg          |  6 ++++
>  board/qemu/riscv64-virt-efi/readme.txt        | 36 +++++++++++++++++++
>  configs/qemu_riscv64_virt_efi_defconfig       | 19 ++++++++++
>  6 files changed, 108 insertions(+)
>  create mode 100755 board/qemu/riscv64-virt-efi/assemble-flash-images
>  create mode 100644 board/qemu/riscv64-virt-efi/genimage.cfg
>  create mode 100644 board/qemu/riscv64-virt-efi/grub.cfg
>  create mode 100644 board/qemu/riscv64-virt-efi/readme.txt
>  create mode 100644 configs/qemu_riscv64_virt_efi_defconfig
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index bad07d51aa..cfd8b7bd8f 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1713,11 +1713,13 @@ F:	configs/ts7680_defconfig
>  F:	package/paho-mqtt-c
>  
>  N:	Julien Olivain <ju.o@free.fr>
> +F:	board/qemu/riscv64-virt-efi/
>  F:	board/spike/
>  F:	board/technexion/imx8mmpico/
>  F:	board/technexion/imx8mpico/
>  F:	configs/imx8mmpico_defconfig
>  F:	configs/imx8mpico_defconfig
> +F:	configs/qemu_riscv64_virt_efi_defconfig
>  F:	configs/spike_riscv64_defconfig
>  F:	package/fluid-soundfont/
>  F:	package/fluidsynth/
> diff --git a/board/qemu/riscv64-virt-efi/assemble-flash-images b/board/qemu/riscv64-virt-efi/assemble-flash-images
> new file mode 100755
> index 0000000000..abcaa2c93b
> --- /dev/null
> +++ b/board/qemu/riscv64-virt-efi/assemble-flash-images
> @@ -0,0 +1,11 @@
> +#! /bin/sh
> +
> +set -e
> +
> +BOARD_DIR="$(dirname "$0")"
> +
> +cp -f "${BOARD_DIR}"/grub.cfg "${BINARIES_DIR}"/efi-part/EFI/BOOT/grub.cfg
> +
> +# The QEMU riscv64 virt machine expects flash devices to be 32M.
> +truncate -s 32M "${BINARIES_DIR}"/RISCV_VIRT_CODE.fd
> +truncate -s 32M "${BINARIES_DIR}"/RISCV_VIRT_VARS.fd
> diff --git a/board/qemu/riscv64-virt-efi/genimage.cfg b/board/qemu/riscv64-virt-efi/genimage.cfg
> new file mode 100644
> index 0000000000..46950591e0
> --- /dev/null
> +++ b/board/qemu/riscv64-virt-efi/genimage.cfg
> @@ -0,0 +1,34 @@
> +image efi-part.vfat {
> +	vfat {
> +		file EFI {
> +			image = "efi-part/EFI"
> +		}
> +
> +		file Image {
> +			image = "Image"
> +		}
> +	}
> +
> +	size = 64M
> +}
> +
> +image disk.img {
> +	hdimage {
> +		partition-table-type = "gpt"
> +	}
> +
> +	partition boot {
> +		image = "efi-part.vfat"
> +		partition-type-uuid = U
> +		offset = 32K
> +		bootable = true
> +	}
> +
> +	partition root {
> +		# For partition-type-uuid value, see:
> +		# https://uapi-group.org/specifications/specs/discoverable_partitions_specification/
> +		# SD_GPT_ROOT_RISCV64
> +		partition-type-uuid = 72ec70a6-cf74-40e6-bd49-4bda08e8f224
> +		image = "rootfs.ext2"
> +	}
> +}
> diff --git a/board/qemu/riscv64-virt-efi/grub.cfg b/board/qemu/riscv64-virt-efi/grub.cfg
> new file mode 100644
> index 0000000000..d99e19c4cd
> --- /dev/null
> +++ b/board/qemu/riscv64-virt-efi/grub.cfg
> @@ -0,0 +1,6 @@
> +set default="0"
> +set timeout="5"
> +
> +menuentry "Buildroot" {
> +	linux /Image root=PARTLABEL=root rootwait
> +}
> diff --git a/board/qemu/riscv64-virt-efi/readme.txt b/board/qemu/riscv64-virt-efi/readme.txt
> new file mode 100644
> index 0000000000..6b9651a011
> --- /dev/null
> +++ b/board/qemu/riscv64-virt-efi/readme.txt
> @@ -0,0 +1,36 @@
> +Intro
> +=====
> +
> +This is a RISC-V 64bit UEFI Linux boot demo in QEmu virt machine.
> +
> +Build
> +=====
> +
> +    make qemu_riscv64_virt_efi_defconfig
> +    make
> +
> +Emulation
> +=========
> +
> +Run the emulation with:
> +
> +    qemu-system-riscv64 \
> +        -M virt,pflash0=pflash0,pflash1=pflash1,acpi=off \
> +        -smp 4 \
> +        -m 1024 \
> +        -nographic \
> +        -blockdev node-name=pflash0,driver=file,read-only=on,filename=output/images/RISCV_VIRT_CODE.fd \
> +        -blockdev node-name=pflash1,driver=file,filename=output/images/RISCV_VIRT_VARS.fd \
> +        \
> +        -drive file=output/images/disk.img,format=raw,id=hd0 \
> +        -device virtio-blk-device,drive=hd0 \
> +        \
> +        -netdev user,id=net0 \
> +        -device virtio-net-device,netdev=net0 # qemu_riscv64_virt_efi_defconfig
> +
> +Note: for information, qemu version >= 8.0.0 is needed for this UEFI
> +Linux demo. It introduced the two pflash memories (previous versions
> +had only one). The host-qemu package in Buildroot (enabled in this
> +defconfig) is sufficient to run this demo. In case another qemu is
> +used (for example, from the host OS), make sure to check the version
> +requirement.
> diff --git a/configs/qemu_riscv64_virt_efi_defconfig b/configs/qemu_riscv64_virt_efi_defconfig
> new file mode 100644
> index 0000000000..79aadf78ca
> --- /dev/null
> +++ b/configs/qemu_riscv64_virt_efi_defconfig
> @@ -0,0 +1,19 @@
> +BR2_riscv=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
> +BR2_SYSTEM_DHCP="eth0"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh board/qemu/riscv64-virt-efi/assemble-flash-images support/scripts/genimage.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG) -c board/qemu/riscv64-virt-efi/genimage.cfg"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.69"
> +BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
> +BR2_TARGET_ROOTFS_EXT2=y
> +# BR2_TARGET_ROOTFS_TAR is not set
> +BR2_TARGET_EDK2=y
> +BR2_TARGET_GRUB2=y
> +BR2_TARGET_GRUB2_RISCV64_EFI=y
> +BR2_PACKAGE_HOST_DOSFSTOOLS=y
> +BR2_PACKAGE_HOST_GENIMAGE=y
> +BR2_PACKAGE_HOST_MTOOLS=y
> +BR2_PACKAGE_HOST_QEMU=y
> +BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
