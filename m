Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 222D4EB64DC
	for <buildroot@archiver.kernel.org>; Sun, 25 Jun 2023 07:02:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6253A40142;
	Sun, 25 Jun 2023 07:02:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6253A40142
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wxx-rxLh3c9k; Sun, 25 Jun 2023 07:02:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6BB29400D2;
	Sun, 25 Jun 2023 07:02:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6BB29400D2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 928DF1BF3C2
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 07:02:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7777581E55
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 07:02:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7777581E55
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GmRk5-3Dsm7x for <buildroot@lists.busybox.net>;
 Sun, 25 Jun 2023 07:02:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E808081E40
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E808081E40
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 07:02:35 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:36ab:e848:bc86:4439])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 11824B0054E;
 Sun, 25 Jun 2023 09:02:30 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 25 Jun 2023 09:02:30 +0200
Date: Sun, 25 Jun 2023 09:02:30 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Andreas Dannenberg <dannenberg@ti.com>
Message-ID: <20230625070230.GG24952@scaer>
References: <20230622160212.2063472-1-dannenberg@ti.com>
 <20230622160212.2063472-4-dannenberg@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230622160212.2063472-4-dannenberg@ti.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1687676553;
 bh=k7bb5IK2Z6oviT1SZs7mUxVIl3uWx0r3J1RnsRPMBjY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sWg1DWGzUXxnb3g57zysyfNajw1DJ24v7AEWkJsXnDIy0RBewHcQZDGlclsAZLM39
 VlvnJ6XHzr/tM/vUcv4lYI9VFqfRcikBmZUn34FPjczxvRDIfY/z3SFuQs4BmFMhsY
 2gPa++n8kCJh5jqfObM3Uhmljt0/MmZuNaIUL3A+LNgiy5P5sVAN6hLmTdrg0ib1nY
 h4kE1i+72yLcId35ODY7sVXoLrbAMyH0QWaVz5Kn317fhfY9v6UotzDf4WJQbOOXNY
 UGqHTLWQ/rGw6utLQArpPxImpKKanR5rIagHHpXN7dowj5Q/qy1qiVAMsHT15KlXMZ
 8534ttX2Xt+Bw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=sWg1DWGz
Subject: Re: [Buildroot] [PATCH v9 03/11] boot/uboot: add support for
 building the TI K3 DM into U-Boot
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Andreas, All,

On 2023-06-22 11:02 -0500, Andreas Dannenberg via buildroot spake thusly:
> Certain TI K3 devices such as AM62x and AM62Ax require a Device Manager
> (DM) firmnware to be made available to the U-Boot build, which will get
> packaged into the "tispl.bin" image tree blob during A53 SPL build.
> Without that DM firmware U-Boot will not be functional. To support this,
> add a config option called BR2_TARGET_UBOOT_NEEDS_TI_K3_DM to enable
> this feature, and another option BR2_TARGET_UBOOT_TI_K3_DM_SOC to allow
> setting the name of the SOC which needs to match the corresponding
> folder name in the ti-linux-firmware Git repository.
> 
> Signed-off-by: Andreas Dannenberg <dannenberg@ti.com>
> ---
>  boot/uboot/Config.in | 17 +++++++++++++++++
>  boot/uboot/uboot.mk  | 16 ++++++++++++++++
>  2 files changed, 33 insertions(+)
> 
> diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
> index 085397d03d..7e1dd44196 100644
> --- a/boot/uboot/Config.in
> +++ b/boot/uboot/Config.in
> @@ -240,6 +240,23 @@ config BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE
>  	  U-Boot, and that the TEE variable pointing to OPTEE's
>  	  tee.elf, is passed during the Buildroot build.
>  
> +config BR2_TARGET_UBOOT_NEEDS_TI_K3_DM
> +	bool "U-Boot needs TI K3 Device Manager (DM)"
> +	help
> +	  Some TI K3 devices need the Device Manager (DM) firmware
> +	  to be available for the U-Boot build. Currently supports FW
> +	  from Git tag 08.06.00.006 by default.
> +
> +	  https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/tree/ti-dm?h=ti-linux-firmware
> +
> +config BR2_TARGET_UBOOT_TI_K3_DM_SOC
> +	string "TI K3 Device Manager (DM) SOC Type"
> +	depends on BR2_TARGET_UBOOT_NEEDS_TI_K3_DM
> +	help
> +	  Name of the TI K3 Device Manager (DM) SOC. This needs to
> +	  match one of the SOC-specific folders in within the ti-dm
> +	  folder of the ti-linux-firmware Git repository.
> +
>  config BR2_TARGET_UBOOT_NEEDS_OPENSBI
>  	bool "U-Boot needs OpenSBI"
>  	depends on BR2_TARGET_OPENSBI
> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> index 4eae8e95c3..48af69bd26 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -184,6 +184,22 @@ UBOOT_DEPENDENCIES += optee-os
>  UBOOT_MAKE_OPTS += TEE=$(BINARIES_DIR)/tee.elf
>  endif
>  
> +ifeq ($(BR2_TARGET_UBOOT_NEEDS_TI_K3_DM),y)
> +# Currently supports the FW from Git tag 08.06.00.006 by default
> +TI_K3_DM_VERSION = 340194800a581baf976360386dfc7b5acab8d948
> +TI_K3_DM_SITE = https://git.ti.com/processor-firmware/ti-linux-firmware/blobs/raw/$(TI_K3_DM_VERSION)/ti-dm/$(BR2_TARGET_UBOOT_TI_K3_DM_SOC)
> +TI_K3_DM_SOURCE = ipc_echo_testb_mcu1_0_release_strip.xer5f
> +# This is not really nice but disable the hash check for the DM FW file. Main
> +# reason is all those DM FW files for different SoCs have the same(!) name in
> +# the Git repository they reside in, so it would be more difficult to distinguish
> +# between them for hash checking purposes. To work around this let's just
> +# rely and trust the official Git repo at ti.com is known-good which is also
> +# accessed through a secure transport.
> +BR_NO_CHECK_HASH_FOR += $(TI_K3_DM_SOURCE)
> +UBOOT_EXTRA_DOWNLOADS = $(TI_K3_DM_SITE)/$(TI_K3_DM_SOURCE)
> +UBOOT_MAKE_OPTS += DM=$(UBOOT_DL_DIR)/$(TI_K3_DM_SOURCE)
> +endif

I again am not very fond of this injecting extra downloads n uboot. I'd
rather we have a separate package, ti-linux-firmware. That way, it can
be used by both uboot and ti-k3-image-gen.

The ti-linux-firmware repository is not small (git clone reports 750MiB
today) but the repository exposes snapshots, so that is a bit more easy
on the networks connection (althoiugh we should take the .gz, not the
.xz, as the on-the-fly compression is much slower for xz than gz).

Then it is again just a matter of ti-linux-firmware copying the
appropriate blobs into $(BINARIES_DIR) and then uboot grabbing what's
necessary.

Regards,
Yann E. MORIN.

>  ifeq ($(BR2_TARGET_UBOOT_NEEDS_OPENSBI),y)
>  UBOOT_DEPENDENCIES += opensbi
>  UBOOT_MAKE_OPTS += OPENSBI=$(BINARIES_DIR)/fw_dynamic.bin
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
