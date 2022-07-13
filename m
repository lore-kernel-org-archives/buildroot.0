Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1639C43334
	for <buildroot@archiver.kernel.org>; Wed, 13 Jul 2022 09:02:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C66A60899;
	Wed, 13 Jul 2022 09:02:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C66A60899
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0O_-1y2YYTUy; Wed, 13 Jul 2022 09:02:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2379560A7B;
	Wed, 13 Jul 2022 09:02:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2379560A7B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EE6E11BF392
 for <buildroot@lists.busybox.net>; Wed, 13 Jul 2022 09:02:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D6161423BF
 for <buildroot@lists.busybox.net>; Wed, 13 Jul 2022 09:02:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6161423BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q0uB_I12M_gQ for <buildroot@lists.busybox.net>;
 Wed, 13 Jul 2022 09:02:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE678423D3
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AE678423D3
 for <buildroot@buildroot.org>; Wed, 13 Jul 2022 09:02:15 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9E749305;
 Wed, 13 Jul 2022 11:02:12 +0200 (CEST)
MIME-Version: 1.0
In-Reply-To: <d94fd831-60af-3837-f32c-e598863f5106@theobroma-systems.com>
References: <20220711131823.116481-1-foss+buildroot@0leil.net>
 <165756918502.1398129.13899758729447253604@Monstersaurus>
 <d94fd831-60af-3837-f32c-e598863f5106@theobroma-systems.com>
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
To: Quentin Schulz <foss+buildroot@0leil.net>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>, buildroot@buildroot.org
Date: Wed, 13 Jul 2022 10:02:09 +0100
Message-ID: <165770292986.1813977.9808714201757010261@Monstersaurus>
User-Agent: alot/0.10
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1657702932;
 bh=bf5K3bWO568qTm7H8oLJjFSQeN2Sh5Mn5wp0hMU+KPU=;
 h=In-Reply-To:References:Subject:From:To:Date:From;
 b=ePypz9Om/j6FCLpzI+6ObcJaC1QPz9bfmRauRBNBFbWwyQt5kALNwHJTGOhFsdzVf
 XR5gVl0MHZ4AO7r2g9wWwC42Cb7NYMuJBybnORRlRuFbVtJ3azlEd8RMbwtZYUIAUj
 hOdr0iaabLUiC8lSUhx3AG7RRKyNQ6khrW+0hLPs=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com
 header.a=rsa-sha256 header.s=mail header.b=ePypz9Om
Subject: Re: [Buildroot] [PATCH v2] package/libcamera: add explicit
 dependency on libevent if libevent package to be built
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Quoting Quentin Schulz (2022-07-12 09:00:51)
> Hi Kieran,
> 
> On 7/11/22 21:53, Kieran Bingham wrote:
> > Quoting Quentin Schulz (2022-07-11 14:18:23)
> >> From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> >>
> >> The cam application requires libevent. Since there's no Kconfig option
> >> for it, cam building ability is checked by meson build system by default.
> >>
> >> If libevent is present in the sysroot, cam is built.
> >>
> >> The issue is that there's no explicit dependency on libevent in
> >> libcamera package. This means that it is possible for libevent AND
> >> libcamera to be built, but have libcamera be built before libevent.
> >> Meaning that even if all requirements seem to be fulfilled, cam still
> >> won't be enabled in some cases.
> >>
> >> This fixes the possible race by expliciting the dependency to libevent
> >> if the libevent package is enabled. Otherwise, explicitly disable cam
> >> building as it's already known that it isn't going to build.
> > 
> > I'm not opposed to this as it fixes the race though. I guess it depends
> > how much resistance there is to adding a specific libcamera kconfig
> > option to select cam.
> > 
> >>
> >> Cc: Quentin Schulz <foss+buildroot@0leil.net>
> >> Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> >> ---
> >>
> >> v2:
> >>   - added -Dcam=enabled when libevent package is enabled, to catch
> >>   possible additional dependencies to cam in later upgrades,
> >>
> >>   package/libcamera/libcamera.mk | 7 +++++++
> >>   1 file changed, 7 insertions(+)
> >>
> >> diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
> >> index 41d6a5abef..3f336cb797 100644
> >> --- a/package/libcamera/libcamera.mk
> >> +++ b/package/libcamera/libcamera.mk
> >> @@ -84,6 +84,13 @@ else
> >>   LIBCAMERA_CONF_OPTS += -Dqcam=disabled
> >>   endif
> >>   
> >> +ifeq ($(BR2_PACKAGE_LIBEVENT),y)
> >> +LIBCAMERA_CONF_OPTS += -Dcam=enabled
> >> +LIBCAMERA_DEPENDENCIES += libevent
> >> +else
> >> +LIBCAMERA_CONF_OPTS += -Dcam=disabled
> >> +endif
> >> +
> >>   ifeq ($(BR2_PACKAGE_TIFF),y)
> >>   LIBCAMERA_DEPENDENCIES += tiff
> > 
> > I see we're already doing things like this though... And I think tiff is
> > only used by cam? (Or perhaps also qcam).
> > 
> 
> qcam meson.build is the only one specifying the dependency and 
> README.rst only mentions this dependency for qcam.

Ah, yes, I see now. libtiff is used for writing out RAW / DNG files. So
this is an 'optional feature' of qcam.

We're into optional features of optional components ;-) - how many
levels should be configurable, vs 'detected' based on the rest of the
system image I wonder.


> I guess we could move libtiff next to the:
> ifeq ($(BR2_PACKAGE_QT5BASE_WIDGETS),y)
> check to "force" enabling of qcam if qt widgets and libtiff packages are 
> enabled?

I think we'd only 'force' enabling qcam (+/dng writer) if the user
explicitly selected a qcam sub option for libcamera (which doesn't yet
exist). Maybe cam/qcam should be configurable but I don't think it's a
big deal right now.
--
Kieran


> 
> Cheers,
> Quentin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
