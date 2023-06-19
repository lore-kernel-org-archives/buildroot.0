Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11294EB64D9
	for <buildroot@archiver.kernel.org>; Mon, 19 Jun 2023 17:40:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49EA460746;
	Mon, 19 Jun 2023 17:40:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 49EA460746
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VBgj_m6O6v9f; Mon, 19 Jun 2023 17:40:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C95B60808;
	Mon, 19 Jun 2023 17:40:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C95B60808
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B19B91BF34D
 for <buildroot@lists.busybox.net>; Mon, 19 Jun 2023 17:40:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 986F540490
 for <buildroot@lists.busybox.net>; Mon, 19 Jun 2023 17:40:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 986F540490
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uAdkQ3YXQsrv for <buildroot@lists.busybox.net>;
 Mon, 19 Jun 2023 17:40:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B41A34031C
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B41A34031C
 for <buildroot@buildroot.org>; Mon, 19 Jun 2023 17:40:02 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id ADFD220039F;
 Mon, 19 Jun 2023 19:39:58 +0200 (CEST)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:35056])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 19 Jun 2023 19:39:58 +0200
MIME-Version: 1.0
Date: Mon, 19 Jun 2023 19:39:58 +0200
From: Julien Olivain <ju.o@free.fr>
To: Andreas Dannenberg <dannenberg@ti.com>
In-Reply-To: <20230616002359.4139814-8-dannenberg@ti.com>
References: <20230616002359.4139814-1-dannenberg@ti.com>
 <20230616002359.4139814-8-dannenberg@ti.com>
User-Agent: Webmail Free/1.6.1
Message-ID: <6cdc63a2ff8ddc7c753108220fa9664b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1687196399;
 bh=kaqHHanWxAX754vPxrVSITLSwbF85gWcAu5Y+XY/nC4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=k6fjwtgim8VpHDk7ppICKa0/CStf07aU8uNKsr7PvGM+P9nMrRiN/8Nr08GiNxMCZ
 4MiwP7uAdxZYo39O8yxW8+1p2IsRXkWviNsDXWBwpetxIJi4f1RNV1Z+YMfeWdtip9
 B756u0bp+H+Q8kp1EtOyC/Icek6FaQvt2ECYfTOxDwtWeaT9l2m0TGc5H7KCKxNhK7
 lUNFbItN7jM5dWkXh8C2izkykU5CcCT4eSYdfD9AZyMbblAZhwSEks0z0zCQfkhLrH
 YQjjicK8WOAZGbd1kw+FnecaUrMfS+drJSIXmCBgwPMBig2DI7m5gGuR2tAM23GsML
 ishbgDYm64rTg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=k6fjwtgi
Subject: Re: [Buildroot] [PATCH v8 07/10] board/ti/am62x_sk|am64x_sk: switch
 to HS-FS device variants
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
Cc: Andreas Dannenberg <dannenberg@ti.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Andreas,

Thanks for the update!

I successfully booted this am64x_sk_defconfig on SK-AM64B board, with
this patch series on top of branch master at commit b91524f.


On 16/06/2023 02:23, Andreas Dannenberg via buildroot wrote:
> Current starter kits for AM62x (called SK-AM62B, see [1]) and AM64x
> (called SK-AM64B, see [2]) both contain High Security - Field Securable
> (HS-FS) device variants, and those are really the recommended 
> production
> device variants and boards TI will provide moving forward. Hence, 
> switch
> the defconfigs for those boards over to accommodate those now-shipping
> device variants and boards.
> 
> [1] https://www.ti.com/tool/SK-AM62B
> [2] https://www.ti.com/tool/SK-AM64B
> 

Tested-by: Julien Olivain <ju.o@free.fr>

> Signed-off-by: Andreas Dannenberg <dannenberg@ti.com>
> ---
>  board/ti/am62x_sk/readme.txt | 16 ++++++++++++++++
>  board/ti/am64x_sk/readme.txt | 16 ++++++++++++++++
>  configs/am62x_sk_defconfig   |  2 +-
>  configs/am64x_sk_defconfig   |  4 ++--
>  4 files changed, 35 insertions(+), 3 deletions(-)
> 
> diff --git a/board/ti/am62x_sk/readme.txt 
> b/board/ti/am62x_sk/readme.txt
> index ccbb24896b..9c7c8818af 100644
> --- a/board/ti/am62x_sk/readme.txt
> +++ b/board/ti/am62x_sk/readme.txt
> @@ -12,6 +12,22 @@ $ make am62x_sk_defconfig
>  Optional: modify the configuration:
>  $ make menuconfig
> 
> +Required setup step for High Security HS-FS and HS-SE SoC variants:
> +
> +To allow the image signing process for various firmware artifacts to
> +work the build process for HS-FS and HS-SE device variants is using
> +an external 'core-secdev-k3' package which can be obtained from
> +https://git.ti.com/cgit/security-development-tools/core-secdev-k3.
> +To prepare building for those device variants create a local copy of
> +the 'core-secdev-k3' and export its location through the
> +TI_SECURE_DEV_PKG environmental variable. Use the package as-is for
> +HS-FS device variants such as populated on the SK-AM64B board, or
> +customize this package with your private signing keys when using a
> +HS-SE device variant.
> +
> +$ git clone 
> https://git.ti.com/git/security-development-tools/core-secdev-k3.git
> +$ export TI_SECURE_DEV_PKG=$PWD/core-secdev-k3
> +
>  Build:
>  $ make
> 
> diff --git a/board/ti/am64x_sk/readme.txt 
> b/board/ti/am64x_sk/readme.txt
> index fe83c675f5..51d0312726 100644
> --- a/board/ti/am64x_sk/readme.txt
> +++ b/board/ti/am64x_sk/readme.txt
> @@ -12,6 +12,22 @@ $ make am64x_sk_defconfig
>  Optional: modify the configuration:
>  $ make menuconfig
> 
> +Required setup step for High Security HS-FS and HS-SE SoC variants:
> +
> +To allow the image signing process for various firmware artifacts to
> +work the build process for HS-FS and HS-SE device variants is using
> +an external 'core-secdev-k3' package which can be obtained from
> +https://git.ti.com/cgit/security-development-tools/core-secdev-k3.
> +To prepare building for those device variants create a local copy of
> +the 'core-secdev-k3' and export its location through the
> +TI_SECURE_DEV_PKG environmental variable. Use the package as-is for
> +HS-FS device variants such as populated on the SK-AM64B board, or
> +customize this package with your private signing keys when using a
> +HS-SE device variant.
> +
> +$ git clone 
> https://git.ti.com/git/security-development-tools/core-secdev-k3.git
> +$ export TI_SECURE_DEV_PKG=$PWD/core-secdev-k3
> +
>  Build:
>  $ make
> 
> diff --git a/configs/am62x_sk_defconfig b/configs/am62x_sk_defconfig
> index 2d05ddd96b..033101b735 100644
> --- a/configs/am62x_sk_defconfig
> +++ b/configs/am62x_sk_defconfig
> @@ -28,7 +28,7 @@ BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_CRYPTOGRAPHY=y
>  BR2_TARGET_OPTEE_OS_PLATFORM="k3"
>  BR2_TARGET_TI_K3_IMAGE_GEN=y
>  BR2_TARGET_TI_K3_IMAGE_GEN_SOC="am62x"
> -BR2_TARGET_TI_K3_IMAGE_GEN_SOC_TYPE="gp"
> +BR2_TARGET_TI_K3_IMAGE_GEN_SOC_TYPE="hs-fs"
>  BR2_TARGET_TI_K3_IMAGE_GEN_CONFIG="evm"
>  BR2_TARGET_TI_K3_R5_LOADER=y
>  BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_TARBALL=y
> diff --git a/configs/am64x_sk_defconfig b/configs/am64x_sk_defconfig
> index a26e38a043..096dd77f6a 100644
> --- a/configs/am64x_sk_defconfig
> +++ b/configs/am64x_sk_defconfig
> @@ -28,8 +28,8 @@ BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_CRYPTOGRAPHY=y
>  BR2_TARGET_OPTEE_OS_PLATFORM="k3"
>  BR2_TARGET_TI_K3_IMAGE_GEN=y
>  BR2_TARGET_TI_K3_IMAGE_GEN_FW_TYPE_TISCI=y
> -BR2_TARGET_TI_K3_IMAGE_GEN_SOC="am64x"
> -BR2_TARGET_TI_K3_IMAGE_GEN_SOC_TYPE="gp"
> +BR2_TARGET_TI_K3_IMAGE_GEN_SOC="am64x_sr2"
> +BR2_TARGET_TI_K3_IMAGE_GEN_SOC_TYPE="hs-fs"
>  BR2_TARGET_TI_K3_IMAGE_GEN_CONFIG="evm"
>  BR2_TARGET_TI_K3_R5_LOADER=y
>  BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_TARBALL=y

Please note that this patch series introduce 18 check-package warnings.
I understand from the current review comments that a v9 series will
be needed. Please run a "utils/docker-run make check-package" and
include the appropriate changes.

See:
https://nightly.buildroot.org/manual.html#_preparing_a_patch_series

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
