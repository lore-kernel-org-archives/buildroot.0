Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 502FDC433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 14:52:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0047A85A35;
	Sun, 12 Dec 2021 14:52:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UMqualeMbiCR; Sun, 12 Dec 2021 14:52:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43DFB85A30;
	Sun, 12 Dec 2021 14:52:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DB0831BF33B
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 14:52:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D824D85A30
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 14:52:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S5jCNuzYVaTK for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 14:52:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0527F85A25
 for <buildroot@busybox.net>; Sun, 12 Dec 2021 14:52:22 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id o20so44846686eds.10
 for <buildroot@busybox.net>; Sun, 12 Dec 2021 06:52:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=ixFX5pyLsswYbuXAOKp8To0ghNSjv/JXusIq0wbZ83g=;
 b=PqaJj+lkQ5dqtZlRBxM9U3U9ORWrE7K+pXotdrUSHHjwMhsSNWitWow95SYb7V322K
 LEG+lzqznLFTpaN18pqHwlqHP5yWQKLPH2KeDDKjMH7q2yNh0g7+y9wjHRzN3qsYnp/X
 AThT84vQgqmzAtiZkJRWSad+Hw2YRmzDY73cKpntkLKazHuvCiSq8uFctOnPYpTeiYk3
 ntz1INNo9bNv9WhwH8yBCTX8tla4kav1BlJpPZxACoI8gBSitDfDleTn9QpkJvRMzwrz
 WhSd4WgwqPFQjc3msM6OEgXhst5Cahskq4CtoSY/bZq1rES6x4+GPhS48r1K3MB5LthD
 dFRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ixFX5pyLsswYbuXAOKp8To0ghNSjv/JXusIq0wbZ83g=;
 b=7XnBWm4I9Hzd6RFy6KCcp6AtriGEWFgGjh7QjsDhjW0gnco5H2GAkvFpSrNLkFsgTK
 NPpjuScvlunzw4psif8KirHQyeUMmKW1w7FqN4Jul4VbA3uc9DlcDs97hrF9ua4wFTga
 urFTnHaFv/PACtWuDjdRv5r1P/4UwV+5r1Mo/lscn0wn++V43B3idIyUU+b5i/bUh9pe
 GfmRd58uhjY/OmfK2hPD0Z/ZHFUI24LCQAGpGww1xESy168nYe1DxapihiDbUQCIOdjO
 Y/LonbLTnUiRrgXFqnSlY7CcXqEVOPhiKrfxdn9+IV939+VdnzLLfgA1TmAVgTS8TpRm
 jvfw==
X-Gm-Message-State: AOAM530ac5qDNsV3PnYXiKr9TZHrvJO/wedDzKn8JrYOUnEDVOsswmUz
 NHLH32M/aS1amZXecRxsbu/RjN3AXHUsbQ==
X-Google-Smtp-Source: ABdhPJw/iDvla2wBeyaejW9R+GqVLn6d3M8qGpUaqTnQntAuaIXVIHMR4HQH3bb6cypu4lzj5BRtcA==
X-Received: by 2002:a05:6402:1cb2:: with SMTP id
 cz18mr56697899edb.99.1639320741251; 
 Sun, 12 Dec 2021 06:52:21 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id lk22sm4631361ejb.83.2021.12.12.06.52.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Dec 2021 06:52:20 -0800 (PST)
Message-ID: <bb4d341f-d1b6-af74-f033-b1537d3c9d00@mind.be>
Date: Sun, 12 Dec 2021 15:52:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Michael Trimarchi <michael@amarulasolutions.com>, buildroot@busybox.net
References: <20211211183412.658131-1-michael@amarulasolutions.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211211183412.658131-1-michael@amarulasolutions.com>
Subject: Re: [Buildroot] [PATCH] boot/uboot: Add ddr3 IMX firmware files to
 uboot package dir
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 11/12/2021 19:34, Michael Trimarchi wrote:
> The mainline U-Boot can create an i.MX specific firmware image (e.g. flash.bin).
> For this the i.MX firmware files must be in the toplevel directory.
> 
> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   boot/uboot/uboot.mk                           |  3 ++-
>   package/freescale-imx/firmware-imx/Config.in  |  5 +++++
>   .../firmware-imx/firmware-imx.mk              | 20 +++++++++++++++++++
>   3 files changed, 27 insertions(+), 1 deletion(-)
> 
> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> index 9661f901ea..c89216fac4 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -187,7 +187,8 @@ UBOOT_DEPENDENCIES += firmware-imx
>   UBOOT_IMX_FW_FILES = \
>   	$(if $(BR2_PACKAGE_FIRMWARE_IMX_NEEDS_HDMI_FW),signed_hdmi_imx8m.bin) \
>   	$(if $(BR2_PACKAGE_FIRMWARE_IMX_LPDDR4),lpddr4*.bin) \
> -	$(if $(BR2_PACKAGE_FIRMWARE_IMX_DDR4),ddr4*.bin)
> +	$(if $(BR2_PACKAGE_FIRMWARE_IMX_DDR4),ddr4*.bin) \
> +	$(if $(BR2_PACKAGE_FIRMWARE_IMX_DDR3),ddr3*.bin)
>   
>   define UBOOT_COPY_IMX_FW_FILES
>   	$(foreach fw,$(UBOOT_IMX_FW_FILES),\
> diff --git a/package/freescale-imx/firmware-imx/Config.in b/package/freescale-imx/firmware-imx/Config.in
> index 0bd8000b50..df266fb28e 100644
> --- a/package/freescale-imx/firmware-imx/Config.in
> +++ b/package/freescale-imx/firmware-imx/Config.in
> @@ -71,6 +71,11 @@ config BR2_PACKAGE_FIRMWARE_IMX_DDR4
>   	help
>   	  Use DDR4 binaries (i.e.: ddr4_*_201810.bin).
>   
> +config BR2_PACKAGE_FIRMWARE_IMX_DDR3
> +	bool "DDR3"
> +	help
> +	  Use DDR3 binaries (i.e.: ddr3_*_201810.bin).
> +
>   endchoice # DDR training FW
>   
>   config BR2_PACKAGE_FIRMWARE_IMX_IMEM_LEN
> diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
> index 60c97fd2b8..3acd053d0f 100644
> --- a/package/freescale-imx/firmware-imx/firmware-imx.mk
> +++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
> @@ -82,6 +82,26 @@ define FIRMWARE_IMX_INSTALL_IMAGE_DDR_FW
>   endef
>   endif
>   
> +ifeq ($(BR2_PACKAGE_FIRMWARE_IMX_DDR3),y)
> +FIRMWARE_IMX_DDRFW_DIR = $(@D)/firmware/ddr/synopsys
> +
> +define FIRMWARE_IMX_INSTALL_IMAGE_DDR_FW
> +	# Create padded versions of ddr3_* and generate ddr3_fw.bin.
> +	# ddr3_fw.bin is needed when generating imx8-boot-sd.bin
> +	# which is done in post-image script.
> +	$(call FIRMWARE_IMX_PREPARE_DDR_FW, \
> +		ddr3_imem_1d_201810,ddr3_dmem_1d_201810,ddr3_1d_201810_fw)
> +	cat $(FIRMWARE_IMX_DDRFW_DIR)/ddr3_1d_201810_fw.bin > \
> +		$(BINARIES_DIR)/ddr3_201810_fw.bin
> +	ln -sf $(BINARIES_DIR)/ddr3_201810_fw.bin $(BINARIES_DIR)/ddr_fw.bin
> +
> +	# U-Boot supports creation of the combined flash.bin image. To make
> +	# sure that U-Boot can access all available files copy them to
> +	# the binary dir.
> +	cp $(FIRMWARE_IMX_DDRFW_DIR)/ddr3*.bin $(BINARIES_DIR)/
> +endef
> +endif
> +
>   #
>   # HDMI firmware
>   #
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
