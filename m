Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9ED7C36008
	for <buildroot@archiver.kernel.org>; Wed, 26 Mar 2025 20:57:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A20D6FA2E;
	Wed, 26 Mar 2025 20:57:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xsCE4KsrRmgp; Wed, 26 Mar 2025 20:57:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F3606F6B5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F3606F6B5;
	Wed, 26 Mar 2025 20:57:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 64C2B1B8
 for <buildroot@buildroot.org>; Wed, 26 Mar 2025 20:57:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 563C58101C
 for <buildroot@buildroot.org>; Wed, 26 Mar 2025 20:57:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id byzycZW-tVBt for <buildroot@buildroot.org>;
 Wed, 26 Mar 2025 20:57:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4FB0C846FB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4FB0C846FB
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4FB0C846FB
 for <buildroot@buildroot.org>; Wed, 26 Mar 2025 20:57:16 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id E47C05FFAA;
 Wed, 26 Mar 2025 21:57:09 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 26 Mar 2025 21:57:09 +0100
MIME-Version: 1.0
Date: Wed, 26 Mar 2025 21:57:09 +0100
From: Julien Olivain <ju.o@free.fr>
To: Francois Dugast <francois.dugast.foss@gmail.com>
Cc: buildroot@buildroot.org, Alistair Francis <alistair@alistair23.me>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20250323172806.558397-3-francois.dugast.foss@gmail.com>
References: <20250323172806.558397-1-francois.dugast.foss@gmail.com>
 <20250323172806.558397-3-francois.dugast.foss@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <a3d8db2e90e72f4482a55e751ce4828e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1743022633;
 bh=VF61gkqAPN2dSuDAQBD/doLtJNhDci3riGJeb9W8Wi8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=MtT3gG6pmRld3AA7ZZ4/pGQeUHeLSwzxWA/kcANkOAl7JidrIvoayESOdWr77EoET
 doajHKg7NiMngaQoCfbZpUqnQ9X0VhnHmFGFrjKlbh6BeQ/PMnpUHBgVYVVjTRty9z
 BRE5FGxb++FIlACZ77rIoosWk6FEXkSOsOeVsSE2QVqRvG96gYYMMst16cOeKXytVf
 Eo9SWnAnQ87P3c7GKoxwoxgDh6qNG+8hpB0eBjTNLQun/rDIc9OIrghyhL3ZOtojWs
 Y69NOOBjH4LccfpE3K89R5ViONK47EC/H4nu8xcwG9NMHjp4XxE+BVL5GitRJvLRmG
 7vMKjaKIMCi9A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=MtT3gG6p
Subject: Re: [Buildroot] [PATCH 2/2] configs/hifive_unmatched: new board
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Francois,

On 23/03/2025 18:28, Francois Dugast wrote:
> This patch adds support for the HiFive Unmatched board. This includes
> building the firmware, kernel and rootFS for the HiFive Unmatched.
> 
> The configuration is similar to the one for the HiFive Unleashed, this
> is why most of it is shared in board/sifive/common.
> 
> Signed-off-by: Francois Dugast <francois.dugast.foss@gmail.com>

[...]

> diff --git a/configs/hifive_unmatched_defconfig 
> b/configs/hifive_unmatched_defconfig
> new file mode 100644
> index 0000000000..e26aaefb57
> --- /dev/null
> +++ b/configs/hifive_unmatched_defconfig
> @@ -0,0 +1,38 @@

Running the command "utils/docker-run make check-package" generates
an error on the defconfig:

     configs/hifive_unmatched_defconfig:0: missing 
BR2_DOWNLOAD_FORCE_CHECK_HASHES

In Buildroot, we are now introducing new defconfigs with
BR2_DOWNLOAD_FORCE_CHECK_HASHES=y to check all hashes.

See:
https://buildroot.org/downloads/manual/manual.html#_adding_project_specific_patches_and_hashes

See also an example commit just enabling hashes:
https://gitlab.com/buildroot.org/buildroot/-/commit/4ca8f0ea762061ad04016d065f37e0c351d578f1

Could you add those custom hashes please?

> +BR2_riscv=y
> +BR2_riscv_custom=y
> +BR2_RISCV_ISA_RVM=y
> +BR2_RISCV_ISA_RVA=y
> +BR2_RISCV_ISA_RVF=y
> +BR2_RISCV_ISA_RVD=y
> +BR2_RISCV_ISA_RVC=y

The defconfigs should defined a specific Kernel version.
I believe the hifive unmatched was introduced in Kernel v5.12.
So I recommend to select the latest lts kernel, for example
v6.12.20. Then, you should have a config line:

BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y

> +BR2_TARGET_GENERIC_GETTY_PORT="ttySIF0"
> +BR2_SYSTEM_DHCP="eth0"
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/sifive/common/post-build.sh"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="-c 
> board/sifive/common/genimage_sdcard.cfg"
> +BR2_LINUX_KERNEL=y

And here, you should also have something like:

BR2_LINUX_KERNEL_CUSTOM_VERSION=y
BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.20"

> +BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
> +BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/sifive/common/linux.config.fragment"
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="sifive/hifive-unmatched-a00"
> +BR2_LINUX_KERNEL_INSTALL_TARGET=y
> +BR2_TARGET_ROOTFS_CPIO=y
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +BR2_TARGET_OPENSBI=y
> +BR2_TARGET_OPENSBI_CUSTOM_VERSION=y
> +BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.2"
> +BR2_TARGET_OPENSBI_PLAT="generic"
> +BR2_TARGET_UBOOT=y

Same comment for u-boot. The defconfig should select a specific
version. For example, we should have here:

BR2_TARGET_UBOOT_CUSTOM_VERSION=y
BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.01"

> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="sifive_unmatched"
> +BR2_TARGET_UBOOT_NEEDS_DTC=y
> +BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
> +BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
> +BR2_TARGET_UBOOT_NEEDS_OPENSBI=y
> +BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
> +BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
> +BR2_TARGET_UBOOT_SPL=y
> +BR2_PACKAGE_HOST_GENIMAGE=y
> +BR2_PACKAGE_HOST_UBOOT_TOOLS=y
> +BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
> +BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/sifive/hifive-unmatched/boot.cmd"

Also, as a suggestion, we could add a patch in the series that updates 
the
hifive_unleashed_defconfig. Basically, I'm thinking about:
- add custom hashes (and remove the entry in .checkpackageignore)
- update uboot and kernel to the same version as this config.

Having those configs aligned would probably make future maintenance 
easier.

Can you have a look at those changes, please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
