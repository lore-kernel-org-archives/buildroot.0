Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 390A6C433EF
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 14:48:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DDC3642949;
	Thu,  6 Jan 2022 14:48:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9DwHGe3g2N_J; Thu,  6 Jan 2022 14:48:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D99C4289F;
	Thu,  6 Jan 2022 14:48:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 444861BF406
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 14:48:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2F897831CA
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 14:48:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WOohFgpQuuhE for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 14:48:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CBAB081A15
 for <buildroot@busybox.net>; Thu,  6 Jan 2022 14:48:24 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id k18so5197615wrg.11
 for <buildroot@busybox.net>; Thu, 06 Jan 2022 06:48:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ln6U81QvMeT2YaBDHdoWPtC9RoU/CT/rWuRkL5G0kOU=;
 b=RIBlgZC6Oh30G6HcgcmvxMX32abcmz+bpVXcHoFtnluO3AuqkO5IIiaAnMvEcqpLEr
 xB5EW0ALl9Hx3wTwmqYupkzkTuVip17GOOSds7oxc+6J2FlAj/BK0J3pVzvsF2hdY/XY
 FZVlGh0J3PFLbMGWBptLX2h84CwJ31f2ZsRqk/M/1cA7oSccRGApg4kZVqmVGfYU1UXK
 jruWqQjllmZWAYynRKuj7pufmr0OD2HtRNuLWBrcIskiP2yct3oWQK8cYJZyWJX3JOZY
 NoQS6Rmy86LSEvsZWk1QVW6+QVWmfMdfoonOxrqVBOyThdOVGhIbDaP/zhqSphPVrsDc
 ttNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ln6U81QvMeT2YaBDHdoWPtC9RoU/CT/rWuRkL5G0kOU=;
 b=jne6y0cPF3eSEcVtTC3IiWULAlSwKFnxQ84yf/n/iGOB1R8VU9xjaS9KtxwYdHepGu
 iBPcG/S1aNE0qSGna+AZ3nL5XvDtF3Ruj0U8csjO6jHxsL3mDbZBeAgiu9EKo+dw1SeZ
 dNIB5r+gWgjTtvLs8yaY85ByyBzYterJZigBgkujG2kkBp9GWaTBNBT8SnUbnByjSUtW
 kb6aKDnJTYSDV+QtaPpQ6eo78ly6IPApxcRyrkppbglE/+pfXup52VZuqAmomuKBV28b
 t5Agd+Ef4Zpvbxopq6bUJFYr0zHFJE37cwHIdJwwycq+PdpFamkVY3eVudn2TapG57M7
 FRJA==
X-Gm-Message-State: AOAM530Ml68pTVtGmqFBINrgzgQYnHjsSmIoeghFORiXhmaIuQ2Y7B5C
 EYbMDnyC1Am3nzrVwGOVOyCeNQ==
X-Google-Smtp-Source: ABdhPJyKOdf/NeA9ItG/bI5RnavCOG7D654JoTKhomIYFKCnhQpGOux9gYTHzEmVL6kGCNXy2+2Zcg==
X-Received: by 2002:adf:d222:: with SMTP id k2mr34601489wrh.677.1641480502745; 
 Thu, 06 Jan 2022 06:48:22 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id l4sm2595861wry.85.2022.01.06.06.48.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jan 2022 06:48:22 -0800 (PST)
Message-ID: <b7fcf0cc-bade-60a1-7f5a-7b57379ac954@mind.be>
Date: Thu, 6 Jan 2022 15:48:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Changming Huang <jerry.huang@nxp.com>, buildroot@busybox.net
References: <20200207083857.28058-1-jerry.huang@nxp.com>
 <20200207083857.28058-4-jerry.huang@nxp.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20200207083857.28058-4-jerry.huang@nxp.com>
Subject: Re: [Buildroot] [PATCH v5 4/9] package/qoriq-rcw: add target rcw
 binary support
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
Cc: michael@walle.cc, matthew.weber@collins.com, thomas.petazzoni@bootlin.com,
 geomatsi@gmail.com, heiko.thiery@gmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 07/02/2020 09:38, Changming Huang wrote:
> From: Jerry Huang <jerry.huang@nxp.com>
> 
> For NXP QorIQ (PowerPC and Layerscape) platform,
> we need to specify the RCW file and build it to binary.
> 
> Introduce BR2_PACKAGE_HOST_QORIQ_RCW_BIN to specify the RCW binary file.

  It took me some time to understand: this is actually simply about an in-tree 
RCW source, rather than a custom one. So I heavily modified this patch:

      - rename the option to _RCW_INTREE;
      - update commit message, documentation, and internal variables
        accordingly;
      - reorganise condition tree so it becomes a little simpler;
      - add patsubst so the source can be specified as either %.rcw or %.bin;
      - always install it as PBL.bin, to be consistent with the custom
        option.

  Note that that last one (PBL.bin) also affects post-image scripts that use it. 
But I didn't get down to the ls1028ardb defconfig.

  Regards,
  Arnout

> 
> Signed-off-by: Jerry Huang <jerry.huang@nxp.com>
> ---
> changes since v4:
> no changes.
> 
> changes since v3:
> no changes.
> 
> changes since v2:
> 1. modify the patch descrition.
> 2. more detail for BR2_PACKAGE_HOST_QORIQ_RCW_BIN.
> 3. remove two options not used in this patch.
> 4. add the condition detection in makefile for QorIQ RCW.
> 
> changes since v1:
> 1. add option BR2_PACKAGE_HOST_RCW_ATF for ATF.
> ---
>   package/nxp/qoriq-rcw/Config.in.host | 12 ++++++++++++
>   package/nxp/qoriq-rcw/qoriq-rcw.mk   | 15 +++++++++++++++
>   2 files changed, 27 insertions(+)
> 
> diff --git a/package/nxp/qoriq-rcw/Config.in.host b/package/nxp/qoriq-rcw/Config.in.host
> index 8f78a40908..9bf55894e8 100644
> --- a/package/nxp/qoriq-rcw/Config.in.host
> +++ b/package/nxp/qoriq-rcw/Config.in.host
> @@ -25,4 +25,16 @@ config BR2_PACKAGE_HOST_QORIQ_RCW_CUSTOM_PATH
>   	  included for use in the SDK or with post scripts but no
>   	  RCW binary will not be generated.
>   
> +config BR2_PACKAGE_HOST_QORIQ_RCW_BIN
> +	string "Custom RCW"
> +	depends on !BR2_PACKAGE_HOST_QORIQ_RCW_CUSTOM_PATH
> +	help
> +	  This option is used to specify the RCW binary file for board.
> +	  which is composed with platform/serdes_value/rcw_file, platform
> +	  is the platform name, serdes_value is the setting of the Serdes,
> +	  rcw_file is the file name of RCW, for example:
> +	  "ls1028ardb/R_SQPP_0x85bb/rcw_1300_sdboot.bin"
> +
> +	  If this option is empty, no rcw file is used.
> +
>   endif
> diff --git a/package/nxp/qoriq-rcw/qoriq-rcw.mk b/package/nxp/qoriq-rcw/qoriq-rcw.mk
> index 7a0494adc6..bbd085f277 100644
> --- a/package/nxp/qoriq-rcw/qoriq-rcw.mk
> +++ b/package/nxp/qoriq-rcw/qoriq-rcw.mk
> @@ -37,6 +37,21 @@ endef
>   define HOST_QORIQ_RCW_INSTALL_DELIVERY_FILE
>   	$(INSTALL) -D -m 0644 $(@D)/PBL.bin $(BINARIES_DIR)/PBL.bin
>   endef
> +else
> +QORIQ_RCW_PATH_FILE_BIN = $(call qstrip,$(BR2_PACKAGE_HOST_QORIQ_RCW_BIN))
> +
> +ifneq ($(QORIQ_RCW_PATH_FILE_BIN),)
> +QORIQ_RCW_PLATFORM = $(firstword $(subst /, ,$(QORIQ_RCW_PATH_FILE_BIN)))
> +QORIQ_RCW_FILE_BIN = $(lastword $(subst /, ,$(QORIQ_RCW_PATH_FILE_BIN)))
> +
> +define HOST_QORIQ_RCW_BUILD_CMDS
> +	$(MAKE) -C $(@D)/$(QORIQ_RCW_PLATFORM)
> +endef
> +
> +define HOST_QORIQ_RCW_INSTALL_DELIVERY_FILE
> +	$(INSTALL) -D -m 0644 $(@D)/$(QORIQ_RCW_PATH_FILE_BIN) $(BINARIES_DIR)/$(QORIQ_RCW_FILE_BIN)
> +endef
> +endif
>   endif
>   
>   # Copy source files and script into $(HOST_DIR)/share/rcw/ so a developer
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
