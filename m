Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C027ECD5BB1
	for <buildroot@archiver.kernel.org>; Tue, 26 May 2026 20:09:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 854C48208A;
	Tue, 26 May 2026 20:09:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xpb8hKidLceD; Tue, 26 May 2026 20:09:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34A088208B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779826155;
	bh=tEOpfxxl1nD8p8VogtWCDym2+cDFznHiW8CXLYc4Zw0=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=tIYWW8LBmW3r+4GJybkmE9pjvmV5mDaqQGHU3kojB74krKn+2p55vvsQkKQrJ98AU
	 ZFDqAmKiUbFoGU7m5e3sLsAjyDcOQeM5gVCh8+V1oXaCveh7IIwoWHtD+ulInsPXuf
	 XxUs2jjDff5Zic96fCYqlTvs6mEyYKZpZHy//pVX9/Sp1zh+2mIwKbDzqIOEvk1MJJ
	 REhG1rChw57CrN/kJ2GoYKhhYbyZvrlXW/Ze2YLoR++GNKNc4N3tSsaxg+YYhjjyFs
	 zUavpAYk2oGyu8jzZY907wHlUjV/PyEsePFrKL4kT8FoAD9EL1OO0kHzfcP6MzPGeu
	 th4wdHTbMx7ag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34A088208B;
	Tue, 26 May 2026 20:09:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 20D7F23F
 for <buildroot@buildroot.org>; Tue, 26 May 2026 20:09:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 11E38610A0
 for <buildroot@buildroot.org>; Tue, 26 May 2026 20:09:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cT5TCRgbigDj for <buildroot@buildroot.org>;
 Tue, 26 May 2026 20:09:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3BA5661091
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3BA5661091
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3BA5661091
 for <buildroot@buildroot.org>; Tue, 26 May 2026 20:09:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6F6C1B97C635; Tue, 26 May 2026 22:09:08 +0200 (CEST)
Message-ID: <a994e803-d6fc-4149-9f0c-282435a32950@rnout.be>
Date: Tue, 26 May 2026 22:09:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Christopher Obbard <obbardc@gmail.com>, buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>,
 efibootguard-dev@googlegroups.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260524-wip-obbardc-boot-efibootguard-initial-pkg-v3-0-47fc8262591b@gmail.com>
 <20260524-wip-obbardc-boot-efibootguard-initial-pkg-v3-2-47fc8262591b@gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260524-wip-obbardc-boot-efibootguard-initial-pkg-v3-2-47fc8262591b@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1779826149; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=7/jgSkRsoFz4ra4q03f4cv/iEPceMII3fCzsi6UmhPk=;
 b=lDh7rk73dtO8bEPOHQbJBpqXw+jGTygNUXH0GaP3E7hs1jkxqnLRg70xjeR/u8012u8LQ0
 uiwszRxI4P3x8m5VAq8D6OpKg11AKxxmyNv4R/kZaGMFojwjmVlUQ3LHq0YiYx5DPrrb3n
 gKtEgH0sEoGyKJ3V/Bi6Z5eNKD1/pXMCfJ5ofIbyQoxB/l7DVgYTJg77JEFQaCcd4QBup/
 dpoPkrEka/MKpJibWjAYmXsfe8MfgDf1YmYwM0Xh8y6gayZ4qiZ4NtNspflPyHMLFXoT6Y
 I2NNr27o9VEi0CH5zbZalAhxPj+1a1nC5CbA5ErbdXmy7IPl7XiUq8vwfS+aGQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=lDh7rk73
Subject: Re: [Buildroot] [PATCH v3 2/2] board/pc-efibootguard: add example
 EFI Boot Guard recipe
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 24/05/2026 19:23, Christopher Obbard wrote:
> Add an example recipe (based on configs/pc_x86_64_efi_defconfig) to
> generate an x86-64 image which boots the system using the EFI Boot Guard
> bootloader. The recipe is an example of how to create an image using
> EFI Boot Guard, including how to create the disk image & how to configure
> the bootloader.
> 
> The created example image contains two boot slots; one of which contains
> the environment built by Buildroot and the other is an empty, dummy slot
> (e.g. cannot be booted from).
> 
> EFI Boot Guard provides a tool for generating UKI images, which can then
> be signed for Secure Boot. For simplicity, this is not enabled in the
> example recipe.

  I think it would be useful to include this as well. Of course that requires 
knowing how to enroll your own key but I guess that can be left as an exercise 
for the reader :-)

> Also add instructions (and a script) to boot the example image in QEMU.
> 
> Signed-off-by: Christopher Obbard <obbardc@gmail.com>
> ---
>   DEVELOPERS                               |  2 +
>   board/pc-efibootguard/README.md          | 89 ++++++++++++++++++++++++++++++++
>   board/pc-efibootguard/genimage.cfg       | 59 +++++++++++++++++++++
>   board/pc-efibootguard/linux.fragment     | 15 ++++++
>   board/pc-efibootguard/post-build.sh      | 33 ++++++++++++
>   board/pc-efibootguard/post-image.sh      |  7 +++
>   board/pc-efibootguard/run-image-qemu.sh  |  9 ++++
>   configs/pc_x86_64_efibootguard_defconfig | 51 ++++++++++++++++++
>   8 files changed, 265 insertions(+)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 246b1aa44e..ddc71d9639 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -704,7 +704,9 @@ F:	package/perl-time-parsedate/
>   F:	package/perl-x10/
>   
>   N:	Christopher Obbard <obbardc@gmail.com>
> +F:	board/pc-efibootguard/
>   F:	boot/efibootguard/
> +F:	configs/pc_x86_64_efibootguard_defconfig
>   
>   N:	Colin Foster <colin.foster@in-advantage.com>
>   F:	package/python-tftpy/
> diff --git a/board/pc-efibootguard/README.md b/board/pc-efibootguard/README.md
> new file mode 100644
> index 0000000000..1bbeff4c48
> --- /dev/null
> +++ b/board/pc-efibootguard/README.md

  All other readme's are called readme.txt. We have no markdown files at all at 
the moment, except for SECURITY.md which is mandated to be markdown.

> @@ -0,0 +1,89 @@
> +# EFI Boot Guard Example Recipe
> +
> +This recipe creates a basic x86 disk image using [EFI Boot Guard](https://github.com/siemens/efibootguard/tree/master)
> +as the bootloader with two root filesystem slots.
> +
> +The image is intended to demonstrate a typical A/B boot layout. The first slot is
> +populated with the root filesystem generated as part of the Buildroot build,
> +while the second slot is left empty so that it can be used later by an update
> +tool, which is out-of-scope for this example recipe.
> +
> +The recipe also creates the EFI system partition and installs the EFI Boot Guard
> +bootloader components needed to select and boot one of the available slots. Each
> +slot has its own EFI Boot Guard environment, containing the kernel image and
> +configuration.
> +
> +This example is deliberately minimal. It is intended as a reference for users who
> +want to integrate EFI Boot Guard into their own platform-specific images, rather
> +than as a complete production-ready update setup.
> +
> +This recipe was designed to be ran in QEMU and may need additional changes to run
> +on real hardware.

  But you did test it on real hardware, right? Can't you copy the instructions 
from board/pc/readme.txt on how to boot on real hardware?

> +
> +
> +## Build the image
> +
> +Configure Buildroot with:
> +
> +```
> +$ make pc_x86_64_efibootguard_defconfig
> +```
> +
> +
> +Build the image with:
> +
> +```
> +$ make
> +```
> +
> +The raw disk image is available under `output/images/disk.img`.
> +
> +
> +## Emulation in QEMU
> +
> +Emulate the system in QEMU with:
> +
> +```
> +$ qemu-system-x86_64 \
> +    -M pc \
> +    -drive if=pflash,format=raw,readonly=on,file=</path/to/OVMF_CODE.fd> \
> +    -drive file=output/images/disk.img,if=virtio,format=raw \
> +    -boot menu=on \
> +    -net nic,model=virtio \
> +    -net user
> +```
> +
> +Note that `</path/to/OVMF.fd>` needs to point to a valid x86_64 UEFI
> +firmware image for qemu. It may be provided by your distribution as a
> +edk2 or OVMF package, in a path such as `/usr/share/OVMF/OVMF_CODE_4M.fd` in
> +Debian.
> +
> +
> +## EFI Boot Guard userspace tools
> +
> +The example image includes the EFI Boot Guard userspace tools. These can be used
> +to inspect and update the boot metadata stored in each slot environment.
> +
> +`bg_printenv` prints the current EFI Boot Guard boot configuration:
> +
> +```
> +# bg_printenv
> +```
> +
> +`bg_setenv` updates the state and revision of a slot. For example, the following
> +commands initialise both slots and prefers booting from slot `0`:
> +
> +```
> +# bg_setenv --part 0 --ustate OK --revision 1
> +# bg_setenv --part 1 --ustate OK --revision 0
> +```
> +
> +In this example, both slots are marked as usable, but slot `0` has the higher
> +revision. EFI Boot Guard will therefore select it before slot `1`.
> +
> +For more information on configuring EFI Boot Guard, see the
> +[upstream documentation](https://github.com/siemens/efibootguard/blob/master/README.md).
> +
> +An update framework (such as RAUC) can use these tools to switch the preferred
> +boot slot after installing an update and to mark a slot as failed if the updated
> +system does not boot successfully.

  Since this is a demo defconfig, perhaps it would make sense to include RAUC as 
well?

> diff --git a/board/pc-efibootguard/genimage.cfg b/board/pc-efibootguard/genimage.cfg
> new file mode 100644
> index 0000000000..2437a89b63
> --- /dev/null
> +++ b/board/pc-efibootguard/genimage.cfg
> @@ -0,0 +1,59 @@
> +image EFI.vfat {
> +	vfat {
> +		file EFI/BOOT/BOOTX64.EFI {
> +			image = "efibootguard/efibootguardx64.efi"
> +		}
> +	}
> +
> +	size = 16352K # 16MB - 32KB
> +}
> +
> +image boot-a.vfat {
> +	vfat {}

  Does it have to be a FAT partition? Seems a bit... unsafe...

> +
> +	size = 128M

  That seems quite large for just a kernel. Unlike /boot in a typical distro, it 
will always contain just a single kernel, right?

> +	srcpath = "output/images/boot-a-part"
> +}
> +
> +# # boot-b is a placeholder
> +image boot-b.vfat {
> +	vfat {}
> +
> +	size = 128M
> +	srcpath = "output/images/boot-b-part"
> +}
> +
> +image disk.img {
> +	hdimage {
> +		partition-table-type = "gpt"
> +	}
> +
> +	partition EFI {
> +		image = "EFI.vfat"
> +		partition-type-uuid = esp
> +		offset = 32K
> +		bootable = true
> +	}
> +
> +	partition boot-a {
> +		partition-type-uuid = fat32
> +		image = "boot-a.vfat"
> +	}
> +
> +	partition boot-b {
> +		partition-type-uuid = fat32
> +		image = "boot-b.vfat"
> +	}
> +
> +	partition system-a {
> +		partition-type-uuid = root-x86-64
> +		image = "rootfs.ext4"
> +		size = 2G

  That seems _extremely_ large... Remember, that size also means that if you dd 
the image you have to write all of it. It's better when you use bmaptool, but we 
don't do that by default.

> +	}
> +
> +	# system-b is a placeholder
> +	partition system-b {
> +		partition-type-uuid = root-x86-64
> +		size = 2G
> +	}
> +}
> diff --git a/board/pc-efibootguard/linux.fragment b/board/pc-efibootguard/linux.fragment
> new file mode 100644
> index 0000000000..f9f2c3fd06
> --- /dev/null
> +++ b/board/pc-efibootguard/linux.fragment
> @@ -0,0 +1,15 @@
> +# efistub
> +CONFIG_EFI=y
> +CONFIG_EFI_STUB=y
> +CONFIG_EFIVAR_FS=y
> +CONFIG_EFI_PARTITION=y
> +
> +# efibootguard tools (bg_printenv / bg_setenv) use fat partition
> +CONFIG_PARTITION_ADVANCED=y
> +CONFIG_EFI_PARTITION=y
> +CONFIG_FAT_FS=y
> +CONFIG_MSDOS_FS=y
> +CONFIG_VFAT_FS=y
> +CONFIG_NLS=y
> +CONFIG_NLS_CODEPAGE_437=y
> +CONFIG_NLS_ISO8859_1=y
> diff --git a/board/pc-efibootguard/post-build.sh b/board/pc-efibootguard/post-build.sh
> new file mode 100755
> index 0000000000..4f3e3254d8
> --- /dev/null
> +++ b/board/pc-efibootguard/post-build.sh
> @@ -0,0 +1,33 @@
> +#!/bin/sh
> +
> +set -e
> +
> +# Kernel cmdline to append
> +KERNEL_CMDLINE=""
> +
> +# Create efibootguard boot-a slot configuration
> +mkdir -p "${BINARIES_DIR}"/boot-a-part
> +printf "boot-a" | iconv -f ascii -t UTF-16LE > "${BINARIES_DIR}"/boot-a-part/EFILABEL
> +"${HOST_DIR}"/bin/bg_setenv \
> +    --verbose \
> +    --watchdog=0 \
> +    --filepath="${BINARIES_DIR}"/boot-a-part/BGENV.DAT \
> +    --revision=2 \
> +    --ustate=OK \
> +    --kernel="C:boot-a:bzImage" \
> +    --args="root=PARTLABEL=system-a $KERNEL_CMDLINE"
> +
> +# Create efibootguard boot-a slot configuration (unbootable)

  boot-b?

> +mkdir -p "${BINARIES_DIR}"/boot-b-part
> +printf "boot-b" | iconv -f ascii -t UTF-16LE > "${BINARIES_DIR}"/boot-b-part/EFILABEL
> +"${HOST_DIR}"/bin/bg_setenv \
> +    --verbose \
> +    --watchdog=0 \
> +    --filepath="${BINARIES_DIR}"/boot-b-part/BGENV.DAT \
> +    --revision=1 \
> +    --ustate=FAILED \
> +    --kernel="C:boot-b:bzImage" \
> +    --args="root=PARTLABEL=system-b $KERNEL_CMDLINE"
> +
> +# Copy kernel into boot-a.
> +cp "${BINARIES_DIR}"/bzImage "${BINARIES_DIR}"/boot-a-part/

  I think it makes more sense to do all of the above in post-image as well. 
post-build is meant for manipulations of TARGET_DIR.

> diff --git a/board/pc-efibootguard/post-image.sh b/board/pc-efibootguard/post-image.sh
> new file mode 100755
> index 0000000000..eec88f707d
> --- /dev/null
> +++ b/board/pc-efibootguard/post-image.sh
> @@ -0,0 +1,7 @@
> +#!/bin/sh
> +
> +set -e
> +
> +UUID=$(dumpe2fs "$BINARIES_DIR/rootfs.ext2" 2>/dev/null | sed -n 's/^Filesystem UUID: *\(.*\)/\1/p')
> +sed "s/UUID_TMP/$UUID/g" board/pc-efibootguard/genimage.cfg > "$BINARIES_DIR/genimage.cfg"

  There is no UUID_TMP in that file...

> +support/scripts/genimage.sh -c "$BINARIES_DIR/genimage.cfg"
> diff --git a/board/pc-efibootguard/run-image-qemu.sh b/board/pc-efibootguard/run-image-qemu.sh
> new file mode 100755
> index 0000000000..32be727c3e
> --- /dev/null
> +++ b/board/pc-efibootguard/run-image-qemu.sh
> @@ -0,0 +1,9 @@
> +#!/bin/sh
> +
> +qemu-system-x86_64 \
> +  -M pc \
> +  -drive if=pflash,format=raw,readonly=on,file=/usr/share/OVMF/OVMF_CODE_4M.fd \
> +  -drive file=output/images/disk.img,if=virtio,format=raw \
> +  -boot menu=on \
> +  -net nic,model=virtio \
> +  -net user

  We don't usually have such a script, it's just part of the readme.txt.

> diff --git a/configs/pc_x86_64_efibootguard_defconfig b/configs/pc_x86_64_efibootguard_defconfig
> new file mode 100644
> index 0000000000..7220b2d7ce
> --- /dev/null
> +++ b/configs/pc_x86_64_efibootguard_defconfig
> @@ -0,0 +1,51 @@
> +BR2_x86_64=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y

  We expect new and updated defconfigs to switch to the Bootlin glibc stable 
toolchain (if appropriate) in order to limit build time. This is unfortunately 
still undocumented, except for the report of the meeting where it was decided [1].

> +BR2_GLOBAL_PATCH_DIR="board/pc/patches"
> +BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
> +BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
> +BR2_TARGET_GENERIC_GETTY_PORT="tty1"
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/pc-efibootguard/post-build.sh"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/pc-efibootguard/post-image.sh"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.47"

  You can use 6.18.33 now.


  Regards,
  Arnout

[1] https://elinux.org/Buildroot:DeveloperDaysELCE2024#Rules_for_defconfigs


> +BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/pc/linux.config"
> +BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/pc-efibootguard/linux.fragment"
> +BR2_LINUX_KERNEL_INSTALL_TARGET=y
> +BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> +BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
> +BR2_PACKAGE_LINUX_FIRMWARE=y
> +BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_9170=y
> +BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_9271=y
> +BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3160=y
> +BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3168=y
> +BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_5000=y
> +BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_6000G2A=y
> +BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_6000G2B=y
> +BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_7260=y
> +BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_7265D=y
> +BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_8000C=y
> +BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_8265=y
> +BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT73=y
> +BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT2XX=y
> +BR2_PACKAGE_LINUX_FIRMWARE_RTL_81XX=y
> +BR2_PACKAGE_LINUX_FIRMWARE_RTL_87XX=y
> +BR2_PACKAGE_LINUX_FIRMWARE_RTL_88XX=y
> +BR2_PACKAGE_LINUX_FIRMWARE_RTL_8169=y
> +BR2_PACKAGE_ACPID=y
> +BR2_PACKAGE_CONNMAN=y
> +BR2_PACKAGE_CONNMAN_WIFI=y
> +BR2_PACKAGE_CONNMAN_CLIENT=y
> +BR2_PACKAGE_WIRELESS_REGDB=y
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
> +# BR2_TARGET_ROOTFS_TAR is not set
> +BR2_TARGET_EFIBOOTGUARD=y
> +BR2_TARGET_EFIBOOTGUARD_X86_64=y
> +BR2_TARGET_EFIBOOTGUARD_INSTALL_TOOLS=y
> +BR2_TARGET_HOST_EFIBOOTGUARD=y
> +BR2_PACKAGE_HOST_DOSFSTOOLS=y
> +BR2_PACKAGE_HOST_GENIMAGE=y
> +BR2_PACKAGE_HOST_MTOOLS=y
> 



_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
