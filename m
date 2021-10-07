Return-Path: <SRS0=EluJ=O3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B50AC433EF
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 20:04:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CDE5610A0
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 20:04:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6CDE5610A0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07934840F9;
	Thu,  7 Oct 2021 20:04:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O1gmxlmnRHCO; Thu,  7 Oct 2021 20:04:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39CA0840DD;
	Thu,  7 Oct 2021 20:04:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EF0801BF29A
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 20:03:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D7DEC40942
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 20:03:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7pBGS9vpeD-g for <buildroot@lists.busybox.net>;
 Thu,  7 Oct 2021 20:03:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd12132.aruba.it (smtpcmd12132.aruba.it [62.149.156.132])
 by smtp4.osuosl.org (Postfix) with ESMTP id 86EC140921
 for <buildroot@buildroot.org>; Thu,  7 Oct 2021 20:03:56 +0000 (UTC)
Received: from [192.168.126.129] ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id YZcQmyml3nxSqYZcQmfMlq; Thu, 07 Oct 2021 22:03:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1633637034; bh=Sqbvee6EkDU7UhARAg5xNtpdCtre0BEIuupsLTPla5g=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=hPUpA+eVk/krP69sv9sL6RKvx2D8sDMXq7R7qNwtPU7eA36vUmFzTK+vtdmDYcwzK
 GyCvzwF1qvOVZ22Oa3J6npzJ7jXjn10vJC1TpaMBCsqR5Kix6COFSD+aHZmMyIQcxF
 NV76kDsvEhIsmb+YtFkwVDzflQ9TEFFDsiWTyBFp70xju1Xhjgq5/R0EjqrNDBh+2H
 Bszs5rvlKZz/v8MmfJubXHVtZ0aaRQRNAARhegMI9INHMWdP8krTYmnV+vqda15Tb2
 UDIUSKvQZKljZ/H3/M8x/hkwAAPUM4EtheSYMvHwYe/dYaUiXyyxFT1oyh5zcl05S1
 2mVW/SunudKRA==
To: Kamel Bouhara <kamel.bouhara@bootlin.com>, buildroot@buildroot.org
References: <20211007095147.688449-1-kamel.bouhara@bootlin.com>
 <20211007095147.688449-4-kamel.bouhara@bootlin.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <fb02e3f3-fb83-9804-1daf-f87467aede87@benettiengineering.com>
Date: Thu, 7 Oct 2021 22:03:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211007095147.688449-4-kamel.bouhara@bootlin.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfL87TCJig/aVw65CrOhKk0jEbBHAmi4wAXqQisikj9Pt2WL648rzQMJKJf7z1wV5hPOTfH6JNR5Jfbu87eSE0h/Ws9Ix+n4xydF/ow3wWO/t2R6t4RDW
 zgYqOYtCHxU4Est49lUaSQw67k8djcCh+kb/ig6iJHQDmEBx4WSiIzzghHNqP4aVJVwnsyYMzWyMnDylj1Uzpe5nzt4tvdFKkJFshXFLXh4k2NGHduJeMQFq
 X4QrTfYJ9QzhmBBc3aDr/qUmGii/YeI6nrlQVlnR4FtjD7l+hHdGQniZFxqoMPsdtbtXwjBKu14HAJwtFEo8wlFAPJ5VxfhtmWRzY56jCFk=
Subject: Re: [Buildroot] [PATCH v3 4/7] package/sunxi-mali-mainline: add
 support for different outputs
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
> From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> 
> Adds support for selecting one of the four display API supported: fbdev,
> wayland, x11-dmabuf, x11-ump.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
> ---
> Changes v2 -> v3:
>   - Moved gbm.pc install into patch 5/7
> 
>   package/sunxi-mali-mainline/Config.in         | 26 +++++++++++++++++
>   .../sunxi-mali-mainline.mk                    | 28 +++++++++++++++++--
>   2 files changed, 51 insertions(+), 3 deletions(-)
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

as done for "wayland" here ^^^ I would add "depends on BR2_PACKAGE_XORG7"

> +
> +config BR2_PACKAGE_SUNXI_MALI_MAINLINE_OUTPUT_X11_UMP
> +	bool "x11 ump"

ditto

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

This is not enough because this way, when you select r8p1, you still can 
see "x11 ump" and "x11 dma-buf". So I would invert the depends on by 
removing the above one and adding the depends on 
BR2_PACKAGE_SUNXI_MALI_MAINLINE_R6P2 to
BR2_PACKAGE_SUNXI_MALI_MAINLINE_OUTPUT_WAYLAND/X11_DMABUF/X11_UMP

Also I would invert the order of the 2 choices, first I would place the 
Version to choose and then the Output, this way is more intuitive for me.

And please, add me to Cc since I'm the maintainer on 
sunxi-mali-mainline* in DEVELOPERS. As already pointed you on previous 
e-mail, please use ./utils/get-developers script to obtain the already 
ready git send-mail command.

Thank you!

Best regards
-- 
Giulio Benetti
Benetti Engineering sas

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
> index b46f572311..e058b5c3cd 100644
> --- a/package/sunxi-mali-mainline/sunxi-mali-mainline.mk
> +++ b/package/sunxi-mali-mainline/sunxi-mali-mainline.mk
> @@ -21,22 +21,44 @@ else ifeq ($(BR2_aarch64),y)
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
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
