Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ABBAC4332F
	for <buildroot@archiver.kernel.org>; Mon,  7 Mar 2022 21:22:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A9246404A8;
	Mon,  7 Mar 2022 21:22:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 49R84sikvCNj; Mon,  7 Mar 2022 21:22:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5B8AD403F8;
	Mon,  7 Mar 2022 21:22:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 958DD1BF2C3
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 21:22:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 82D04403F8
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 21:22:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MLiLHYYNIJkQ for <buildroot@lists.busybox.net>;
 Mon,  7 Mar 2022 21:22:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CC3D6403A4
 for <buildroot@buildroot.org>; Mon,  7 Mar 2022 21:22:22 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id d10so34807052eje.10
 for <buildroot@buildroot.org>; Mon, 07 Mar 2022 13:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=p5dCZt/X27Ow1RaPJOmT+jFYXL6e6bKR6UV2C8Zvz7w=;
 b=iZXMPId+4tqumYqGExzF48+bH01rN70711IQ7WGJTdOIoGQPrI/3WJXa2yX6nXxPsm
 JPMFhKFNBUF/lFuHg2jvwCDOePSdXbjJ8r4+xFD+Wp/zoGZ6HCLDKzcnmr1SbcIwZF/J
 WO7VBhe49v+M4WQZV8IkxcHU3bZAycDyhNnHuh9UDaC+DJBY920c5aLi0/T2bxyT7YRc
 o+EG6QL7ndyxtxB3JvEMkMVR2Ee6EgVqUmgqfr1/4av9cPY/TWQ1o5QFFZplxpddmNy9
 JXB4O056gF1aTz5mHZhQk6VSLUfD07PsOOG0L238qmnA1puBJV4YOhWW/5YWM4T+l0F0
 AKhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=p5dCZt/X27Ow1RaPJOmT+jFYXL6e6bKR6UV2C8Zvz7w=;
 b=4Yxp7tOhmS+OwlZJGxmSFfi0dD7Rac+M9hZJZBO8Qk4SV/j7uhKhowsBOQxmp1Vkj+
 WjGiNMCHSA3uu5uUh4vntyFctQedM11xIVdnImEArMiPjl13vjhPp42D8TwwCoNWHUck
 go3mBK2TaQG0RYKK/JTmukhbUpw5iXbMXsWVp1Ph4QZBMYfY5uRgPjRDrzBpTPNCu2HH
 dQcP8glkqC17Qgxu1rtVvWfwlyCfA/mCz0owVn66LCSZPrGEcOce5zQV1mI1YmoRo+Nr
 TcykVGJqifw0QefsswpYO6mJ/8Eck/U6pTh48WrJXLcnDJTsB4wwZcvp35A42D+m1Z+7
 JEWw==
X-Gm-Message-State: AOAM533j1zb/BVfovwTTB64KjBBh+IoLPn1kIBwkoIagbJXPWLO8zorC
 hvvLKn+iY8pzfNTimPPQ5AR7np3Bz3Nrhg==
X-Google-Smtp-Source: ABdhPJyk61QwNhSjvZMr/AAgwRtv5jRQPbYC1uwe5sEhh4SEdfVysd3LVaeQvAO6eOcP89OJSL4qNw==
X-Received: by 2002:a17:907:6e90:b0:6da:886b:ab with SMTP id
 sh16-20020a1709076e9000b006da886b00abmr10448068ejc.285.1646688140845; 
 Mon, 07 Mar 2022 13:22:20 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 k17-20020a1709062a5100b006d5c69301e4sm5146540eje.202.2022.03.07.13.22.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 13:22:20 -0800 (PST)
Message-ID: <96905b6b-a8f7-7110-772b-bc835c219253@mind.be>
Date: Mon, 7 Mar 2022 22:22:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220218090533.645612-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220218090533.645612-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/pulseview: fix build with
 glibmm 2.68
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
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 18/02/2022 10:05, Fabrice Fontaine wrote:
> Fixes:
>   - http://autobuild.buildroot.org/results/ebb73892fd7471de4f0c109554dfdc65b93d3dcf
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   .../pulseview/0003-Support-glibmm-2.68.patch  | 89 +++++++++++++++++++
>   1 file changed, 89 insertions(+)
>   create mode 100644 package/pulseview/0003-Support-glibmm-2.68.patch
> 
> diff --git a/package/pulseview/0003-Support-glibmm-2.68.patch b/package/pulseview/0003-Support-glibmm-2.68.patch
> new file mode 100644
> index 0000000000..00e4e696d9
> --- /dev/null
> +++ b/package/pulseview/0003-Support-glibmm-2.68.patch
> @@ -0,0 +1,89 @@
> +From a97d5a060a534a3c658578e7f14ab43556db93ca Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Thu, 30 Dec 2021 16:19:46 +0100
> +Subject: [PATCH] Support glibmm 2.68
> +
> +Support glibmm 2.68 which has been released one year ago and is the
> +first stable release in the glibmm-2.68 ABI series:
> +https://gitlab.gnome.org/GNOME/glibmm/-/blob/2.68.2/NEWS
> +
> +C++17 support is mandatory with glibmm 2.68
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status: not sent yet]
> +---
> + CMakeLists.txt | 23 +++++++++++++++++++----
> + INSTALL        |  2 +-
> + 2 files changed, 20 insertions(+), 5 deletions(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index 7791b1b1..58a9cf92 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -75,7 +75,14 @@ add_subdirectory(manual)
> + #-------------------------------------------------------------------------------
> +
> + list(APPEND PKGDEPS glib-2.0>=2.28.0)
> +-list(APPEND PKGDEPS glibmm-2.4>=2.28.0)
> ++
> ++set(LIBSR_GLIBMM "glibmm-2.4>=2.28.0")
> ++find_package(PkgConfig)
> ++pkg_check_modules(LIBSRGLIBMM24 ${LIBSR_GLIBMM})
> ++if(NOT LIBSRGLIBMM24_FOUND)
> ++	set(LIBSR_GLIBMM "glibmm-2.68>=2.68.0")
> ++endif()
> ++list(APPEND PKGDEPS ${LIBSR_GLIBMM})
> +
> + if(ENABLE_FLOW)
> + 	list(APPEND PKGDEPS gstreamermm-1.0>=1.8.0)
> +@@ -93,7 +100,6 @@ if(ANDROID)
> + 	list(APPEND PKGDEPS libsigrokandroidutils>=0.1.0)
> + endif()
> +
> +-find_package(PkgConfig)
> + pkg_check_modules(LIBSRCXX ${LIBSR_CXX_BINDING})
> + if(NOT LIBSRCXX_FOUND OR NOT LIBSRCXX_VERSION)
> + 	message(FATAL_ERROR "libsigrok C++ bindings missing, check libsigrok's 'configure' output (missing dependencies?)")
> +@@ -225,7 +231,11 @@ memaccess_check_unaligned_le(HAVE_UNALIGNED_LITTLE_ENDIAN_ACCESS)
> + set(PV_TITLE PulseView)
> + set(PV_VERSION_STRING "0.5.0")
> +
> +-set(PV_GLIBMM_VERSION ${PKGDEPS_glibmm-2.4_VERSION})
> ++if(LIBSRGLIBMM24_FOUND)
> ++	set(PV_GLIBMM_VERSION ${PKGDEPS_glibmm-2.4_VERSION})
> ++else()
> ++	set(PV_GLIBMM_VERSION ${PKGDEPS_glibmm-2.68_VERSION})
> ++endif()
> +
> + include(GetGitRevisionDescription)
> +
> +@@ -486,7 +496,12 @@ qt5_add_resources(pulseview_RESOURCES_RCC ${CMAKE_BINARY_DIR}/translations.qrc)
> + add_definitions(-DQT_NO_KEYWORDS)
> + add_definitions(-D__STDC_LIMIT_MACROS)
> + add_definitions(-Wall -Wextra)
> +-add_definitions(-std=c++11)
> ++if(LIBSRGLIBMM24_FOUND)
> ++	add_definitions(-std=c++11)
> ++else()
> ++	# glibmm-2.68 reuires c++17
> ++	add_definitions(-std=c++17)
> ++endif()
> + add_definitions(-DBOOST_MATH_DISABLE_FLOAT128=1)
> + if(WIN32)
> + 	add_definitions(-Wa,-mbig-obj -O3)
> +diff --git a/INSTALL b/INSTALL
> +index da89be8d..8003fcfb 100644
> +--- a/INSTALL
> ++++ b/INSTALL
> +@@ -14,7 +14,7 @@ Requirements
> +  - pkg-config >= 0.22
> +  - cmake >= 2.8.12
> +  - libglib >= 2.28.0
> +- - glibmm-2.4 (>= 2.28.0)
> ++ - glibmm-2.4 (>= 2.28.0) or glibmm-2.68 (>= 2.68.0)
> +  - Qt5 (>= 5.3), including the following components:
> +     - Qt5Core, Qt5Gui, Qt5Widgets, Qt5Svg, Qt5LinguistTools
> +     - Qt translation package (optional; needed at runtime, not build time)
> +--
> +2.34.1
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
