Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CDE8CFD376
	for <buildroot@archiver.kernel.org>; Sun, 30 Nov 2025 17:40:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F0948101A;
	Sun, 30 Nov 2025 17:40:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RVjTjzzYfJry; Sun, 30 Nov 2025 17:40:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 46A2480FAC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 46A2480FAC;
	Sun, 30 Nov 2025 17:40:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8BEC8219
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 17:40:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 89BE5409AE
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 17:40:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AyK4iMuj-gEY for <buildroot@buildroot.org>;
 Sun, 30 Nov 2025 17:40:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 820CB409AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 820CB409AC
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 820CB409AC
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 17:40:12 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 959777803A2;
 Sun, 30 Nov 2025 18:40:07 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 30 Nov 2025 18:40:07 +0100
MIME-Version: 1.0
Date: Sun, 30 Nov 2025 18:40:07 +0100
To: Raphael Gallais-Pou <rgallaispou@gmail.com>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20251022-piglit-v1-1-9c1a52af5650@gmail.com>
References: <20251022-piglit-v1-1-9c1a52af5650@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <c6a863415534e1ad6ad3f2cc37fdeea5@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1764524409;
 bh=vvowSQGlL7c7QZB2rsVPPZ4ziFds5v8H2fApmAmsZ1I=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ixa3erZMvHONXqJfIKn1WF+cdpRRa0xbjLFHqK3zGGYiTLdnFA34ClY9UuWbk1Sfe
 kb52nXHRdvz4J0/qt8AbBM0iExkl4vqiqhRz/MAKNfG4OTRmsgVvcsPzA2+xVxZFWF
 m50G9xWa35c2Vsou06jp7KEwv+u7unmqwRSP3PyztCvPi69fvUMBQBZp4Psy2KHJtq
 fgrqu8GCLEPgfJIyHuK6c5gWEPtwXH8BHV18dBDsT/BOPYWKBVtJXS15D4NGwe9AzM
 rOA09nzH0Ljz1nugIjE4XQ4ImUjX3IIjyBD3emnhk6qvQVU7BNGgjT7E1ZMKFFWTeC
 Ll6fn/AhwApCQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ixa3erZM
Subject: Re: [Buildroot] [PATCH] package/piglit: bump to
 a70c33045c59310f972dbbdb33f322eb209971bc
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Raphael,

Thanks for the patch.

On 22/10/2025 11:38, Raphael Gallais-Pou wrote:
> New dependency since commit 2519c330fba5 ("make: introduce option for
> building vulkan tests") [1].
> 
> Add vulkan-loader new dependency and bump version to commit
> a70c33045c59310f972dbbdb33f322eb209971bc.

According to:
https://gitlab.freedesktop.org/mesa/piglit/-/commit/2519c330fba55ce6efd0dbee07aa67c703124d4f

The vulkan tests are enabled by default on Linux, but could
be disabled. It would be preferable to keep this vulkan
dependency optional.

Also, piglit Vulkan tests seems to also need glslangValidator.

So we could probably keep the vulkan-loader dependency optional,
with something like:

ifeq ($(BR2_PACKAGE_VULKAN_LOADER),y)
PIGLIT_DEPENDENCIES += host-python-glslang vulkan-loader
PIGLIT_CONF_OPTS += -DPIGLIT_BUILD_VK_TESTS=ON
else
PIGLIT_CONF_OPTS += -DPIGLIT_BUILD_VK_TESTS=OFF
endif

I'm not sure if piglit needs python-glslang on target.
It is not in Buildroot as a target package, at the moment.
Another option could be to always disable vulkan tests with:
-DPIGLIT_BUILD_VK_TESTS=OFF

> 
> [1] 
> https://gitlab.freedesktop.org/mesa/piglit/-/commit/eec9ea557fe813b963e8aa77a95c4d2e6e432033
> 
> Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
> ---
>  package/piglit/Config.in   | 1 +
>  package/piglit/piglit.hash | 2 +-
>  package/piglit/piglit.mk   | 3 ++-
>  3 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/package/piglit/Config.in b/package/piglit/Config.in
> index 48b7641909b5..3b92443fc56f 100644
> --- a/package/piglit/Config.in
> +++ b/package/piglit/Config.in
> @@ -6,6 +6,7 @@ config BR2_PACKAGE_PIGLIT
>  		BR2_PACKAGE_WAFFLE_SUPPORTS_WAYLAND || \
>  		BR2_PACKAGE_WAFFLE_SUPPORTS_X11_EGL || \
>  		BR2_PACKAGE_WAFFLE_SUPPORTS_GBM
> +	depends on BR2_PACKAGE_VULKAN_LOADER

This dependency could be removed.

>  	depends on BR2_INSTALL_LIBSTDCPP # mesa3d-demos, python-numpy
>  	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # 
> python-numpy
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9 # python-numpy
> diff --git a/package/piglit/piglit.hash b/package/piglit/piglit.hash
> index 2c0b6aa52a46..20c79a4546af 100644
> --- a/package/piglit/piglit.hash
> +++ b/package/piglit/piglit.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated
> -sha256  
> ba4d1839038905f3833e9ab23b385913e08d552533dd222cc203c79c10e09918  
> piglit-2affee53f3ad7a96f5b397a2b6d6408af8a374b0-git4.tar.gz
> +sha256  
> e968966faee7d97305c0a526d339102ddfc8435a2c9007c90444cb3303629f6a  
> piglit-a70c33045c59310f972dbbdb33f322eb209971bc-git4.tar.gz
>  sha256  
> dcc398730859aee7cc1d6aa57f526f8d181b47bb3a49830e85b5723d5bc2c3bc  
> COPYING
>  sha256  
> 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  
> licences/GPL-2
>  sha256  
> 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  
> licences/GPL-3
> diff --git a/package/piglit/piglit.mk b/package/piglit/piglit.mk
> index 4d17405d10ea..76a759cfca40 100644
> --- a/package/piglit/piglit.mk
> +++ b/package/piglit/piglit.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -PIGLIT_VERSION = 2affee53f3ad7a96f5b397a2b6d6408af8a374b0
> +PIGLIT_VERSION = a70c33045c59310f972dbbdb33f322eb209971bc
>  PIGLIT_SITE = https://gitlab.freedesktop.org/mesa/piglit.git
>  PIGLIT_SITE_METHOD = git
>  PIGLIT_LICENSE = MIT (code), \
> @@ -23,6 +23,7 @@ PIGLIT_DEPENDENCIES = host-pkgconf \
>  	python-mako \
>  	python-numpy \
>  	python-six \
> +	vulkan-loader \

This hard dependency could be removed.

>  	waffle \
>  	zlib
> 
> 
> ---
> base-commit: c55714aeb9e9bb32b0674b93c4a4cd4b6fa4eb52
> change-id: 20251021-piglit-ebd7afed9982
> 
> Best regards,
> --
> Raphael Gallais-Pou <rgallaispou@gmail.com>

While testing, I also seen that piglit enable X11 by default
on Linux. Piglit introduced PIGLIT_USE_X11 in:
https://gitlab.freedesktop.org/mesa/piglit/-/commit/d958b70d1fc5c2ee039363d862b14ca498a50e82

So it might be needed to add -DPIGLIT_USE_X11=ON/OFF in
the "ifeq ($(BR2_PACKAGE_XORG7),y)" block.

Could you have a look to make the vulkan-loader dependency optional, 
please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
