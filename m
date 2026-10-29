Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975AC606A320
	for <buildroot@archiver.kernel.org>; Thu, 29 Oct 2026 21:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=P8b9y7bP
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B0E460A85;
	Thu, 29 Oct 2026 21:30:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B0TgCTFi0G4s; Thu, 29 Oct 2026 21:30:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7D0A760A70
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793309421;
	b=s09aESMTofcVHZJC0Bf9kc6X/EDOMR0XzNtzLSW5Pex5+Z2HGV3RcyR/AQFDK96LFoC4
	 CMWNZbrJDgCRIaF8zHUVF64OeTmx3LFqhKm9i3Ttr8DqI7NqOAAS19+M79X0AQfRU6Nin
	 IkeuweKSSJAvR/PjsbRNNagMkAvu/rvccvO4+kINsch1QubOXoGofYD/AGtvkMt6sGY9o
	 vN+2kDInjGFDH4IiCBVYrm5xf8nYqpC5QOfpido/kffvLaLkjMLCrJpWHQCDn6KSoOlIm
	 K7lN+JyENApkWSPp1mbrVP7RUxs32LtGauz/zKnUqrJLqfJB14SlKBkhukr74utn17g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793309421;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=Ck00fTp6jsBdt3+BOzmsA/GVaDL1BZ/osUp5RiDA8NE=;
	b=An4noe1WQtJZd46kQ58LGeIwgl3EQrKu0nC++v4eaf/uDC8K7m5S2vMNtJwZgs+fxHA/
	 OjJbq9U8ZhMuxvGRflVfWYwe7GXmRbMMsK17NxzctdVKy+n2rFuCdEzxBlAZZNt0/uvUR
	 t75NR840nJhdO4jJy6kENxuTQhG1oabhZUp2W76YbU6PsHH/8EyPuvfDyWAqMg/cZDEMm
	 gj7RdnyBv5XJ3LBTE6xbouSuG0rbOVEPEZ1WIf3IVjB9DfycNNGvNhpZaU3LEKomMKLYQ
	 53QPrQKx8/4wtloaN680cjlcVU4zeKHNI644KuXL3bOEUAeYSPkG9npcOxIfBzp63oA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793309421;
	bh=Ck00fTp6jsBdt3+BOzmsA/GVaDL1BZ/osUp5RiDA8NE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=P8b9y7bPZae1SazDpHNqU0MVaNjN6xSN3RDApU7Bnx78p/d1Qrskxpe0lPNzIV+c2
	 DZbelcoV7jodZPabbNprQYwPwpIYW9BOtFFOsYMEO+kKKbaUzD5Z7e+Rkb+dkytsZ7
	 QOQuRyCgAz1r5izzMx/nYOylYFIgcdWALmfgJJlEsnoDsV5O1qMNsFL3JvQna6O0WD
	 Zt6lWQ/ZerSZ6WdMqgaDmBeJe5X+aI78tF680kyKw2friDwf+hcAe/OBvU42PIY8Dk
	 xsJqKR120aDo/UeH/lBPfO1B3kyxXkrdp4QChIA0Biw0gBryl2Hcr+UOO4Ecv3y/Pp
	 m07ur8pYDxKcA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D0A760A70;
	Thu, 29 Oct 2026 21:30:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9E5161DE
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 21:30:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 84AED80AF9
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 21:30:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PXZb15w6wxMN for <buildroot@buildroot.org>;
 Thu, 29 Oct 2026 21:30:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D87A98085F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793309418;
 b=DkTO/KAu6pBzkHk31L2IGJk4pFHlm1KGnea6hL6zA23eK584NuTXS21PewwZ3A0SV3LU
 qYUUcLGcR8h4yMLsMp9FL2YmcWKiL7fu3rHxz688nCt21XUyn9lUe2HeV902nCV5qbZkW
 jSL2F4N0Hk83sOwd5FAvWu8reIvxYPh8iIKGbjNKALvKslTNW4WtgDWau1bYRuIl1NqCE
 KCdabXNdPQZN/O6m5Cs3hJf7J3K1X3qu+yU3dvlHmVmcKzYJJTT9MqPJPDnLPha37MCq+
 8Wnvt6UoPftFS5j7av1APCYSd2FDtktk20HEds+XGM2Yg4x3SFU0gBoZA+N9kHBy4Pw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793309418;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=TzJjfx5+ninbouvyg5mi2W1vJgbg2AnTz9pEJNaigVA=;
 b=g8gI9G/9tzjnQoWfcHkLMmUx6SnrbFHU4E+9rPv6ccDKwespzhy7DoQ2Fcwv9ZLTGp7D
 CYL8++asmM6bdIgdVAMopxqpT+yIUNxdEZgioAjYK+VodDH5QxDf9sq622o3nfEs1q3dd
 qL/k7TmJE8ZiXxlgajEsxaXo6KEWVQF2YjDjeKZJXEoQo2zyqx3ahW6oN0PnHkpdoqiKA
 ej0b47vUgpqvc6hY66oDGps+f3BVnF5iKOZ3CIH/RvOUcVH4mOkUi0SSt/3jqk7iVj4Cz
 EQabAW4Js2mjpTuNlc95mnxE929fbRHWK4DTQRkoYRn2Yym6rEwkb3tUvoest73UiGg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Z7xHKDZ3; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::11"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D87A98085F
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 21:30:17 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 1023020039F;
 Thu, 29 Oct 2026 22:30:09 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Thu, 29 Oct 2026 22:30:09 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Thu, 29 Oct 2026 22:30:09 +0100
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: buildroot@buildroot.org, thomas.petazzoni@bootlin.com
In-Reply-To: <20261028184257.635621-1-dinguyen@kernel.org>
References: <20261028184257.635621-1-dinguyen@kernel.org>
User-Agent: Webmail Free/1.6.20
Message-ID: <da925ae9b0bd1ec41451bd9a38684b1f@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH RESEND] config: add socfpga_agilex5_defconfig
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Dinh,

Thanks for the patch. I have few comments.

Since this defconfig uses "vendor" uboot, TF-A and kernel, I suggest
to rename it to socfpga_agilex5_vendor_defconfig, to follow the "new"
convention described in:
https://elinux.org/Buildroot:DeveloperDaysELCE2024#Rules_for_defconfigs

Also, to follow the convention in Buildroot, could you change the
commit title to:

configs/socfpga_agilex5_vendor: new defconfig

On 28/10/2026 19:42, Dinh Nguyen via buildroot wrote:
> Build Linux, U-Boot, and TF-A for the Agilex 5 SoC Development Kit
> from the QPDS 26.1.1 GSRD sources.
> 
> Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
> ---
[...]
> diff --git a/board/altera/agilex5/readme.txt 
> b/board/altera/agilex5/readme.txt
> new file mode 100644
> index 0000000000..4460e43477
> --- /dev/null
> +++ b/board/altera/agilex5/readme.txt
> @@ -0,0 +1,50 @@
> +Altera SoCFPGA Agilex 5 SoC Development Kit
> +
> +Intro
> +=====
> +
> +This configuration builds a Linux system for the Agilex 5 SoC 
> Development
> +Kit (socfpga_agilex5_socdk) from the QPDS 26.1.1 Golden System 
> Reference

Could you add a link to the precise development board(s) page(s)
and reference(s) being supported, please?

For example:
[1] 
https://www.altera.com/products/devkit/po-3274/agilex-5-fpga-and-soc-e-series-065b-modular-development-kit

When reading this file for a newcomer, it is not obvious which
board is actually supported.

> +Design component versions:
> +
> +  https://github.com/altera-fpga/linux-socfpga          
> QPDS26.1.1_REL_GSRD_PR
> +  https://github.com/altera-fpga/u-boot-socfpga         
> QPDS26.1.1_REL_GSRD_PR
> +  https://github.com/altera-fpga/arm-trusted-firmware   
> QPDS26.1.1_REL_GSRD_PR
> +
> +The HPS first-stage bootloader is packaged by Quartus into the FPGA
> +configuration file. This defconfig builds the software that the HPS 
> loads
> +after that: U-Boot (u-boot.itb, with TF-A BL31), the kernel Image, the
> +socfpga_agilex5_socdk device tree, and a root filesystem.
> +
> +Build
> +=====
> +
> +    make socfpga_agilex5_defconfig
> +    make
> +
> +output/images will contain:
> +
> +    Image
> +    socfpga_agilex5_socdk.dtb
> +    u-boot.itb
> +    u-boot-spl-dtb.hex
> +    bl31.bin
> +    rootfs.ext2
> +    rootfs.tar.gz
> +    sdcard.img
> +
> +sdcard.img has a FAT boot partition (Image, device tree, u-boot.itb) 
> and
> +an ext4 root filesystem on the second partition.
> +
> +Creating a bootable SD card
> +===========================
> +
> +Copy a fabric configuration file named ghrd.core.rbf onto the FAT
> +partition if the design needs the FPGA loaded before Linux starts. 
> U-Boot
> +skips that step when the file is absent.

I suggest to move the previous paragraph _after_ the "dd" command.
The "dd" will create the vfat partition first, then the user can
add a file manually, if needed.

> +

I suggest to add before the "dd" command something like:

Prepare the a SD card with the command:

> +    dd if=output/images/sdcard.img of=/dev/sdX

And add notes, such as:

Notes:
   - replace 'sdX' with the actual device with your micro SDcard,
   - you may need to be root to do that (use 'sudo').

> +
> +Program the HPS first-stage bootloader with Quartus, using
> +output/images/u-boot-spl-dtb.hex as the HPS handoff file. Boot the HPS
> +from the SD card. The serial console is ttyS0 at 115200 8n1.
[...]
> diff --git a/configs/socfpga_agilex5_defconfig 
> b/configs/socfpga_agilex5_defconfig
> new file mode 100644
> index 0000000000..25d5beaded
> --- /dev/null
> +++ b/configs/socfpga_agilex5_defconfig
> @@ -0,0 +1,49 @@
> +BR2_aarch64=y

The "BR2_aarch64=y" can be removed. AArch64 recently became the
default architecture in Buildroot.

> +BR2_cortex_a55=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y
> +BR2_TOOLCHAIN_BUILDROOT_CXX=y

The last two lines can be removed, and replaced by:

BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y

to follow the guidelines from:
https://elinux.org/Buildroot:DeveloperDaysELCE2024#Rules_for_defconfigs
to use a Bootlin external glibc stable toolchains.

> +BR2_PACKAGE_HOST_GDB=y

To keep this defconfig minimal, could you remove this host gdb,
please?

Also, you should add here:
BR2_DOWNLOAD_FORCE_CHECK_HASHES=y

The command "make check-package" reports the error:
configs/socfpga_agilex5_defconfig:0: missing 
BR2_DOWNLOAD_FORCE_CHECK_HASHES

You'll also need to add a BR2_GLOBAL_PATCH_DIR pointing to
"board/altera/agilex5/patches".

Then you can add manually, or use the utils/add-custom-hashes script
to add your hash files. See for example:
https://gitlab.com/buildroot.org/buildroot/-/commit/1c393bfa6374a378550305ad70d096d4c16cf88b

> +BR2_TARGET_GENERIC_HOSTNAME="agilex5"
> +BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
> +BR2_SYSTEM_DHCP="eth0"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT_ARGS="-c 
> board/altera/agilex5/genimage.cfg"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/altera-fpga/linux-socfpga.git"
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="QPDS26.1.1_REL_GSRD_PR"
> +BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
> +BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/altera/agilex5/linux.fragment"
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="intel/socfpga_agilex5_socdk"
> +BR2_LINUX_KERNEL_INSTALL_TARGET=y
> +BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> +BR2_PACKAGE_GDB=y
> +BR2_PACKAGE_DROPBEAR=y

gdb and dropbear should be removed. defconfigs should
be minimal, see:
https://elinux.org/Buildroot:DeveloperDaysELCE2024#Rules_for_defconfigs

> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +BR2_TARGET_ROOTFS_EXT2_SIZE="512M"

The filesystem size could probably be reduced to 256M.

> +BR2_TARGET_ROOTFS_TAR_GZIP=y

The gzip'ed tar root fs can be removed. It is not used in the boot
method described in the readme.txt. It could even be replaced with:

# BR2_TARGET_ROOTFS_TAR is not set

> +BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/altera-fpga/arm-trusted-firmware.git"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="QPDS26.1.1_REL_GSRD_PR"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="agilex5"
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> +BR2_TARGET_UBOOT_CUSTOM_GIT=y
> +BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/altera-fpga/u-boot-socfpga.git"
> +BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="QPDS26.1.1_REL_GSRD_PR"
> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="socfpga_agilex5"
> +BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/altera/agilex5/uboot.fragment"
> +BR2_TARGET_UBOOT_NEEDS_DTC=y
> +BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
> +BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
> +BR2_TARGET_UBOOT_USE_BINMAN=y
> +# BR2_TARGET_UBOOT_FORMAT_BIN is not set
> +BR2_TARGET_UBOOT_FORMAT_ITB=y
> +BR2_TARGET_UBOOT_SPL=y
> +BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl-dtb.hex"
> +BR2_PACKAGE_HOST_DOSFSTOOLS=y
> +BR2_PACKAGE_HOST_GENIMAGE=y
> +BR2_PACKAGE_HOST_MTOOLS=y
> --
> 2.42.0.411.g813d9a9188

Could you send a v2 addressing those comments, please?

After those changes, please also make sure the
the defconfig is regenerated with "make savedefconfig"
and "utils/docker-run make check-package" does not report
errors. Thanks.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
