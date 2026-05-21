Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1662CD4F3D
	for <buildroot@archiver.kernel.org>; Thu, 21 May 2026 18:45:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5960D84AA0;
	Thu, 21 May 2026 18:45:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DwSnpZIjT1fQ; Thu, 21 May 2026 18:45:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 68A0B84A9D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779389154;
	bh=L4w7O8jQfz3Ej2ghmPxykl+ufYWSJCP2ZaJSskA9i+w=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=g4Adw3z1aVacM2MJCZqKGw5hXjLqbQdjPiXRDDSUi4AnFxqACf+eaFhW4fwWx69Lm
	 xs4ZNMqPwv4m+HzfSee2HFIeMTJTsjtDdaLe+WbsABe9gUcSCGsAKNC818WvlfiojF
	 3aOxrW/ilsYDTiYXRv2nPlV0ykSbPhMW3rSfw6E8sJHOQlyURTObnBEvZVVGTSBjgF
	 7/K++30YONqCRTnZ2QkxvzTtHeHIL77Cr37KWNt4EvbanqxqHpkKFwLU7INDkvAmVG
	 c8FZxDjqYG1Sven1pNc5P28ooGIBv9GFi2cNddJjqURDhuglfHMdS9kUaef5ePt5st
	 bt6cciSYdJSNg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 68A0B84A9D;
	Thu, 21 May 2026 18:45:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 038CF3B9
 for <buildroot@buildroot.org>; Thu, 21 May 2026 18:45:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D6A1384A9D
 for <buildroot@buildroot.org>; Thu, 21 May 2026 18:45:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NrhshGDScly0 for <buildroot@buildroot.org>;
 Thu, 21 May 2026 18:45:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B236C84A9B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B236C84A9B
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B236C84A9B
 for <buildroot@buildroot.org>; Thu, 21 May 2026 18:45:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2E946B97C54A; Thu, 21 May 2026 20:45:45 +0200 (CEST)
Message-ID: <acf35b98-a846-429e-9686-6fff29515002@rnout.be>
Date: Thu, 21 May 2026 20:45:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Joseph Kogut <joseph.kogut@gmail.com>, buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Romain Naour <romain.naour@gmail.com>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260515-virglrenderer-v7-0-1f1814b65ccd@gmail.com>
 <20260515-virglrenderer-v7-1-1f1814b65ccd@gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260515-virglrenderer-v7-1-1f1814b65ccd@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1779389147; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=BAhKeg1Pc3Y5rWdNMigQaqFTG/ALAm0gWg+QLDK1/SA=;
 b=Jp/VxGitOXV3o18J6XBgVgTIFifD7JpQgxiHVxHvfaJSIpmZkm0OYeKr6EweGOnuYPpN2d
 xLOd7n8WCvcobQiOU8/EFqmSNN7TxFQrYwnY2vyjtpIu+E2Hkr471jtSm/K//za30MbRM/
 HkQaI5nxHAK3J7v77QLXENowmX7sCzQZki0SVdgtkQsY4EiOASUEl8o09qDV9r4RpKYN9q
 i3+FcvGJceiv0Of2oyWtVOfHf3Ck8PZPjqDpl6IXdIwhNj2RrOg70LXMYjPXvihVNmlcAe
 hPtuvVHOeruTtByX92vqeBQkVi/ZS3pKL6F7jkw1ce91ZSvbeNb2pX3sQUoQ2g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=Jp/VxGit
Subject: Re: [Buildroot] [PATCH v7 1/8] package/weston: add EGL dependency
 for XWayland
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 16/05/2026 04:03, Joseph Kogut wrote:
> BR2_PACKAGE_WESTON_XWAYLAND currently depends on BR2_PACKAGE_LIBEPOXY,
> which implicitly requires either libGL or libEGL. However, the XWayland
> glamor support uses libepoxy with EGL, so express that dependency

  This sounds like the current situation was actually wrong, because we could 
enable glamor in xwayland when libgl and no libegl is available.

BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV=y
BR2_PACKAGE_MESA3D_OPENGL_GLX=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_XWAYLAND=y
BR2_PACKAGE_LIBEPOXY=y

fails with:

In file included from ../glamor/glamor_priv.h:73,
from ../glamor/glamor_composite_glyphs.c:25:
../glamor/glamor_context.h:27:10: fatal error: epoxy/egl.h: No such file or 
directory
27 | #include <epoxy/egl.h>
    |          ^~~~~~~~~~~~~

  Therefore I updated the commit message and applied to master, thanks.

  Regards,
  Arnout

> directly.
> 
> This avoids relying on libepoxy's package-level dependencies to provide
> the EGL backend.
> 
> Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
> ---
>   package/weston/Config.in           | 6 ++++--
>   package/x11r7/xwayland/xwayland.mk | 2 +-
>   2 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/package/weston/Config.in b/package/weston/Config.in
> index 774b75d5fb..6f61c3c561 100644
> --- a/package/weston/Config.in
> +++ b/package/weston/Config.in
> @@ -123,6 +123,7 @@ comment "X11 (nested) compositor needs X.org enabled"
>   
>   config BR2_PACKAGE_WESTON_XWAYLAND
>   	bool "XWayland support"
> +	depends on BR2_PACKAGE_HAS_LIBEGL
>   	depends on BR2_PACKAGE_LIBEPOXY
>   	depends on BR2_PACKAGE_XORG7 # xwayland
>   	depends on BR2_USE_MMU # xwayland
> @@ -136,8 +137,9 @@ config BR2_PACKAGE_WESTON_XWAYLAND
>   	select BR2_PACKAGE_XLIB_LIBXCURSOR
>   	select BR2_PACKAGE_XWAYLAND
>   
> -comment "XWayland support needs libepoxy and X.org enabled"
> -	depends on !BR2_PACKAGE_XORG7 || !BR2_PACKAGE_LIBEPOXY
> +comment "XWayland support needs libepoxy w/ EGL and X.org enabled"
> +	depends on !BR2_PACKAGE_HAS_LIBEGL || !BR2_PACKAGE_XORG7 || \
> +		!BR2_PACKAGE_LIBEPOXY
>   
>   comment "XWayland support needs a toolchain w/ threads, dynamic library"
>   	depends on BR2_USE_MMU
> diff --git a/package/x11r7/xwayland/xwayland.mk b/package/x11r7/xwayland/xwayland.mk
> index 8fa5260f47..5902f85d4f 100644
> --- a/package/x11r7/xwayland/xwayland.mk
> +++ b/package/x11r7/xwayland/xwayland.mk
> @@ -30,7 +30,7 @@ XWAYLAND_CONF_OPTS = \
>   	-Ddtrace=false \
>   	-Ddocs=false
>   
> -ifeq ($(BR2_PACKAGE_LIBEPOXY),y)
> +ifeq ($(BR2_PACKAGE_HAS_LIBEGL)$(BR2_PACKAGE_LIBEPOXY),yy)
>   XWAYLAND_CONF_OPTS += -Dglamor=true
>   XWAYLAND_DEPENDENCIES += libepoxy
>   else
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
