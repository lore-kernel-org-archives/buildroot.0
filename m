Return-Path: <SRS0=W/Lv=OL=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27569C433EF
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 15:39:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39F0460E08
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 15:39:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 39F0460E08
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 05BF94021C;
	Tue, 21 Sep 2021 15:39:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PS1zd3LxzF1a; Tue, 21 Sep 2021 15:39:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F063401E1;
	Tue, 21 Sep 2021 15:39:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A21961BF5A7
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 15:39:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8EB6B40188
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 15:39:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NEIinI4zgGPe for <buildroot@lists.busybox.net>;
 Tue, 21 Sep 2021 15:39:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd02101.aruba.it (smtpcmd02101.aruba.it [62.149.158.101])
 by smtp2.osuosl.org (Postfix) with ESMTP id AE97040102
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 15:39:33 +0000 (UTC)
Received: from [192.168.126.129] ([146.241.167.42])
 by Aruba Outgoing Smtp  with ESMTPSA
 id ShrlmvTlBqG1wShrlmRis3; Tue, 21 Sep 2021 17:39:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1632238770; bh=CfR5mwmsZryqzR88lVM8oOkKFSqBPjG5ztSHVgRLdZg=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=R29omsMRsQYgqJHlbxF+9VlXENVo3wpMrh4dNiAQTE3jq5nHt1Xn/2dHKPzYnz2rS
 boyQEt8hupsivIk7zzEVmSuf4VOW4VZskZYTs7Pa6JHvJZDTiRaberQaEyDjO8mapi
 DsCRAtU2aiBshbQwgrdjCs34T1Okki0dVhqtqU8A4iQlZHbq6wT7XJz23/Jk9N66Cm
 EScfbNU6WzM8f8nA1JJJM7tjOpLmOM+K5d9OYZWuvgqs1iHtFQTI2Bq+cDd8XRSVHv
 Dl4C1q/GLx34GeGImfswXd2ljJ4O3Oi3dF6ml6ceKDa8brjR1bBjyC4sActXZ7J/JY
 Qqa+61S9NJtcQ==
To: Kamel Bouhara <kamel.bouhara@bootlin.com>, buildroot@buildroot.org
References: <20210921130326.3462783-1-kamel.bouhara@bootlin.com>
 <20210921130326.3462783-6-kamel.bouhara@bootlin.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <d449502f-20c0-3949-7449-b20e95631a69@benettiengineering.com>
Date: Tue, 21 Sep 2021 17:39:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210921130326.3462783-6-kamel.bouhara@bootlin.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfOz+HKhKsrfS2eRsYLOcRNzLY7zcTjvPvY2/7UdY0QKXzhfH9Dv6xz3kbG9GT8JGQAyuKWM2CvaYl+RaYqvA+v84GpEb0hi9Zh4iEF9cy73CEJ+uIAm6
 8VXvDe1DnAiGGzIHOoxR1kN3YEPVOUDN+LgH+uvgTholz21mnNszwAWhRYggvEZzJOtiKGEXAU8cBQRAn/JP32D9GokRt1W3pn8NQSacCgafp6Plk0Zye26/
 BJYMipkmDjwBYjj6LNZdQz0Zddu43JV14xfCPliJnFwKccpVgg0iyOu5iK+L5BrM
Subject: Re: [Buildroot] [PATCH 5/8] package/sunxi-mali-mainline: add
 support for different outputs
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Hi Kamel, Thomas,

On 9/21/21 3:03 PM, Kamel Bouhara wrote:
> From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> 
> Adds support for selecting one of the four display API supported: fbdev,
> wayland, x11-dmabuf, x11-ump.

Only r6p2 arm supports x11_ump.
r6p2 aarch64 doesn't.

And r8p1 only supports fbdev.

So you have to add some check below.

Also, x11-ump is pretty old, do we really want to keep it?

Best regards
-- 
Giulio Benetti
Benetti Engineering sas

> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
> ---
>   package/sunxi-mali-mainline/Config.in         | 26 ++++++++++++++++
>   .../sunxi-mali-mainline.mk                    | 30 +++++++++++++++++--
>   2 files changed, 53 insertions(+), 3 deletions(-)
> 
> diff --git a/package/sunxi-mali-mainline/Config.in b/package/sunxi-mali-mainline/Config.in
> index a2fb95bd79..31a9152407 100644
> --- a/package/sunxi-mali-mainline/Config.in
> +++ b/package/sunxi-mali-mainline/Config.in
> @@ -17,6 +17,24 @@ config BR2_PACKAGE_PROVIDES_LIBEGL
>   config BR2_PACKAGE_PROVIDES_LIBGLES
>   	default "sunxi-mali-mainline"
>   
> +choice
> +	prompt "Output"
> +
> +config BR2_PACKAGE_SUNXI_MALI_MAINLINE_OUTPUT_FBDEV
> +	bool "fbdev"
> +
> +config BR2_PACKAGE_SUNXI_MALI_MAINLINE_OUTPUT_WAYLAND
> +	bool "wayland"
> +	depends on BR2_PACKAGE_WAYLAND
> +
> +config BR2_PACKAGE_SUNXI_MALI_MAINLINE_OUTPUT_X11_DMABUF
> +	bool "x11 dma-buf"
> +
> +config BR2_PACKAGE_SUNXI_MALI_MAINLINE_OUTPUT_X11_UMP
> +	bool "x11 ump"
> +
> +endchoice
> +
>   choice
>   	prompt "Version"
>   	default BR2_PACKAGE_SUNXI_MALI_MAINLINE_R6P2
> @@ -27,9 +45,17 @@ config BR2_PACKAGE_SUNXI_MALI_MAINLINE_R6P2
>   	bool "r6p2"
>   config BR2_PACKAGE_SUNXI_MALI_MAINLINE_R8P1
>   	bool "r8p1"
> +	depends on BR2_PACKAGE_SUNXI_MALI_MAINLINE_OUTPUT_FBDEV
>   
>   endchoice
>   
> +config BR2_PACKAGE_SUNXI_MALI_MAINLINE_OUTPUT
> +	string
> +	default "fbdev"		if BR2_PACKAGE_SUNXI_MALI_MAINLINE_OUTPUT_FBDEV
> +	default "wayland"	if BR2_PACKAGE_SUNXI_MALI_MAINLINE_OUTPUT_WAYLAND
> +	default "x11_dma_buf" 	if BR2_PACKAGE_SUNXI_MALI_MAINLINE_OUTPUT_X11_DMABUF
> +	default "x11_ump"     	if BR2_PACKAGE_SUNXI_MALI_MAINLINE_OUTPUT_X11_UMP
> +
>   config BR2_PACKAGE_SUNXI_MALI_MAINLINE_REVISION
>   	string
>   	default "r6p2"	if BR2_PACKAGE_SUNXI_MALI_MAINLINE_R6P2
> diff --git a/package/sunxi-mali-mainline/sunxi-mali-mainline.mk b/package/sunxi-mali-mainline/sunxi-mali-mainline.mk
> index b46f572311..e9091b05a2 100644
> --- a/package/sunxi-mali-mainline/sunxi-mali-mainline.mk
> +++ b/package/sunxi-mali-mainline/sunxi-mali-mainline.mk
> @@ -21,22 +21,46 @@ else ifeq ($(BR2_aarch64),y)
>   SUNXI_MALI_MAINLINE_ARCH=arm64
>   endif
>   
> +SUNXI_MALI_MAINLINE_OUTPUT = $(call qstrip,$(BR2_PACKAGE_SUNXI_MALI_MAINLINE_OUTPUT))
> +SUNXI_MALI_MAINLINE_LIB_SUBDIR = \
> +	$(SUNXI_MALI_MAINLINE_REV)/$(SUNXI_MALI_MAINLINE_ARCH)/$(SUNXI_MALI_MAINLINE_OUTPUT)
> +
> +ifeq ($(BR2_PACKAGE_SUNXI_MALI_MAINLINE_OUTPUT_X11_DMABUF)$(BR2_PACKAGE_SUNXI_MALI_MAINLINE_OUTPUT_X11_UMP),y)
> +SUNXI_MALI_MAINLINE_INCLUDE_SUBDIR = include/x11
> +else
> +SUNXI_MALI_MAINLINE_INCLUDE_SUBDIR = \
> +	include/$(SUNXI_MALI_MAINLINE_OUTPUT)
> +define SUNXI_MALI_MAINLINE_FIXUP_EGL_PC
> +	$(SED) "s/Cflags: /Cflags: -DMESA_EGL_NO_X11_HEADERS /" \
> +		$(STAGING_DIR)/usr/lib/pkgconfig/egl.pc
> +endef
> +endif
> +
> +ifeq ($(BR2_PACKAGE_SUNXI_MALI_MAINLINE_OUTPUT_WAYLAND),y)
> +SUNXI_MALI_MAINLINE_DEPENDENCIES += wayland
> +endif
> +
> +# FIXME: install gbm.pc conditionally
>   define SUNXI_MALI_MAINLINE_INSTALL_STAGING_CMDS
>   	mkdir -p $(STAGING_DIR)/usr/lib $(STAGING_DIR)/usr/include
>   
> -	cp -rf $(@D)/$(SUNXI_MALI_MAINLINE_REV)/$(SUNXI_MALI_MAINLINE_ARCH)/fbdev/*.so* \
> +	cp -rf $(@D)/$(SUNXI_MALI_MAINLINE_LIB_SUBDIR)/*.so* \
>   		$(STAGING_DIR)/usr/lib/
> -	cp -rf $(@D)/include/fbdev/* $(STAGING_DIR)/usr/include/
> +	cp -rf $(@D)/$(SUNXI_MALI_MAINLINE_INCLUDE_SUBDIR)/* \
> +		$(STAGING_DIR)/usr/include/
>   
>   	$(INSTALL) -D -m 0644 package/sunxi-mali-mainline/egl.pc \
>   		$(STAGING_DIR)/usr/lib/pkgconfig/egl.pc
>   	$(INSTALL) -D -m 0644 package/sunxi-mali-mainline/glesv2.pc \
>   		$(STAGING_DIR)/usr/lib/pkgconfig/glesv2.pc
> +	$(INSTALL) -D -m 0644 package/sunxi-mali-mainline/gbm.pc \
> +		$(STAGING_DIR)/usr/lib/pkgconfig/gbm.pc
> +	$(SUNXI_MALI_MAINLINE_FIXUP_EGL_PC)
>   endef
>   
>   define SUNXI_MALI_MAINLINE_INSTALL_TARGET_CMDS
>   	mkdir -p $(TARGET_DIR)/usr/lib
> -	cp -rf $(@D)/$(SUNXI_MALI_MAINLINE_REV)/$(SUNXI_MALI_MAINLINE_ARCH)/fbdev/*.so* \
> +	cp -rf $(@D)/$(SUNXI_MALI_MAINLINE_LIB_SUBDIR)/*.so* \
>   		$(TARGET_DIR)/usr/lib/
>   endef
>   
> 

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
