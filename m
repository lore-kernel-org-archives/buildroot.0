Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2C95C433EF
	for <buildroot@archiver.kernel.org>; Sat, 12 Feb 2022 10:13:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 725B64023B;
	Sat, 12 Feb 2022 10:13:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2KujXAqKm6-6; Sat, 12 Feb 2022 10:13:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 20418401AF;
	Sat, 12 Feb 2022 10:13:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4AE791BF853
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 10:13:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3971D81361
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 10:13:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j8QnpSszzX06 for <buildroot@lists.busybox.net>;
 Sat, 12 Feb 2022 10:13:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 47DC181344
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 10:13:38 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 a11-20020a17090a740b00b001b8b506c42fso14296685pjg.0
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 02:13:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2NAUN0suBTkhVpc2VsUfE2gqH3dEH4PGGWgCeWPY/T4=;
 b=UhgSXv1BjECMaI0FZ49JgUuEWVwxK+geyfL0Ejpzo3BEq9KbfxczoAmHFTZDkhsEtN
 Y93SroFjYRHYV3dXj0Uv0tMfvDoLhPrxJn4Q/nd1ZQ5M23DyOTi1dTgc4Nr3qYUbuP9E
 zOR7irabnJN+z5FWB518HNV+sHIlYCie4e2Zc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2NAUN0suBTkhVpc2VsUfE2gqH3dEH4PGGWgCeWPY/T4=;
 b=3rkfbuxthrC9GBMfiZnzU4Kqy2BX3w+cx/DszyZzquOIZpYgVI9G5YTijosOJ5ueXM
 tqTPef+AKXQPeRN43rybM/7PuzuBKGz/UIMtWG8PP4If5S6iSrcpnHt+s3SoWtlwrBBz
 u9Hw4rSYYrQCoS0OUkvbYjjqlrgVmRzDSlOuJb1lX32buWalrWbX2aMDMwIgnCxxyewo
 rEJsgAyOtVMEiIsilX2Bv6Y+Cl1UxuDTQrW8YTvCf/csze2h5f90Zbnf+dDsG7zcP7y+
 ep1l6hiSX6+OlUIGcH5WrFrVAK7IbYRgw47klmNdCFRVAORuHWRYVgHOhXbnFlNKqW/0
 xkTA==
X-Gm-Message-State: AOAM530zaFOy80Wa213lQboZ7uUApl2mGphuwVZDPfSBW5x6suxccORS
 IldodeUis2Y+fbdIT8t7mKvJ6NuQLuyOzLcXV9nRR5+VID0=
X-Google-Smtp-Source: ABdhPJzx7+zD7yIepOzycVDgC7KeEKGnlEqBq7pPovH6D+J/rD+Dl61AcOkg7Mh+wlLC2w6iWOUHcLLzrK9UOjxg2S8=
X-Received: by 2002:a17:90b:4b05:: with SMTP id
 lx5mr4574395pjb.171.1644660817174; 
 Sat, 12 Feb 2022 02:13:37 -0800 (PST)
MIME-Version: 1.0
References: <20220129140831.1284832-1-michael@amarulasolutions.com>
In-Reply-To: <20220129140831.1284832-1-michael@amarulasolutions.com>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Sat, 12 Feb 2022 11:13:25 +0100
Message-ID: <CAOf5uwmwoVsqZ45hduVNyLWKGJMkah1w3TFW=DuN1RKbj2Kg2g@mail.gmail.com>
To: buildroot@buildroot.org
Subject: Re: [Buildroot] [PATCH] package/freescale-imx: Add installation of
 easrc-imx8mn.bin firmware
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
Cc: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi

On Sat, Jan 29, 2022 at 3:08 PM Michael Trimarchi
<michael@amarulasolutions.com> wrote:
>
> The easrc firmware is used for audio resampling. The firmware for now
> exists only for imx8mn device
>
> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> ---
>  package/freescale-imx/firmware-imx/Config.in       |  4 ++++
>  package/freescale-imx/firmware-imx/firmware-imx.mk | 12 ++++++++++++
>  2 files changed, 16 insertions(+)
>
> diff --git a/package/freescale-imx/firmware-imx/Config.in b/package/freescale-imx/firmware-imx/Config.in
> index df266fb28e..06c4d8036c 100644
> --- a/package/freescale-imx/firmware-imx/Config.in
> +++ b/package/freescale-imx/firmware-imx/Config.in
> @@ -39,6 +39,10 @@ config BR2_PACKAGE_FIRMWARE_IMX_NEEDS_HDMI_FW
>         bool
>         default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M
>
> +config BR2_PACKAGE_FIRMWARE_IMX_NEEDS_EASRC_FW
> +       bool
> +       default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN
> +
>  config BR2_PACKAGE_FIRMWARE_IMX_NEEDS_EPDC_FW
>         bool
>         default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q
> diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
> index 3acd053d0f..211a43c4ca 100644
> --- a/package/freescale-imx/firmware-imx/firmware-imx.mk
> +++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
> @@ -113,6 +113,17 @@ define FIRMWARE_IMX_INSTALL_IMAGE_HDMI_FW
>  endef
>  endif
>
> +#
> +# EASRC firmware
> +#
> +
> +ifeq ($(BR2_PACKAGE_FIRMWARE_IMX_NEEDS_EASRC_FW),y)
> +define FIRMWARE_IMX_INSTALL_TARGET_EASRC_FW
> +       mkdir -p $(TARGET_DIR)/lib/firmware/imx
> +       cp -r $(@D)/firmware/easrc $(TARGET_DIR)/lib/firmware/imx
> +endef
> +endif
> +
>  #
>  # EPDC firmware
>  #
> @@ -160,6 +171,7 @@ define FIRMWARE_IMX_INSTALL_IMAGES_CMDS
>  endef
>
>  define FIRMWARE_IMX_INSTALL_TARGET_CMDS
> +       $(FIRMWARE_IMX_INSTALL_TARGET_EASRC_FW)
>         $(FIRMWARE_IMX_INSTALL_TARGET_EPDC_FW)
>         $(FIRMWARE_IMX_INSTALL_TARGET_SDMA_FW)
>         $(FIRMWARE_IMX_INSTALL_TARGET_VPU_FW)


Is something missing here?

Michael
> --
> 2.25.1
>


-- 
Michael Nazzareno Trimarchi
Co-Founder & Chief Executive Officer
M. +39 347 913 2170
michael@amarulasolutions.com
__________________________________

Amarula Solutions BV
Joop Geesinkweg 125, 1114 AB, Amsterdam, NL
T. +31 (0)85 111 9172
info@amarulasolutions.com
www.amarulasolutions.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
