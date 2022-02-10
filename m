Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01D51C433F5
	for <buildroot@archiver.kernel.org>; Thu, 10 Feb 2022 16:39:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92E1960B87;
	Thu, 10 Feb 2022 16:39:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id msgBbSMRP9NP; Thu, 10 Feb 2022 16:39:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7B9560BCD;
	Thu, 10 Feb 2022 16:39:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 319A81BF20B
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 16:39:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2C56D40132
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 16:39:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E6m5MHKlL7hr for <buildroot@lists.busybox.net>;
 Thu, 10 Feb 2022 16:39:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14161.aruba.it (smtpcmd14161.aruba.it [62.149.156.161])
 by smtp2.osuosl.org (Postfix) with ESMTP id 30C0340184
 for <buildroot@buildroot.org>; Thu, 10 Feb 2022 16:39:35 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id ICTmnWBKJNVvLICTmnM3me; Thu, 10 Feb 2022 17:39:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644511175; bh=uzUIWF8GbHVJi964OPnMKWXgzI9NAYBk9sksQDBDi3Q=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=lM40+hSyCIUOkHmtSY5XVxfTkAzPgxZRV3xwrEfsmN3bJTOcT8eK/Go7+lcLFXEDM
 VDWPAJDrW6UU3WbrI8n+Sadhu9UUVT3ABXdMeTFl+vmW+pGOA+SOpb5p/Tm6Z27e+I
 Y8MHByGaC3ria5Fyfoeqhua4C+wlGm6ofXzml8JasWoDWZPT+0pgWmKM7bUSPt14Pf
 YZmQZA0KXsganoF5Bdh8+rSTzCJSEuV7Du7gURb6n6Fq9Ofkycu+/6AshWU5q6xKOg
 hXdLndwIpFcLq+DyFTcuUcl7Zwa/vwM7zyoLFSzDYanbwKVjcChOc9VdfKymbU03c5
 oAJe53g0WRoGg==
Message-ID: <7ed72b26-0729-93c7-e1c7-c429e2a5fb87@benettiengineering.com>
Date: Thu, 10 Feb 2022 17:39:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Neal Frager <neal.frager@xilinx.com>, buildroot@buildroot.org
References: <20220210081932.3114763-1-neal.frager@xilinx.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220210081932.3114763-1-neal.frager@xilinx.com>
X-CMAE-Envelope: MS4wfM5nrbsItIOoWSVoyw/aH2GMFIBI2fIjVKvmjqHp5EHvjSbAVNmQYFonetK6dTbi8HqyAsqLCq2CsWaTzftkdW3Kat3zQFFzlO1hF1ssQi3EyE+tMbjm
 9CUHx6jeRyEa9rna+B/FQNT8ZcyajpMh3pnaJVG2R32NKEGBccoNKQmxQFJIXc2v4xtL/Ulb7WySq2tRNudZrLMNEiP0sRDTz1qV6rViXx5wlWjqT4EXCoZX
 uzsdehotbxobt/jz4o3YCf/+l0+sPWwAl/8iVDIfTQp1YY2BulNOtvrEb7wGdrEzXL+k+chdKCXz1GXiQkBjWg==
Subject: Re: [Buildroot] [PATCH v4 1/2] configs/zynqmp_zcu106: bump
 ATF/U-Boot/Linux to Xilinx 2022
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
Cc: luca@lucaceresoli.net, michal.simek@xilinx.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Neal,

On 10/02/22 09:19, Neal Frager wrote:
> This patch:
> - bumps ATF to Xilinx v2.6: mainline v2.6 requires patch to build
> - bumps U-Boot to Xilinx 2022.01: important drivers not in mainline
> - bumps Linux to Xilinx 5.15: important drivers not in mainline
> - deletes board/zynqmp/patches directory: patches already in mainline
> - modifies board/zynqmp/genimage.cfg: U-Boot 2022.01 uses u-boot.itb format
> - adds extlinux.conf to vfat bootfs
> - modifies U-Boot to unified xilinx_zynqmp_virt_defconfig (supports all boards)
> - adds support for SPL pm_cfg_obj.c loading to PMU firmware
> - enables support for host machines without OpenSSL required by U-Boot and Linux
> 

If you put the 3 dashes below, everything after them will be ignored, so 
you need to put here...

> ---
> V1->V2:
> * fixed general build issues
> * added extlinux.conf for run-time boot issue
> V2->V3:
> * enabled support for host machines without OpenSSL required by U-Boot and Linux
> * moved readme.txt update to zynqmp_zcu102_defconfig patch 2/2
> V3->V4:
> * cleaned up commit log messages
> * added version history
> ---
> 
> Signed-off-by: Neal Frager <neal.frager@xilinx.com>
> Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Tested-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> [Giulio: only build tested]

These ^^^

> Signed-off-by: Neal Frager <neal.frager@xilinx.com>

And drop this ^^^ that is already part of the patch.

Same goes for patch 2/2

And I would shrink pm_cfg_obj.c down to what boards really sport without 
thinking too much about eventual custom boards as discussed here:
https://lists.buildroot.org/pipermail/buildroot/2022-February/636513.html

> ---
>   board/zynqmp/extlinux.conf                    |   5 +
>   board/zynqmp/genimage.cfg                     |   6 +-
>   ...-fix-Remove-GGC-ignore-Warray-bounds.patch |  68 --
>   ...64-zynqmp-zcu106-fix-SPL-MMC-booting.patch |  52 --
>   ...2-arm64-zynqmp-Enable-booting-to-ATF.patch | 114 ----
>   ...ept-an-absolute-path-for-PMUFW_INIT_.patch |  68 --
>   ...ynqmp-pass-the-PS-init-file-as-a-kco.patch | 175 -----
>   board/zynqmp/pm_cfg_obj.c                     | 614 ++++++++++++++++++

But here I see you only have one pm_cfg_obj.c for both z102 and z106, is 
that sufficient? I mean, have they so common peripherals?

I see we have to deal with:
Zynq UltraScale+ XCZU7EV-2FFVC1156 MPSoC for z106
and
Zynq UltraScale+ XCZU9EG-2FFVB1156 MPSoC for z102

so I don't know if having a common pm_cfg_obj.c should be a good idea.

I know few about FPGAs, but I don't know if they are really compatible.

What you and Luca think about this?

Btw, thank you Luca for noticing it!

Best regards
-- 
Giulio Benetti
Benetti Engineering sas

>   board/zynqmp/post-build.sh                    |   8 +
>   board/zynqmp/post-image.sh                    |   4 +-
>   configs/zynqmp_zcu106_defconfig               |  23 +-
>   11 files changed, 648 insertions(+), 489 deletions(-)
>   create mode 100644 board/zynqmp/extlinux.conf
>   delete mode 100644 board/zynqmp/patches/arm-trusted-firmware/0001-Coverity-fix-Remove-GGC-ignore-Warray-bounds.patch
>   delete mode 100644 board/zynqmp/patches/uboot/0001-arm64-zynqmp-zcu106-fix-SPL-MMC-booting.patch
>   delete mode 100644 board/zynqmp/patches/uboot/0002-arm64-zynqmp-Enable-booting-to-ATF.patch
>   delete mode 100644 board/zynqmp/patches/uboot/0003-arm64-zynqmp-accept-an-absolute-path-for-PMUFW_INIT_.patch
>   delete mode 100644 board/zynqmp/patches/uboot/0004-arm-arm64-zynq-zynqmp-pass-the-PS-init-file-as-a-kco.patch
>   create mode 100644 board/zynqmp/pm_cfg_obj.c
>   create mode 100755 board/zynqmp/post-build.sh
> 
> diff --git a/board/zynqmp/extlinux.conf b/board/zynqmp/extlinux.conf
> new file mode 100644
> index 0000000000..ae3ec8614a
> --- /dev/null
> +++ b/board/zynqmp/extlinux.conf
> @@ -0,0 +1,5 @@
> +label linux
> +  kernel /Image
> +  devicetree /system.dtb
> +  append console=ttyPS0,115200 root=/dev/mmcblk0p2 rw rootwait
> +
> diff --git a/board/zynqmp/genimage.cfg b/board/zynqmp/genimage.cfg
> index ed202f4550..20d8352c08 100644
> --- a/board/zynqmp/genimage.cfg
> +++ b/board/zynqmp/genimage.cfg
> @@ -2,11 +2,13 @@ image boot.vfat {
>   	vfat {
>   		files = {
>   			"boot.bin",
> -			"u-boot.bin",
> -			"atf-uboot.ub",
> +			"u-boot.itb",
>   			"system.dtb",
>   			"Image"
>   		}
> +		file extlinux/extlinux.conf {
> +			image = extlinux.conf
> +		}
>   	}
>   
>   	size = 32M
> diff --git a/board/zynqmp/patches/arm-trusted-firmware/0001-Coverity-fix-Remove-GGC-ignore-Warray-bounds.patch b/board/zynqmp/patches/arm-trusted-firmware/0001-Coverity-fix-Remove-GGC-ignore-Warray-bounds.patch
> deleted file mode 100644
> index 0c1a9ba2a4..0000000000
> --- a/board/zynqmp/patches/arm-trusted-firmware/0001-Coverity-fix-Remove-GGC-ignore-Warray-bounds.patch
> +++ /dev/null
> @@ -1,68 +0,0 @@
> -From da003e6ada7d0217fe99dc7c649a731f8ebd3c34 Mon Sep 17 00:00:00 2001
> -From: Deepika Bhavnani <deepika.bhavnani@arm.com>
> -Date: Thu, 15 Aug 2019 00:56:46 +0300
> -Subject: [PATCH] Coverity fix: Remove GGC ignore -Warray-bounds
> -
> -GCC diagnostics were added to ignore array boundaries, instead
> -of ignoring GCC warning current code will check for array boundaries
> -and perform and array update only for valid elements.
> -
> -Resolves: `CID 246574` `CID 246710` `CID 246651`
> -
> -Signed-off-by: Deepika Bhavnani <deepika.bhavnani@arm.com>
> -Change-Id: I7530ecf7a1707351c6ee87e90cc3d33574088f57
> -
> -Backported from: 41af05154abe136938bcfb5f26c969933784bbef
> -[Adapted to apply on 1.5]
> -
> ----
> - lib/psci/psci_common.c | 20 ++++++++++----------
> - 1 file changed, 10 insertions(+), 10 deletions(-)
> -
> -diff --git a/lib/psci/psci_common.c b/lib/psci/psci_common.c
> -index 2220a745cd6e..6282d992a2f0 100644
> ---- a/lib/psci/psci_common.c
> -+++ b/lib/psci/psci_common.c
> -@@ -188,21 +188,17 @@ static unsigned int get_power_on_target_pwrlvl(void)
> - /******************************************************************************
> -  * Helper function to update the requested local power state array. This array
> -  * does not store the requested state for the CPU power level. Hence an
> -- * assertion is added to prevent us from accessing the wrong index.
> -+ * assertion is added to prevent us from accessing the CPU power level.
> -  *****************************************************************************/
> - static void psci_set_req_local_pwr_state(unsigned int pwrlvl,
> - 					 unsigned int cpu_idx,
> - 					 plat_local_state_t req_pwr_state)
> - {
> --	/*
> --	 * This should never happen, we have this here to avoid
> --	 * "array subscript is above array bounds" errors in GCC.
> --	 */
> - 	assert(pwrlvl > PSCI_CPU_PWR_LVL);
> --#pragma GCC diagnostic push
> --#pragma GCC diagnostic ignored "-Warray-bounds"
> --	psci_req_local_pwr_states[pwrlvl - 1][cpu_idx] = req_pwr_state;
> --#pragma GCC diagnostic pop
> -+	if ((pwrlvl > PSCI_CPU_PWR_LVL) && (pwrlvl <= PLAT_MAX_PWR_LVL) &&
> -+			(cpu_idx < PLATFORM_CORE_COUNT)) {
> -+		psci_req_local_pwr_states[pwrlvl - 1U][cpu_idx] = req_pwr_state;
> -+	}
> - }
> -
> - /******************************************************************************
> -@@ -228,7 +224,11 @@ static plat_local_state_t *psci_get_req_local_pwr_states(unsigned int pwrlvl,
> - {
> - 	assert(pwrlvl > PSCI_CPU_PWR_LVL);
> -
> --	return &psci_req_local_pwr_states[pwrlvl - 1][cpu_idx];
> -+	if ((pwrlvl > PSCI_CPU_PWR_LVL) && (pwrlvl <= PLAT_MAX_PWR_LVL) &&
> -+			(cpu_idx < PLATFORM_CORE_COUNT)) {
> -+		return &psci_req_local_pwr_states[pwrlvl - 1U][cpu_idx];
> -+	} else
> -+		return NULL;
> - }
> -
> - /*
> ---
> -2.34.0
> -
> diff --git a/board/zynqmp/patches/uboot/0001-arm64-zynqmp-zcu106-fix-SPL-MMC-booting.patch b/board/zynqmp/patches/uboot/0001-arm64-zynqmp-zcu106-fix-SPL-MMC-booting.patch
> deleted file mode 100644
> index 4d85e1bb12..0000000000
> --- a/board/zynqmp/patches/uboot/0001-arm64-zynqmp-zcu106-fix-SPL-MMC-booting.patch
> +++ /dev/null
> @@ -1,52 +0,0 @@
> -From e5d72ed8339eb05285448aad3c89d21e4d18fd29 Mon Sep 17 00:00:00 2001
> -From: Luca Ceresoli <luca@lucaceresoli.net>
> -Date: Mon, 26 Feb 2018 09:40:34 +0100
> -Subject: [PATCH] arm64: zynqmp: zcu106: fix SPL MMC booting
> -
> -The U-Boot SPL generated with the current zcu106 defconfig cannot boot
> -from MMC:
> -
> -  [...]
> -  U-Boot SPL 2018.01 (Feb 21 2018 - 17:47:14)
> -  EL Level:  EL3
> -  Trying to boot from MMC1
> -  sdhci_transfer_data: Error detected in status(0x408020)!
> -  spl_load_image_fat_os: error reading image u-boot.bin, err - -2
> -  spl_load_image_fat: error reading image u-boot.img, err - -6
> -  SPL: failed to boot from all boot devices
> -  ### ERROR ### Please RESET the board ###
> -
> -Fix by lowering the rpll value. The new value for the RPLL_CTRL
> -register comes from the current psu_init_gpl.c from the HDF file at
> -https://github.com/xilinx/hdf-examples/tree/01ad8ea5fd1989abf4ea5a072d019a16cb2bc546/zcu106-zynqmp
> -(generated by Vivado v2017.4).
> -
> -RPLL and sdio1_ref clocks before and after this change:
> -
> - - Old values: RPLL 1.36 GHz, sdio1_ref 272 MHz
> - - New values: RPLL 1.16 GHz, sdio1_ref 233 MHz
> -
> -Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> -Cc: Michal Simek <michal.simek@xilinx.com>
> -Upstream-status: accepted upstream in a different form
> ----
> -
> - board/xilinx/zynqmp/zynqmp-zcu106-revA/psu_init_gpl.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/board/xilinx/zynqmp/zynqmp-zcu106-revA/psu_init_gpl.c b/board/xilinx/zynqmp/zynqmp-zcu106-revA/psu_init_gpl.c
> -index 4d18abe000ca..e6fa477e53e7 100644
> ---- a/board/xilinx/zynqmp/zynqmp-zcu106-revA/psu_init_gpl.c
> -+++ b/board/xilinx/zynqmp/zynqmp-zcu106-revA/psu_init_gpl.c
> -@@ -10,7 +10,7 @@
> - static unsigned long psu_pll_init_data(void)
> - {
> - 	psu_mask_write(0xFF5E0034, 0xFE7FEDEFU, 0x7E4E2C62U);
> --	psu_mask_write(0xFF5E0030, 0x00717F00U, 0x00013C00U);
> -+	psu_mask_write(0xFF5E0030, 0x00717F00U, 0x00014600U);
> - 	psu_mask_write(0xFF5E0030, 0x00000008U, 0x00000008U);
> - 	psu_mask_write(0xFF5E0030, 0x00000001U, 0x00000001U);
> - 	psu_mask_write(0xFF5E0030, 0x00000001U, 0x00000000U);
> ---
> -2.7.4
> -
> diff --git a/board/zynqmp/patches/uboot/0002-arm64-zynqmp-Enable-booting-to-ATF.patch b/board/zynqmp/patches/uboot/0002-arm64-zynqmp-Enable-booting-to-ATF.patch
> deleted file mode 100644
> index 487fff6812..0000000000
> --- a/board/zynqmp/patches/uboot/0002-arm64-zynqmp-Enable-booting-to-ATF.patch
> +++ /dev/null
> @@ -1,114 +0,0 @@
> -From 5e3cac50cc981e01d9072241035a8d4162560c71 Mon Sep 17 00:00:00 2001
> -From: Luca Ceresoli <luca@lucaceresoli.net>
> -Date: Mon, 12 Mar 2018 17:18:38 +0100
> -Subject: [PATCH] arm64: zynqmp: Enable booting to ATF
> -
> -U-Boot is now able to boot to ARM Trusted Firmware (ATF). The boot
> -flow is SPL(EL3) loads ATF and full u-boot and jump to ATF(EL3) which
> -pass control to full u-boot(EL2). This has been tested on zcu106, so
> -enable it in this defconfig.
> -
> -To generate an image that triggers this booting flow, you need to pass
> -'-O arm-trusted-firmware' to mkimage.
> -
> -Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> -Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> -Backported from upstream: http://git.denx.de/?p=u-boot.git;a=commit;h=5e3cac50cc981e01d9072241035a8d4162560c71
> ----
> -
> - configs/xilinx_zynqmp_zc1751_xm015_dc1_defconfig | 1 +
> - configs/xilinx_zynqmp_zc1751_xm016_dc2_defconfig | 1 +
> - configs/xilinx_zynqmp_zc1751_xm018_dc4_defconfig | 1 +
> - configs/xilinx_zynqmp_zc1751_xm019_dc5_defconfig | 1 +
> - configs/xilinx_zynqmp_zcu102_rev1_0_defconfig    | 1 +
> - configs/xilinx_zynqmp_zcu102_revA_defconfig      | 1 +
> - configs/xilinx_zynqmp_zcu102_revB_defconfig      | 1 +
> - 7 files changed, 7 insertions(+)
> -
> -diff --git a/configs/xilinx_zynqmp_zc1751_xm015_dc1_defconfig b/configs/xilinx_zynqmp_zc1751_xm015_dc1_defconfig
> -index c5bfa2b12638..488c72258b0e 100644
> ---- a/configs/xilinx_zynqmp_zc1751_xm015_dc1_defconfig
> -+++ b/configs/xilinx_zynqmp_zc1751_xm015_dc1_defconfig
> -@@ -19,6 +19,7 @@ CONFIG_BOARD_EARLY_INIT_R=y
> - CONFIG_SPL_OS_BOOT=y
> - CONFIG_SPL_RAM_SUPPORT=y
> - CONFIG_SPL_RAM_DEVICE=y
> -+CONFIG_SPL_ATF=y
> - CONFIG_SYS_PROMPT="ZynqMP> "
> - CONFIG_FASTBOOT=y
> - CONFIG_FASTBOOT_FLASH=y
> -diff --git a/configs/xilinx_zynqmp_zc1751_xm016_dc2_defconfig b/configs/xilinx_zynqmp_zc1751_xm016_dc2_defconfig
> -index f86dce403a42..5d501eec0edd 100644
> ---- a/configs/xilinx_zynqmp_zc1751_xm016_dc2_defconfig
> -+++ b/configs/xilinx_zynqmp_zc1751_xm016_dc2_defconfig
> -@@ -20,6 +20,7 @@ CONFIG_BOARD_EARLY_INIT_R=y
> - CONFIG_SPL_OS_BOOT=y
> - CONFIG_SPL_RAM_SUPPORT=y
> - CONFIG_SPL_RAM_DEVICE=y
> -+CONFIG_SPL_ATF=y
> - CONFIG_SYS_PROMPT="ZynqMP> "
> - CONFIG_FASTBOOT=y
> - CONFIG_FASTBOOT_FLASH=y
> -diff --git a/configs/xilinx_zynqmp_zc1751_xm018_dc4_defconfig b/configs/xilinx_zynqmp_zc1751_xm018_dc4_defconfig
> -index 6e947cf56827..6f7eaebd7676 100644
> ---- a/configs/xilinx_zynqmp_zc1751_xm018_dc4_defconfig
> -+++ b/configs/xilinx_zynqmp_zc1751_xm018_dc4_defconfig
> -@@ -16,6 +16,7 @@ CONFIG_BOARD_EARLY_INIT_R=y
> - CONFIG_SPL_OS_BOOT=y
> - CONFIG_SPL_RAM_SUPPORT=y
> - CONFIG_SPL_RAM_DEVICE=y
> -+CONFIG_SPL_ATF=y
> - CONFIG_SYS_PROMPT="ZynqMP> "
> - CONFIG_CMD_MEMTEST=y
> - CONFIG_SYS_ALT_MEMTEST=y
> -diff --git a/configs/xilinx_zynqmp_zc1751_xm019_dc5_defconfig b/configs/xilinx_zynqmp_zc1751_xm019_dc5_defconfig
> -index 1c934858c61c..7a3806cba4b5 100644
> ---- a/configs/xilinx_zynqmp_zc1751_xm019_dc5_defconfig
> -+++ b/configs/xilinx_zynqmp_zc1751_xm019_dc5_defconfig
> -@@ -17,6 +17,7 @@ CONFIG_BOARD_EARLY_INIT_R=y
> - CONFIG_SPL_OS_BOOT=y
> - CONFIG_SPL_RAM_SUPPORT=y
> - CONFIG_SPL_RAM_DEVICE=y
> -+CONFIG_SPL_ATF=y
> - CONFIG_SYS_PROMPT="ZynqMP> "
> - CONFIG_CMD_MEMTEST=y
> - CONFIG_SYS_ALT_MEMTEST=y
> -diff --git a/configs/xilinx_zynqmp_zcu102_rev1_0_defconfig b/configs/xilinx_zynqmp_zcu102_rev1_0_defconfig
> -index e13c7c56f310..e4408f182ca0 100644
> ---- a/configs/xilinx_zynqmp_zcu102_rev1_0_defconfig
> -+++ b/configs/xilinx_zynqmp_zcu102_rev1_0_defconfig
> -@@ -19,6 +19,7 @@ CONFIG_BOARD_EARLY_INIT_R=y
> - CONFIG_SPL_OS_BOOT=y
> - CONFIG_SPL_RAM_SUPPORT=y
> - CONFIG_SPL_RAM_DEVICE=y
> -+CONFIG_SPL_ATF=y
> - CONFIG_SYS_PROMPT="ZynqMP> "
> - CONFIG_FASTBOOT=y
> - CONFIG_FASTBOOT_FLASH=y
> -diff --git a/configs/xilinx_zynqmp_zcu102_revA_defconfig b/configs/xilinx_zynqmp_zcu102_revA_defconfig
> -index 5b2cd495ee85..b52f6789fd4b 100644
> ---- a/configs/xilinx_zynqmp_zcu102_revA_defconfig
> -+++ b/configs/xilinx_zynqmp_zcu102_revA_defconfig
> -@@ -19,6 +19,7 @@ CONFIG_BOARD_EARLY_INIT_R=y
> - CONFIG_SPL_OS_BOOT=y
> - CONFIG_SPL_RAM_SUPPORT=y
> - CONFIG_SPL_RAM_DEVICE=y
> -+CONFIG_SPL_ATF=y
> - CONFIG_SYS_PROMPT="ZynqMP> "
> - CONFIG_FASTBOOT=y
> - CONFIG_FASTBOOT_FLASH=y
> -diff --git a/configs/xilinx_zynqmp_zcu102_revB_defconfig b/configs/xilinx_zynqmp_zcu102_revB_defconfig
> -index e6530fbfe7ff..80592554f682 100644
> ---- a/configs/xilinx_zynqmp_zcu102_revB_defconfig
> -+++ b/configs/xilinx_zynqmp_zcu102_revB_defconfig
> -@@ -19,6 +19,7 @@ CONFIG_BOARD_EARLY_INIT_R=y
> - CONFIG_SPL_OS_BOOT=y
> - CONFIG_SPL_RAM_SUPPORT=y
> - CONFIG_SPL_RAM_DEVICE=y
> -+CONFIG_SPL_ATF=y
> - CONFIG_SYS_PROMPT="ZynqMP> "
> - CONFIG_FASTBOOT=y
> - CONFIG_FASTBOOT_FLASH=y
> ---
> -2.7.4
> -
> diff --git a/board/zynqmp/patches/uboot/0003-arm64-zynqmp-accept-an-absolute-path-for-PMUFW_INIT_.patch b/board/zynqmp/patches/uboot/0003-arm64-zynqmp-accept-an-absolute-path-for-PMUFW_INIT_.patch
> deleted file mode 100644
> index 95ab7b3b75..0000000000
> --- a/board/zynqmp/patches/uboot/0003-arm64-zynqmp-accept-an-absolute-path-for-PMUFW_INIT_.patch
> +++ /dev/null
> @@ -1,68 +0,0 @@
> -From c7df098a71e05dc81cee818747759e8060b59626 Mon Sep 17 00:00:00 2001
> -From: Luca Ceresoli <luca@lucaceresoli.net>
> -Date: Mon, 4 Jun 2018 12:21:01 +0200
> -Subject: [PATCH] arm64: zynqmp: accept an absolute path for PMUFW_INIT_FILE
> -
> -The value of PMUFW_INIT_FILE is prefixed with "$(srctree)/", thus
> -forcing it to be a relative path inside the U-Boot source tree. Since
> -the PMUFW is a binary file generated outside of U-Boot, the PMUFW
> -binary must be copied inside the U-Boot source tree before the
> -build.
> -
> -This generates a few problems:
> -
> - * if the source tree is shared among different out-of-tree builds,
> -   they will pollute (and potentially corrupt) each other
> - * the source tree cannot be read-only
> - * any buildsystem must add a command to copy the PMUFW binary
> - * putting an externally-generated binary in the source tree is ugly
> -   as hell
> -
> -Avoid these problems by accepting an absolute path for
> -PMUFW_INIT_FILE. This would be as simple as removing the "$(srctree)/"
> -prefix, but in order to keep backward compatibility we rather use the
> -shell and readlink to get the absolute path even when starting from a
> -relative path.
> -
> -Since 'readlink -f' produces an empty string if the file does not
> -exist, we also add a check to ensure the file configured in
> -PMUFW_INIT_FILE exists. Otherwise the build would exit successfully,
> -but produce a boot.bin without PMUFW as if PMUFW_INIT_FILE were empty.
> -
> -Tested in the 12 possible combinations of:
> - - PMUFW_INIT_FILE empty, relative, absolute, non-existing
> - - building in-tree, in subdir, in other directory
> -
> -Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> -Cc: Michal Simek <michal.simek@xilinx.com>
> -Cc: Simon Glass <sjg@chromium.org>
> -Cc: Emmanuel Vadot <manu@bidouilliste.com>
> -Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> -Backported from upstream: https://git.denx.de/?p=u-boot.git;a=commit;h=c7df098a71e05dc81cee818747759e8060b59626
> ----
> - scripts/Makefile.spl | 8 +++++++-
> - 1 file changed, 7 insertions(+), 1 deletion(-)
> -
> -diff --git a/scripts/Makefile.spl b/scripts/Makefile.spl
> -index ef018b5b4056..252f13826d4c 100644
> ---- a/scripts/Makefile.spl
> -+++ b/scripts/Makefile.spl
> -@@ -167,8 +167,14 @@ ifdef CONFIG_ARCH_ZYNQ
> - MKIMAGEFLAGS_boot.bin = -T zynqimage -R $(srctree)/$(CONFIG_BOOT_INIT_FILE)
> - endif
> - ifdef CONFIG_ARCH_ZYNQMP
> -+ifneq ($(CONFIG_PMUFW_INIT_FILE),"")
> -+spl/boot.bin: zynqmp-check-pmufw
> -+zynqmp-check-pmufw: FORCE
> -+	( cd $(srctree) && test -r $(CONFIG_PMUFW_INIT_FILE) ) \
> -+		|| ( echo "Cannot read $(CONFIG_PMUFW_INIT_FILE)" && false )
> -+endif
> - MKIMAGEFLAGS_boot.bin = -T zynqmpimage -R $(srctree)/$(CONFIG_BOOT_INIT_FILE) \
> --	-n $(srctree)/$(CONFIG_PMUFW_INIT_FILE)
> -+	-n "$(shell cd $(srctree); readlink -f $(CONFIG_PMUFW_INIT_FILE))"
> - endif
> -
> - spl/boot.bin: $(obj)/u-boot-spl.bin FORCE
> ---
> -2.7.4
> -
> diff --git a/board/zynqmp/patches/uboot/0004-arm-arm64-zynq-zynqmp-pass-the-PS-init-file-as-a-kco.patch b/board/zynqmp/patches/uboot/0004-arm-arm64-zynq-zynqmp-pass-the-PS-init-file-as-a-kco.patch
> deleted file mode 100644
> index b32e162780..0000000000
> --- a/board/zynqmp/patches/uboot/0004-arm-arm64-zynq-zynqmp-pass-the-PS-init-file-as-a-kco.patch
> +++ /dev/null
> @@ -1,175 +0,0 @@
> -From 4c9d54ab5a41d65000c8d249b6fb1b76056f1812 Mon Sep 17 00:00:00 2001
> -From: Luca Ceresoli <luca@lucaceresoli.net>
> -Date: Wed, 20 Jun 2018 12:11:50 +0200
> -Subject: [PATCH] arm/arm64: zynq/zynqmp: pass the PS init file as a kconfig
> - variable
> -
> -U-Boot needs to link ps7_init_gpl.c on Zynq or psu_init_gpl.c on
> -ZynqMP (PS init for short). The current logic to locate this file for
> -both platforms is:
> -
> - 1. if a board-specific file exists in
> -    board/xilinx/zynq[mp]/$(CONFIG_DEFAULT_DEVICE_TREE)/ps?_init_gpl.c
> -    then use it
> - 2. otherwise use board/xilinx/zynq/ps?_init_gpl.c
> -
> -In the latter case the file does not exist in the U-Boot sources and
> -must be copied in the source tree from the outside before starting the
> -build. This is typical when it is generated from Xilinx tools while
> -developing a custom hardware. However making sure that a
> -board-specific file is _not_ found (and used) requires some trickery
> -such as removing or overwriting all PS init files (e.g.: the current
> -meta-xilinx yocto layer [0]).
> -
> -This generates a few problems:
> -
> - * if the source tree is shared among different out-of-tree builds,
> -   they will pollute (and potentially corrupt) each other
> - * the source tree cannot be read-only
> - * any buildsystem must add a command to copy the PS init file binary
> - * overwriting or deleting files in the source tree is ugly as hell
> -
> -Simplify usage by allowing to pass the path to the desired PS init
> -file in kconfig variable XILINX_PS_INIT_FILE. It can be an absolute
> -path or relative to $(srctree). If the variable is set, the
> -user-specified file will always be used without being copied
> -around. If the the variable is left empty, for backward compatibility
> -fall back to the old behaviour.
> -
> -Since the issue is the same for Zynq and ZynqMP, add one kconfig
> -variable in a common place and use it for both.
> -
> -Also use the new kconfig help text to document all the ways to give
> -U-Boot the PS init file.
> -
> -Build-tested with all combinations of:
> - - platform: zynq or zynqmp
> - - PS init file: from XILINX_PS_INIT_FILE (absolute, relative path,
> -   non-existing), in-tree board-specific, in board/xilinx/zynq[mp]/
> - - building in-tree, in subdir, in other directory
> -
> -[0] https://github.com/Xilinx/meta-xilinx/blob/b2f74cc7fe5c4881589d5e440a17cb51fc66a7ab/meta-xilinx-bsp/recipes-bsp/u-boot/u-boot-spl-zynq-init.inc#L9
> -
> -Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> -Cc: Albert Aribaud <albert.u.boot@aribaud.net>
> -Cc: Michal Simek <michal.simek@xilinx.com>
> -Cc: Nathan Rossi <nathan@nathanrossi.com>
> -Backported from upstream: https://git.denx.de/?p=u-boot.git;a=commit;h=6da4f67ad09cd8b311d77b2b04e557b7ef65b56c
> ----
> - arch/arm/Kconfig             |  1 +
> - board/xilinx/Kconfig         | 41 +++++++++++++++++++++++++++++++++++++++++
> - board/xilinx/zynq/Makefile   | 10 +++++++++-
> - board/xilinx/zynqmp/Makefile | 10 +++++++++-
> - 4 files changed, 60 insertions(+), 2 deletions(-)
> - create mode 100644 board/xilinx/Kconfig
> -
> -diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> -index 22234cde2ab6..e04979d0ef7e 100644
> ---- a/arch/arm/Kconfig
> -+++ b/arch/arm/Kconfig
> -@@ -1293,4 +1293,5 @@ source "board/technologic/ts4600/Kconfig"
> - source "board/vscom/baltos/Kconfig"
> - source "board/woodburn/Kconfig"
> - source "board/work-microwave/work_92105/Kconfig"
> -+source "board/xilinx/Kconfig"
> - source "board/zipitz2/Kconfig"
> -
> - source "arch/arm/Kconfig.debug"
> -diff --git a/board/xilinx/Kconfig b/board/xilinx/Kconfig
> -new file mode 100644
> -index 000000000000..aa3fa061edef
> ---- /dev/null
> -+++ b/board/xilinx/Kconfig
> -@@ -0,0 +1,41 @@
> -+# Copyright (c) 2018, Luca Ceresoli <luca@lucaceresoli.net>
> -+#
> -+# SPDX-License-Identifier: GPL-2.0
> -+
> -+if ARCH_ZYNQ || ARCH_ZYNQMP
> -+
> -+config XILINX_PS_INIT_FILE
> -+	string "Zynq/ZynqMP PS init file(s) location"
> -+	help
> -+	  On Zynq and ZynqMP U-Boot SPL (or U-Boot proper if
> -+	  ZYNQMP_PSU_INIT_ENABLED is set) is responsible for some
> -+	  basic initializations, such as enabling peripherals and
> -+	  configuring pinmuxes. The PS init file (called
> -+	  psu_init_gpl.c on ZynqMP, ps7_init_gpl.c for Zynq-7000)
> -+	  contains the code for such initializations.
> -+
> -+	  U-Boot contains PS init files for some boards, but each of
> -+	  them describes only one specific configuration. Users of a
> -+	  different board, or needing a different configuration, can
> -+	  generate custom files using the Xilinx development tools.
> -+
> -+	  There are three ways to give a PS init file to U-Boot:
> -+
> -+	  1. Set this variable to the path, either relative to the
> -+	     source tree or absolute, where the psu_init_gpl.c or
> -+	     ps7_init_gpl.c file is located. U-Boot will build this
> -+	     file.
> -+
> -+	  2. If you leave an empty string here, U-Boot will use
> -+	     board/xilinx/zynq/$(CONFIG_DEFAULT_DEVICE_TREE)/ps7_init_gpl.c
> -+	     for Zynq-7000, or
> -+	     board/xilinx/zynqmp/$(CONFIG_DEFAULT_DEVICE_TREE)/psu_init_gpl.c
> -+	     for ZynqMP.
> -+
> -+	  3. If the above file does not exist, U-Boot will use
> -+	     board/xilinx/zynq/ps7_init_gpl.c for Zynq-7000, or
> -+	     board/xilinx/zynqmp/psu_init_gpl.c for ZynqMP. This file
> -+	     is not provided by U-Boot, you have to copy it there
> -+	     before the build.
> -+
> -+endif
> -diff --git a/board/xilinx/zynq/Makefile b/board/xilinx/zynq/Makefile
> -index 5a76a26720cd..03ad5f0532ee 100644
> ---- a/board/xilinx/zynq/Makefile
> -+++ b/board/xilinx/zynq/Makefile
> -@@ -5,10 +5,18 @@
> -
> - obj-y	:= board.o
> -
> --hw-platform-y :=$(shell echo $(CONFIG_DEFAULT_DEVICE_TREE))
> -+ifneq ($(CONFIG_XILINX_PS_INIT_FILE),"")
> -+PS_INIT_FILE := $(shell cd $(srctree); readlink -f $(CONFIG_XILINX_PS_INIT_FILE))
> -+init-objs := ps_init_gpl.o
> -+spl/board/xilinx/zynq/ps_init_gpl.o board/xilinx/zynq/ps_init_gpl.o: $(PS_INIT_FILE)
> -+	$(CC) $(c_flags) -I $(srctree)/$(src) -c -o $@ $^
> -+endif
> -
> -+ifeq ($(init-objs),)
> -+hw-platform-y :=$(shell echo $(CONFIG_DEFAULT_DEVICE_TREE))
> - init-objs := $(if $(wildcard $(srctree)/$(src)/$(hw-platform-y)/ps7_init_gpl.c),\
> - 	$(hw-platform-y)/ps7_init_gpl.o)
> -+endif
> -
> - ifeq ($(init-objs),)
> - ifneq ($(wildcard $(srctree)/$(src)/ps7_init_gpl.c),)
> -diff --git a/board/xilinx/zynqmp/Makefile b/board/xilinx/zynqmp/Makefile
> -index 05ccd25dcef3..960b81fc5853 100644
> ---- a/board/xilinx/zynqmp/Makefile
> -+++ b/board/xilinx/zynqmp/Makefile
> -@@ -5,10 +5,18 @@
> -
> - obj-y	:= zynqmp.o
> -
> --hw-platform-y :=$(shell echo $(CONFIG_DEFAULT_DEVICE_TREE))
> -+ifneq ($(CONFIG_XILINX_PS_INIT_FILE),"")
> -+PS_INIT_FILE := $(shell cd $(srctree); readlink -f $(CONFIG_XILINX_PS_INIT_FILE))
> -+init-objs := ps_init_gpl.o
> -+spl/board/xilinx/zynqmp/ps_init_gpl.o board/xilinx/zynqmp/ps_init_gpl.o: $(PS_INIT_FILE)
> -+	$(CC) $(c_flags) -I $(srctree)/$(src) -c -o $@ $^
> -+endif
> -
> -+ifeq ($(init-objs),)
> -+hw-platform-y :=$(shell echo $(CONFIG_DEFAULT_DEVICE_TREE))
> - init-objs := $(if $(wildcard $(srctree)/$(src)/$(hw-platform-y)/psu_init_gpl.c),\
> - 	$(hw-platform-y)/psu_init_gpl.o)
> -+endif
> -
> - ifeq ($(init-objs),)
> - ifneq ($(wildcard $(srctree)/$(src)/psu_init_gpl.c),)
> ---
> -2.7.4
> -
> diff --git a/board/zynqmp/pm_cfg_obj.c b/board/zynqmp/pm_cfg_obj.c
> new file mode 100644
> index 0000000000..7566b3236a
> --- /dev/null
> +++ b/board/zynqmp/pm_cfg_obj.c
> @@ -0,0 +1,614 @@
> +/******************************************************************************
> +* Copyright (c) 2017 - 2020 Xilinx, Inc.  All rights reserved.
> +* SPDX-License-Identifier: MIT
> +******************************************************************************/
> +
> +
> +#include "xil_types.h"
> +#include "pm_defs.h"
> +
> +#define PM_CONFIG_MASTER_SECTION_ID	0x101U
> +#define PM_CONFIG_SLAVE_SECTION_ID	0x102U
> +#define PM_CONFIG_PREALLOC_SECTION_ID	0x103U
> +#define PM_CONFIG_POWER_SECTION_ID	0x104U
> +#define PM_CONFIG_RESET_SECTION_ID	0x105U
> +#define PM_CONFIG_SHUTDOWN_SECTION_ID	0x106U
> +#define PM_CONFIG_SET_CONFIG_SECTION_ID	0x107U
> +#define PM_CONFIG_GPO_SECTION_ID	0x108U
> +
> +#define PM_SLAVE_FLAG_IS_SHAREABLE	0x1U
> +#define PM_MASTER_USING_SLAVE_MASK	0x2U
> +
> +#define PM_CONFIG_GPO1_MIO_PIN_34_MAP	(1U << 10U)
> +#define PM_CONFIG_GPO1_MIO_PIN_35_MAP	(1U << 11U)
> +#define PM_CONFIG_GPO1_MIO_PIN_36_MAP	(1U << 12U)
> +#define PM_CONFIG_GPO1_MIO_PIN_37_MAP	(1U << 13U)
> +
> +#define PM_CONFIG_GPO1_BIT_2_MASK	(1U << 2U)
> +#define PM_CONFIG_GPO1_BIT_3_MASK	(1U << 3U)
> +#define PM_CONFIG_GPO1_BIT_4_MASK	(1U << 4U)
> +#define PM_CONFIG_GPO1_BIT_5_MASK	(1U << 5U)
> +
> +#define SUSPEND_TIMEOUT	0xFFFFFFFFU
> +
> +
> +#define PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK    0x00000001
> +#define PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK    0x00000100
> +#define PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK    0x00000200
> +
> +
> +
> +#if defined (__ICCARM__)
> +#pragma language=save
> +#pragma language=extended
> +#endif
> +#if defined (__GNUC__)
> +    const u32 XPm_ConfigObject[] __attribute__((used, section(".sys_cfg_data"))) =
> +#elif defined (__ICCARM__)
> +#pragma location = ".sys_cfg_data"
> +__root const u32 XPm_ConfigObject[] =
> +#endif
> +{
> +	/**********************************************************************/
> +	/* HEADER */
> +	1,	/* Number of remaining words in the header */
> +	8,	/* Number of sections included in config object */
> +	/**********************************************************************/
> +	/* MASTER SECTION */
> +	PM_CONFIG_MASTER_SECTION_ID, /* Master SectionID */
> +	3U, /* No. of Masters*/
> +
> +	NODE_APU, /* Master Node ID */
> +	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK, /* IPI Mask of this master */
> +	SUSPEND_TIMEOUT, /* Suspend timeout */
> +	PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* Suspend permissions */
> +	PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* Wake permissions */
> +
> +	NODE_RPU_0, /* Master Node ID */
> +	PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK, /* IPI Mask of this master */
> +	SUSPEND_TIMEOUT, /* Suspend timeout */
> +	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* Suspend permissions */
> +	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* Wake permissions */
> +
> +	NODE_RPU_1, /* Master Node ID */
> +	PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask of this master */
> +	SUSPEND_TIMEOUT, /* Suspend timeout */
> +	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK, /* Suspend permissions */
> +	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK, /* Wake permissions */
> +
> +
> +	/**********************************************************************/
> +	/* SLAVE SECTION */
> +
> +
> +	PM_CONFIG_SLAVE_SECTION_ID,	/* Section ID */
> +	49,				/* Number of slaves */
> +
> +	NODE_OCM_BANK_0,
> +	PM_SLAVE_FLAG_IS_SHAREABLE,
> +	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK| PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK| PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
> +
> +	NODE_OCM_BANK_1,
> +	PM_SLAVE_FLAG_IS_SHAREABLE,
> +	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK| PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK| PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
> +
> +	NODE_OCM_BANK_2,
> +	PM_SLAVE_FLAG_IS_SHAREABLE,
> +	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK| PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK| PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
> +
> +	NODE_OCM_BANK_3,
> +	PM_SLAVE_FLAG_IS_SHAREABLE,
> +	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK| PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK| PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
> +
> +	NODE_TCM_0_A,
> +	PM_SLAVE_FLAG_IS_SHAREABLE,
> +	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK| PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK, /* IPI Mask */
> +
> +	NODE_TCM_0_B,
> +	PM_SLAVE_FLAG_IS_SHAREABLE,
> +	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK| PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK, /* IPI Mask */
> +
> +	NODE_TCM_1_A,
> +	PM_SLAVE_FLAG_IS_SHAREABLE,
> +	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK| PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
> +
> +	NODE_TCM_1_B,
> +	PM_SLAVE_FLAG_IS_SHAREABLE,
> +	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK| PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
> +
> +	NODE_L2,
> +	PM_SLAVE_FLAG_IS_SHAREABLE,
> +	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
> +
> +	NODE_GPU_PP_0,
> +	PM_SLAVE_FLAG_IS_SHAREABLE,
> +	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
> +
> +	NODE_GPU_PP_1,
> +	PM_SLAVE_FLAG_IS_SHAREABLE,
> +	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
> +
> +	NODE_USB_0,
> +	PM_SLAVE_FLAG_IS_SHAREABLE,
> +	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
> +
> +	NODE_USB_1,
> +	PM_SLAVE_FLAG_IS_SHAREABLE,
> +	0U, /* IPI Mask */
> +
> +	NODE_TTC_0,
> +	PM_SLAVE_FLAG_IS_SHAREABLE,
> +	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
> +
> +	NODE_TTC_1,
> +	PM_SLAVE_FLAG_IS_SHAREABLE,
> +	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
> +
> +	NODE_TTC_2,
> +	PM_SLAVE_FLAG_IS_SHAREABLE,
> +	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
> +
> +	NODE_TTC_3,
> +	PM_SLAVE_FLAG_IS_SHAREABLE,
> +	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
> +
> +	NODE_SATA,
> +	PM_SLAVE_FLAG_IS_SHAREABLE,
> +	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
> +
> +	NODE_ETH_0,
> +	PM_SLAVE_FLAG_IS_SHAREABLE,
> +	0U, /* IPI Mask */
> +
> +	NODE_ETH_1,
> +	PM_SLAVE_FLAG_IS_SHAREABLE,
> +	0U, /* IPI Mask */
> +
> +	NODE_ETH_2,
> +	PM_SLAVE_FLAG_IS_SHAREABLE,
> +	0U, /* IPI Mask */
> +
> +	NODE_ETH_3,
> +	PM_SLAVE_FLAG_IS_SHAREABLE,
> +	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
> +
> +	NODE_UART_0,
> +	PM_SLAVE_FLAG_IS_SHAREABLE,
> +	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
> +
> +	NODE_UART_1,
> +	PM_SLAVE_FLAG_IS_SHAREABLE,
> +	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
> +
> +	NODE_SPI_0,
> +	PM_SLAVE_FLAG_IS_SHAREABLE,
> +	0U, /* IPI Mask */
> +
> +	NODE_SPI_1,
> +	PM_SLAVE_FLAG_IS_SHAREABLE,
> +	0U, /* IPI Mask */
> +
> +	NODE_I2C_0,
> +	PM_SLAVE_FLAG_IS_SHAREABLE,
> +	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
> +
> +	NODE_I2C_1,
> +	PM_SLAVE_FLAG_IS_SHAREABLE,
> +	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
> +
> +	NODE_SD_0,
> +	PM_SLAVE_FLAG_IS_SHAREABLE,
> +	0U, /* IPI Mask */
> +
> +	NODE_SD_1,
> +	PM_SLAVE_FLAG_IS_SHAREABLE,
> +	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
> +
> +	NODE_DP,
> +	PM_SLAVE_FLAG_IS_SHAREABLE,
> +	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
> +
> +	NODE_GDMA,
> +	PM_SLAVE_FLAG_IS_SHAREABLE,
> +	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
> +
> +	NODE_ADMA,
> +	PM_SLAVE_FLAG_IS_SHAREABLE,
> +	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
> +
> +	NODE_NAND,
> +	PM_SLAVE_FLAG_IS_SHAREABLE,
> +	0U, /* IPI Mask */
> +
> +	NODE_QSPI,
> +	PM_SLAVE_FLAG_IS_SHAREABLE,
> +	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
> +
> +	NODE_GPIO,
> +	PM_SLAVE_FLAG_IS_SHAREABLE,
> +	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
> +
> +	NODE_CAN_0,
> +	PM_SLAVE_FLAG_IS_SHAREABLE,
> +	0U, /* IPI Mask */
> +
> +	NODE_CAN_1,
> +	PM_SLAVE_FLAG_IS_SHAREABLE,
> +	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
> +
> +	NODE_EXTERN,
> +	PM_SLAVE_FLAG_IS_SHAREABLE,
> +	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
> +
> +	NODE_DDR,
> +	PM_SLAVE_FLAG_IS_SHAREABLE,
> +	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK| PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK| PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
> +
> +	NODE_IPI_APU,
> +	0U,
> +	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK, /* IPI Mask */
> +
> +	NODE_IPI_RPU_0,
> +	0U,
> +	PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK, /* IPI Mask */
> +
> +	NODE_IPI_RPU_1,
> +	0U,
> +	PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
> +
> +	NODE_GPU,
> +	PM_SLAVE_FLAG_IS_SHAREABLE,
> +	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
> +
> +	NODE_PCIE,
> +	PM_SLAVE_FLAG_IS_SHAREABLE,
> +	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
> +
> +	NODE_PCAP,
> +	PM_SLAVE_FLAG_IS_SHAREABLE,
> +	0U, /* IPI Mask */
> +
> +	NODE_RTC,
> +	PM_SLAVE_FLAG_IS_SHAREABLE,
> +	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
> +
> +	NODE_VCU,
> +	PM_SLAVE_FLAG_IS_SHAREABLE,
> +	0U, /* IPI Mask */
> +
> +	NODE_PL,
> +	PM_SLAVE_FLAG_IS_SHAREABLE,
> +	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
> +
> +
> +	/**********************************************************************/
> +	/* PREALLOC SECTION */
> +
> +	PM_CONFIG_PREALLOC_SECTION_ID, /* Preallaoc SectionID */
> +	3U, /* No. of Masters*/
> +
> +/* Prealloc for psu_cortexa53_0 */
> +	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK,
> +	12,
> +	NODE_DDR,
> +	PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
> +	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
> +	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
> +
> +	NODE_L2,
> +	PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
> +	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
> +	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
> +
> +	NODE_OCM_BANK_0,
> +	PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
> +	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
> +	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
> +
> +	NODE_OCM_BANK_1,
> +	PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
> +	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
> +	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
> +
> +	NODE_OCM_BANK_2,
> +	PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
> +	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
> +	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
> +
> +	NODE_OCM_BANK_3,
> +	PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
> +	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
> +	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
> +
> +	NODE_I2C_0,
> +	PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
> +	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
> +	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
> +
> +	NODE_I2C_1,
> +	PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
> +	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
> +	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
> +
> +	NODE_SD_1,
> +	PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
> +	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
> +	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
> +
> +	NODE_QSPI,
> +	PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
> +	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
> +	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
> +
> +	NODE_PL,
> +	PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
> +	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
> +	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
> +
> +	NODE_IPI_APU,
> +	PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
> +	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
> +	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
> +
> +
> +	/* Prealloc for psu_cortexr5_0 */
> +	PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK,
> +	14,
> +	NODE_TCM_0_A,
> +	PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
> +	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
> +	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
> +
> +	NODE_TCM_0_B,
> +	PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
> +	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
> +	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
> +
> +	NODE_DDR,
> +	PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
> +	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
> +	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
> +
> +	NODE_OCM_BANK_0,
> +	PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
> +	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
> +	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
> +
> +	NODE_OCM_BANK_1,
> +	PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
> +	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
> +	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
> +
> +	NODE_OCM_BANK_2,
> +	PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
> +	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
> +	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
> +
> +	NODE_OCM_BANK_3,
> +	PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
> +	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
> +	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
> +
> +	NODE_I2C_0,
> +	PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
> +	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
> +	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
> +
> +	NODE_I2C_1,
> +	PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
> +	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
> +	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
> +
> +	NODE_SD_1,
> +	PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
> +	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
> +	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
> +
> +	NODE_QSPI,
> +	PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
> +	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
> +	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
> +
> +	NODE_PL,
> +	PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
> +	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
> +	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
> +
> +	NODE_ADMA,
> +	PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
> +	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
> +	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
> +
> +	NODE_IPI_RPU_0,
> +	PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
> +	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
> +	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
> +
> +
> +	/* Prealloc for psu_cortexr5_1 */
> +	PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	3,
> +	NODE_TCM_1_A,
> +	PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
> +	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
> +	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
> +
> +	NODE_TCM_1_B,
> +	PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
> +	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
> +	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
> +
> +	NODE_IPI_RPU_1,
> +	PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
> +	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
> +	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
> +
> +
> +	/**********************************************************************/
> +	/* POWER SECTION */
> +
> +	PM_CONFIG_POWER_SECTION_ID, /* Power Section ID */
> +	4U, /* Number of power nodes */
> +
> +	NODE_APU, /* Power node ID */
> +	PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* Force power down permissions */
> +
> +	NODE_RPU, /* Power node ID */
> +	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* Force power down permissions */
> +
> +	NODE_FPD, /* Power node ID */
> +	PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* Force power down permissions */
> +
> +	NODE_PLD, /* Power node ID */
> +	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* Force power down permissions */
> +
> +
> +	/**********************************************************************/
> +	/* RESET SECTION */
> +
> +	PM_CONFIG_RESET_SECTION_ID, /* Reset Section ID */
> +	120U, /* Number of resets */
> +
> +	XILPM_RESET_PCIE_CFG, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_PCIE_BRIDGE, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_PCIE_CTRL, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_DP, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_SWDT_CRF, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_AFI_FM5, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_AFI_FM4, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_AFI_FM3, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_AFI_FM2, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_AFI_FM1, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_AFI_FM0, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_GDMA, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_GPU_PP1, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_GPU_PP0, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_GPU, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_GT, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_SATA, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_ACPU3_PWRON, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_ACPU2_PWRON, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_ACPU1_PWRON, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_ACPU0_PWRON, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_APU_L2, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_ACPU3, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_ACPU2, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_ACPU1, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_ACPU0, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_DDR, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_APM_FPD, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_SOFT, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_GEM0, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_GEM1, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_GEM2, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_GEM3, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_QSPI, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_UART0, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_UART1, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_SPI0, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_SPI1, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_SDIO0, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_SDIO1, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_CAN0, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_CAN1, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_I2C0, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_I2C1, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_TTC0, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_TTC1, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_TTC2, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_TTC3, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_SWDT_CRL, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_NAND, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_ADMA, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_GPIO, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_IOU_CC, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_TIMESTAMP, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_RPU_R50, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_RPU_R51, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_RPU_AMBA, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_OCM, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_RPU_PGE, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_USB0_CORERESET, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_USB1_CORERESET, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_USB0_HIBERRESET, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_USB1_HIBERRESET, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_USB0_APB, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_USB1_APB, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_IPI, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_APM_LPD, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_RTC, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_SYSMON, 0,
> +	XILPM_RESET_AFI_FM6, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_LPD_SWDT, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_FPD, PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK,
> +	XILPM_RESET_RPU_DBG1, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_RPU_DBG0, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_DBG_LPD, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_DBG_FPD, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_APLL, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_DPLL, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_VPLL, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_IOPLL, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_RPLL, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_GPO3_PL_0, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_GPO3_PL_1, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_GPO3_PL_2, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_GPO3_PL_3, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_GPO3_PL_4, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_GPO3_PL_5, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_GPO3_PL_6, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_GPO3_PL_7, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_GPO3_PL_8, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_GPO3_PL_9, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_GPO3_PL_10, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_GPO3_PL_11, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_GPO3_PL_12, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_GPO3_PL_13, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_GPO3_PL_14, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_GPO3_PL_15, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_GPO3_PL_16, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_GPO3_PL_17, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_GPO3_PL_18, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_GPO3_PL_19, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_GPO3_PL_20, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_GPO3_PL_21, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_GPO3_PL_22, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_GPO3_PL_23, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_GPO3_PL_24, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_GPO3_PL_25, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_GPO3_PL_26, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_GPO3_PL_27, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_GPO3_PL_28, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_GPO3_PL_29, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_GPO3_PL_30, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_GPO3_PL_31, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_RPU_LS, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_PS_ONLY, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_PL, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_GPIO5_EMIO_92, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_GPIO5_EMIO_93, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_GPIO5_EMIO_94, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +	XILPM_RESET_GPIO5_EMIO_95, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +
> +	/**********************************************************************/
> +	/* SET CONFIG SECTION */
> +	PM_CONFIG_SET_CONFIG_SECTION_ID,	/* Section ID */
> +	0,					/* Permissions to set config */
> +	/**********************************************************************/
> +	/* SHUTDOWN SECTION */
> +	PM_CONFIG_SHUTDOWN_SECTION_ID,		/* Section ID */
> +	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* System Shutdown/Restart Permission */
> +
> +	/**********************************************************************/
> +	/* GPO SECTION */
> +	PM_CONFIG_GPO_SECTION_ID,		/* GPO Section ID */
> +	PM_CONFIG_GPO1_BIT_2_MASK |
> +	PM_CONFIG_GPO1_MIO_PIN_34_MAP |
> +	PM_CONFIG_GPO1_MIO_PIN_35_MAP |
> +	PM_CONFIG_GPO1_MIO_PIN_36_MAP |
> +	PM_CONFIG_GPO1_MIO_PIN_37_MAP |
> +	0,					/* State of GPO pins */
> +};
> +#if defined (__ICCARM__)
> +#pragma language=restore
> +#endif
> diff --git a/board/zynqmp/post-build.sh b/board/zynqmp/post-build.sh
> new file mode 100755
> index 0000000000..9fd8bbf2c8
> --- /dev/null
> +++ b/board/zynqmp/post-build.sh
> @@ -0,0 +1,8 @@
> +#!/bin/sh
> +
> +# genimage will need to find the extlinux.conf
> +# in the binaries directory
> +
> +BOARD_DIR="$(dirname $0)"
> +
> +install -m 0644 -D $BOARD_DIR/extlinux.conf $BINARIES_DIR/extlinux.conf
> diff --git a/board/zynqmp/post-image.sh b/board/zynqmp/post-image.sh
> index b2b99fed01..ed6dbe188c 100755
> --- a/board/zynqmp/post-image.sh
> +++ b/board/zynqmp/post-image.sh
> @@ -10,4 +10,6 @@ FIRST_DT=$(sed -nr \
>   
>   [ -z "${FIRST_DT}" ] || ln -fs ${FIRST_DT}.dtb ${BINARIES_DIR}/system.dtb
>   
> -support/scripts/genimage.sh -c board/zynqmp/genimage.cfg
> +BOARD_DIR="$(dirname $0)"
> +
> +support/scripts/genimage.sh -c $BOARD_DIR/genimage.cfg
> diff --git a/configs/zynqmp_zcu106_defconfig b/configs/zynqmp_zcu106_defconfig
> index bee7c1daf7..2026f60bd1 100644
> --- a/configs/zynqmp_zcu106_defconfig
> +++ b/configs/zynqmp_zcu106_defconfig
> @@ -1,34 +1,39 @@
>   BR2_aarch64=y
> -BR2_GLOBAL_PATCH_DIR="board/zynqmp/patches/"
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh"
>   BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_GIT=y
>   BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://github.com/Xilinx/linux-xlnx.git"
> -BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="xilinx-v2017.4"
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="xlnx_rebase_v5.15"
>   BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynqmp"
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
>   BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-zcu106-revA"
> +BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
>   BR2_TARGET_ROOTFS_EXT2=y
>   BR2_TARGET_ROOTFS_EXT2_4=y
>   # BR2_TARGET_ROOTFS_TAR is not set
>   BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
>   BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
> -BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/ARM-software/arm-trusted-firmware.git"
> -BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v1.5"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/Xilinx/arm-trusted-firmware.git"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="xlnx_rebase_v2.6"
>   BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="zynqmp"
>   BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
>   BR2_TARGET_UBOOT=y
>   BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>   BR2_TARGET_UBOOT_CUSTOM_GIT=y
> -BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://github.com/xilinx/u-boot-xlnx.git"
> -BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="228801a215909365ae1dcdd799034195ad7264f7"
> -BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_zcu106_revA"
> +BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://github.com/Xilinx/u-boot-xlnx.git"
> +BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="xlnx_rebase_v2022.01"
> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_virt"
>   BR2_TARGET_UBOOT_NEEDS_DTC=y
> +BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
>   BR2_TARGET_UBOOT_SPL=y
>   BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
>   BR2_TARGET_UBOOT_ZYNQMP=y
> -BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/lucaceresoli/zynqmp-pmufw-binaries/raw/53fdb7b6c92860ceb0ec5fd14deee302f4a84269/bin/pmufw-zcu106-default-v2017.4.bin"
> +BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/lucaceresoli/zynqmp-pmufw-binaries/raw/v2021.2/bin/pmufw-v2021.2.bin"
> +BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/pm_cfg_obj.c"
> +BR2_TARGET_UBOOT_FORMAT_ITB=y
> +BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
>   BR2_PACKAGE_HOST_DOSFSTOOLS=y
>   BR2_PACKAGE_HOST_GENIMAGE=y
>   BR2_PACKAGE_HOST_MTOOLS=y

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
