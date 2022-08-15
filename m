Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5226C00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 19:02:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7635F4067F;
	Mon, 15 Aug 2022 19:02:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7635F4067F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i8DYiJCXEUIs; Mon, 15 Aug 2022 19:02:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A2D64069B;
	Mon, 15 Aug 2022 19:02:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A2D64069B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 856161BF279
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 19:02:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6D6E981491
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 19:02:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D6E981491
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HxTECOv_hVcr for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 19:02:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1792181362
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1792181362
 for <buildroot@busybox.net>; Mon, 15 Aug 2022 19:02:15 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:c91d:14e3:a117:34c4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 6F65A60134;
 Mon, 15 Aug 2022 21:02:11 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 15 Aug 2022 21:02:11 +0200
Date: Mon, 15 Aug 2022 21:02:11 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20220815190211.GG2854108@scaer>
References: <20220815165632.1278597-1-francois.perrad@gadz.org>
 <20220815165632.1278597-3-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220815165632.1278597-3-francois.perrad@gadz.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1660590133;
 bh=W1cO6l5ZtvF4eRb1WX9O/Oc95bkT5LHAXQaT2roFfok=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=p/fKgzWUyNCw9pmYG+LsqLIQh2QD73lqp3+pgqWUqDYFl7UHzLqDnLyPyOIHdRJN7
 QhkZrdIrA4fTtvqxKUed7uzMj3u3lrpyGXIEbUu9CHLggI1TaYfe0P6TEm4ApZIZ91
 yaz5s+E9bl9oHTrY5ITK3Sxd5FZzYd27efBm1ofRxc/zqr24yFajKprUpxDJXB3u0I
 pWCAPMUJsqFk3BhvXByu7C2BnJEGVL08SUQ73VDZU48A+A00WTOSZpb7K7boSLtQ2H
 jytwR2aWBazUfZBLtiBpV4wUcznZH3lpp/rch+Rc2iKIcMHEK6i2Cl+ahH6MIieo29
 AkDw5ArwfeaNg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=p/fKgzWU
Subject: Re: [Buildroot] [PATCH 3/4] package/freescale-imx: rename
 FREESCALE_IMX_EXTRACT_HELPER to NXP_EXTRACT_HELPER
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 2022-08-15 18:56 +0200, Francois Perrad spake thusly:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

This comit log was bit too short, so I extended it with a rationale for
the renaming.

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/freescale-imx/firmware-imx/firmware-imx.mk           | 2 +-
>  package/freescale-imx/gpu-amd-bin-mx51/gpu-amd-bin-mx51.mk   | 2 +-
>  package/freescale-imx/imx-codec/imx-codec.mk                 | 2 +-
>  package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk             | 2 +-
>  package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk             | 2 +-
>  package/freescale-imx/imx-parser/imx-parser.mk               | 2 +-
>  package/freescale-imx/imx-sc-firmware/imx-sc-firmware.mk     | 2 +-
>  package/freescale-imx/imx-seco/imx-seco.mk                   | 2 +-
>  package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.mk | 2 +-
>  package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.mk       | 2 +-
>  package/freescale-imx/imx-vpu/imx-vpu.mk                     | 2 +-
>  package/freescale-imx/imx-vpuwrap/imx-vpuwrap.mk             | 2 +-
>  package/freescale-imx/libz160/libz160.mk                     | 2 +-
>  package/pkg-utils.mk                                         | 4 ++--
>  14 files changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
> index 47c21585a..4884079d5 100644
> --- a/package/freescale-imx/firmware-imx/firmware-imx.mk
> +++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
> @@ -15,7 +15,7 @@ FIRMWARE_IMX_REDISTRIBUTE = NO
>  FIRMWARE_IMX_INSTALL_IMAGES = YES
>  
>  define FIRMWARE_IMX_EXTRACT_CMDS
> -	$(call FREESCALE_IMX_EXTRACT_HELPER,$(FIRMWARE_IMX_DL_DIR)/$(FIRMWARE_IMX_SOURCE))
> +	$(call NXP_EXTRACT_HELPER,$(FIRMWARE_IMX_DL_DIR)/$(FIRMWARE_IMX_SOURCE))
>  endef
>  
>  #
> diff --git a/package/freescale-imx/gpu-amd-bin-mx51/gpu-amd-bin-mx51.mk b/package/freescale-imx/gpu-amd-bin-mx51/gpu-amd-bin-mx51.mk
> index c99c568f7..895fedc2e 100644
> --- a/package/freescale-imx/gpu-amd-bin-mx51/gpu-amd-bin-mx51.mk
> +++ b/package/freescale-imx/gpu-amd-bin-mx51/gpu-amd-bin-mx51.mk
> @@ -23,7 +23,7 @@ GPU_AMD_BIN_MX51_LICENSE_FILES = EULA
>  GPU_AMD_BIN_MX51_REDISTRIBUTE = NO
>  
>  define GPU_AMD_BIN_MX51_EXTRACT_CMDS
> -	$(call FREESCALE_IMX_EXTRACT_HELPER,$(GPU_AMD_BIN_MX51_DL_DIR)/$(GPU_AMD_BIN_MX51_SOURCE))
> +	$(call NXP_EXTRACT_HELPER,$(GPU_AMD_BIN_MX51_DL_DIR)/$(GPU_AMD_BIN_MX51_SOURCE))
>  endef
>  
>  # Upstream headers need to be compiled with -D_LINUX. It is more convenient
> diff --git a/package/freescale-imx/imx-codec/imx-codec.mk b/package/freescale-imx/imx-codec/imx-codec.mk
> index 1ec701d2f..2b7c346a6 100644
> --- a/package/freescale-imx/imx-codec/imx-codec.mk
> +++ b/package/freescale-imx/imx-codec/imx-codec.mk
> @@ -26,7 +26,7 @@ IMX_CODEC_CONF_OPTS += --enable-vpu
>  endif
>  
>  define IMX_CODEC_EXTRACT_CMDS
> -	$(call FREESCALE_IMX_EXTRACT_HELPER,$(IMX_CODEC_DL_DIR)/$(IMX_CODEC_SOURCE))
> +	$(call NXP_EXTRACT_HELPER,$(IMX_CODEC_DL_DIR)/$(IMX_CODEC_SOURCE))
>  endef
>  
>  # FIXME The Makefile installs both the arm9 and arm11 versions of the
> diff --git a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk
> index 0e4078a96..c5df87e61 100644
> --- a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk
> +++ b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk
> @@ -19,7 +19,7 @@ IMX_GPU_G2D_LICENSE_FILES = EULA COPYING
>  IMX_GPU_G2D_REDISTRIBUTE = NO
>  
>  define IMX_GPU_G2D_EXTRACT_CMDS
> -	$(call FREESCALE_IMX_EXTRACT_HELPER,$(IMX_GPU_G2D_DL_DIR)/$(IMX_GPU_G2D_SOURCE))
> +	$(call NXP_EXTRACT_HELPER,$(IMX_GPU_G2D_DL_DIR)/$(IMX_GPU_G2D_SOURCE))
>  endef
>  
>  define IMX_GPU_G2D_INSTALL_STAGING_CMDS
> diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
> index 1d76d79e2..63d5d3c2e 100644
> --- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
> +++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
> @@ -44,7 +44,7 @@ IMX_GPU_VIV_DEPENDENCIES += wayland
>  endif
>  
>  define IMX_GPU_VIV_EXTRACT_CMDS
> -	$(call FREESCALE_IMX_EXTRACT_HELPER,$(IMX_GPU_VIV_DL_DIR)/$(IMX_GPU_VIV_SOURCE))
> +	$(call NXP_EXTRACT_HELPER,$(IMX_GPU_VIV_DL_DIR)/$(IMX_GPU_VIV_SOURCE))
>  endef
>  
>  ifeq ($(IMX_GPU_VIV_LIB_TARGET),fb)
> diff --git a/package/freescale-imx/imx-parser/imx-parser.mk b/package/freescale-imx/imx-parser/imx-parser.mk
> index fc4376f04..dccb8829d 100644
> --- a/package/freescale-imx/imx-parser/imx-parser.mk
> +++ b/package/freescale-imx/imx-parser/imx-parser.mk
> @@ -24,7 +24,7 @@ IMX_PARSER_CONF_OPTS += --enable-fsw
>  endif
>  
>  define IMX_PARSER_EXTRACT_CMDS
> -	$(call FREESCALE_IMX_EXTRACT_HELPER,$(IMX_PARSER_DL_DIR)/$(IMX_PARSER_SOURCE))
> +	$(call NXP_EXTRACT_HELPER,$(IMX_PARSER_DL_DIR)/$(IMX_PARSER_SOURCE))
>  endef
>  
>  # The Makefile installs several versions of the libraries, but we only
> diff --git a/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.mk b/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.mk
> index bbb731030..6a304c0c8 100644
> --- a/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.mk
> +++ b/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.mk
> @@ -13,7 +13,7 @@ IMX_SC_FIRMWARE_LICENSE_FILES = EULA COPYING
>  IMX_SC_FIRMWARE_REDISTRIBUTE = NO
>  
>  define IMX_SC_FIRMWARE_EXTRACT_CMDS
> -	$(call FREESCALE_IMX_EXTRACT_HELPER,$(IMX_SC_FIRMWARE_DL_DIR)/$(IMX_SC_FIRMWARE_SOURCE))
> +	$(call NXP_EXTRACT_HELPER,$(IMX_SC_FIRMWARE_DL_DIR)/$(IMX_SC_FIRMWARE_SOURCE))
>  endef
>  
>  IMX_SC_FIRMWARE_INSTALL_IMAGES = YES
> diff --git a/package/freescale-imx/imx-seco/imx-seco.mk b/package/freescale-imx/imx-seco/imx-seco.mk
> index 79c9722c4..987f24658 100644
> --- a/package/freescale-imx/imx-seco/imx-seco.mk
> +++ b/package/freescale-imx/imx-seco/imx-seco.mk
> @@ -13,7 +13,7 @@ IMX_SECO_LICENSE_FILES = EULA COPYING
>  IMX_SECO_REDISTRIBUTE = NO
>  
>  define IMX_SECO_EXTRACT_CMDS
> -	$(call FREESCALE_IMX_EXTRACT_HELPER,$(IMX_SECO_DL_DIR)/$(IMX_SECO_SOURCE))
> +	$(call NXP_EXTRACT_HELPER,$(IMX_SECO_DL_DIR)/$(IMX_SECO_SOURCE))
>  endef
>  
>  IMX_SECO_INSTALL_IMAGES = YES
> diff --git a/package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.mk b/package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.mk
> index b07e11667..5f4c6faee 100644
> --- a/package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.mk
> +++ b/package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.mk
> @@ -14,7 +14,7 @@ IMX_VPU_HANTRO_VC_LICENSE_FILES = EULA COPYING
>  IMX_VPU_HANTRO_VC_REDISTRIBUTE = NO
>  
>  define IMX_VPU_HANTRO_VC_EXTRACT_CMDS
> -	$(call FREESCALE_IMX_EXTRACT_HELPER,$(IMX_VPU_HANTRO_VC_DL_DIR)/$(IMX_VPU_HANTRO_VC_SOURCE))
> +	$(call NXP_EXTRACT_HELPER,$(IMX_VPU_HANTRO_VC_DL_DIR)/$(IMX_VPU_HANTRO_VC_SOURCE))
>  endef
>  
>  define IMX_VPU_HANTRO_VC_INSTALL_TARGET_CMDS
> diff --git a/package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.mk b/package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.mk
> index 360591b44..9d34c7add 100644
> --- a/package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.mk
> +++ b/package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.mk
> @@ -23,7 +23,7 @@ IMX_VPU_HANTRO_LICENSE_FILES = EULA COPYING
>  IMX_VPU_HANTRO_REDISTRIBUTE = NO
>  
>  define IMX_VPU_HANTRO_EXTRACT_CMDS
> -	$(call FREESCALE_IMX_EXTRACT_HELPER,$(IMX_VPU_HANTRO_DL_DIR)/$(IMX_VPU_HANTRO_SOURCE))
> +	$(call NXP_EXTRACT_HELPER,$(IMX_VPU_HANTRO_DL_DIR)/$(IMX_VPU_HANTRO_SOURCE))
>  endef
>  
>  define IMX_VPU_HANTRO_BUILD_CMDS
> diff --git a/package/freescale-imx/imx-vpu/imx-vpu.mk b/package/freescale-imx/imx-vpu/imx-vpu.mk
> index 14a1a7a9f..cae3d88b6 100644
> --- a/package/freescale-imx/imx-vpu/imx-vpu.mk
> +++ b/package/freescale-imx/imx-vpu/imx-vpu.mk
> @@ -21,7 +21,7 @@ IMX_VPU_LICENSE_FILES = EULA COPYING
>  IMX_VPU_REDISTRIBUTE = NO
>  
>  define IMX_VPU_EXTRACT_CMDS
> -	$(call FREESCALE_IMX_EXTRACT_HELPER,$(IMX_VPU_DL_DIR)/$(IMX_VPU_SOURCE))
> +	$(call NXP_EXTRACT_HELPER,$(IMX_VPU_DL_DIR)/$(IMX_VPU_SOURCE))
>  endef
>  
>  define IMX_VPU_BUILD_CMDS
> diff --git a/package/freescale-imx/imx-vpuwrap/imx-vpuwrap.mk b/package/freescale-imx/imx-vpuwrap/imx-vpuwrap.mk
> index 4f8916540..4bee1cf64 100644
> --- a/package/freescale-imx/imx-vpuwrap/imx-vpuwrap.mk
> +++ b/package/freescale-imx/imx-vpuwrap/imx-vpuwrap.mk
> @@ -22,7 +22,7 @@ IMX_VPUWRAP_LICENSE_FILES = EULA COPYING
>  IMX_VPUWRAP_REDISTRIBUTE = NO
>  
>  define IMX_VPUWRAP_EXTRACT_CMDS
> -	$(call FREESCALE_IMX_EXTRACT_HELPER,$(IMX_VPUWRAP_DL_DIR)/$(IMX_VPUWRAP_SOURCE))
> +	$(call NXP_EXTRACT_HELPER,$(IMX_VPUWRAP_DL_DIR)/$(IMX_VPUWRAP_SOURCE))
>  endef
>  
>  $(eval $(autotools-package))
> diff --git a/package/freescale-imx/libz160/libz160.mk b/package/freescale-imx/libz160/libz160.mk
> index 5b1feeb44..a15b5f6b6 100644
> --- a/package/freescale-imx/libz160/libz160.mk
> +++ b/package/freescale-imx/libz160/libz160.mk
> @@ -15,7 +15,7 @@ LIBZ160_LICENSE_FILES = EULA
>  LIBZ160_REDISTRIBUTE = NO
>  
>  define LIBZ160_EXTRACT_CMDS
> -	$(call FREESCALE_IMX_EXTRACT_HELPER,$(LIBZ160_DL_DIR)/$(LIBZ160_SOURCE))
> +	$(call NXP_EXTRACT_HELPER,$(LIBZ160_DL_DIR)/$(LIBZ160_SOURCE))
>  endef
>  
>  define LIBZ160_INSTALL_STAGING_CMDS
> diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
> index 57f4af04c..32a5c8c95 100644
> --- a/package/pkg-utils.mk
> +++ b/package/pkg-utils.mk
> @@ -276,7 +276,7 @@ legal-deps = \
>              $(call non-virtual-deps,\
>                  $($(call UPPERCASE,$(1))_FINAL_RECURSIVE_DEPENDENCIES))),$(p) [$($(call UPPERCASE,$(p))_LICENSE)])
>  
> -# Helper for self-extracting binaries distributed by Freescale.
> +# Helper for self-extracting binaries distributed by NXP.
>  #
>  # The --force option makes sure it doesn't fail if the source
>  # directory already exists. The --auto-accept skips the license check,
> @@ -290,7 +290,7 @@ legal-deps = \
>  #
>  # $(1): full path to the archive file
>  #
> -define FREESCALE_IMX_EXTRACT_HELPER
> +define NXP_EXTRACT_HELPER
>  	awk 'BEGIN      { start = 0; } \
>  	     /^EOEULA/  { start = 0; } \
>  	                { if (start) print; } \
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
