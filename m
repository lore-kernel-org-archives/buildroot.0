Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAA99C46CD3
	for <buildroot@archiver.kernel.org>; Sun, 24 Dec 2023 16:58:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4774081425;
	Sun, 24 Dec 2023 16:58:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4774081425
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HwcPYud1I18N; Sun, 24 Dec 2023 16:58:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70470813E1;
	Sun, 24 Dec 2023 16:58:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70470813E1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D32911BF304
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 16:58:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AC7EE8139C
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 16:58:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC7EE8139C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s0PoIUWDVhzg for <buildroot@lists.busybox.net>;
 Sun, 24 Dec 2023 16:58:49 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 99C0D81391
 for <buildroot@buildroot.org>; Sun, 24 Dec 2023 16:58:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99C0D81391
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 34D91B0059B;
 Sun, 24 Dec 2023 17:58:43 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 24 Dec 2023 17:58:42 +0100
Date: Sun, 24 Dec 2023 17:58:42 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <ZYhjQtmfpGir8zsQ@landeda>
References: <20231223212948.2512412-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231223212948.2512412-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1703437127;
 bh=+xed/S8vyWtAJ3kjN6ZlqEyRiuZdqtobh1gYtt9JbVQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RPqzgHVmsS4+sLaP+jWk5ETaqDTFab32KSpyn0qUq2vMgEvR7xox2uy/xvxXHRWhW
 QVN0T9iJ+SSJL92ZixxMUneuwb+eYBObD/M5J0mE475t4ytkxbbR7PBClQ4DtHG1Xg
 Igmv8w+Ftim3bqAQtaBhRl4J+ismJu3y1n9SVVHQ7IWDEEfK9hhGXSYDDyieLsCift
 LtLKC8yJI2iVL89vz66tDTz+YKkyEmATq2peNgSvhPQw2AtlGu4f86H8/KWo00i+Yi
 ljq99ZsdRkf1VV3h3rd5V64PhcdXBTasL5Zupbj7By23O6ow0BwilPZjBmNlPdwMIX
 xte7Z3cbhFHdQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=RPqzgHVm
Subject: Re: [Buildroot] [PATCH v2 1/2] boot/grub2: add RISC-V 64bit EFI
 support
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Julien, All,

On 2023-12-23 22:29 +0100, Julien Olivain spake thusly:
> Grub can be built as a RISC-V UEFI application since commit [1]. This
> commit was first included in grub version 2.04.
> 
> This commit enables this support.
> 
> [1] https://git.savannah.gnu.org/gitweb/?p=grub.git;a=commitdiff;h=f1957dc8a3347278a095bc8f44197662559a8ba3
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Oh, I forgot to add: it would be awesome if you coulde extend the
existing runtiem test to include a risc-v test:
    support/testing/tests/boot/test_grub.py

Also, it would be nice to extend the readme for grub:
    boot/grub2/readme.txt

Regards,
Yann E. MORIN.

> ---
>  boot/grub2/Config.in | 10 ++++++++++
>  boot/grub2/grub2.mk  |  9 +++++++++
>  2 files changed, 19 insertions(+)
> 
> diff --git a/boot/grub2/Config.in b/boot/grub2/Config.in
> index f05f33ccc7..7c235e96f7 100644
> --- a/boot/grub2/Config.in
> +++ b/boot/grub2/Config.in
> @@ -4,6 +4,7 @@ config BR2_TARGET_GRUB2_ARCH_SUPPORTS
>  	default y if BR2_x86_64
>  	default y if BR2_arm
>  	default y if BR2_aarch64
> +	default y if BR2_RISCV_64
>  	depends on BR2_USE_MMU
>  
>  config BR2_TARGET_GRUB2
> @@ -102,6 +103,15 @@ config BR2_TARGET_GRUB2_ARM64_EFI
>  	  Aarch64 platform and you want to boot Grub 2 as an EFI
>  	  application.
>  
> +config BR2_TARGET_GRUB2_RISCV64_EFI
> +	bool "riscv64-efi"
> +	depends on BR2_RISCV_64
> +	select BR2_TARGET_GRUB2_HAS_EFI_BOOT
> +	help
> +	  Select this option if the platform you're targetting is a
> +	  64bit RISC-V platform and you want to boot Grub 2 as an EFI
> +	  application.
> +
>  if BR2_TARGET_GRUB2_HAS_LEGACY_BOOT
>  
>  comment "Options for the x86 legacy BIOS or ARM U-Boot support"
> diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
> index b9be826885..679eac5f46 100644
> --- a/boot/grub2/grub2.mk
> +++ b/boot/grub2/grub2.mk
> @@ -93,6 +93,15 @@ GRUB2_BUILTIN_CONFIG_arm64-efi = $(GRUB2_BUILTIN_CONFIG_EFI)
>  GRUB2_BUILTIN_MODULES_arm64-efi = $(GRUB2_BUILTIN_MODULES_EFI)
>  GRUB2_TUPLES-$(BR2_TARGET_GRUB2_ARM64_EFI) += arm64-efi
>  
> +GRUB2_IMAGE_riscv64-efi = $(BINARIES_DIR)/efi-part/EFI/BOOT/bootriscv64.efi
> +GRUB2_CFG_riscv64-efi = $(BINARIES_DIR)/efi-part/EFI/BOOT/grub.cfg
> +GRUB2_PREFIX_riscv64-efi = /EFI/BOOT
> +GRUB2_TARGET_riscv64-efi = riscv64
> +GRUB2_PLATFORM_riscv64-efi = efi
> +GRUB2_BUILTIN_CONFIG_riscv64-efi = $(GRUB2_BUILTIN_CONFIG_EFI)
> +GRUB2_BUILTIN_MODULES_riscv64-efi = $(GRUB2_BUILTIN_MODULES_EFI)
> +GRUB2_TUPLES-$(BR2_TARGET_GRUB2_RISCV64_EFI) += riscv64-efi
> +
>  # Grub2 is kind of special: it considers CC, LD and so on to be the
>  # tools to build the host programs and uses TARGET_CC, TARGET_CFLAGS,
>  # TARGET_CPPFLAGS, TARGET_LDFLAGS to build the bootloader itself.
> -- 
> 2.43.0
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
