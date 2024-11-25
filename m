Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20E29D59D7F
	for <buildroot@archiver.kernel.org>; Mon, 25 Nov 2024 22:00:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D713661603;
	Mon, 25 Nov 2024 22:00:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bc58dQIFBda2; Mon, 25 Nov 2024 22:00:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D5F1D61631
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5F1D61631;
	Mon, 25 Nov 2024 22:00:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6930A281F
 for <buildroot@buildroot.org>; Mon, 25 Nov 2024 22:00:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6470961603
 for <buildroot@buildroot.org>; Mon, 25 Nov 2024 22:00:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VRGG15XK5elb for <buildroot@buildroot.org>;
 Mon, 25 Nov 2024 22:00:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0B6A2600B8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B6A2600B8
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0B6A2600B8
 for <buildroot@buildroot.org>; Mon, 25 Nov 2024 22:00:32 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 0D09019F732;
 Mon, 25 Nov 2024 23:00:26 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:50204])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 25 Nov 2024 23:00:26 +0100
MIME-Version: 1.0
Date: Mon, 25 Nov 2024 23:00:26 +0100
From: Julien Olivain <ju.o@free.fr>
To: Jean-Christophe Bauduin <jean-christophe.bauduin@mind.be>
Cc: buildroot@buildroot.org, Fabio Estevam <festevam@gmail.com>
In-Reply-To: <20241125103246.756587-1-jean-christophe.bauduin@mind.be>
References: <20241030141811.1372499-1-jean-christophe.bauduin@mind.be>
 <20241125103246.756587-1-jean-christophe.bauduin@mind.be>
User-Agent: Webmail Free/1.6.9
Message-ID: <302def4780b4086d05209428405ee73e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1732572029;
 bh=AMtYu7541F4UEwvekj27GIdpjcKFXaKcOt9D8epfIJ0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pAOS2wYB8AHNl8ZwQ4J/2AYC9eRhb7cE+bGrhZCioqZSiSBjQ1Woi4MDuJx1iFu50
 zZLzSUxRAuZHV+vBF2kU/bxmQqeu8p3OFgo0hQgduVtDzH6Rbqtls5ajN9B3jOaabt
 w59774tFcv4ajMIdXTTfUgKZ9gy6HOSCeK98UvYcxYCyAhL9/fjqYldEPnVmnr1v5D
 JWCt0Hie96AMMeAfu6zjH1GPoKVvWsryCiXxelvZX2PXjl5+8Hw3yULAx8HGMzbQ1y
 4eIlE2KBESN4oj9vLbTLDyc8UDb0t1Itb1Q6iel08XzCxAf7VM7S8pKdG6hVhVdwPU
 wlBdm/Fx9Mr9Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=pAOS2wYB
Subject: Re: [Buildroot] [PATCH] board/imx7d-sdb: bump linux to 6.6.58 and
 uboot to 2024.10
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

Hi Jean-Christophe,

I applied this patch to the branch next.

I added your "Signed-off-by:" tag which was missing in the commit log.
I also added:
BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
which were missing. Testing the defconfig in "utils/docker-run" shows
the issue.

I also updated the linux.hash comment to prefer using the upstream
hashes.

Thanks!

On 25/11/2024 11:32, Jean-Christophe Bauduin via buildroot wrote:
> ---
>  .checkpackageignore                                      | 1 -
>  board/imx7d-sdb/patches/linux-headers/linux-headers.hash | 1 +
>  board/imx7d-sdb/patches/linux/linux.hash                 | 2 ++
>  board/imx7d-sdb/patches/uboot/uboot.hash                 | 2 ++
>  configs/imx7d-sdb_defconfig                              | 6 ++++--
>  5 files changed, 9 insertions(+), 3 deletions(-)
>  create mode 120000 
> board/imx7d-sdb/patches/linux-headers/linux-headers.hash
>  create mode 100644 board/imx7d-sdb/patches/linux/linux.hash
>  create mode 100644 board/imx7d-sdb/patches/uboot/uboot.hash
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index b793026881..d60d487e04 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -162,7 +162,6 @@ configs/imx6sx-sdb_defconfig 
> lib_defconfig.ForceCheckHash
>  configs/imx6ulevk_defconfig lib_defconfig.ForceCheckHash
>  configs/imx6ullevk_defconfig lib_defconfig.ForceCheckHash
>  configs/imx6ulpico_defconfig lib_defconfig.ForceCheckHash
> -configs/imx7d-sdb_defconfig lib_defconfig.ForceCheckHash
>  configs/imx7dpico_defconfig lib_defconfig.ForceCheckHash
>  configs/imx8mqevk_defconfig lib_defconfig.ForceCheckHash
>  configs/imxrt1050-evk_defconfig lib_defconfig.ForceCheckHash
> diff --git a/board/imx7d-sdb/patches/linux-headers/linux-headers.hash 
> b/board/imx7d-sdb/patches/linux-headers/linux-headers.hash
> new file mode 120000
> index 0000000000..5808d92afe
> --- /dev/null
> +++ b/board/imx7d-sdb/patches/linux-headers/linux-headers.hash
> @@ -0,0 +1 @@
> +../linux/linux.hash
> \ No newline at end of file
> diff --git a/board/imx7d-sdb/patches/linux/linux.hash 
> b/board/imx7d-sdb/patches/linux/linux.hash
> new file mode 100644
> index 0000000000..dafd9cff69
> --- /dev/null
> +++ b/board/imx7d-sdb/patches/linux/linux.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256  
> e7df81e588d70fab5ec3ec3bb04ac53d51f0860fc3b1ec45e0a4167a026899db  
> linux-6.6.58.tar.xz
> diff --git a/board/imx7d-sdb/patches/uboot/uboot.hash 
> b/board/imx7d-sdb/patches/uboot/uboot.hash
> new file mode 100644
> index 0000000000..904fa56c02
> --- /dev/null
> +++ b/board/imx7d-sdb/patches/uboot/uboot.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256  
> b28daf4ac17e43156363078bf510297584137f6df50fced9b12df34f61a92fb0  
> u-boot-2024.10.tar.bz2
> diff --git a/configs/imx7d-sdb_defconfig b/configs/imx7d-sdb_defconfig
> index 541a689ddc..5c3decff70 100644
> --- a/configs/imx7d-sdb_defconfig
> +++ b/configs/imx7d-sdb_defconfig
> @@ -2,12 +2,14 @@ BR2_arm=y
>  BR2_cortex_a7=y
>  BR2_ARM_FPU_NEON_VFPV4=y
>  BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
> +BR2_GLOBAL_PATCH_DIR="board/imx7d-sdb/patches"
> +BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
>  BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
>  BR2_ROOTFS_OVERLAY="board/freescale/imx7dsdb/rootfs_overlay"
>  
> BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.21"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.58"
>  BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="nxp/imx/imx7d-sdb"
> @@ -18,7 +20,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
>  BR2_TARGET_UBOOT=y
>  BR2_TARGET_UBOOT_BOARDNAME="mx7dsabresd"
>  BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.07"
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.10"
>  BR2_TARGET_UBOOT_FORMAT_DTB_IMX=y
>  BR2_PACKAGE_HOST_DOSFSTOOLS=y
>  BR2_PACKAGE_HOST_GENIMAGE=y
> --
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
