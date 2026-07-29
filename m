Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DBC1C53219
	for <buildroot@archiver.kernel.org>; Wed, 29 Jul 2026 18:57:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9EF980E44;
	Wed, 29 Jul 2026 18:57:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g6LlnEWKqnOM; Wed, 29 Jul 2026 18:57:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ACC4680E46
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785351459;
	bh=HziXP6SAkzPOvb98V7FtKcqOtBcNHm9rdBAhZcQ+RKs=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=InYJ3/7PO+0g6bhgBUz0tRm6asjvgOuvjRTAcLKHm1yFGehoCGKoWstCenjvzQx9N
	 hPGSAdZ7wyMBbxxrOUrtK2baqXL1XU090v6s0d6ise9NHxl42Eu1CUqCAvRw+5Sl7F
	 qm/spmZnLNXizKfAwhW1Iu1s/prhtUeHoWv539NetwSok4yqMqJHmupEcywj62EMII
	 SqvG9wm8Q75bcjsYlQHOF/hCtLa9i2YPiha3drmBOvrICy5KfvhNE/xVnFJkX7X6b0
	 tJCqQNv2KpzYCE5402noioM7Z5J/re/HhtUHEv0m/25n1bvnSgBxKgaCWaNHc7kkV1
	 fiESyGNAcHNeQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ACC4680E46;
	Wed, 29 Jul 2026 18:57:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E4C9026E
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 18:57:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D6B4140149
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 18:57:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hQt4ewWIN9Pl for <buildroot@buildroot.org>;
 Wed, 29 Jul 2026 18:57:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AC7D3400AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC7D3400AF
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AC7D3400AF
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 18:57:37 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 7D32778035B;
 Wed, 29 Jul 2026 20:57:33 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 29 Jul 2026 20:57:33 +0200
MIME-Version: 1.0
Date: Wed, 29 Jul 2026 20:57:33 +0200
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: buildroot@buildroot.org, Fabio Estevam <festevam@gmail.com>
In-Reply-To: <f904afd9-e941-9f04-7a0b-b6de0c124d29@crashcourse.ca>
References: <20260726204437.3148734-1-ju.o@free.fr>
 <f904afd9-e941-9f04-7a0b-b6de0c124d29@crashcourse.ca>
User-Agent: Webmail Free/1.6.17
Message-ID: <ca3ebf8b04b15d95399ebc536a866ab3@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1785351455;
 bh=lOjlSwMA7UD/gALLWIeOzbCNhjEAgPDsxW4veO2nuAE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=rlR5w1BqNTKpKpltHo0ZBUPsNC/bvJpQ3VBQoMtBvSxG0Ke9Y5Mh1nhLMj0LjYiqN
 GSrSH+SU0GeW7uVmYmecnMxbNBi7bB5nxQKcFbmcjWnOgJkPxyIwl/iJpr160c6/o9
 xejIIOKEAQdw3p4I3SJEQThtaqucg2WCbLnL0nh5mdgiIJBpuWP1QNyCCB1y458bTo
 S1sI4tw0RMlt9L0ffM6DLY3lZs0u/K3eB9zR4/b/aOVaiF7D7ra9qFSFOHiH8+5w7V
 8RReLtvYvaymhOuGvBC+oB6/tK6XZJpKTNEHHXkZI2WRGv4ePbtZMw4J4zAyv3nBj2
 hriF4k91cNalg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=rlR5w1Bq
Subject: Re: [Buildroot] [PATCH 1/1] configs/freescale_imx93frdm: bump
 U-Boot, TF-A and Linux
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 29/07/2026 20:42, Robert P. J. Day wrote:
> On Sun, 26 Jul 2026, Julien Olivain wrote:
> 
>> Since Buildroot commit [1] "package/gcc: switch to GCC 15.x as the
>> default", compiling freescale_imx93frdm_defconfig fails in TF-A with
>> error:
>> 
>>     include/drivers/nxp/trdc/imx_trdc.h:7: error: header guard 
>> 'IMX_TRDC_H' followed by '#define' of a different macro 
>> [-Werror=header-guard]
>>         7 | #ifndef IMX_TRDC_H
>>     include/drivers/nxp/trdc/imx_trdc.h:8: note: 'IMX_XRDC_H' is 
>> defined here; did you mean 'IMX_TRDC_H'?
>>         8 | #define IMX_XRDC_H
>> 
>> The issue happen because this defconfig is using a Buildroot
>> (internal) toolchain which uses gcc version 15 by default.
>> 
>> This issue was fixed upstream in [2], first included in TF-A v2.13.
>> 
>> This commit updates U-Boot, TF-A and Linux to use the NXP
>> tag lf-6.18.20-2.0.0, which include this fixes.
>> 
>> Note that, as described in the commit log of [3] which introduced
>> this defconfig, U-Boot and Linux were forks. Now the necessary
>> patches are included in the vendor BSP, this commit switches those
>> repos to use the vendor ones.
>> 
>> While at it, this commit also switches the defconfig to use an
>> external glibc stable Bootlin toolchain, to follow recommendations
>> from [4]. Since an external toolchain is used, the linux-headers.hash
>> custom hash file is no longer needed and is also removed. At the
>> time of this commit, the Bootlin stable toolchain is a gcc 14.
>> 
>> Also, due to the upstream uboot commit [5], this commit adds a uboot
>> config fragment to disable CONFIG_EFI_CAPSULE_AUTHENTICATE, to
>> remove the dependency on the command "cert-to-efi-sig-list", provided
>> the host efitools package, which is not yet in Buildroot.
>> 
>> This commit was run tested on board 700-94611 Rev B1.
>> 
>> [1] 
>> https://gitlab.com/buildroot.org/buildroot/-/commit/a75b8623f5515d99bec48f96586115953150558e
>> [2] 
>> https://git.trustedfirmware.org/plugins/gitiles/TF-A/trusted-firmware-a.git/+/2e9198d0e0cbe9546348dd0a71ff6c3d2061d4eb%5E%21/
>> [3] 
>> https://gitlab.com/buildroot.org/buildroot/-/commit/2e05f22ff862192a7e512d0db0486351bba94ae8
>> [4] 
>> https://elinux.org/Buildroot:DeveloperDaysELCE2024#Rules_for_defconfigs
>> [5] 
>> https://git.u-boot-project.org/u-boot/u-boot/-/commit/fd58c275f6ba524101ba0990e53f5a11ac390bd0
>> 
>> Reported-by: Robert P. J. Day <rpjday@crashcourse.ca>
>> Signed-off-by: Julien Olivain <ju.o@free.fr>
>> ---
>>  .../arm-trusted-firmware/arm-trusted-firmware.hash    |  2 +-
>>  .../patches/linux-headers/linux-headers.hash          |  1 -
>>  board/freescale/imx93frdm/patches/linux/linux.hash    |  2 +-
>>  board/freescale/imx93frdm/patches/uboot/uboot.hash    |  2 +-
>>  board/freescale/imx93frdm/uboot.fragment              |  1 +
>>  configs/freescale_imx93frdm_defconfig                 | 11 
>> +++++++----
>>  6 files changed, 11 insertions(+), 8 deletions(-)
>>  delete mode 120000 
>> board/freescale/imx93frdm/patches/linux-headers/linux-headers.hash
>>  create mode 100644 board/freescale/imx93frdm/uboot.fragment
>> 
>> diff --git 
>> a/board/freescale/imx93frdm/patches/arm-trusted-firmware/arm-trusted-firmware.hash 
>> b/board/freescale/imx93frdm/patches/arm-trusted-firmware/arm-trusted-firmware.hash
>> index 7561385cb8..bf39f1e9c7 100644
>> --- 
>> a/board/freescale/imx93frdm/patches/arm-trusted-firmware/arm-trusted-firmware.hash
>> +++ 
>> b/board/freescale/imx93frdm/patches/arm-trusted-firmware/arm-trusted-firmware.hash
>> @@ -1,2 +1,2 @@
>>  # Locally calculated
>> -sha256  
>> 8cfe0afc903ebbc03f27e4874aa9ce82be78843a8b42ed4c906871e7f311b510  
>> imx-atf-lf-6.6.36-2.1.0.tar.gz
>> +sha256  
>> d7813f4ad5431edb162d6be2775bc021f9007b9c6934e977330291168523a507  
>> imx-atf-lf-6.18.20-2.0.0.tar.gz
>> diff --git 
>> a/board/freescale/imx93frdm/patches/linux-headers/linux-headers.hash 
>> b/board/freescale/imx93frdm/patches/linux-headers/linux-headers.hash
>> deleted file mode 120000
>> index 5808d92afe..0000000000
>> --- 
>> a/board/freescale/imx93frdm/patches/linux-headers/linux-headers.hash
>> +++ /dev/null
>> @@ -1 +0,0 @@
>> -../linux/linux.hash
>> \ No newline at end of file
>> diff --git a/board/freescale/imx93frdm/patches/linux/linux.hash 
>> b/board/freescale/imx93frdm/patches/linux/linux.hash
>> index 0da8c03384..222ec55328 100644
>> --- a/board/freescale/imx93frdm/patches/linux/linux.hash
>> +++ b/board/freescale/imx93frdm/patches/linux/linux.hash
>> @@ -1,2 +1,2 @@
>>  # Locally calculated
>> -sha256  
>> 3244dc3c62c990d9de90e1c7193aa3099e0e74e720de5c9c13edfbfdd802f596  
>> linux-imx-lf-6.6.36-2.1.0-imx93frdm.tar.gz
>> +sha256  
>> a8f55764fd1418db8adfd2711c0abb7d5464a8ee1cbfd0f6878f1059ecfa1316  
>> linux-imx-lf-6.18.20-2.0.0.tar.gz
>> diff --git a/board/freescale/imx93frdm/patches/uboot/uboot.hash 
>> b/board/freescale/imx93frdm/patches/uboot/uboot.hash
>> index e512c27f7d..01e860b59e 100644
>> --- a/board/freescale/imx93frdm/patches/uboot/uboot.hash
>> +++ b/board/freescale/imx93frdm/patches/uboot/uboot.hash
>> @@ -1,2 +1,2 @@
>>  # Locally calculated
>> -sha256  
>> bced4334363199d5465532d221d06dc3a5b49271067d74408019c825ed2ca715  
>> uboot-imx-lf-6.6.36-2.1.0-imx93frdm.tar.gz
>> +sha256  
>> 96942f8c49736b7d40277891bf0a34cfdd0afb59390f79b65b2b33b3bbd19f61  
>> uboot-imx-lf-6.18.20-2.0.0.tar.gz
>> diff --git a/board/freescale/imx93frdm/uboot.fragment 
>> b/board/freescale/imx93frdm/uboot.fragment
>> new file mode 100644
>> index 0000000000..201ab28290
>> --- /dev/null
>> +++ b/board/freescale/imx93frdm/uboot.fragment
>> @@ -0,0 +1 @@
>> +# CONFIG_EFI_CAPSULE_AUTHENTICATE is not set
>> diff --git a/configs/freescale_imx93frdm_defconfig 
>> b/configs/freescale_imx93frdm_defconfig
>> index 8e16762d8f..53875cc020 100644
>> --- a/configs/freescale_imx93frdm_defconfig
>> +++ b/configs/freescale_imx93frdm_defconfig
>> @@ -1,14 +1,16 @@
>>  BR2_aarch64=y
>>  BR2_cortex_a55=y
>>  BR2_ARM_FPU_VFPV4D16=y
>> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
>> +BR2_TOOLCHAIN_EXTERNAL=y
>> +BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
>> +BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
>>  BR2_GLOBAL_PATCH_DIR="board/freescale/imx93frdm/patches"
>>  BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
>>  BR2_TARGET_GENERIC_GETTY_PORT="ttyLP0"
>>  
>> BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/imx9-bootloader-prepare.sh 
>> board/freescale/common/imx/post-image.sh"
>>  BR2_LINUX_KERNEL=y
>>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
>> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call 
>> github,jolivain,linux-imx,lf-6.6.36-2.1.0-imx93frdm)/linux-imx-lf-6.6.36-2.1.0-imx93frdm.tar.gz"
>> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call 
>> github,nxp-imx,linux-imx,lf-6.18.20-2.0.0)/linux-imx-lf-6.18.20-2.0.0.tar.gz"
>>  BR2_LINUX_KERNEL_DEFCONFIG="imx_v8"
>>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx93-11x11-frdm"
>> @@ -22,14 +24,15 @@ BR2_TARGET_ROOTFS_EXT2_4=y
>>  BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
>>  BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
>>  BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
>> -BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call 
>> github,nxp-imx,imx-atf,lf-6.6.36-2.1.0)/imx-atf-lf-6.6.36-2.1.0.tar.gz"
>> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call 
>> github,nxp-imx,imx-atf,lf-6.18.20-2.0.0)/imx-atf-lf-6.18.20-2.0.0.tar.gz"
>>  BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx93"
>>  BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
>>  BR2_TARGET_UBOOT=y
>>  BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>>  BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
>> -BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call 
>> github,jolivain,uboot-imx,lf-6.6.36-2.1.0-imx93frdm)/uboot-imx-lf-6.6.36-2.1.0-imx93frdm.tar.gz"
>> +BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call 
>> github,nxp-imx,uboot-imx,lf-6.18.20-2.0.0)/uboot-imx-lf-6.18.20-2.0.0.tar.gz"
>>  BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx93_11x11_frdm"
>> +BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/freescale/imx93frdm/uboot.fragment"
>>  BR2_TARGET_UBOOT_NEEDS_DTC=y
>>  BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
>>  BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
>> --
>> 2.55.0
>> 
> 
> Looks good, here's the first part of the boot after applying the patch
> and configuring with "make freescale_imx93frdm_defconfig":
> 
> 
> U-Boot SPL 2026.04 (Jul 29 2026 - 14:16:48 -0400)
> PMIC: PCA9451A
> PMIC: Over Drive Voltage Mode
> DDR: 3733MTS
> found DRAM 2CS_2GB DRAM matched
> M33 prepare ok
> Normal Boot
> Trying to boot from BOOTROM
> Boot Stage: Primary boot
> image offset 0x8000, pagesize 0x200, ivt offset 0x0
> Load image from 0x5b400 by ROM_API
> NOTICE:  TRDC init done
> NOTICE:  BL31: v2.14.1(release):custom
> NOTICE:  BL31: Built : 14:15:18, Jul 29 2026
> 
> 
> U-Boot 2026.04 (Jul 29 2026 - 14:16:48 -0400)
> 
> Reset Status: POR
> 
> CPU:   NXP i.MX93(52) Rev1.1 A55 at 1700 MHz
> CPU:   Industrial temperature grade (-40C to 105C) at 33C
> Model: NXP i.MX93 11X11 FRDM board
> DRAM:  2 GiB
> optee optee: OP-TEE api uid mismatch
> BOARD: V1.0(ADC2:686,ADC3:297)
> TCPC:  Vendor ID [0x1fc9], Product ID [0x5110], Addr [I2C2 0x52]
> SNK.Power3.0 on CC1
> 
> ... snip until login prompt ...
> 
> Tested-by: Robert P. J. Day <rpjday@crashcourse.ca>

Thanks for testing. With that, I applied the patch to master.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
