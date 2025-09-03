Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8698CA1012
	for <buildroot@archiver.kernel.org>; Wed,  3 Sep 2025 19:32:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75E90418B9;
	Wed,  3 Sep 2025 19:32:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qii--eMU4Ene; Wed,  3 Sep 2025 19:32:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9CF21417C3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9CF21417C3;
	Wed,  3 Sep 2025 19:32:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B7C4439
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 19:32:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0C7D3845DB
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 19:32:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a9OMJcirwONn for <buildroot@buildroot.org>;
 Wed,  3 Sep 2025 19:32:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 13CEF84598
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 13CEF84598
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 13CEF84598
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 19:32:19 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 0D00E1A0614;
 Wed,  3 Sep 2025 19:32:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D8F10606C3;
 Wed,  3 Sep 2025 19:32:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 00F1A1C228A5D; 
 Wed,  3 Sep 2025 21:32:13 +0200 (CEST)
Date: Wed, 3 Sep 2025 21:32:13 +0200
To: Philip Molloy <philip@philipmolloy.com>
Cc: buildroot@buildroot.org, Michael Hennerich
 <michael.hennerich@analog.com>, Philip Molloy <philip.molloy@analog.com>
Message-ID: <20250903213213.15ac10fa@windsurf>
In-Reply-To: <20250903135005.1803497-3-philip@philipmolloy.com>
References: <20250903135005.1803497-1-philip@philipmolloy.com>
 <20250903135005.1803497-3-philip@philipmolloy.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1756927936; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=KIUb/76ad+L913HW14aL0ql+kfpSHjRw9famxt4nedM=;
 b=uok708k6glbufP8FAgpbmZbT/wWllW/Tjw12lH9bBAmlSK2hcINJxJOheCAIAbLHZz5woW
 0G2xsRx0nlzzbIub2tcIyGNXMHSvKAT9btG9k7mmDzQEcOHuQy/JILTktMJbzn+tXOpFkJ
 M7/vC4GfWEqxu9MW4hSAx7Qg95mNY8455bV3db20xQgMehgHBlvKTIjykqwsuzKpCssU+V
 HfjndMH3nDeCjFVKTDRW9RtrNK1XIxO8LdLk1MtEOQbnCgzHOPDeY78Zx+53zlz+JZIs7A
 8xxYwTpT0M4xf/hFyFw9ExoO2htCTwTD2Ti6v0nL5cMEXuEQjokSUOE4nkefug==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=uok708k6
Subject: Re: [Buildroot] [PATCH v2 2/2] boot/uboot: add ADSP LDR binary
 format
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Philip,

Thanks for this v2, we're getting there!

On Wed, 03 Sep 2025 13:50:19 +0000
Philip Molloy <philip@philipmolloy.com> wrote:

> From: Philip Molloy <philip.molloy@analog.com>
> 
> Signed-off-by: Philip Molloy <philip.molloy@analog.com>
> ---
>  boot/uboot/Config.in | 4 ++++
>  boot/uboot/uboot.mk  | 8 ++++++++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
> index a2301b7747..813a29828d 100644
> --- a/boot/uboot/Config.in
> +++ b/boot/uboot/Config.in
> @@ -479,6 +479,10 @@ config BR2_TARGET_UBOOT_FORMAT_QSPI_BIN
>  	  file for flashing by combining the spl/boot.bin and
>  	  u-boot.itb files into a unified binary.
>  
> +config BR2_TARGET_UBOOT_FORMAT_ADSP_LDR
> +	bool "u-boot.ldr"
> +	depends on BR2_arm || BR2_aarch64

A little help text here would be nice, indicating on which platforms
this is relevant.

> +ifeq ($(BR2_TARGET_UBOOT_FORMAT_ADSP_LDR),y)
> +UBOOT_BINS += u-boot.ldr
> +endif
> +
>  ifeq ($(BR2_TARGET_UBOOT_INITIAL_ENV),y)
>  UBOOT_MAKE_TARGET += u-boot-initial-env
>  define UBOOT_INSTALL_UBOOT_INITIAL_ENV
> @@ -257,6 +261,10 @@ UBOOT_MAKE_OPTS += TEE=$(BINARIES_DIR)/$(notdir $(ROCKCHIP_RKBIN_TEE_FILENAME))
>  endif
>  endif
>  
> +ifeq ($(BR2_TARGET_UBOOT_FORMAT_ADSP_LDR),y)
> +UBOOT_DEPENDENCIES += host-adsp-ldr
> +endif

These two should be factored into one condition.

Like we have:

ifeq ($(BR2_TARGET_UBOOT_FORMAT_NAND),y)
UBOOT_BINS += u-boot.nand
UBOOT_MAKE_TARGET += u-boot.sb
UBOOT_DEPENDENCIES += host-elftosb host-openssl
endif

Just do:

ifeq ($(BR2_TARGET_UBOOT_FORMAT_ADSP_LDR),y)
UBOOT_BINS += u-boot.ldr
UBOOT_DEPENDENCIES += host-adsp-ldr
endif

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
