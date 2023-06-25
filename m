Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71F7CEB64DC
	for <buildroot@archiver.kernel.org>; Sun, 25 Jun 2023 13:43:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10729812FE;
	Sun, 25 Jun 2023 13:43:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10729812FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xtZMgwS3rktp; Sun, 25 Jun 2023 13:43:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E0A2812D0;
	Sun, 25 Jun 2023 13:43:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E0A2812D0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 08E301BF3BA
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 13:43:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D588340141
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 13:43:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D588340141
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KG3jwVg_WWGI for <buildroot@lists.busybox.net>;
 Sun, 25 Jun 2023 13:43:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 950E540102
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 950E540102
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 13:43:45 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:36ab:e848:bc86:4439])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 428FBB0055E;
 Sun, 25 Jun 2023 15:43:33 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 25 Jun 2023 15:43:32 +0200
Date: Sun, 25 Jun 2023 15:43:32 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Andreas Dannenberg <dannenberg@ti.com>
Message-ID: <20230625134332.GB589277@scaer>
References: <20230622160212.2063472-1-dannenberg@ti.com>
 <20230622160212.2063472-5-dannenberg@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230622160212.2063472-5-dannenberg@ti.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1687700622;
 bh=+YT5HdPcK2qkWFviaCgwY+pjpbrJoCmEoAW9IKDbYWY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WfaC2pEjrtUe5geEeYd9besoXYuX8snxbLKK2x2ExMuNoQH+1OdgNsDwv9EPeTSP/
 RqT+scyWi33bgUtwnvv6OqcpjrHvUxfcybLICJcnrBSKLh71S6Yu2APK/t8QMjC5ds
 bFSUXZ+mTAz+tjuEfn0Bfqit10m0XlQDYgzNwJi7bBv5gLSSlWJnJNu1xJkNbT9LSQ
 XeCTYt4Tvd1OKWR2zgyirB5RHzYaQDcybprujZQReC2Rb8ydd9NgzHhACefpFOHU2W
 lWwU9PV9/zXkuXSbERlG/EEBdCzHxMuUsFT/Sm1xIxPX04iKHAidFOptQJahz4nOLH
 zvs9Iz2jfj78w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=WfaC2pEj
Subject: Re: [Buildroot] [PATCH v9 04/11] board/ti/am64x_sk: add new board
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
Cc: Bryan Brattlof <bb@ti.com>, Andrew Davis <afd@ti.com>,
 Julien Olivain <ju.o@free.fr>, Xuanhao Shi <x-shi@ti.com>,
 buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>, Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Andreas, All,

On 2023-06-22 11:02 -0500, Andreas Dannenberg via buildroot spake thusly:
> From: Xuanhao Shi <x-shi@ti.com>
> 
> Adds support for TI's SK-AM64 board by introducing the
> am64x_sk_defconfig file and related support files.
> 
> More information about the board can be found at:
> https://www.ti.com/tool/SK-AM64
> 
> Signed-off-by: Xuanhao Shi <x-shi@ti.com>
> Signed-off-by: Anand Gadiyar <gadiyar@ti.com>
> Signed-off-by: Andreas Dannenberg <dannenberg@ti.com>
> Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Acked-by: Andrew Davis <afd@ti.com>
> Tested-by: Bryan Brattlof <bb@ti.com>
> Cc: Romain Naour <romain.naour@gmail.com>
> Reviewed-by: Francois Perrad <francois.perrad@gadz.org>
> Reviewed-by: Julien Olivain <ju.o@free.fr>
> ---
[--SNIP--]
> diff --git a/configs/am64x_sk_defconfig b/configs/am64x_sk_defconfig
> new file mode 100644
> index 0000000000..411b3d5b0f
> --- /dev/null
> +++ b/configs/am64x_sk_defconfig
> @@ -0,0 +1,44 @@
> +BR2_aarch64=y
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/ti/am64x_sk/genimage.cfg"
> +BR2_LINUX_KERNEL=y

For the kernel, we prefer that an explcit version be used, rather than
the default, latest. Indeed, a board is usally tested using a specific
kernel version, and thus is more prone to break with a kernel update,
which will happen next time we update the kernel latest version.

As a consequence, you also need to add:

    BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_3=y

(yes, the current latest kernel version is 6.3)

Regards,
Yann E. MORIN.

> +BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/k3-am642-sk"
> +BR2_LINUX_KERNEL_INSTALL_TARGET=y
> +BR2_PACKAGE_LINUX_FIRMWARE=y
> +BR2_PACKAGE_LINUX_FIRMWARE_TI_WL18XX=y
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.7.0"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="k3"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_TARGET_BOARD="lite"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=y
> +BR2_TARGET_OPTEE_OS=y
> +BR2_TARGET_OPTEE_OS_PLATFORM="k3"
> +BR2_TARGET_TI_K3_IMAGE_GEN=y
> +BR2_TARGET_TI_K3_IMAGE_GEN_FW_TYPE_TISCI=y
> +BR2_TARGET_TI_K3_IMAGE_GEN_SOC="am64x"
> +BR2_TARGET_TI_K3_IMAGE_GEN_SOC_TYPE_GP=y
> +BR2_TARGET_TI_K3_IMAGE_GEN_CONFIG="evm"
> +BR2_TARGET_TI_K3_R5_LOADER=y
> +BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG="am64x_evm_r5"
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.10"
> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am64x_evm_a53"
> +BR2_TARGET_UBOOT_NEEDS_DTC=y
> +BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
> +BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
> +# BR2_TARGET_UBOOT_FORMAT_BIN is not set
> +BR2_TARGET_UBOOT_FORMAT_IMG=y
> +BR2_TARGET_UBOOT_SPL=y
> +BR2_TARGET_UBOOT_SPL_NAME="tispl.bin"
> +BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="TEE=$(BINARIES_DIR)/tee-pager_v2.bin"
> +BR2_PACKAGE_HOST_DOSFSTOOLS=y
> +BR2_PACKAGE_HOST_GENIMAGE=y
> +BR2_PACKAGE_HOST_MTOOLS=y
> -- 
> 2.34.1
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
