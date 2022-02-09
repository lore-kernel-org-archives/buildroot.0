Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 654E6C433FE
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 16:27:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D3A9F400D0;
	Wed,  9 Feb 2022 16:27:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z-Pk90cRlCVf; Wed,  9 Feb 2022 16:27:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A4FC340146;
	Wed,  9 Feb 2022 16:27:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DFCD61BF47D
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 16:27:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CE13982BBA
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 16:27:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZYN_76_7FxPs for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 16:27:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6AD3C82AC6
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 16:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1644424039;
 bh=quOYXGCTlri46en+/BycIzQ09+ZpOq8II9Ew1AXyXg0=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=MrBkFZkBGLsvjhWC4v/AdFMWA8wmdX5kD1XubC2DFnjQA+i77s+NvGG0qL+H2L9EL
 V4k8Db+A3BLgoIGQOW3dN3Xw4A7HpIGpdfg8mYsiE/aS9LumD/EKu40CqbOi7kq9AB
 HCxYYLjvNt6kF7rC7Io6nXCpF1SJuP3qxi6yPadg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.59]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MMobO-1naT7j0DP2-00IjJk; Wed, 09
 Feb 2022 17:27:19 +0100
Date: Wed, 9 Feb 2022 17:27:18 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20220209172718.4afc2ed6@gmx.net>
In-Reply-To: <b471621d-c852-fbe1-54ca-0970480cbc36@mind.be>
References: <20210502095925.10744-1-ps.report@gmx.net>
 <b471621d-c852-fbe1-54ca-0970480cbc36@mind.be>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:XapR/AwJbQbEivYDeRfWz+LTRm9uhdCE9F819jcHVDAVYV1uJ2U
 vlwSfWtU2PHhLbogqaxKvG7g+eaaBnK2hul5Q45bmrGDOaaiaidPiBuRszn+Db2m5XaB5+7
 wPya3X3zSACjt+EYlWqoiTw1mVAxPm8o9+26bKpDC6FQeCY+3XS1aP9iDPwySbYnLOaeTcv
 FyCFhs3GL9jua2v90brdg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:vT42iu+dZkw=:+bMgbX1RiJH0yBKVhKVtRx
 oItPUaonXWCHoqIXjrNB1T+PyUELsG9CHYzeFnqg2C9V2A8YhB207t15JyrBxeVIExJyRjZXY
 GVKqZt51tCGmA7cLvqxilEPxLbSeuHf2S7e/X+d5T5DvzcEko+1hlIfAcDw+EN3m6ueYLqEli
 3dEAZaRgq9YKJHWgwpsZZbfUPiW9tf/p9kbNJVubDpMHMpB0GshX69LLq0xAiGONv9g2zj5sm
 Xm7p4wDZw9eVSP5dkOYWvRvwoubjsmS5RF4SR2OyBnjbNmtj5NWmknNa/AjE9YgxV26n69HY0
 5nETpgBlcin1nEQybnF/JWOADMl3il11iqwisbNc6vPcFNM2ats/CmZIYjekbCAdVHlu4yuhl
 6AXTlDjZ4IsHg8Wl2c3wn5cTipwPY+m/gc6iiL0YG2YGOxoWoihUTCtzjHmB+9kydFUHON9bz
 dc7WKWYfXBjK+RcPId4ksi8TbdFFaFHEbI+AjL8Vp+VVFbt4BxFZbimllRK2K/ZNce+Hw0ZyQ
 V4OJbZbE7p9srZOBUkKi5ieL/x5UEY7Zmwg1H0e/Cce/D+hlxY/fpJUc07wG2fd1M5P78+rZJ
 gBp5H5O6aRW8VM3y+CLk+4ZODQHmzyJCtb8ufEeaZtb3t+hKbFxP19cCRUUgwgKBbKqnRR44Q
 o59mZ8J7Pv0xWcfC6LUX0nHC2PzGGqscLllOIAesuX+8EBXmKSxd2Ed+2gS/kkbxBiU6hvjza
 P9STP0pFuNN1MJNlZ8OAjTFpT46/tm115unl42DrSvtT1xLQJmgFYpC8+1rJxNAE9zyhyIfN3
 fDYHvl1dbNSfvgK2HYYKlQdu6UlsIkiDFWfTwVhrdQhj5Md/VNS7jyW9VCdkJHzQdfxFf1Fxm
 dLlbStChp1LF8dcf3GMQMtTLF+5JhV3Kg63PNv23vlzWzk8FIVlS8RROPf/ZgwGD8imq7M4L9
 v0VHjHenakrro+jvgZ4ReFDBoCpxUTttJ3H2WKIgUB7VlmcJT5sysIRutPomKt9YgfB1J7f6N
 E0YCxzF892/Emr4P2FvvdUD3oIDWEerCB2X+6zV1cU5A0Y6Bg6TDpMnSLRl2oojTmjgzM4pi7
 ZOdleqvDF6TS74=
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
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Arnout,

On Tue, 8 Feb 2022 22:09:44 +0100, Arnout Vandecappelle <arnout@mind.be> wrote:

> On 02/05/2021 11:59, Peter Seiderer wrote:
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
>
>   (Finally) applied to master, thanks. However...
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

Do not remember the exact failure....

>
>   I kept the patch anyway because I didn't test without it.

Ups, patch needs some update anyway, fails with current libcamera package/version:

	-- Checking for module 'camera'
	--   Package 'camera', required by 'virtual:world', not found
	CMake Error at /usr/share/cmake/Modules/FindPkgConfig.cmake:603 (message):
	  A required package was not found
	Call Stack (most recent call first):
	  /usr/share/cmake/Modules/FindPkgConfig.cmake:825 (_pkg_check_modules_internal)
	  CMakeLists.txt:36 (pkg_check_modules)

Fixed upstream by [1]...

Regards,
Peter

[1] https://github.com/raspberrypi/libcamera-apps/commit/729df015fb37ab25abd73c4832f9e7fa5d1cb8de

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
> > +	bool "libcamera-apps"
> > +	depends on BR2_PACKAGE_LIBCAMERA_ARCH_SUPPORTS # libcamera
> > +	depends on BR2_INSTALL_LIBSTDCPP # libcamera/boost
> > +	depends on BR2_TOOLCHAIN_HAS_THREADS # libcamera/boost/libdrm
> > +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17/libcamera
> > +	depends on !BR2_STATIC_LIBS # gnutls/libcamera
> > +	depends on BR2_USE_WCHAR # gnutls/libcamera/boost
> > +	depends on BR2_PACKAGE_XORG7
> > +	depends on BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL # libepoxy
> > +	select BR2_PACKAGE_BOOST
> > +	select BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
> > +	select BR2_PACKAGE_JPEG
> > +	select BR2_PACKAGE_LIBCAMERA
> > +	select BR2_PACKAGE_LIBDRM
> > +	select BR2_PACKAGE_LIBEPOXY
> > +	select BR2_PACKAGE_LIBEXIF
> > +	select BR2_PACKAGE_LIBPNG
> > +	select BR2_PACKAGE_TIFF
> > +	select BR2_PACKAGE_XLIB_LIBX11
> > +	help
> > +	  This is a small suite of libcamera-based apps that aim to copy
> > +	  the functionality of the existing "raspicam" apps.
> > +
> > +	  https://github.com/raspberrypi/libcamera-apps
> > +
> > +comment "libcamera-apps needs a toolchain w/ C++, threads, wchar, dynamic library, gcc >= 7 and needs an OpenGL and/or OpenGL EGL backend"
> > +	depends on BR2_PACKAGE_LIBCAMERA_ARCH_SUPPORTS
> > +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
> > +		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || BR2_STATIC_LIBS || !BR2_USE_WCHAR
> > +	depends on !BR2_PACKAGE_HAS_LIBEGL && !BR2_PACKAGE_HAS_LIBGL
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
> > +	host-pkgconf \
> > +	boost \
> > +	jpeg \
> > +	libcamera \
> > +	libdrm \
> > +	libexif \
> > +	libepoxy \
> > +	libpng \
> > +	tiff \
> > +	xlib_libX11
> > +
> > +LIBCAMERA_APPS_CONF_OPTS = -DENABLE_COMPILE_FLAGS_FOR_TARGET=disabled
> > +
> > +$(eval $(cmake-package))

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
