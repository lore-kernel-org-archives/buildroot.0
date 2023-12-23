Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2CD0C3DA6E
	for <buildroot@archiver.kernel.org>; Sat, 23 Dec 2023 14:51:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 60EB760B13;
	Sat, 23 Dec 2023 14:51:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 60EB760B13
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3DqwXIj76vX6; Sat, 23 Dec 2023 14:51:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B126460D68;
	Sat, 23 Dec 2023 14:51:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B126460D68
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DFC581BF616
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 14:51:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B732840168
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 14:51:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B732840168
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5M8dU-PWW4_q for <buildroot@lists.busybox.net>;
 Sat, 23 Dec 2023 14:51:26 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5753C40131
 for <buildroot@buildroot.org>; Sat, 23 Dec 2023 14:51:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5753C40131
Received: by mail.gandi.net (Postfix) with ESMTPSA id 851D3FF805;
 Sat, 23 Dec 2023 14:51:24 +0000 (UTC)
Date: Sat, 23 Dec 2023 15:51:23 +0100
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <20231223155123.018a56a2@windsurf>
In-Reply-To: <20231221153620.237439-1-adam.duskett@amarulasolutions.com>
References: <20231221153620.237439-1-adam.duskett@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703343084;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vQCZn/58lcCe/9IHDu8iQy9ea1LS+zUO1FsJFQOW0JM=;
 b=cclDbrx8qWCFYtc8vRFQBK09ElL38GSwjkepe+isOSNy8dvNWzPuV+093ekz5bbasbAqSu
 WPzjavQd7q6vsyYctGb0WS1pFj13V9W8JwU8zHH4izUx3BZe826V965e+Pz8mCJVj75pEw
 Is8nbPU7veBGRqIaFcN0bcNV/oT88HG9vIBvE8rxEzmqD0X4rPBARl/if/BokXRuVFlDTv
 XjVrvEMbeM0ldsXcQvKL5EswlS13KRH/jw1kIavBzxdqKQrDIpmEGwa6aV5tquR5WqybG4
 0yL3DDkgzJy0cL96yHUzI5vfOk2KrNiz9/pB7BezUSUmDv2Mbs4q/8sUyK++ew==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cclDbrx8
Subject: Re: [Buildroot] [PATCH v4 01/10] package/wlroots: add hwdata and
 hwdata_pnp_ids as a dependency
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 21 Dec 2023 08:36:10 -0700
Adam Duskett <adam.duskett@amarulasolutions.com> wrote:

> As per backend/drm/meson.build:1-7
> 
> hwdata = dependency('hwdata', required: false, native: true)
> if hwdata.found()
> 	hwdata_dir = hwdata.get_variable(pkgconfig: 'pkgdatadir')
> 	pnp_ids = files(hwdata_dir / 'pnp.ids')
> else
> 	pnp_ids = files('/usr/share/hwdata/pnp.ids')
> endif
> 
> On a build in a fresh debian container with a minimal config
> 
> BR2_x86_64=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
> BR2_PACKAGE_MESA3D=y
> BR2_PACKAGE_MESA3D_OSMESA_GALLIUM=y
> BR2_PACKAGE_MESA3D_OPENGL_EGL=y
> BR2_PACKAGE_MESA3D_OPENGL_ES=y
> BR2_PACKAGE_WLROOTS=y
> 
> The build fails as neither hwdata nor the pnp.ids are found.
> 
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
> v3 -> v4: Add a more comprehensive commit with a minimal defconfig.

Applied to master with a significantly extended commit message.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
