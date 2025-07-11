Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 983EAC83F1A
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 19:43:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66A6360685;
	Fri, 11 Jul 2025 19:43:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NtOD5oSiRAzH; Fri, 11 Jul 2025 19:43:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A218060883
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A218060883;
	Fri, 11 Jul 2025 19:43:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E614119
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 19:43:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 245FE60685
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 19:43:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YAEjDMsCquaR for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 19:43:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1BAA060598
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1BAA060598
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1BAA060598
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 19:43:40 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 17A52B0054E;
 Fri, 11 Jul 2025 21:43:37 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 11 Jul 2025 21:43:37 +0200
MIME-Version: 1.0
Date: Fri, 11 Jul 2025 21:43:37 +0200
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20250710174557.558115-1-romain.naour@smile.fr>
References: <20250710174557.558115-1-romain.naour@smile.fr>
User-Agent: Webmail Free/1.6.11
Message-ID: <41f2a4cf08b5ee40f3e4d2b5a8b22877@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1752263019;
 bh=gB9aEXvHfkhAdenHwmA0R1Ll2A4y8Jsr1d0TP1Pt83E=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=nEAxv+j7vG2jJkLgfbhcCaslPuzarwjC/5+ZAsMYmFcgEXSJTyiXKus/06AGhV4mF
 IhPprJYo4w9IaxGtiFvk8kAqMdRh0e0N8+Kg4nWI2/HLK9C/5dTvGlwo9UHdGk2CYb
 EZ8rXnfqzF0GPTcr8crQORsFdV9L7+mhrb1jLHT6prRks9ziECP6Brgz9lJsQrjFIZ
 QQzDc+vGnHUI9vEah5KNBbQ8f+nQSpADyVbyu2Sm80yTXc2S6KGAXvHhKb34NItBBX
 9/LkXfjeG5mYZvSXVdcC0t5CufVErXfg71Sh79Diszgk7oFf2QViNxWXTH0BibXtXe
 zVIMJAJcdSCtQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=nEAxv+j7
Subject: Re: [Buildroot] [PATCH] configs/beagley_ai_defconfig: new defconfig
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

On 10/07/2025 19:45, Romain Naour via buildroot wrote:
> Adds support for BeagleY-AI board by introducing the
> beagley_ai_defconfig file and related support files.
> 
> The BeagleY-AI uses the TI J722S SoC, also known as AM67A, also
> known as TDA4VEN or TDA4AEN.
> 
> Retrieve BSP settings from meta-ti (may be useful for other TI boards):
> 
> - Set BR2_TARGET_ARM_TRUSTED_FIRMWARE_TARGET_BOARD = "lite"
>   meta-ti-bsp/conf/machine/include/j722s.inc:TFA_BOARD = "lite"
> 
> - Set BR2_TARGET_UBOOT_NEEDS_ATF_BL31 to provide BL31 variable pointing
>   to ATF bl31.bin to the U-Boot build process [1].
> 
> - Set BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE to OP-TEE as BL32
>   secure payload. meta-ti set "SPD=opteed" to build ATF [2].
> 
> - Set BR2_TARGET_OPTEE_OS_PLATFORM to "k3-am62x".
>   meta-ti uses the OPTEEMACHINE to set optee-os platform [3].
>   meta-ti]$ git grep OPTEEMACHINE
>   meta-ti-bsp/conf/machine/include/j722s.inc:OPTEEMACHINE = "k3-am62x"
> 
> - Use am67a_beagley_ai_a53 and am67a_beagley_ai_r5 u-boot
>   defconfigs introduced in u-boot v2025.07 [4]
> 
> - u-boot distroboot (bootflow) detect extlinux.conf file from the first
>   SDcard partition, so we have to install the kernel and its dtb file.
>   Use devicetreedir instead of devicetree in extlinux.conf file to
>   avoid hardcoding the devicetree file name. TI boards are able to
>   retrieve dtb file name from an EEPROM (see TI_I2C_BOARD_DETECT in
>   uboot).
> 
> - Use 6.15.6 stable release instead of the latest 6.12 LTS since the
>   k3-j722s support was only introduced in 6.11 kernels.
> 
> - Provide a hash file for all custom package version
>   (arm-trusted-firmware, linux, ti-k3-r5-loader, uboot) to enable
>   BR2_DOWNLOAD_FORCE_CHECK_HASHES.
> 
> [1] 
> https://git.yoctoproject.org/meta-ti/commit/?id=e74b9a1746d4d04757c87c1920a0f743e55ff096
> [2] 
> https://git.yoctoproject.org/meta-ti/tree/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc?h=09.02.00.004#n7
> [3] 
> https://git.yoctoproject.org/meta-arm/tree/meta-arm/recipes-security/optee/optee-os.inc?h=4.0.3#n23
> [4] 
> https://source.denx.de/u-boot/u-boot/-/commit/b27c94958b976213e3f21e53943a699ffa53f16e
> 
> More information about the board can be found at:
> https://www.beagleboard.org/boards/beagley-ai
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
