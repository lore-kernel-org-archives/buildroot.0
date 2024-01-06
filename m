Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63F14C46CD2
	for <buildroot@archiver.kernel.org>; Sat,  6 Jan 2024 17:28:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F417E405D8;
	Sat,  6 Jan 2024 17:28:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F417E405D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x55xdOls8782; Sat,  6 Jan 2024 17:28:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 79AB84018F;
	Sat,  6 Jan 2024 17:28:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 79AB84018F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DC13C1BF345
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 17:28:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B526381839
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 17:28:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B526381839
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Eidx9O5TYySV for <buildroot@lists.busybox.net>;
 Sat,  6 Jan 2024 17:28:30 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F4154817C0
 for <buildroot@buildroot.org>; Sat,  6 Jan 2024 17:28:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F4154817C0
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 12203B004FF;
 Sat,  6 Jan 2024 18:28:25 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 06 Jan 2024 18:28:24 +0100
Date: Sat, 6 Jan 2024 18:28:24 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <ZZmNuFpMtxw73Rh-@landeda>
References: <20240103020613.4084011-1-adam.duskett@amarulasolutions.com>
 <20240103020613.4084011-2-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240103020613.4084011-2-adam.duskett@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1704562107;
 bh=dxw+docuxNJghUj7Q6inAhe/IpgzDn4ASj4BKBaF3ys=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JM27mFub5Dbp7Y8uxj8IYgwWr+m0bTD6DZJ0UW5xig+CSfUSmRbjqxcDMpztUPK18
 pUNs85y+p0FnccT9rzA0viHG6d7vzj8gzYl7XkyxZ3Hia3ypCWXOzS/hISA7blxz9P
 N5V4AAvtuoeTacaKbHARfkyPpwniagYgAOIgvdfR0l1+dWrEgwLHn7IdvouoFFmHDY
 14px5/RcNvL24Wmyaj0KekvBQl+CAenE8ysqsMpLQ091XSg6edvKXcmiNiyXav5CGG
 yZQ3Eo27X2TmD7YbVTk4rKYJoVOYBAr0I+atzQnxa3hrpJUkoB/ijNbk3pjb9J1s9x
 vk83glQPVienQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=JM27mFub
Subject: Re: [Buildroot] [PATCH v5 1/1] package/ivi-homescreen: new package
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

On 2024-01-02 19:06 -0700, Adam Duskett spake thusly:
> Much like flutter-pi, this package is a Flutter embedder used to run Flutter
> applications. However, unlike Flutter-pi, this package requires a Wayland
> compositor to run, which flutter-pi does not support. Furthermore, flutter-pi
> lacks several plugins and features that ivi-homescreen supports, such as:
>   - Dart VM console redirection
>   - DLT logging
>   - Accessibility
>   - Compositor region
>   - Compositor surface
>   - Desktop Window
>   - Go Router
>   - Isolate
>   - Keyboard Manager
>   - Layer Playground
>   - Mouse Cursor
>   - PackageInfo
>   - Platform
>   - Platform Views
>   - Restoration
>   - URL Launcher
> 
> The following plugins and options are hardcoded to off:
>   - Crash handler: Requires a newer version of sentry-native.
>   - File selector: Requires the zenity package.
>   - Firebase-core: Requires the firebase-cpp-sdk package.
>   - BUILD_TEXTURE_NAVI_EGL_ROUTING: Fails to build.
>   - BUILD_TEXTURE_NAVI_RENDER_EGL: Fales to build.
>   - BUILD_TEXTURE_TEST_EGL: Fails to build.

Thanks for the detailed commit log! It is a bit more descriptive than
explaining, but there is not much to explain, so OK. The part about the
hardcoded-off options *is* very a-propos, though. Thanks!

Still, I have a few questions, see below for the details, but here are
the few key points:
  - licensing terms to extend
  - inherited dependencies to propagate
  - is at least a client required, or can we build with none?
  - TLS-aware libcurl needed?
  - missing _DEPENDENCIES to add or explain
  - reduce verbosity of _CONF_OPTS where possible

Also, the following part, although interesting, is not really fit for a
commit log; it would have been better as a post-commit note, or in the
cover letter; it could even be used as the basis for a runtime test:

> This package has been tested on a x86_64 host with an AMD Ryzen 9 6900HS
> with Docker 24.0.5:
[--SNIP--]
> With the following defconfig:
[--SNIP--]
> The image is then booted using qemu with the following
> command:
[--SNIP--]
> After logging in, type:
>  - mkdir -p /tmp/sway && export XDG_RUNTIME_DIR=/tmp/sway && sway
>  - bring up a terminal with `windows key + return`
>  - Type `homescreen --b=/usr/share/flutter/gallery/release/`
[--SNIP--]

... up to here.

> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
[--SNIP--]
> diff --git a/package/ivi-homescreen/Config.in b/package/ivi-homescreen/Config.in
> new file mode 100644
> index 0000000000..b007ea47af
> --- /dev/null
> +++ b/package/ivi-homescreen/Config.in
> @@ -0,0 +1,167 @@

This file is big, so I'll chop off the parts that are OK, just to
concentrate on the key points (minor formatting issues like missing
empty lines are just ignored, and elided):

> +menuconfig BR2_PACKAGE_IVI_HOMESCREEN
> +	bool "ivi-homescreen"
> +	depends on BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_ARCH_SUPPORTS
> +	depends on BR2_PACKAGE_FLUTTER_ENGINE
> +	select BR2_PACKAGE_HOST_FLUTTER_SDK_BIN
> +	select BR2_PACKAGE_LIBXKBCOMMON
> +	select BR2_PACKAGE_WAYLAND
> +	select BR2_PACKAGE_WAYLAND_PROTOCOLS
> +	select BR2_PACKAGE_WAYLAND_UTILS

It's not obvious what dependencies are inherited from either
BR2_PACKAGE_FLUTTER_ENGINE or BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_ARCH_SUPPORTS,
so I would prefer they be duplicated, however, because then it is really
obvious.

It might seem superfluous, but with big graphic stacks, it's easy to get
lost, so at least the comment assesses the check was performed.

[--SNIP--]
> +comment "Clients"
> +
> +config BR2_PACKAGE_IVI_HOMESCREEN_XDG_CLIENT
> +	bool "xdg"
> +
> +config BR2_PACKAGE_IVI_HOMESCREEN_AGL_CLIENT
> +	bool "AGL"
> +
> +config BR2_PACKAGE_IVI_HOMESCREEN_IVI_SHELL
> +	bool "ivi-shell"

Should we ensure there is at least one client enabled, or does it still
make sense to build ivi-homescreen without any client?

If we need at least one, then we can do the usual dance (I arbitrarily
choose XDG as the default client, adapt if another one makes more
sense):

    menuconfig BR2_PACKAGE_IVI_HOMESCREEN
        bool "ivi-homescreen"
        select BR2_PACKAGE_IVI_HOMESCREEN_XDG_CLIENT if !BR2_PACKAGE_IVI_HOMESCREEN_HAS_CLIENT

    config BR2_PACKAGE_IVI_HOMESCREEN_HAS_CLIENT
        bool

    config BR2_PACKAGE_IVI_HOMESCREEN_XDG_CLIENT
        bool "xdg"

    config BR2_PACKAGE_IVI_HOMESCREEN_AGL_CLIENT
        bool "AGL"
        select BR2_PACKAGE_IVI_HOMESCREEN_HAS_CLIENT

    config BR2_PACKAGE_IVI_HOMESCREEN_IVI_SHELL
        bool "ivi-shell"
        select BR2_PACKAGE_IVI_HOMESCREEN_HAS_CLIENT

[--SNIP--]
> +comment "plugins with external dependencies"
> +config BR2_PACKAGE_IVI_HOMESCREEN_AUDIO_PLAYERS
> +	bool "Audio Players"
> +	select BR2_PACKAGE_GSTREAMER1

Again, it's not clear what the dependencies inherited via either
BR2_PACKAGE_FLUTTER_ENGINE or BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_ARCH_SUPPORTS
are.

> +	select BR2_PACKAGE_GST1_PLUGINS_BASE
> +	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_ALSA
> +	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIOCONVERT
> +	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIORESAMPLE
> +	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VOLUME
> +
> +config BR2_PACKAGE_IVI_HOMESCREEN_FLUTTER_SECURE_STORAGE_PLUGIN
> +	bool "Flutter Secure Storage"
> +	select BR2_PACKAGE_LIBSECRET
> +
> +config BR2_PACKAGE_IVI_HOMESCREEN_GOOGLE_SIGN_IN_PLUGIN
> +	bool "Google Sign In manager"
> +	select BR2_PACKAGE_LIBCURL

Doesn't that also need an SSL/TLS capable libcurl? If so, then select
BR2_PACKAGE_LIBCURL_FORCE_TLS, and look at the comment for that option.

[--SNIP--]
> +config BR2_PACKAGE_IVI_HOMESCREEN_OPENGL_TEXTURE_PLUGIN
> +	bool "OpenGL Texture"
> +	depends on BR2_PACKAGE_HAS_LIBEGL
> +	select BR2_PACKAGE_IVI_HOMESCREEN_EGL_TEXTURE

BR2_PACKAGE_IVI_HOMESCREEN_EGL_TEXTURE is defined nowhere.

> +comment "OpenGL texture plugin needs an EGL backend"
> +	depends on !BR2_PACKAGE_HAS_LIBEGL
> +
> +endif # BR2_PACKAGE_IVI_HOMESCREEN
> +
> +comment "flutter-auto needs flutter-engine"

s/flutter-auto/ivi-homescreen/

[--SNIP--]
> diff --git a/package/ivi-homescreen/ivi-homescreen.mk b/package/ivi-homescreen/ivi-homescreen.mk
> new file mode 100644
> index 0000000000..760390c125
> --- /dev/null
> +++ b/package/ivi-homescreen/ivi-homescreen.mk
> @@ -0,0 +1,245 @@
> +################################################################################
> +#
> +# ivi-homescreen
> +#
> +################################################################################
> +
> +IVI_HOMESCREEN_VERSION = 5ab78a19e95c88cc5d6b173ab1260a211e78cf0a
> +IVI_HOMESCREEN_SITE = https://github.com/toyota-connected/ivi-homescreen.git
> +IVI_HOMESCREEN_SITE_METHOD = git
> +IVI_HOMESCREEN_LICENSE = Apache-2.0
> +IVI_HOMESCREEN_LICENSE_FILES = LICENSE

The licensing is going to be a bit more complex: ivi-homescreen bundles
a few third-parties (in the aptly named third_party/ top-level
directory); I quickly had a look, and they have various other licensing
terms:

    third_party/agl/protocol/               MIT
    third_party/asio-1-28-1/asio/           BSL-1.0

It also has a (partial?) flutter copy, which also bundles a few
third-parties of its own:

    third_party/flutter/
    third_party/flutter/third_party/rapidjson/include/rapidjson/    MIT
    third_party/flutter/third_party/dart/runtime/include/           BSD-style

Note that one refers to a LICENSE file, which is missing.

    third_party/googletest/                 BSD-3c
    third_party/sanitizers-cmake/           MIT
    third_party/spdlog-1.12.0/              MIT
    third_party/weston/protocol/            MIT

The above is not exhaustive, so more research is needed.

[--SNIP--]
> +ifeq ($(BR2_PACKAGE_HAS_LIBEGL),y)
> +IVI_HOMESCREEN_CONF_OPTS += -DBUILD_BACKEND_WAYLAND_EGL=ON

Why is there no dependency on libegl?

> +else
> +IVI_HOMESCREEN_CONF_OPTS += -DBUILD_BACKEND_WAYLAND_EGL=OFF
> +endif
> 
> +ifeq ($(BR2_PACKAGE_IVI_HOMESCREEN_EGL_TRANSPARENCY),y)
> +IVI_HOMESCREEN_CONF_OPTS += -DBUILD_EGL_TRANSPARENCY=ON
> +else
> +IVI_HOMESCREEN_CONF_OPTS += -DBUILD_EGL_TRANSPARENCY=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_IVI_HOMESCREEN_EGL_ENABLE_3D),y)
> +IVI_HOMESCREEN_CONF_OPTS += -DBUILD_EGL_ENABLE_3D=ON
> +else
> +IVI_HOMESCREEN_CONF_OPTS += -DBUILD_EGL_ENABLE_3D=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_IVI_HOMESCREEN_EGL_MULTISAMPLE),y)
> +IVI_HOMESCREEN_CONF_OPTS += -DBUILD_EGL_ENABLE_MULTISAMPLE=ON
> +else
> +IVI_HOMESCREEN_CONF_OPTS += -DBUILD_EGL_ENABLE_MULTISAMPLE=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_MESA3D_VULKAN_DRIVER),y)
> +IVI_HOMESCREEN_CONF_OPTS += -DBUILD_BACKEND_WAYLAND_VULKAN=ON

Why is a dependency on mesa3d not needed here?

> +else
> +IVI_HOMESCREEN_CONF_OPTS += -DBUILD_BACKEND_WAYLAND_VULKAN=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBDRM),y)
> +IVI_HOMESCREEN_CONF_OPTS += -DBUILD_BACKEND_WAYLAND_DRM=ON

Ditto: don't we need a dependency on libdrm?

> +else
> +IVI_HOMESCREEN_CONF_OPTS += -DBUILD_BACKEND_WAYLAND_DRM=OFF
> +endif

Otherwise, all those ifeq-else-endif blocks are a bit verbose. I know
we use such constructs, but there is an alternative solution that is
less verbose, and quite fitting when there is no dependency to add with
the symbol:

    IVI_HOMESCREEN_CONF_OPTS += \
        -DBUILD_EGL_TRANSPARENCY=$(if $(BR2_PACKAGE_IVI_HOMESCREEN_EGL_TRANSPARENCY),ON,OFF) \
        -DBUILD_EGL_ENABLE_3D=$(if $(BR2_PACKAGE_IVI_HOMESCREEN_EGL_ENABLE_3D),ON,OFF) \
        -DBUILD_EGL_ENABLE_MULTISAMPLE=$(if $(BR2_PACKAGE_IVI_HOMESCREEN_EGL_MULTISAMPLE),ON,OFF) \
        -DENABLE_XDG_CLIENT=$(if $(BR2_PACKAGE_IVI_HOMESCREEN_XDG_CLIENT),ON,OFF) \
        -DENABLE_DLT=$(if $(BR2_PACKAGE_IVI_HOMESCREEN_DLT),ON,OFF) \
        ...

And keep using ifeq-else-endif blocks when there is an actual dependency
to add.

(The big users of such constructs are opencv3 and opencv4, but there are
a few others as well.)

Thank you for working on such complex packages! There is nothing really
major above, and I could have fixed most when applying, except for a few
questions I couldn't easily find the answer for.

Regards,
Yann E. MORIN.

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
