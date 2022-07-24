Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A8F6C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 13:26:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01B42424F6;
	Sun, 24 Jul 2022 13:26:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 01B42424F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fnsVwRgyPrLJ; Sun, 24 Jul 2022 13:26:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED45B424F3;
	Sun, 24 Jul 2022 13:26:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED45B424F3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 23EEC1BF488
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 13:26:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F2C288497A
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 13:26:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2C288497A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gGiZEKWa0fq3 for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 13:26:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CDC5E84971
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CDC5E84971
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 13:26:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPA id 587541814BA
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 15:26:20 +0200 (CEST)
To: buildroot@buildroot.org
User-Agent: SOGoMail 5.7.0
MIME-Version: 1.0
Date: Sun, 24 Jul 2022 15:26:20 +0200
Message-ID: <4e-62dd4880-5-46422880@211195407>
X-Last-TLS-Session-Version: None
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1658669180; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding; bh=+W79bpaimMI5uV4yuiOfVYGqJA5t8BmIk/xP9QmOhEE=;
 b=aFtLeq1KEesuQ7aBuCs92Sf6SpQ9+o4uj+LiIHkPdRqGPy3bIfogbHrdKq7Taq7tJolTLz
 SKeteN1joBiUzHcHSvWQnfhu92QUuD7GRJCvitDI1myb/JN/uVRyG2kpeUH/P1iRLsr1Zs
 1fx+ilvCOwjSrztWrPffQrtZ9lWbkP8=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=heine.tech header.i=@heine.tech
 header.a=rsa-sha256 header.s=dkim header.b=aFtLeq1K
Subject: Re: [Buildroot] 
 =?utf-8?q?=5BPATCH_v2=5D_package/cog=3A_add_libgbm_a?=
 =?utf-8?q?s_dependency_when_building_with_DRM_support?=
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

On Saturday, July 23, 2022 10:48 CEST, Arnout Vandecappelle <arnout@mind.be> wrote:

> 
> 
> On 22/07/2022 09:01, Alexandru Ardelean wrote:
> > When building with the DRM support, it can happen that the libgbm library
> > is not yet built by the provider of this lib (specified by
> > BR2_PACKAGE_PROVIDES_LIBGBM).
> 
>   I've applied this one to master already, however there are two comments on v1 
> that remain unaddressed.
> 
> > 
> > The docs in cog `docs/platform-drm.md` specify this dep-list:
> > - **WPEBackend-fdo**:
> > - **Wayland**:
> > - **libdrm**:
> > - **libgbm**:
> > - **libinput**:
> > - **libudev**:
> 
>   This would imply that a dependency on udev is needed as well (both in the 
> Config.in and the .mk). It is actually implied by libinput, so we won't get 
> build failures, but it's better to have explicit dependencies.
> 
> > 
> > libgbm needs to be added.
> > Adding libegl as well.
> > 
> > Updated package/cog/Config.in to define the dependencies (for DRM)
> > according to libegl & libgbm.
> > 
> > Signed-off-by: Alexandru Ardelean <ardeleanalex@gmail.com>
> > ---
> >   package/cog/Config.in | 9 ++++++---
> >   package/cog/cog.mk    | 2 +-
> >   2 files changed, 7 insertions(+), 4 deletions(-)
> > 
> > diff --git a/package/cog/Config.in b/package/cog/Config.in
> > index d4238750f9..484eb85c70 100644
> > --- a/package/cog/Config.in
> > +++ b/package/cog/Config.in
> > @@ -39,7 +39,8 @@ config BR2_PACKAGE_COG_PLATFORM_FDO
> >   config BR2_PACKAGE_COG_PLATFORM_DRM
> >   	bool "DRM backend"
> >   	depends on BR2_PACKAGE_HAS_UDEV # libinput
> > -	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL # gbm
> > +	depends on BR2_PACKAGE_HAS_LIBEGL
> > +	depends on BR2_PACKAGE_HAS_LIBGBM
> 
>   It apparently needs the 
> BR2_PACKAGE_LIBGBM_HAS_FEATURE_FORMAT_MODIFIER_PLANE_COUNT feature. You can test 
> that by trying a build with rockchip-mali or ti-sgx-um as provider, since those 
> packages don't have that feature.
> 

I'm currently maintaining an external package for the newest ti-sgx-um version which provides
(i think) a newer/more complete version of libegl/libgbm. For this I currently have to patch
the cog package but the output is working fine with the drm backend.
So I would be highly interested in a patch like this.

Is there a way to find out which features a certain libegl/libgbm provides? Maybe I can then pick-up
the work on bumping the ti-sgx-um/km packages again to bring them to a more recent version.

Regards,
Michael

> 
>   Regards,
>   Arnout
> 
> >   	select BR2_PACKAGE_LIBDRM
> >   	select BR2_PACKAGE_LIBINPUT
> >   	help
> > @@ -52,7 +53,9 @@ config BR2_PACKAGE_COG_USE_SYSTEM_DBUS
> >   	help
> >   	  Expose remote control interface on system bus
> >   
> > -comment "DRM platform needs mesa3d w/ EGL driver and GBM"
> > -	depends on !BR2_PACKAGE_MESA3D_OPENGL_EGL
> > +comment "DRM platform needs EGL and GBM"
> > +	depends on \
> > +		!BR2_PACKAGE_HAS_LIBEGL || \
> > +		!BR2_PACKAGE_HAS_LIBGBM
> >   
> >   endif
> > diff --git a/package/cog/cog.mk b/package/cog/cog.mk
> > index f2ca0af93d..da660eb7c1 100644
> > --- a/package/cog/cog.mk
> > +++ b/package/cog/cog.mk
> > @@ -28,7 +28,7 @@ endif
> >   
> >   ifeq ($(BR2_PACKAGE_COG_PLATFORM_DRM),y)
> >   COG_CONF_OPTS += -DCOG_PLATFORM_DRM=ON
> > -COG_DEPENDENCIES += libdrm libinput
> > +COG_DEPENDENCIES += libdrm libinput libgbm libegl
> >   else
> >   COG_CONF_OPTS += -DCOG_PLATFORM_DRM=OFF
> >   endif
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
