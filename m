Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ABD2C41535
	for <buildroot@archiver.kernel.org>; Fri, 22 Dec 2023 17:02:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BEA1D6F614;
	Fri, 22 Dec 2023 17:02:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BEA1D6F614
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ng8gGW7CDTx1; Fri, 22 Dec 2023 17:02:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C68E96F5F6;
	Fri, 22 Dec 2023 17:02:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C68E96F5F6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7687E1BF47D
 for <buildroot@lists.busybox.net>; Fri, 22 Dec 2023 17:02:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4F7F983F56
 for <buildroot@lists.busybox.net>; Fri, 22 Dec 2023 17:02:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F7F983F56
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ePcZpy9-T_TR for <buildroot@lists.busybox.net>;
 Fri, 22 Dec 2023 17:02:46 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CEC1183F4D
 for <buildroot@buildroot.org>; Fri, 22 Dec 2023 17:02:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CEC1183F4D
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id BA870B0051B;
 Fri, 22 Dec 2023 18:02:40 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 22 Dec 2023 18:02:40 +0100
Date: Fri, 22 Dec 2023 18:02:40 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <ZYXBME0BTWxAc9an@landeda>
References: <20231221153620.237439-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231221153620.237439-1-adam.duskett@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1703264562;
 bh=47YDAyyl9gIUI65E7XTPi1NpyZFf477g8B6nBq2UKRE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HwCiizVEU2kiYDfdCY7eILMrm1NgaUc3xyCMEd5ZdtG0AR26XIJ7UM2clISRNuI62
 MB/lcdcX9UnXbPfq2GFI/jOT1kxG9k0VK7gqz3BucGy3b/nU148LciFuAqEuFMxYQA
 Fcek6dgcTneZoCJixJ8zei65ZHm58a32KaPAYseOag71XFB6e2EEHDJWvJz4b5FRBE
 P841WpnHjruxF9b1HVqYAyvKcpSW6xNpvZskmTGgjL/sXs9d4VnC6TnsPO5Vm/OZPt
 joAr1QhnTiEo4uiC9a7Mb4hFtXGWhW12t9vTEZ6ZN0LkoKBJTbun8bhuDgtM8Toof9
 CmeEObXaLqlhA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=HwCiizVE
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Adam, All,

Thanks for the updated patch. You respun too fast, I did not have time
to further comment after Thomas' review of v3. So there it is.

On 2023-12-21 08:36 -0700, Adam Duskett spake thusly:
> As per backend/drm/meson.build:1-7
> 
> hwdata = dependency('hwdata', required: false, native: true)
> if hwdata.found()
> 	hwdata_dir = hwdata.get_variable(pkgconfig: 'pkgdatadir')
> 	pnp_ids = files(hwdata_dir / 'pnp.ids')
> else
> 	pnp_ids = files('/usr/share/hwdata/pnp.ids')
> endif

First, this code excerpt does not bring much in a commit log; a code
snippet on its own is not a substitute for a proper explanation for why
a change is needed in Buildroot (otherwise we would have all our commit
logs be just snippets of upstream code...)

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

Thanks for the reproducer. :-) However, Thomas was also wondering why
this was never caught in our autobuilders. Do you have an idea why it
was never caught? Since the autobuilders did not help, we have no idea
when this started to occur, so we have no idea whether we need to
backport the fix. Having an explanation why the autobuilder did not
catch the issue will help decide whether this needs to be backported.

Second, hwdata does not provide a library or headers, just data files
that describe the VID/PID mappings to human-readable names; those are
supposed to be used at runtime to do the conversion (e.g. lspci or lsusb
do that).

And as you report a build failure, it means those are used at build
time, which is weird.

So, what does wlroots do?

In fact, the build scans the pnp.ids and generates a C file with a big
switch-case mapping all the PNP ids to their vendor string, and thus
hwdata is not needed on the target, but is needed at build time.

So, it means we end up with the hwdata on the target for nothing. The
default config will install about 2.1MiB, which is arguably not too much
if one builds a system with wlroots (the stack is already big). Still,
this is noticeable.

Of course, this is not your fault! :-) But it would have been good to
provide this info in the commit log, even as a terse sentence, to avoid
the maintainers trying to understand this (i.e. try to understand the
reason why the data files are needed at build time rather than are
runtime).

Third and finally, hwdata is not mandatory in wlroots; it is only
required for the DRM backend, so it should not be unconditional. Except
that in Buildroot, we do enable the DRM backend unconditionally, so
hwdata indeed becomes an unconditional dependency.

So yes, it does indeed take some time to come up with the underlying
reasons for why a change is needed, and to digest them into a commit
log. But if submitters don't do that work on their end, it means the
maintainers have do it, and that means even more time is spent reviewing
and replying to each patch, which makes the patch queue grow, and
ultimately makes everyone grumpy, submitters first.

Regards,
Yann E. MORIN.

> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
> v3 -> v4: Add a more comprehensive commit with a minimal defconfig.
> 
>  package/wlroots/Config.in  | 2 ++
>  package/wlroots/wlroots.mk | 1 +
>  2 files changed, 3 insertions(+)
> 
> diff --git a/package/wlroots/Config.in b/package/wlroots/Config.in
> index fb23e9069c..7622a3033b 100644
> --- a/package/wlroots/Config.in
> +++ b/package/wlroots/Config.in
> @@ -16,6 +16,8 @@ config BR2_PACKAGE_WLROOTS
>  	depends on BR2_PACKAGE_HAS_LIBEGL
>  	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND
>  	depends on BR2_PACKAGE_HAS_LIBGLES
> +	select BR2_PACKAGE_HWDATA
> +	select BR2_PACKAGE_HWDATA_PNP_IDS
>  	select BR2_PACKAGE_LIBDRM
>  	select BR2_PACKAGE_LIBINPUT
>  	select BR2_PACKAGE_LIBXKBCOMMON
> diff --git a/package/wlroots/wlroots.mk b/package/wlroots/wlroots.mk
> index b478e57abb..bb5c8f497d 100644
> --- a/package/wlroots/wlroots.mk
> +++ b/package/wlroots/wlroots.mk
> @@ -13,6 +13,7 @@ WLROOTS_INSTALL_STAGING = YES
>  WLROOTS_DEPENDENCIES = \
>  	host-pkgconf \
>  	host-wayland \
> +	hwdata \
>  	libinput \
>  	libxkbcommon \
>  	libegl \
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
