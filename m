Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0038C636CD
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 15:22:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B4CB40F4E;
	Tue,  7 Feb 2023 15:22:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B4CB40F4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S4rJFmrI8pAa; Tue,  7 Feb 2023 15:22:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D996417E1;
	Tue,  7 Feb 2023 15:22:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D996417E1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 879191BF275
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 15:22:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5D033417F7
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 15:22:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D033417F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 46wy7MzQXZFh for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 15:22:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2484240F4E
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2484240F4E
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 15:22:52 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [85.119.216.19])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 01BFA13F84C;
 Tue,  7 Feb 2023 16:22:46 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 07 Feb 2023 16:22:46 +0100
Date: Tue, 7 Feb 2023 16:22:46 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Message-ID: <20230207152246.GG4124@scaer>
References: <20230207085445.1651226-1-marcus.folkesson@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230207085445.1651226-1-marcus.folkesson@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1675783369;
 bh=QwUAP9AjVjmc8YGV3ejKPbnYX7rA2Sv1QxUL8ij4ON8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ueOpUYv1KA3FoV5wBzdR87TV9kq19gaeIUSBTChKmykkMsoqWpLeGjvyP3hS02I6O
 agmePvZj66iogm7MJPD2AOd+zCIjDw3Xa2r64cxF2ajCb/dHM3VAp12b7jlVr2WleU
 kTUjNLqCDWAYN3KF+cOTWOUOnZKmOu7n7GKisUeG+sB6JC3WjSq9F9pj94aVPBI+kM
 c47YQjV4Prj2XajDF9JH4BRs1A0R1T+qXg8nqcIXQXVVy/yl3C0LoRp+ybaAZv+Zqe
 Q5K/StryI1TshReRGHB1wpwHantH8qrQJdPG/PcS/VdvKEe+lapWgRn744V7GCYChT
 Ov4YZJZ9+/pWA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ueOpUYv1
Subject: Re: [Buildroot] [PATCH] package/libcamera-apps: enable LIBAV only
 if libdrm is present
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

Marcus, All,

On 2023-02-07 09:54 +0100, Marcus Folkesson spake thusly:
> Since commit 35266e84043f880d7591e52b71a8c5b8d0e4717d, libcamera-apps
> does enable LIBAV by default which depends on libdrm.
> 
> Fixes:
> - http://autobuild.buildroot.net/results/548f2a3b353ce4693fb60d7fb1e06e02af22991c/
> 
> /home/buildroot/autobuild/run/instance-1/output-1/build/libcamera-apps-1.1.1/encoder/libav_encoder.cpp:13:10: fatal error: libdrm/drm_fourcc.h: No such file or directory
>    13 | #include <libdrm/drm_fourcc.h>
>       |          ^~~~~~~~~~~~~~~~~~~~~
> 
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---
>  package/libcamera-apps/libcamera-apps.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/libcamera-apps/libcamera-apps.mk b/package/libcamera-apps/libcamera-apps.mk
> index 290ee9a026..385c65136e 100644
> --- a/package/libcamera-apps/libcamera-apps.mk
> +++ b/package/libcamera-apps/libcamera-apps.mk
> @@ -25,8 +25,10 @@ LIBCAMERA_APPS_CONF_OPTS = \
>  ifeq ($(BR2_PACKAGE_LIBDRM),y)
>  LIBCAMERA_APPS_DEPENDENCIES += libdrm
>  LIBCAMERA_APPS_CONF_OPTS += -DENABLE_DRM=1
> +LIBCAMERA_APPS_CONF_OPTS += -DENABLE_LIBAV=1

But doesn't ENABLE_LIBAV also need a few libraries? From libcamera-apps'
encoder/CMakeLists.txt:

   13 if (ENABLE_LIBAV)
   14     message(STATUS "Checking for libavcodec")
   15     pkg_check_modules(LIBAV QUIET IMPORTED_TARGET
   16         libavcodec
   17         libavdevice
   18         libavformat
   19         libswresample
   20     )

libavcodec, libavdevice, libavformat, and libswresample come with
ffmpeg, so this should be added to dependencies too.

Note: in fact, if the libs are not found, the feature will be silently
disabled:

   21     if (LIBAV_FOUND)
   22         include_directories(${LIBAV_INCLUDE_DIRS})
   23         set(SRC ${SRC} libav_encoder.cpp)
   24         set(TARGET_LIBS ${TARGET_LIBS} ${LIBAV_LIBRARIES})
   25         set(LIBAV_PRESENT 1)
   26         message(STATUS "libavcodec found:")
   27         message(STATUS "    libraries: ${LIBAV_LIBRARIES}")
   28     endif()
   29 else()
   30     message(STATUS "Omitting libavcodec")
   31 endif()

However, this is not clean, because we explicitly asked for a feature
(enable libav suport) but it gets disabled because of missing
dependencies.

So, either we explicitly and unconditionally disable it, or we add the
necessary dependencies.

Regards,
Yann E. MORIN.

>  else
>  LIBCAMERA_APPS_CONF_OPTS += -DENABLE_DRM=0
> +LIBCAMERA_APPS_CONF_OPTS += -DENABLE_LIBAV=0
>  endif
>  
>  ifeq ($(BR2_PACKAGE_XORG7),y)
> -- 
> 2.38.1
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
