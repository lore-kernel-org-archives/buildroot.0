Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE86EC6FD18
	for <buildroot@archiver.kernel.org>; Sun, 23 Apr 2023 22:01:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 326CE60E33;
	Sun, 23 Apr 2023 22:01:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 326CE60E33
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j67Vass_ZByh; Sun, 23 Apr 2023 22:01:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F29660BB9;
	Sun, 23 Apr 2023 22:01:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F29660BB9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 073FC1C2B11
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 22:01:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D41CC4031D
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 22:01:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D41CC4031D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gIr9LByjSRJz for <buildroot@lists.busybox.net>;
 Sun, 23 Apr 2023 22:01:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4089E4012E
Received: from smtpdh20-2.aruba.it (smtpdh20-2.aruba.it [62.149.155.165])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4089E4012E
 for <buildroot@buildroot.org>; Sun, 23 Apr 2023 22:01:16 +0000 (UTC)
Received: from [192.168.50.18] ([146.241.104.90])
 by Aruba Outgoing Smtp  with ESMTPSA
 id qhlgpGZwcxNVBqhlgpKIqz; Mon, 24 Apr 2023 00:01:13 +0200
Message-ID: <c0f9b364-d483-d8b7-981b-51d31b52c21e@benettiengineering.com>
Date: Mon, 24 Apr 2023 00:01:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
To: Adrian Perez de Castro <aperez@igalia.com>, buildroot@buildroot.org
References: <20230423214014.2963361-1-aperez@igalia.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20230423214014.2963361-1-aperez@igalia.com>
X-CMAE-Envelope: MS4xfMA+dWLkfvZLMGE+gx1OJHPMzGLd6xp4YQ2Z1eQ8xcauLoMs4ABsvK1k5TjuOEU6OMA+HqqtXUM87i2B8xCsm5NM07afxAGcs6V/jMop/tbrdS5LGS7l
 qVhZOFIvtgrlKWl76rp7F3CIOYQfnBCLYB5sSm30INXlPicDUWgR+whhWOklGKaMVP3UQVtNfoq4zVnNsi+NbR6T9wAMlEFeTYwv/yHZX7oZ2gOmSWyYl2vA
 8kQcyIjg/AMoka81Ch80sQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1682287273; bh=b+uZGJg73JInYS/OfcVoSAN0/VPfuzjQTFLBS4vJFX8=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=CRCSDHunHRy9FS8BAjvr/hl79uEKb/ZafmFujFFlwVhvqblsKbb3nnokpl28a1JU0
 edMXUGvVe0v6Wtycof2NLLc7bJrd++z96BBbHieIJ1Fyvb41oviDb/YHtt3Ffsabnl
 WoecC0my7wMUZcFLrTS+Q9YIgsJqPRuXkiJmz108MoOWUlOHBe3ht9CQJo41RdCboq
 GdlpXoPzn2l8Oi0SB0E6hh9SPxA4y2uG5yySG4vLgsUzVXFUGRAzBX6U1/9sL9UsOW
 cVLz1gvRekNyS7t0/gT3xJPf66VGRSrr+yMXtZiwR39hjY4BQRDOOgz/q+YpNlq5f9
 4WOTfD2jXJ4Zg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=CRCSDHun
Subject: Re: [Buildroot] [PATCH] package/sunxi-mali-utgard: support the
 wayland driver
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

Hi Adrian,

Il 23/04/2023 23:40, Adrian Perez de Castro ha scritto:
> Add a choice to allow using the Wayland variant of the Mali driver. When
> selected, the package is marked as provider for libgbm as libMali.so
> includes the symbols and a libgbm.so symlink is installed; and both
> BR2_PACKAGE_HAS_{LIBGBM,LIBEGL_WAYLAND} are selected accordingly.
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> ---
>   package/sunxi-mali-utgard/Config.in           | 23 +++++++++++++++++++
>   .../sunxi-mali-utgard/sunxi-mali-utgard.mk    | 18 ++++++++++++---
>   2 files changed, 38 insertions(+), 3 deletions(-)
> 
> diff --git a/package/sunxi-mali-utgard/Config.in b/package/sunxi-mali-utgard/Config.in
> index 59ac21f5ab..0856f220fd 100644
> --- a/package/sunxi-mali-utgard/Config.in
> +++ b/package/sunxi-mali-utgard/Config.in
> @@ -18,6 +18,9 @@ config BR2_PACKAGE_PROVIDES_LIBEGL
>   config BR2_PACKAGE_PROVIDES_LIBGLES
>   	default "sunxi-mali-utgard"
>   
> +config BR2_PACKAGE_PROVIDES_LIBGBM
> +	default "sunxi-mali-utgard" if BR2_PACKAGE_SUNXI_MALI_UTGARD_WAYLAND
> +
>   choice
>   	prompt "Version"
>   	default BR2_PACKAGE_SUNXI_MALI_UTGARD_R6P2 if BR2_PACKAGE_SUNXI_MALI_MAINLINE_R6P2 # legacy
> @@ -38,6 +41,26 @@ config BR2_PACKAGE_SUNXI_MALI_UTGARD_REVISION
>   	default "r6p2"	if BR2_PACKAGE_SUNXI_MALI_UTGARD_R6P2
>   	default "r8p1"	if BR2_PACKAGE_SUNXI_MALI_UTGARD_R8P1
>   
> +choice
> +	prompt "Platform"
> +	default BR2_PACKAGE_SUNXI_MALI_UTGARD_FBDEV
> +	help
> +	  Select the target EGL platform.
> +
> +config BR2_PACKAGE_SUNXI_MALI_UTGARD_FBDEV
> +	bool "fbdev"
> +config BR2_PACKAGE_SUNXI_MALI_UTGARD_WAYLAND
> +	bool "wayland"
> +	select BR2_PACKAGE_HAS_LIBEGL_WAYLAND
> +	select BR2_PACKAGE_HAS_LIBGBM

There is a wayland blob only for r6p2 version :-/ so here you need
to depend on BR2_PACKAGE_SUNXI_MALI_UTGARD_R6P2 and add a comment
for Wayland not available when r8p1 is selected.

Thank you

Best regards
-- 
Giulio Benetti
CEO/CTO@Benetti Engineering sas

> +
> +endchoice
> +
> +config BR2_PACKAGE_SUNXI_MALI_UTGARD_PLATFORM
> +	string
> +	default "fbdev" if BR2_PACKAGE_SUNXI_MALI_UTGARD_FBDEV
> +	default "wayland" if BR2_PACKAGE_SUNXI_MALI_UTGARD_WAYLAND
> +
>   endif
>   
>   comment "sunxi-mali-utgard needs an EABIhf glibc toolchain"
> diff --git a/package/sunxi-mali-utgard/sunxi-mali-utgard.mk b/package/sunxi-mali-utgard/sunxi-mali-utgard.mk
> index f693667955..23c6e8ec6e 100644
> --- a/package/sunxi-mali-utgard/sunxi-mali-utgard.mk
> +++ b/package/sunxi-mali-utgard/sunxi-mali-utgard.mk
> @@ -24,9 +24,9 @@ endif
>   define SUNXI_MALI_UTGARD_INSTALL_STAGING_CMDS
>   	mkdir -p $(STAGING_DIR)/usr/lib $(STAGING_DIR)/usr/include
>   
> -	cp -rf $(@D)/$(SUNXI_MALI_UTGARD_REV)/$(SUNXI_MALI_UTGARD_ARCH)/fbdev/*.so* \
> +	cp -rf $(@D)/$(SUNXI_MALI_UTGARD_REV)/$(SUNXI_MALI_UTGARD_ARCH)/$(BR2_PACKAGE_SUNXI_MALI_UTGARD_PLATFORM)/*.so* \
>   		$(STAGING_DIR)/usr/lib/
> -	cp -rf $(@D)/include/fbdev/* $(STAGING_DIR)/usr/include/
> +	cp -rf $(@D)/include/$(BR2_PACKAGE_SUNXI_MALI_UTGARD_PLATFORM)/* $(STAGING_DIR)/usr/include/
>   
>   	$(INSTALL) -D -m 0644 package/sunxi-mali-utgard/egl.pc \
>   		$(STAGING_DIR)/usr/lib/pkgconfig/egl.pc
> @@ -34,9 +34,21 @@ define SUNXI_MALI_UTGARD_INSTALL_STAGING_CMDS
>   		$(STAGING_DIR)/usr/lib/pkgconfig/glesv2.pc
>   endef
>   
> +ifeq ($(BR2_PACKAGE_SUNXI_MALI_UTGARD_WAYLAND),y)
> +define SUNXI_MALI_UTGARD_INSTALL_FIXUP_STAGING_PC_FILES
> +	sed -e '/^Cflags:/s/$$/ -DWL_EGL_PLATFORM/' \
> +		-e '/^Requires:/s/$$/ wayland-client wayland-server/' \
> +		-i $(STAGING_DIR)/usr/lib/pkgconfig/egl.pc
> +	sed -e '/^Requires:/s/$$/ wayland-client wayland-server/' \
> +		-i $(STAGING_DIR)/usr/lib/pkgconfig/glesv2.pc
> +endef
> +SUNXI_MALI_UTGARD_POST_INSTALL_TARGET_HOOKS += SUNXI_MALI_UTGARD_INSTALL_FIXUP_STAGING_PC_FILES
> +SUNXI_MALI_UTGARD_DEPENDENCIES += wayland
> +endif
> +
>   define SUNXI_MALI_UTGARD_INSTALL_TARGET_CMDS
>   	mkdir -p $(TARGET_DIR)/usr/lib
> -	cp -rf $(@D)/$(SUNXI_MALI_UTGARD_REV)/$(SUNXI_MALI_UTGARD_ARCH)/fbdev/*.so* \
> +	cp -rf $(@D)/$(SUNXI_MALI_UTGARD_REV)/$(SUNXI_MALI_UTGARD_ARCH)/$(BR2_PACKAGE_SUNXI_MALI_UTGARD_PLATFORM)/*.so* \
>   		$(TARGET_DIR)/usr/lib/
>   endef
>   

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
