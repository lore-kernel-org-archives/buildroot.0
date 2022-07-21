Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB4A2C43334
	for <buildroot@archiver.kernel.org>; Thu, 21 Jul 2022 16:16:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7928B60E33;
	Thu, 21 Jul 2022 16:16:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7928B60E33
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YS4U_mAFye2j; Thu, 21 Jul 2022 16:16:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7639760D65;
	Thu, 21 Jul 2022 16:16:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7639760D65
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 09FC91BF2A5
 for <buildroot@lists.busybox.net>; Thu, 21 Jul 2022 16:16:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BFD33847AB
 for <buildroot@lists.busybox.net>; Thu, 21 Jul 2022 16:16:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BFD33847AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ye4mCGGx4reG for <buildroot@lists.busybox.net>;
 Thu, 21 Jul 2022 16:16:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21C7A847A1
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 21C7A847A1
 for <buildroot@buildroot.org>; Thu, 21 Jul 2022 16:16:53 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C797424000E;
 Thu, 21 Jul 2022 16:16:49 +0000 (UTC)
Date: Thu, 21 Jul 2022 18:16:48 +0200
To: Alexandru Ardelean <ardeleanalex@gmail.com>
Message-ID: <20220721181648.7eedcb41@windsurf>
In-Reply-To: <20220721144939.1265027-1-ardeleanalex@gmail.com>
References: <20220721144939.1265027-1-ardeleanalex@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658420211;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uzTlG0L4h58Xp2QdBy332zL8HrdzK0FhpqkqnHvgfNU=;
 b=n1/4Sl+DAiTMVYyIBqCadtoiKi1JIylAIpATjEcG4gLcsqucAFSDgIOB/pOOi4FsaeSG0h
 Hx2DSTwkxVo91u/j3U7edZmum4GD3Dnr1XHO71KwXBM/G1apFFjifKMNoo0PxGpBeTFOk/
 FkTa8VfzSJ6TRHFF4TO1nVQkXbkj7UcYxhY6zYfY5qwKk511edPv9vYdjPvf9XaMXn7Cit
 GmOLXYB1QQl2F1/20bWC4FgPz6J0KeOcYHUJ3DyakPR3od05lZD/JXjf3qZj2vZIy9sxfo
 atf+EW5q78Re4OY3rSiFxzhThUmIj9G3u1F1bA8fiR74h0pEiFrNIFoCVcEJ4g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=n1/4Sl+D
Subject: Re: [Buildroot] [PATCH] package/cog: add libgbm as dependency when
 building with DRM support
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Adrian Perez de Castro <aperez@igalia.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Alexandru,

On Thu, 21 Jul 2022 17:49:39 +0300
Alexandru Ardelean <ardeleanalex@gmail.com> wrote:

> When building with DRM support, it can happen that the libgbm library
> is not yet built by the provider of libgbm (specified by
> BR2_PACKAGE_PROVIDES_LIBGBM).
> 
> The docs in cog `docs/platform-drm.md` specify this dep-list:
> - **WPEBackend-fdo**:
> - **Wayland**:
> - **libdrm**:
> - **libgbm**:
> - **libinput**:
> - **libudev**:
> 
> libgbm needs to be added, whereas `libudev` is provided by systemd (in my
> case).

Then udev should also be in the dependencies when
BR2_PACKAGE_COG_PLATFORM_DRM=y.

>  ifeq ($(BR2_PACKAGE_COG_PLATFORM_DRM),y)
>  COG_CONF_OPTS += -DCOG_PLATFORM_DRM=ON
> -COG_DEPENDENCIES += libdrm libinput
> +COG_DEPENDENCIES += libdrm libinput libgbm

That is correct, but not complete. The DRM platform code in Cog also
uses EGL, so we would also need libegl in the list of dependencies. In
pratice, libgbm and libegl are most likely implemented by the same
package, but for the sake of correctness, it would be better to have
both.

Another thing that is wrong is:

	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL # gbm

in the Config.in file. This used to be the only way to detect the
availability of gbm, but since quite some time now, we have the libgbm
virtual package.

So this should be instead:

	depends on BR2_PACKAGE_HAS_LIBGBM

and I'm pretty sure Cog uses some "advanced" features of libgbm, so
most likely at least depends on BR2_PACKAGE_LIBGBM_HAS_FEATURE_DMA_BUF
is needed, and probably also depends on
BR2_PACKAGE_LIBGBM_HAS_FEATURE_FORMAT_MODIFIER_PLANE_COUNT is needed.
See package/opengl/libgbm/Config.in for details.

Of course, this aspect should be in a different patch: your change to
add "libgbm" in the DEPENDENCIES variable is really a fix, while my
proposed change in the Config.in file is really an improvement, that
will allow using Cog on libgbm-capable platforms that don't use mesa3d
as their OpenGL/libgbm implementation.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
