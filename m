Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AEBFE7718C
	for <buildroot@archiver.kernel.org>; Fri, 20 Dec 2024 19:18:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AAD39607CC;
	Fri, 20 Dec 2024 19:18:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wq6Nkkzsl9y8; Fri, 20 Dec 2024 19:18:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B14A7607D3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B14A7607D3;
	Fri, 20 Dec 2024 19:18:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 91428730
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 19:18:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7FA1C8129A
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 19:18:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P9yt0BS2m1Cj for <buildroot@buildroot.org>;
 Fri, 20 Dec 2024 19:18:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 83C5A8119B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 83C5A8119B
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 83C5A8119B
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 19:18:32 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 1CC652003C6;
 Fri, 20 Dec 2024 20:18:26 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:43650])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 20 Dec 2024 20:18:26 +0100
MIME-Version: 1.0
Date: Fri, 20 Dec 2024 20:18:26 +0100
From: Julien Olivain <ju.o@free.fr>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Michael Trimarchi
 <michael@amarulasolutions.com>, linux-amarula@amarulasolutions.com
In-Reply-To: <20241219173408.3349860-1-dario.binacchi@amarulasolutions.com>
References: <20241219173408.3349860-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <3a456f6db3d8ef38afc6f73f05673938@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1734722309;
 bh=eV6yTUWJeXjvQOgVROFCGanwljbM0J/AtX7q6aS/dUc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=aYorkJEji0X7DXgWxBW+JqvCpd3bWfVkoLUraGBvL73sFgVSGQ+MqTO1RVYbMorzk
 EWVKQ1I5jrok+tPa99ZDSea+mTzDnICzvf7fbFdfYyaOkCdgJ8eTuDgHr/ceB5OH5V
 0N/Vf+3D7CzbqFnOxrCP14ieRHs/Q29ZxBOwtt1SEkpAmFOtc0fvh7ZPd17Yx56iS8
 Nwh1HqJkuNki3zxTTfQ0Y01cT2UbNSfrmx6rqzorX13J1Y/C18XAGzfa7AXzVgLMyf
 h1ilJRY719xADRBTe1+BIaRs2dOOFvEgQoF7CSKHKKC2rliKjje4cZ2FZylNsDhuXC
 xM3iWZQDoFLAQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=aYorkJEj
Subject: Re: [Buildroot] [PATCH 1/1] configs/imx6ulz_bsh_smm_m2: bump U-Boot
 to 2024.10 and Linux to 6.1.120
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

On 19/12/2024 18:34, Dario Binacchi wrote:
> - Bump Linux kernel to 6.1.120
> - Bump U-Boot to 2024.10 and add the dependency on GnuTLS and
>   util-linux (for uuid)
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.

> ---
>  board/bsh/imx6ulz-bsh-smm-m2/patches/uboot/uboot.hash | 2 +-
>  configs/imx6ulz_bsh_smm_m2_defconfig                  | 6 ++++--
>  2 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/board/bsh/imx6ulz-bsh-smm-m2/patches/uboot/uboot.hash 
> b/board/bsh/imx6ulz-bsh-smm-m2/patches/uboot/uboot.hash
> index c0b3bcdd0404..904fa56c02a3 100644
> --- a/board/bsh/imx6ulz-bsh-smm-m2/patches/uboot/uboot.hash
> +++ b/board/bsh/imx6ulz-bsh-smm-m2/patches/uboot/uboot.hash
> @@ -1,2 +1,2 @@
>  # Locally calculated
> -sha256  
> e00e6c6f014e046101739d08d06f328811cebcf5ae101348f409cbbd55ce6900  
> u-boot-2023.10.tar.bz2
> +sha256  
> b28daf4ac17e43156363078bf510297584137f6df50fced9b12df34f61a92fb0  
> u-boot-2024.10.tar.bz2
> diff --git a/configs/imx6ulz_bsh_smm_m2_defconfig 
> b/configs/imx6ulz_bsh_smm_m2_defconfig
> index 29177c475656..f12dc8383d80 100644
> --- a/configs/imx6ulz_bsh_smm_m2_defconfig
> +++ b/configs/imx6ulz_bsh_smm_m2_defconfig
> @@ -9,7 +9,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
>  
> BR2_ROOTFS_POST_BUILD_SCRIPT="board/bsh/imx6ulz-bsh-smm-m2/post-build.sh"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.68"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.120"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  
> BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/bsh/imx6ulz-bsh-smm-m2/linux.config"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
> @@ -28,10 +28,12 @@ BR2_TARGET_ROOTFS_UBIFS_LEBSIZE=0x1f000
>  BR2_TARGET_UBOOT=y
>  BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>  BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.10"
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.10"
>  BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx6ulz_smm_m2"
>  BR2_TARGET_UBOOT_NEEDS_DTC=y
>  BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
> +BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
> +BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
>  # BR2_TARGET_UBOOT_FORMAT_BIN is not set
>  BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
>  BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-with-spl.imx"
> --
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
