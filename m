Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B54CBC433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 18:09:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 48900819ED;
	Sun,  9 Jan 2022 18:09:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2cSXtScRSVMT; Sun,  9 Jan 2022 18:09:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8039681934;
	Sun,  9 Jan 2022 18:09:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5F6E11BF488
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 18:09:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4D8E781934
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 18:09:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aqF3TWQ4dvP1 for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 18:09:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4E88D81871
 for <buildroot@busybox.net>; Sun,  9 Jan 2022 18:09:11 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id o3so22521914wrh.10
 for <buildroot@busybox.net>; Sun, 09 Jan 2022 10:09:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=5YUnBwisyXjqnchFtMBSEjDuW8YSXXKP6VRcU6rZpuw=;
 b=cVVPeyB9VNdiIzW9UcviAkXV4T+D8KguUFh12tv25H+yz0+e5BmG1ywHh7YzrqLbet
 b7Nkr1upelLdMfJY2i6QXV0+FkimFIMVXhZ6NSPYFtZvQYox17wMo2h6Fhq/E9wa02SX
 RBlehQAhIuXVeGcjEQaM/fT4sFI4d2XrVw9n5mg/cdnBFJMGUOZkxv84564iXJ9AyDEW
 PkBjFn0Ya/8TVKATrR5HzshWwmL1n4nsXyXVOFVNnLCW3+Yvv2p5A0h59SK0ssHX+qGO
 Fx+fovUCCLLgi7MMqKSFNFX0rbcoKijULL5wznd0iaets+oIU/fA7iE9EBIEnsJj6+rB
 paXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=5YUnBwisyXjqnchFtMBSEjDuW8YSXXKP6VRcU6rZpuw=;
 b=X/6loHl8iazF7gJ2+YsxF245a3LNARkrws+Eg7H8sjUTad1lWeI0v79VNO+EPNwDGO
 iLbKqPe1uPkPzJ6HXPFAtZfNnbCCk8EBtpTSKyvt/62mQvVPppiaoq+fqAYEVNB9gM1g
 ZrC3ZNp547YR7uydIwyoZl+Lht5Bulq5ILouiQOgWT+3UCJuXJ6T2B++xp83//fjvFYb
 tnJ1+vQ6HZNR6rgdR6v62orMbXNlOvWdUuPewfXQqRjo0QfaLMWzV+GofiiP6IbP3jj1
 iYPzHMJJt3jC+bNd6R8XasZ0ir1Zj9AbfmYem5XD3iFr4yc8UdAXrBbx+k8v2oD/jhN4
 Jcrw==
X-Gm-Message-State: AOAM531lsF1oawiNH6MsJoWcWpDWh+sqJOPA5uHzjtrJp3f3wnTyYirr
 a7eNPfQkLc5i1Ui7E2KkwI3ndA==
X-Google-Smtp-Source: ABdhPJyzVswMofad6AYOmGZtbmUlKqG42PRgA/XoFazAMPsH03sNk5Py0pQLPpLxyML1DZ/p/41GvQ==
X-Received: by 2002:a5d:4147:: with SMTP id c7mr3663558wrq.341.1641751749381; 
 Sun, 09 Jan 2022 10:09:09 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id b14sm4655060wrg.15.2022.01.09.10.09.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Jan 2022 10:09:09 -0800 (PST)
Message-ID: <f11bde42-92c5-2744-cb45-8e7c1a3b5f8d@mind.be>
Date: Sun, 9 Jan 2022 19:09:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Peter Seiderer <ps.report@gmx.net>, buildroot@busybox.net
References: <20210110222833.26301-1-ps.report@gmx.net>
 <20210110222833.26301-3-ps.report@gmx.net>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210110222833.26301-3-ps.report@gmx.net>
Subject: Re: [Buildroot] [RFC v2 02/12] package/mesa3d: fix vulkan/intel
 dependencies
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Romain Naour <romain.naour@gmail.com>, Julien Corjon <corjon.j@ecagroup.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Peter,

  I'm finally reviewing this series. Since it's RFC, I'm going to mark it as 
changes requested right away.

On 10/01/2021 23:28, Peter Seiderer wrote:
> - enable X11/GLX free build
> 
> - remove xorgproto dependency is already given via BR2_PACKAGE_MESA3D_OPENGL_GLX/BR2_PACKAGE_MESA3D_NEEDS_X11
> 
> - libxshmfence only needed in case BR2_PACKAGE_MESA3D_OPENGL_GLX is enabled
> 
> - the correct dependency for BR2_PACKAGE_XLIB_LIBXSHMFENCE would
>    be 'depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_MESA3D_OPENGL_GLX',
>    but this results in:
> 
>    package/mesa3d/Config.in:81:error: recursive dependency detected!
>    package/mesa3d/Config.in:81:    symbol BR2_PACKAGE_MESA3D_DRIVER is selected by BR2_PACKAGE_MESA3D_VULKAN_DRIVER
>    package/mesa3d/Config.in:77:    symbol BR2_PACKAGE_MESA3D_VULKAN_DRIVER is selected by BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL
>    package/mesa3d/Config.in:406:   symbol BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL depends on BR2_PACKAGE_MESA3D_OPENGL_GLX
>    package/mesa3d/Config.in:461:   symbol BR2_PACKAGE_MESA3D_OPENGL_GLX depends on BR2_PACKAGE_MESA3D_DRIVER
>    For a resolution refer to Documentation/kbuild/kconfig-language.txt
>    subsection "Kconfig recursive dependency limitations"
> 
>    so use unconditional 'depends on BR2_TOOLCHAIN_HAS_SYNC_4' instead
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Changes v1 -> v2:
>    - new patch
> ---
>   package/mesa3d/Config.in | 10 ++++++----
>   package/mesa3d/mesa3d.mk |  2 ++
>   2 files changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
> index 347b1a2726..d9c27f8b5c 100644
> --- a/package/mesa3d/Config.in
> +++ b/package/mesa3d/Config.in
> @@ -398,15 +398,17 @@ comment "Vulkan drivers"
>   config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL
>   	bool "Vulkan Intel driver"
>   	depends on BR2_i386 || BR2_x86_64
> +	# depends on BR2_TOOLCHAIN_HAS_SYNC_4 because of libxshmfence only
> +	# in case GLX is enabled but the following results in 'recursive
> +	# dependency detected!', so simple depend always on BR2_TOOLCHAIN_HAS_SYNC_4
> +	# depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_MESA3D_OPENGL_GLX # libxshmfence in case GLX is enabled
>   	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libxshmfence
>   	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 # memfd.h
>   	depends on BR2_TOOLCHAIN_USES_GLIBC # ifunc, static_assert
> -	depends on BR2_PACKAGE_XORG7 # xorgproto
>   	select BR2_PACKAGE_EXPAT
> -	select BR2_PACKAGE_MESA3D_DRI3
> +	select BR2_PACKAGE_MESA3D_DRI3 if BR2_PACKAGE_MESA3D_OPENGL_GLX

  In other drivers we enable DRI3 uncondtionally when X11 is enabled, i.e. even 
if GLX is not enabled:

	select BR2_PACKAGE_MESA3D_DRI3 if BR2_PACKAGE_XORG7

  I am not entirely sure if DRI3 makes any sense at all without GLX, but why not 
I'd say. Anyway, by working that way, you can resolve the circular dependency, 
because it simply becomes (as you see in many other drivers)

	depends on (BR2_TOOLCHAIN_HAS_SYNC_4 && !BR2_RISCV_32) || !BR2_PACKAGE_XORG7 # 
libxshmfence
	select BR2_PACKAGE_MESA3D_DRI3 if BR2_PACKAGE_XORG7

>   	select BR2_PACKAGE_MESA3D_VULKAN_DRIVER
> -	select BR2_PACKAGE_XORGPROTO
> -	select BR2_PACKAGE_XLIB_LIBXSHMFENCE
> +	select BR2_PACKAGE_XLIB_LIBXSHMFENCE if BR2_PACKAGE_MESA3D_OPENGL_GLX
>   	help
>   	  Vulkan driver for Intel hardware from Ivy Bridge onward.
>   
> diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
> index ea6265d723..967b86810f 100644
> --- a/package/mesa3d/mesa3d.mk
> +++ b/package/mesa3d/mesa3d.mk
> @@ -146,7 +146,9 @@ ifeq ($(BR2_PACKAGE_MESA3D_VULKAN_DRIVER),)
>   MESA3D_CONF_OPTS += \
>   	-Dvulkan-drivers=
>   else
> +ifeq ($(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL)$(BR2_PACKAGE_MESA3D_OPENGL_GLX),yy)
>   MESA3D_DEPENDENCIES += xlib_libxshmfence

  That also means that this can simply be removed, since it's already done by DRI3.

  Actually, I don't need feedback on those changes, so applied to master, thanks!

  Regards,
  Arnout

> +endif
>   MESA3D_CONF_OPTS += \
>   	-Dvulkan-drivers=$(subst $(space),$(comma),$(MESA3D_VULKAN_DRIVERS-y))
>   endif
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
