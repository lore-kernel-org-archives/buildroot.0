Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A2BEC433EF
	for <buildroot@archiver.kernel.org>; Tue,  8 Feb 2022 21:36:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44D6560F3D;
	Tue,  8 Feb 2022 21:36:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l0EKq1nWgo0f; Tue,  8 Feb 2022 21:36:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51D6F60F27;
	Tue,  8 Feb 2022 21:36:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7C1281BF391
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 21:36:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6A60360F2E
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 21:36:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kb9lgrF4NvWw for <buildroot@lists.busybox.net>;
 Tue,  8 Feb 2022 21:36:13 +0000 (UTC)
X-Greylist: delayed 00:07:19 by SQLgrey-1.8.0
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1173860F57
 for <buildroot@buildroot.org>; Tue,  8 Feb 2022 21:36:13 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3C9F0A04;
 Tue,  8 Feb 2022 22:28:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1644355732;
 bh=tmYm9WzrrvLpI0ezvI9vV33oVIMjnbUW7iBfCoAWP6M=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=TEnpKoQhLek8JGkbBYTtUk+m4uC/JQkPnYhdZlRwPk79HhGB+tljnKIx3jvM9zrH4
 Rtbo9jFZ3LUbQUBlirp8cgahBm7liP4Kbo1rkPMTUt6fGk7LhtLJWyopohGo/37QcG
 P//+MJvyISFsl8x654wl4ggfPDpvm2Zgme0+1EAg=
MIME-Version: 1.0
In-Reply-To: <b471621d-c852-fbe1-54ca-0970480cbc36@mind.be>
References: <20210502095925.10744-1-ps.report@gmx.net>
 <b471621d-c852-fbe1-54ca-0970480cbc36@mind.be>
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
To: Arnout Vandecappelle <arnout@mind.be>, Peter Seiderer <ps.report@gmx.net>,
 buildroot@buildroot.org
Date: Tue, 08 Feb 2022 21:28:49 +0000
Message-ID: <164435572997.3447701.14524139530215798014@Monstersaurus>
User-Agent: alot/0.10
Subject: Re: [Buildroot] [PATCH v5] package/libcamera-apps: new package
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

Hi All,

Quoting Arnout Vandecappelle (2022-02-08 21:09:44)
> 
> 
> On 02/05/2021 11:59, Peter Seiderer wrote:
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> 
>   (Finally) applied to master, thanks. However...

Ohh, I'm happy to see this packaged.

Can someone try to bump the libcamera to the latest revision soon
please? There have been a couple of bug fixes/performance issues
resolved that were quite noticable on the Pi.

In fact, now I check there's a couple more RPi patches to be merged soon
so it might be worth getting those in first.
--
Kieran.

> 
> [snip]
> > diff --git a/package/libcamera-apps/0001-cmake-remove-Wfatal-errors-compiler-command-line-opt.patch b/package/libcamera-apps/0001-cmake-remove-Wfatal-errors-compiler-command-line-opt.patch
> > new file mode 100644
> > index 0000000000..11d19fa526
> > --- /dev/null
> > +++ b/package/libcamera-apps/0001-cmake-remove-Wfatal-errors-compiler-command-line-opt.patch
> > @@ -0,0 +1,25 @@
> > +From 22096ef8cfb18563c1955145db24742081910e10 Mon Sep 17 00:00:00 2001
> > +From: Peter Seiderer <ps.report@gmx.net>
> > +Date: Fri, 5 Feb 2021 18:24:08 +0100
> > +Subject: [PATCH] cmake: remove -Wfatal-errors compiler command line option
> > +
> > +Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > +---
> > + CMakeLists.txt | 1 -
> > + 1 file changed, 1 deletion(-)
> > +
> > +diff --git a/CMakeLists.txt b/CMakeLists.txt
> > +index 4191245..199a0f6 100644
> > +--- a/CMakeLists.txt
> > ++++ b/CMakeLists.txt
> > +@@ -10,7 +10,6 @@ endif()
> > + set (CMAKE_EXPORT_COMPILE_COMMANDS ON)
> > + set (CMAKE_CXX_STANDARD 17)
> > + set (CMAKE CXX_FLAGS "-Wall -Wextra -pedantic -Wno-unused-parameter -faligned-new")
> > +-add_definitions(-Wfatal-errors)
> 
>   Why is this patch needed? The only thing that -Wfatal-errors does is to stop 
> compilation when there is an error, instead of trying to continue and find more 
> errors in the rest of the file. It's not -Werror.
> 
>   I kept the patch anyway because I didn't test without it.
> 
> 
>   Regards,
>   Arnout
> 
> 
> > + add_definitions(-Wno-psabi)
> > + add_definitions(-DBOOST_LOG_DYN_LINK)
> > +
> > +--
> > +2.30.0
> > +
> > diff --git a/package/libcamera-apps/Config.in b/package/libcamera-apps/Config.in
> > new file mode 100644
> > index 0000000000..08667eb830
> > --- /dev/null
> > +++ b/package/libcamera-apps/Config.in
> > @@ -0,0 +1,31 @@
> > +config BR2_PACKAGE_LIBCAMERA_APPS
> > +     bool "libcamera-apps"
> > +     depends on BR2_PACKAGE_LIBCAMERA_ARCH_SUPPORTS # libcamera
> > +     depends on BR2_INSTALL_LIBSTDCPP # libcamera/boost
> > +     depends on BR2_TOOLCHAIN_HAS_THREADS # libcamera/boost/libdrm
> > +     depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17/libcamera
> > +     depends on !BR2_STATIC_LIBS # gnutls/libcamera
> > +     depends on BR2_USE_WCHAR # gnutls/libcamera/boost
> > +     depends on BR2_PACKAGE_XORG7
> > +     depends on BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL # libepoxy
> > +     select BR2_PACKAGE_BOOST
> > +     select BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
> > +     select BR2_PACKAGE_JPEG
> > +     select BR2_PACKAGE_LIBCAMERA
> > +     select BR2_PACKAGE_LIBDRM
> > +     select BR2_PACKAGE_LIBEPOXY
> > +     select BR2_PACKAGE_LIBEXIF
> > +     select BR2_PACKAGE_LIBPNG
> > +     select BR2_PACKAGE_TIFF
> > +     select BR2_PACKAGE_XLIB_LIBX11
> > +     help
> > +       This is a small suite of libcamera-based apps that aim to copy
> > +       the functionality of the existing "raspicam" apps.
> > +
> > +       https://github.com/raspberrypi/libcamera-apps
> > +
> > +comment "libcamera-apps needs a toolchain w/ C++, threads, wchar, dynamic library, gcc >= 7 and needs an OpenGL and/or OpenGL EGL backend"
> > +     depends on BR2_PACKAGE_LIBCAMERA_ARCH_SUPPORTS
> > +     depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
> > +             !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || BR2_STATIC_LIBS || !BR2_USE_WCHAR
> > +     depends on !BR2_PACKAGE_HAS_LIBEGL && !BR2_PACKAGE_HAS_LIBGL
> > diff --git a/package/libcamera-apps/libcamera-apps.hash b/package/libcamera-apps/libcamera-apps.hash
> > new file mode 100644
> > index 0000000000..da426434c1
> > --- /dev/null
> > +++ b/package/libcamera-apps/libcamera-apps.hash
> > @@ -0,0 +1,3 @@
> > +# Locally computed
> > +sha256  9b3475e1c817cbcf942c4be0dac3d1f6bf2ee192b0ca5edb95c85c06c5a12b4f  libcamera-apps-326fdfd120a0f62b7e76f4ee8aa0c82c2bf008e6.tar.gz
> > +sha256  36dfed86bdef661a0a14ec1a1cc84c771d5a06b6f9b92e9ebb610ba711bd528a  license.txt
> > diff --git a/package/libcamera-apps/libcamera-apps.mk b/package/libcamera-apps/libcamera-apps.mk
> > new file mode 100644
> > index 0000000000..5edcefefad
> > --- /dev/null
> > +++ b/package/libcamera-apps/libcamera-apps.mk
> > @@ -0,0 +1,25 @@
> > +################################################################################
> > +#
> > +# libcamera-apps
> > +#
> > +################################################################################
> > +
> > +LIBCAMERA_APPS_VERSION = 326fdfd120a0f62b7e76f4ee8aa0c82c2bf008e6
> > +LIBCAMERA_APPS_SITE = $(call github,raspberrypi,libcamera-apps,$(LIBCAMERA_APPS_VERSION))
> > +LIBCAMERA_APPS_LICENSE = BSD-2-Clause
> > +LIBCAMERA_APPS_LICENSE_FILES = license.txt
> > +LIBCAMERA_APPS_DEPENDENCIES = \
> > +     host-pkgconf \
> > +     boost \
> > +     jpeg \
> > +     libcamera \
> > +     libdrm \
> > +     libexif \
> > +     libepoxy \
> > +     libpng \
> > +     tiff \
> > +     xlib_libX11
> > +
> > +LIBCAMERA_APPS_CONF_OPTS = -DENABLE_COMPILE_FLAGS_FOR_TARGET=disabled
> > +
> > +$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
