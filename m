Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23A4EC3DA4A
	for <buildroot@archiver.kernel.org>; Sun, 11 Aug 2024 03:58:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F9BC40D77;
	Sun, 11 Aug 2024 03:58:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mRGdoTsjPlUa; Sun, 11 Aug 2024 03:58:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C0B940B93
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C0B940B93;
	Sun, 11 Aug 2024 03:58:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9F5311BF3F9
 for <buildroot@lists.busybox.net>; Sun, 11 Aug 2024 03:58:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 88F26810CD
 for <buildroot@lists.busybox.net>; Sun, 11 Aug 2024 03:58:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZghwOr5gGzRw for <buildroot@lists.busybox.net>;
 Sun, 11 Aug 2024 03:58:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 43A45810CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43A45810CC
Received: from mail.tkos.co.il (guitar.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 43A45810CC
 for <buildroot@buildroot.org>; Sun, 11 Aug 2024 03:58:10 +0000 (UTC)
Received: from localhost (unknown [10.0.8.3])
 by mail.tkos.co.il (Postfix) with ESMTP id B6450440DA8;
 Sun, 11 Aug 2024 06:56:37 +0300 (IDT)
To: Waldemar Brodkorb <wbx@openadk.org>
In-Reply-To: <ZrcMbDYOcKkKaazr@waldemar-brodkorb.de> (Waldemar Brodkorb's
 message of "Sat, 10 Aug 2024 08:45:00 +0200")
References: <ZrcMbDYOcKkKaazr@waldemar-brodkorb.de>
Date: Sun, 11 Aug 2024 06:58:08 +0300
Message-ID: <87h6br7ltb.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1723348597;
 bh=tSvYi2Q6IYkX5RRDvnOHN3jnJDfDQX5tPgr2rmDgnjE=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=UA+6zFHwmYTNOgnw6xQdRsNu/5HIEtqrFV3Qu4RRnMkeV5ICMSLc2r+xPnD5u5t4/
 gZVNS4tZjYNwD5zDrwem2C9aMOz8uZMQsaF6Km1a5rFOoZJK/uRowhsnO/hlLv7hTb
 S5J0Jf8ouha45+3nNkLEtiHdhDph9ZEMavx1b5Z7sekODPExCdnpD01h/ZpkgJi82i
 17v3SZj6bU8ri/8KdqYCWrGRNmykBJOcfjUHU4jcOYQiKHVVa1/gLFAo3f40UnGX+X
 qpV3rPdmONcGOoIYl1GCp1t7YUkt4vrVqd9Fkty6ku7qICYo20RynXUdoQMFoBbH7L
 1/XO3o6nQKViQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=UA+6zFHw
Subject: Re: [Buildroot] [PATCH] configs/solidrun_clearfog: update U-Boot
 and Linux
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Waldemar,

On Sat, Aug 10 2024, Waldemar Brodkorb wrote:
> Tested on Solidrun Clearfog.
>
> Signed-off-by: Wademar Brodkorb <wbx@openadk.org>
> ---
>  board/solidrun/clearfog/genimage.cfg                   |  2 +-
>  .../clearfog/patches/linux-headers/linux-headers.hash  |  2 ++
>  board/solidrun/clearfog/patches/linux/linux.hash       |  2 ++
>  board/solidrun/clearfog/patches/uboot/uboot.hash       |  2 ++

Since you add hashes and FORCE_CHECK_HASHES, You should also update
.checkpackageignore.

Thanks,
baruch

>  configs/solidrun_clearfog_defconfig                    | 10 +++++++---
>  5 files changed, 14 insertions(+), 4 deletions(-)
>  create mode 100644 board/solidrun/clearfog/patches/linux-headers/linux-headers.hash
>  create mode 100644 board/solidrun/clearfog/patches/linux/linux.hash
>  create mode 100644 board/solidrun/clearfog/patches/uboot/uboot.hash
>
> diff --git a/board/solidrun/clearfog/genimage.cfg b/board/solidrun/clearfog/genimage.cfg
> index 8963619cc5..35aab62a8c 100644
> --- a/board/solidrun/clearfog/genimage.cfg
> +++ b/board/solidrun/clearfog/genimage.cfg
> @@ -4,7 +4,7 @@ image sdcard.img {
>  
>  	partition u-boot {
>  		in-partition-table = "no"
> -		image = "u-boot-spl.kwb"
> +		image = "u-boot-with-spl.kwb"
>  		offset = 512
>  	}
>  
> diff --git a/board/solidrun/clearfog/patches/linux-headers/linux-headers.hash b/board/solidrun/clearfog/patches/linux-headers/linux-headers.hash
> new file mode 100644
> index 0000000000..b8935a250a
> --- /dev/null
> +++ b/board/solidrun/clearfog/patches/linux-headers/linux-headers.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256  0ad83b1a1a780a1aad948d55aa55ee63c50c626f2d46910b9d2180028d100a5e  linux-6.6.43.tar.xz
> diff --git a/board/solidrun/clearfog/patches/linux/linux.hash b/board/solidrun/clearfog/patches/linux/linux.hash
> new file mode 100644
> index 0000000000..b8935a250a
> --- /dev/null
> +++ b/board/solidrun/clearfog/patches/linux/linux.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256  0ad83b1a1a780a1aad948d55aa55ee63c50c626f2d46910b9d2180028d100a5e  linux-6.6.43.tar.xz
> diff --git a/board/solidrun/clearfog/patches/uboot/uboot.hash b/board/solidrun/clearfog/patches/uboot/uboot.hash
> new file mode 100644
> index 0000000000..fe9b4f53dc
> --- /dev/null
> +++ b/board/solidrun/clearfog/patches/uboot/uboot.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256  f591da9ab90ef3d6b3d173766d0ddff90c4ed7330680897486117df390d83c8f  u-boot-2024.07.tar.bz2
> diff --git a/configs/solidrun_clearfog_defconfig b/configs/solidrun_clearfog_defconfig
> index 7f633d30d5..56d5c1d354 100644
> --- a/configs/solidrun_clearfog_defconfig
> +++ b/configs/solidrun_clearfog_defconfig
> @@ -5,6 +5,10 @@ BR2_ARM_ENABLE_NEON=y
>  BR2_ARM_ENABLE_VFP=y
>  BR2_ARM_FPU_NEON=y
>  
> +# Hashes
> +BR2_GLOBAL_PATCH_DIR="board/solidrun/clearfog/patches"
> +BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
> +
>  # Linux headers same as kernel, a 6.6 series
>  BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
>  
> @@ -16,7 +20,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/solidrun/clearfog/genimage.cfg"
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.28"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.43"
>  BR2_LINUX_KERNEL_DEFCONFIG="mvebu_v7"
>  BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/solidrun/clearfog/linux.fragment"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
> @@ -33,10 +37,10 @@ BR2_PACKAGE_HOST_GENIMAGE=y
>  BR2_TARGET_UBOOT=y
>  BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>  BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.07"
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
>  BR2_TARGET_UBOOT_BOARD_DEFCONFIG="clearfog"
>  BR2_TARGET_UBOOT_NEEDS_DTC=y
>  BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
>  # BR2_TARGET_UBOOT_FORMAT_BIN is not set
>  BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
> -BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-spl.kwb"
> +BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-with-spl.kwb"

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
