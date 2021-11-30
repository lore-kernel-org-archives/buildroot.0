Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80FDCC4332F
	for <buildroot@archiver.kernel.org>; Tue, 30 Nov 2021 08:52:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC3AD608C3;
	Tue, 30 Nov 2021 08:52:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ycsnv4e5Bmfr; Tue, 30 Nov 2021 08:52:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3671F607CB;
	Tue, 30 Nov 2021 08:52:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5D0E31BF284
 for <buildroot@lists.busybox.net>; Tue, 30 Nov 2021 08:52:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 46C7C607CB
 for <buildroot@lists.busybox.net>; Tue, 30 Nov 2021 08:52:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lysq8t0bscuY for <buildroot@lists.busybox.net>;
 Tue, 30 Nov 2021 08:52:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E2E8A607A4
 for <buildroot@buildroot.org>; Tue, 30 Nov 2021 08:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1638262364;
 bh=4hZaj3A+wD8y1Ty5i3CtgIEpAgb8U09xAAS35mjoVhA=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=KaTshEL5a8D3IQ7tyWfCL5zR/yy/NchcTGPV/kakwQnSP9ncfPvUkmnJjMY1fy/Ra
 znuHKd3qxLfBL9R3qC2efoIqSd492j4IEIYvwYA21IduoTssxOk8RsAng5/NAdR4te
 5ZZYd/01ighCX8pPO0M6G+JfprxSLW7utQtgIaWo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.208.239]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MFsUp-1mowTb1zUF-00HS3Z; Tue, 30
 Nov 2021 09:52:44 +0100
Date: Tue, 30 Nov 2021 09:52:43 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: Michael Taubert <info@arachnodroid.de>
Message-ID: <20211130095243.4e0d68dc@gmx.net>
In-Reply-To: <f3e486d3-af27-1c7c-7022-c2a733216a7f@arachnodroid.de>
References: <f3e486d3-af27-1c7c-7022-c2a733216a7f@arachnodroid.de>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:s+OqSsMDZeOLZeeQECiooSjrBV0j+04FMhbqGbLF7C6H7NxSaqU
 1UQ2Kf5gBQwIlw3pxH78psFv3y96UJYXRo0PsRzdaP+Fx561vAwU8b3UYkHfGEm2DWPnPxE
 SaEFbTXJmosaEoy+ylRGGap5o63lCgjEUsHUQRquADlOBdgHVtT+p4hetGtJNvGcA3vyQCA
 DXRlz30hpNiGJ9k4T+uMA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:lakebHhWBcM=:juYb6o58slIdBpVFMcH4W6
 XoMPllENMLaEBSXC5bEGkuiWsISwlldm0zwlDd3aBqiOZhj5YdaN81vW2U14nVyBz2VTjH7zn
 jAqAhoH9hJSU85FF6wW/WnTMPzAx4a53LyGGRicCWDXHUv2qjhi3arKbd1109E0/qTFquEsuc
 R6H5q4DJPAUpExdzTTakW4HYti6FIZS3bHWkbFmm9ouW5sDQoFJtSqRe85dR0Pw+W1Dv0K5N7
 /+KeTGQO9N5y94nljHqWNDqZujtdBTtID59IwfI0Ia9KHVrFAPqgNUJKksbsuVdBF17Gv/jNZ
 Bn3a2i7ssNtHjR+1JiHOVTZEi1QW5rEKu89Oew4DSBuE0+AoUwfDnCZADffekiTpIPGmulnOL
 WTi0LqgA9mW0lm64Tr6UOoNf6I8iDcGbcfUCV9Ylxuw3cdHv0Hnm4mHY7wvppx6KAhc6LDjN+
 na1u6RQt9KDyWA99W94zLkxEBUavZQJPSqn/PzwTbq9jwT6fWTzw/1cKF5o2RB9Jw9cNdpqZ6
 aU4WzROcp7YV3fqVaH9Mjn2LCYl4hBqN14vwxG06YmjawwFA/TNm+r7NIj42h59cP4sOfjkVP
 ENXZEDmXS9e5r2b7sS62fgs9vdTjxw0e4vhq8T6I9zlCTD42pUv+1VHSewfbMf9eRJv3RI5ao
 2VJAdaGFqPyJo7f7m0DM0bcXJPlQr1HIQJOgcb+LAdhvkIzeXsMbYmjsD1JRb14V37KDV21rE
 G42GIS/ieoelZSNHKUEVnb/otWqzuJ0sdckrf/VGTYl58lYkHAB3S1YadUEj44Gcc1E0qGXRZ
 ynk0OG6hhJ3MqXjnWBtkT9omURD5ytGRD4Z69XoBt42RSg3e5pdAI3CtqrRjg/R1kyiSBV68c
 Je0U1txfXpElT4osmWBRM/B2CwVNbc5vp0Is81E6z9UnS64iB7FnlIUZhq/yIuI7SlVCGFJqb
 Zx9A6FGbciiMz0nW6SxgS+K0oYOns/BfX8+MtSMEFA5zGtYbLXwRvpDgh0TNttLQtlzQDB1u6
 5sphMiLtFAZsCeeL2eRwqo/p9sHkUVK2FZgtKE/RTcvdu2nanTVOx/0L9+YB2LFMRwMORKMIO
 54EHSh0wm0MlBY=
Subject: Re: [Buildroot] Mesa3D / RPi4 - Failed to open bo 1: Permission
 denied
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

Hello Michael,

On Tue, 30 Nov 2021 08:30:01 +0100, Michael Taubert <info@arachnodroid.de> wrote:

> Hi list!
>
> I've switched from branch 2021.02.x to 2021.08.x and got a problem with
> Mesa3D. Mesa3D does not build with DRI3 support by default, which leads
> into the error message 'Failed to open bo 1: Permission denied' when
> running glxgears -info.
>
> Earlier this year I already got caught by this problem, but could work
> around by enabling DRI SWRAST driver for Mesa3D. But this driver is not
> available anymore. The meson-log says, it's not built with DRI3:
>
> buildroot-rpi4/output/host/lib/pkgconfig -Dgallium-omx=disabled
> -Dpower8=disabled -Dllvm=disabled -Dgallium-opencl=disabled -Dglx=dri
> -Dgallium-xa=disabled -Dgallium-vc4-neon=auto -Dshared-glapi=enabled
> -Dgallium-drivers=v3d,vc4 -Dgallium-extra-hud=true -Ddri-drivers=
> -Ddri3=disabled ...
>
> This is the output of glxgears:
>
> root@buildroot:~# glxgears -info
> Failed to open bo 1: Permission denied
> Running synchronized to the vertical refresh.  The framerate should be
> approximately the same as the monitor refresh rate.
> GL_RENDERER   = V3D 4.2
> GL_VERSION    = 2.1 Mesa 21.1.6
> GL_VENDOR     = Broadcom
>
> It runs, but the screen stays black.
>
> When I change mesa3d.mk to this:
>
> ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),)
> MESA3D_CONF_OPTS += \
>          -Ddri-drivers= -Ddri3=enabled
> else
> ...
>
> It works again and the error disappears. How am I supposed to enable
> DRI3 support for my RPI4 now?

The problem is maybe addressed by the following patchset:

 -  [PATCH v1 1/2] package/mesa3d: add config option for DRI3 support (see [1])
 -  [PATCH v1 2/2] package/mesa3d: gallium/kmsro drivers require dri3 for X11 (see [2])

But did not find enough spare time/interest to do further work on this ones...

Regards,
Peter

[1] http://lists.busybox.net/pipermail/buildroot/2021-June/312614.html
[2] http://lists.busybox.net/pipermail/buildroot/2021-June/615147.html

>
> Thanks in advance.
>
> Best regards,
> Michael
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
