Return-Path: <SRS0=EluJ=O3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CD80C433F5
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 20:23:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B3B361139
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 20:23:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8B3B361139
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61FC240454;
	Thu,  7 Oct 2021 20:23:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fETk-qLAaPHr; Thu,  7 Oct 2021 20:23:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2C22401EE;
	Thu,  7 Oct 2021 20:23:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EF0C41BF84C
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 20:23:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CF69F842D0
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 20:23:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tyb6znmH58Jk for <buildroot@lists.busybox.net>;
 Thu,  7 Oct 2021 20:23:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd12132.aruba.it (smtpcmd12132.aruba.it [62.149.156.132])
 by smtp1.osuosl.org (Postfix) with ESMTP id D64DF842C2
 for <buildroot@buildroot.org>; Thu,  7 Oct 2021 20:23:25 +0000 (UTC)
Received: from [192.168.126.129] ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id YZvImz8k3nxSqYZvImfY2T; Thu, 07 Oct 2021 22:23:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1633638204; bh=h2bZr1P0SsGFi13l/AmRQJGtRWN20Y3wB6oCyfCnljc=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=nC55cIVXUYB2FzcTtUO3hbZ7Ocb7/NwVCeKclJ2qggMv6yrY+mvcwQ0oB3P08Ejpp
 V1ZDz0mt8BGcD1LCAwI6cAYo+3jRWUswRtFNEt27CL4L2Qrl0dDmfmORpBb31cQiWN
 FkH4dBXqafdQ14+mYqLqrf+rdUUctxpaw/siyWw88BpIuox5obxmTSYRPatJkTYlxh
 EXy4LjyJieUv7LkuT+i6XrEp+AsQiMgk5/K3PqYoaqCoZkPEXVujfH0F5+EXAnA+hG
 145Imf35aP5YjCZoR9fD9qQir+OT5mkuXA2FBOxvijsf3vD7UhYsNqSfmvobUxfLQ9
 dpNcz0JoM5ttA==
To: Kamel Bouhara <kamel.bouhara@bootlin.com>, buildroot@buildroot.org
References: <20211007095147.688449-1-kamel.bouhara@bootlin.com>
 <20211007095147.688449-5-kamel.bouhara@bootlin.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <04333d8b-411c-97a4-8872-e2200e2833ab@benettiengineering.com>
Date: Thu, 7 Oct 2021 22:23:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211007095147.688449-5-kamel.bouhara@bootlin.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfIqnp2V9C/0iqqwk0dJvFelvboyO+lsFSJW1S1tZK6B6Q4Q8Qy/N17/nLyJnOTyAaJVdzxioxX6GsAuRUkyBHsP1KiOUd1DTxb4r2hq5xcP29OA9AdTd
 M5xUkO+GvtqftDNu0ncaL9h8d+Lw9W9oEzgP+/EUbKXJa3OCsrt73t4Qgxu8NT9/di0akgXDA0DCbGqXLNrs1Uooo8HmtLrNSwgoqv9nt8Cq1h0m4y7civiF
 PWvZLEWIFRXRxdzwonGqc+EOdfF8jzOFUyIDXsnlCB+6mWM5xmjMUFO2Cv1r/8k4aJIfYtCy5AKcGZ1QlxlxTPl6zZT4pB/qMDaX5uKV0us=
Subject: Re: [Buildroot] [PATCH v3 5/7] package/sunxi-mali-mainline:
 provides libgbm
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
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Kamel,

On 10/7/21 11:51 AM, Kamel Bouhara wrote:
> Registers the package as a libgbm provider.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
> ---
> Changes v1 -> v2:
>   - Fixed gbm features are provided only when wayland is set
> Changes v1 -> v2:
>   - Fixed gbm features selected only when wayland is set
> 
>   package/sunxi-mali-mainline/Config.in              |  5 +++++
>   package/sunxi-mali-mainline/gbm.pc                 | 12 ++++++++++++
>   package/sunxi-mali-mainline/sunxi-mali-mainline.mk |  3 +++
>   3 files changed, 20 insertions(+)
>   create mode 100644 package/sunxi-mali-mainline/gbm.pc
> 
> diff --git a/package/sunxi-mali-mainline/Config.in b/package/sunxi-mali-mainline/Config.in
> index 31a9152407..10534f263b 100644
> --- a/package/sunxi-mali-mainline/Config.in
> +++ b/package/sunxi-mali-mainline/Config.in
> @@ -14,6 +14,9 @@ if BR2_PACKAGE_SUNXI_MALI_MAINLINE
>   config BR2_PACKAGE_PROVIDES_LIBEGL
>   	default "sunxi-mali-mainline"
>   
> +config BR2_PACKAGE_PROVIDES_LIBGBM
> +	default "sunxi-mali-mainline" if BR2_PACKAGE_SUNXI_MALI_MAINLINE_OUTPUT_WAYLAND
> +
>   config BR2_PACKAGE_PROVIDES_LIBGLES
>   	default "sunxi-mali-mainline"
>   
> @@ -26,6 +29,8 @@ config BR2_PACKAGE_SUNXI_MALI_MAINLINE_OUTPUT_FBDEV
>   config BR2_PACKAGE_SUNXI_MALI_MAINLINE_OUTPUT_WAYLAND
>   	bool "wayland"
>   	depends on BR2_PACKAGE_WAYLAND
> +	select BR2_PACKAGE_LIBGBM_HAS_FEATURE_DMA_BUF
> +	select BR2_PACKAGE_HAS_LIBGBM
>   
>   config BR2_PACKAGE_SUNXI_MALI_MAINLINE_OUTPUT_X11_DMABUF
>   	bool "x11 dma-buf"
> diff --git a/package/sunxi-mali-mainline/gbm.pc b/package/sunxi-mali-mainline/gbm.pc
> new file mode 100644
> index 0000000000..593cfa0aba
> --- /dev/null
> +++ b/package/sunxi-mali-mainline/gbm.pc
> @@ -0,0 +1,12 @@
> +prefix=/usr
> +exec_prefix=/usr
> +libdir=${exec_prefix}/lib
> +includedir=${prefix}/include
> +
> +Name: gbm
> +Description: ARM Mali implementation of gbm
> +Requires.private:
> +Version: 1.0
> +Libs: -L${libdir} -lgbm
> +Libs.private:
> +Cflags: -I${includedir}
> diff --git a/package/sunxi-mali-mainline/sunxi-mali-mainline.mk b/package/sunxi-mali-mainline/sunxi-mali-mainline.mk
> index e058b5c3cd..8a76b46aba 100644
> --- a/package/sunxi-mali-mainline/sunxi-mali-mainline.mk
> +++ b/package/sunxi-mali-mainline/sunxi-mali-mainline.mk
> @@ -38,6 +38,7 @@ endif
>   
>   ifeq ($(BR2_PACKAGE_SUNXI_MALI_MAINLINE_OUTPUT_WAYLAND),y)
>   SUNXI_MALI_MAINLINE_DEPENDENCIES += wayland
> +SUNXI_MALI_MAINLINE_PROVIDES += libgbm
>   endif
>   
>   # FIXME: install gbm.pc conditionally
> @@ -53,6 +54,8 @@ define SUNXI_MALI_MAINLINE_INSTALL_STAGING_CMDS
>   		$(STAGING_DIR)/usr/lib/pkgconfig/egl.pc
>   	$(INSTALL) -D -m 0644 package/sunxi-mali-mainline/glesv2.pc \
>   		$(STAGING_DIR)/usr/lib/pkgconfig/glesv2.pc
> +	$(INSTALL) -D -m 0644 package/sunxi-mali-mainline/gbm.pc \
> +		$(STAGING_DIR)/usr/lib/pkgconfig/gbm.pc

As pointed by # FIXME above you need to make the install of gbm.pc 
conditional to BR2_PACKAGE_HAS_LIBGBM, something like:

ifeq ($(BR2_PACKAGE_HAS_LIBGBM),y)
define SUNXI_MALI_MAINLINE_INSTALL_GBM_PC
	$(INSTALL) -D -m 0644 package/sunxi-mali-mainline/gbm.pc \
		$(STAGING_DIR)/usr/lib/pkgconfig/gbm.pc
endef
endif

and then call $(SUNXI_MALI_MAINLINE_INSTALL_GBM_PC) in place of the 
actual install, like $(SUNXI_MALI_MAINLINE_FIXUP_EGL_PC).

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
