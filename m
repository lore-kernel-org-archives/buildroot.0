Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E942CD343F
	for <buildroot@archiver.kernel.org>; Mon, 18 May 2026 20:17:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7D54409A2;
	Mon, 18 May 2026 20:17:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HjvEgWnt25uQ; Mon, 18 May 2026 20:17:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B64B0409A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779135445;
	bh=mYK9pKnPLvfRAt08e0aHYoHbjlBRTFPbwe4WIoMb928=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DZu0unFgGCM2qF6U5ktDP13iVQag726N/JoubcA4cZGa+t72dmOH9E5js2zYi4s6e
	 QfUK6jyYxVWjM8hA2iRYfl6AQ63Myyhp5io4oa0Bb8WccOA3RtTgYpCxW+L1n1LA5k
	 oTeY2qgGl+uw5BXWK4le+aUt6d3Q57aKVIM1GZPC/3PoD9OIjw81Nz+xqM/xiBSudV
	 AjB83r0QHm/0lV/Ya76OXhYSGc848fmjuUkff2NoaVIxfkfUIL8R8tqsF542rmm+L8
	 jcg3208PBCg23gveLZTQyBHUTXg3XQCZ4A/beNwehXyv4TGlhGoanYNdknUJ6AyjzO
	 SiqbHdpeKwUdA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B64B0409A3;
	Mon, 18 May 2026 20:17:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5891B265
 for <buildroot@buildroot.org>; Mon, 18 May 2026 20:17:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 49CC8811A5
 for <buildroot@buildroot.org>; Mon, 18 May 2026 20:17:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZNFkrM0Age8V for <buildroot@buildroot.org>;
 Mon, 18 May 2026 20:17:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 30BC0811A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 30BC0811A3
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 30BC0811A3
 for <buildroot@buildroot.org>; Mon, 18 May 2026 20:17:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 245A6B97BDDC; Mon, 18 May 2026 22:17:19 +0200 (CEST)
Message-ID: <1df52643-3d49-46f3-97b4-cc31a4d5d75a@rnout.be>
Date: Mon, 18 May 2026 22:17:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Kanak Shilledar <kanak.shilledar@axis.com>, buildroot@buildroot.org
Cc: Damien Le Moal <dlemoal@kernel.org>,
 Kanak Shilledar <kanakshilledar@gmail.com>
References: <20260508154811.3559477-2-kanak.shilledar@axis.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260508154811.3559477-2-kanak.shilledar@axis.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1779135440; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=funVknlMHBBBlvuolU3AINgE4MoeXEXmAjYNbNhsohs=;
 b=WdZ9Ilkun+67DZ556WbPaoceFGcSZJWo0uS+dNCxdGP5DMM6ALvpcwSfaauZRYaeEYB3rX
 AB4Hs6VkwCLFaCUA74jfWuETcWm3+6wTUIoB1oAqLb0tEjVxHnj/5ZFAQd5TSUXnuM2rYC
 cCWjNfshzNslX61m5lahpHNBDL3eQCP3OoBd9xzU77QjaJauRzat8lTAZdJCa/ur4jStul
 N/+SHDLjkIag5EZioeJ6Tg7iusqfbecFeSCYDGQlTrN1D4lqPgFkiZuu7v4wjWxZt4ltay
 X+vmeKUXL1g8RNB1lsd4Fku0nW75eLiVEWcWi3iT8P9kPdFGmJ5GrBdUdjWe/Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=WdZ9Ilku
Subject: Re: [Buildroot] [PATCH 1/1] board: licheepi_4a: Upgrade BSP
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Kanak,

  Thank you for this patch!

On 08/05/2026 17:48, Kanak Shilledar wrote:
> Updated the BSP for Sipeed LicheePi 4A.
> * Updated Linux Kernel to use latest release
> * Updated the opensbi to v1.6
> * Updated uboot to latest from the vendor
> * Removed Architecture Vector support from board's defconfig as it gave
>    a kernel panic.

  That is not so nice... Ideally we'd fix this on a more fundamental level 
rather than by changing the architecture. Unless if the hardware doesn't 
actually implement the RVV extension correctly - if that is the case, please 
point to a website that explains that.


> 
> ```
> [    1.677829] Run /sbin/init as init process
> [    1.689056] init[1]: unhandled signal 4 code 0x1 at 0x0000003fa8231b80 in ld-linux-riscv64-lp64d.so.1[11b80,3fa8220000+21000]
> [    1.700491] CPU: 2 UID: 0 PID: 1 Comm: init Not tainted 7.0.4 #1 PREEMPTLAZY
> [    1.707697] Hardware name: Sipeed Lichee Pi 4A (DT)
> [    1.712626] epc : 0000003fa8231b80 ra : 0000003fa8231392 sp : 0000003fc1ad08f0
> [    1.719893]  gp : 0000000000000000 tp : 0000000000000000 t0 : 0000000000000000
> [    1.727158]  t1 : 0000000000000000 t2 : 0000000000000000 s0 : 0000003fc1ad09d0
> [    1.734420]  s1 : 0000000000000000 a0 : 0000000000000000 a1 : 000000006fffffff
> [    1.741685]  a2 : 0000000000000006 a3 : 0000000000000001 a4 : ffffffffffffffff
> [    1.748949]  a5 : 0000000000000000 a6 : 0000003fa8242ec8 a7 : 000000006ffffdff
> [    1.756208]  s2 : 0000000000000000 s3 : 0000003fa8220000 s4 : 0000000000000000
> [    1.763474]  s5 : 0000003fa8220000 s6 : 0000003fa8243c40 s7 : 0000000000000000
> [    1.770734]  s8 : 0000000000000000 s9 : 0000000000000000 s10: 0000000000000000
> [    1.777993]  s11: 0000000000000000 t3 : 000000000000000a t4 : 0000000000000035
> [    1.785252]  t5 : 000000000000000b t6 : 0000000000000000 ssp : 0000000000000000
> [    1.792608] status: 0000000200004020 badaddr: 00000000cd817057 cause: 0000000000000002
> [    1.800618] Code: 0206 9381 bf31 06a1 0513 1f85 e8e3 fab6 3a83 008b (7057) cd81
> [    1.808151] Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000004
> ```
> 
> Signed-off-by: Kanak Shilledar <kanak.shilledar@axis.com>
> ---
>   .../licheepi_4a/patches/opensbi/opensbi.hash       |  2 +-
>   board/sipeed/licheepi_4a/patches/uboot/uboot.hash  |  2 +-
>   configs/sipeed_licheepi_4a_defconfig               | 14 ++++++--------
>   3 files changed, 8 insertions(+), 10 deletions(-)
> 
> diff --git a/board/sipeed/licheepi_4a/patches/opensbi/opensbi.hash b/board/sipeed/licheepi_4a/patches/opensbi/opensbi.hash
> index 5ced5c95cc..a08d207608 100644
> --- a/board/sipeed/licheepi_4a/patches/opensbi/opensbi.hash
> +++ b/board/sipeed/licheepi_4a/patches/opensbi/opensbi.hash
> @@ -1,2 +1,2 @@
>   # Locally computed
> -sha256  2510c0e867b4f8c28579def9a21e97fa2e8de95b8c7d66bb8b6642202bcee3b4  opensbi-61d7484c752a5e4c464d5dc18e21d9ac67fbbefa-git4.tar.gz
> +sha256  514f652aafdc8f45864922fa28d54a1fe493d8997707f0ec3546f8e2bdc32628  opensbi-1b8e883a7368676c2bafd6236dfd2dd5edabe067-git4.tar.gz
> diff --git a/board/sipeed/licheepi_4a/patches/uboot/uboot.hash b/board/sipeed/licheepi_4a/patches/uboot/uboot.hash
> index b63a8d79d4..7dc3fac84c 100644
> --- a/board/sipeed/licheepi_4a/patches/uboot/uboot.hash
> +++ b/board/sipeed/licheepi_4a/patches/uboot/uboot.hash
> @@ -1,2 +1,2 @@
>   # Locally computed
> -sha256  6158b9c6faee41a1e790ad4ba2e1b3e18a122ecdb5749fa77c7495a2d1c56262  uboot-b5ee6e549a7b5ff382a14021a5d6a3c94017bddd-git4.tar.gz
> +sha256  198b6181303f9973e4c585ee5ab2440d412dd97ef5d42194943aa5fed172b500  uboot-a13e24ed9ed773d4a07f079576a2fd654af6bfbb-git4.tar.gz
> diff --git a/configs/sipeed_licheepi_4a_defconfig b/configs/sipeed_licheepi_4a_defconfig
> index c7867ed05d..e936a1258b 100644
> --- a/configs/sipeed_licheepi_4a_defconfig
> +++ b/configs/sipeed_licheepi_4a_defconfig
> @@ -1,7 +1,7 @@
>   BR2_riscv=y
>   BR2_RISCV_ISA_RVC=y
> -BR2_RISCV_ISA_RVV=y
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y

  You must keep the custom headers option and point it to the right series.

  Well, actually, we prefer all defconfigs to switch to a Bootlin external 
toolchain if that is possible. Can you test with 
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_GLIBC_STABLE?
It uses GCC 14 at the moment, who knows, maybe that fixes the SIGILL in init as 
well...

> +BR2_BINUTILS_VERSION_2_46_X=y
> +BR2_GCC_VERSION_15_X=y
>   BR2_GLOBAL_PATCH_DIR="board/sipeed/licheepi_4a/patches"
>   BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
>   BR2_TARGET_GENERIC_HOSTNAME="licheepi4a"
> @@ -10,8 +10,6 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
>   BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
>   BR2_ROOTFS_POST_IMAGE_SCRIPT="board/sipeed/licheepi_4a/post-image.sh"
>   BR2_LINUX_KERNEL=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.18"

  You have to keep a custom version and specify the Linux version explicitly.

>   BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
>   BR2_LINUX_KERNEL_INTREE_DTS_NAME="thead/th1520-lichee-pi-4a"
> @@ -28,14 +26,14 @@ BR2_TARGET_ROOTFS_EXT2=y
>   BR2_TARGET_ROOTFS_EXT2_4=y
>   BR2_TARGET_OPENSBI=y
>   BR2_TARGET_OPENSBI_CUSTOM_GIT=y
> -BR2_TARGET_OPENSBI_CUSTOM_REPO_URL="https://github.com/revyos/thead-opensbi.git"
> -BR2_TARGET_OPENSBI_CUSTOM_REPO_VERSION="61d7484c752a5e4c464d5dc18e21d9ac67fbbefa"
> +BR2_TARGET_OPENSBI_CUSTOM_REPO_URL="https://github.com/revyos/opensbi.git"

  That is weird, is it not a T-Head any more? Or did they merge the two repos?

  Please explain in the commit message.

> +BR2_TARGET_OPENSBI_CUSTOM_REPO_VERSION="1b8e883a7368676c2bafd6236dfd2dd5edabe067"
>   BR2_TARGET_OPENSBI_PLAT="generic"
>   BR2_TARGET_UBOOT=y
>   BR2_TARGET_UBOOT_BOARDNAME="light_lpi4a"
>   BR2_TARGET_UBOOT_CUSTOM_GIT=y
> -BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/revyos/thead-u-boot.git"
> -BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="b5ee6e549a7b5ff382a14021a5d6a3c94017bddd"
> +BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/revyos/th1520-vendor-uboot.git"

  Same question here.

  Marked as Changes Requested.

  Thanks,
  regards,
  Arnout

> +BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="a13e24ed9ed773d4a07f079576a2fd654af6bfbb"
>   BR2_TARGET_UBOOT_SPL=y
>   BR2_TARGET_UBOOT_SPL_NAME="u-boot-with-spl.bin"
>   BR2_PACKAGE_HOST_GENIMAGE=y

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
