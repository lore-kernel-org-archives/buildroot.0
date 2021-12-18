Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10F82C433EF
	for <buildroot@archiver.kernel.org>; Sat, 18 Dec 2021 22:05:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1A5560B1B;
	Sat, 18 Dec 2021 22:05:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7988Sde1QEeG; Sat, 18 Dec 2021 22:05:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 616E660B21;
	Sat, 18 Dec 2021 22:05:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B70911BF23C
 for <buildroot@lists.busybox.net>; Sat, 18 Dec 2021 22:05:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A580460B21
 for <buildroot@lists.busybox.net>; Sat, 18 Dec 2021 22:05:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L9ZjGOpA2ipp for <buildroot@lists.busybox.net>;
 Sat, 18 Dec 2021 22:05:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D368560B1B
 for <buildroot@buildroot.org>; Sat, 18 Dec 2021 22:05:23 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4cb3:149f:d03e:db5a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id A93AE5FF10;
 Sat, 18 Dec 2021 23:05:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1639865121;
 bh=0mK8jLuZGeOTT4GZ5m2tX3gCEpKayhvXus8YrmE7WqU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=O1o8BAWAdf2a71cnyNIWpgaB+2IrfxRVdc75ltmFbCqIIDIZE1adf2Y+zjyrPP/sv
 3Jsm+f/Hb49WdEWdxFDFm2SG7RaaxujUNWSti0zmmdKgKh6Zewc1uc7q7pO1wHs37Y
 WJQZWbfMu81XY4tB2JxiTZRwXmMMXCwfvaE53HZzLVS6a1roNK2yuPuMP5ZU8badot
 ll5DG1kkiJBDsXraqdeYfVqhKIkRdhY7OsiYQwZDwHXOsHLNrp9zI0nXnwk7l99O9b
 RqV0TMTmFINEtQKGogqc3H2gNrKfY27eoJ9z0yPtWoKK+vLACfRSa9YmX/i1vcJo1U
 Y3nXCUdBxnhpQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 18 Dec 2021 23:05:08 +0100
Date: Sat, 18 Dec 2021 23:05:08 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211218220508.GU2603@scaer>
References: <20211217200943.35061-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211217200943.35061-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/pango: needs host gcc >= 4.9
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
Cc: Samuel Martin <s.martin49@gmail.com>, Romain Naour <romain.naour@gmail.com>,
 Simon Dawson <spdawson@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

The title refers to pango, but the commit log refers to harfbuzz...
I am confused...

pango has no dependency on host-harfbuzz, though, and harfbuzz has no
dependency on host-harfbuzz...

Also, the failing build has host-harfbuzz because of that dependency
chain:

    host-image-magick -> host-librsvg -> host-pango -> host-harfbuzz

Did I miss something?

Regards,
Yann E. MORIN.

On 2021-12-17 21:09 +0100, Fabrice Fontaine spake thusly:
> host gcc >= 4.9 is needed since bump of harfbuzz to version 3.1.2 in
> commit 6861933d22006fbe8c961a41506beac826881f33 to avoid the following
> build failure:
> 
> In file included from ../src/hb-serialize.hh:36:0,
>                  from ../src/hb-machinery.hh:37,
>                  from ../src/hb-common.cc:30:
> ../src/hb-map.hh:67:18: error: 'is_trivially_copyable' is not a member of 'std'
>    static_assert (std::is_trivially_copyable<K>::value, "");
>                   ^
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/60989ab63fc9d1c34c717d8b49497ca4db098515
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/cwiid/Config.in                        | 1 +
>  package/enlightenment/Config.in                | 5 +++--
>  package/gstreamer1/gst1-plugins-bad/Config.in  | 6 ++++--
>  package/gstreamer1/gst1-plugins-base/Config.in | 6 ++++--
>  package/libfm/Config.in                        | 4 +++-
>  package/libgtk2/Config.in                      | 4 +++-
>  package/libgtk3/Config.in                      | 4 +++-
>  package/librsvg/Config.in                      | 5 +++--
>  package/openbox/Config.in                      | 5 +++--
>  package/pango/Config.in                        | 5 +++--
>  package/pcmanfm/Config.in                      | 4 +++-
>  package/pinentry/Config.in                     | 4 +++-
>  package/rrdtool/Config.in                      | 6 ++++--
>  package/xscreensaver/Config.in                 | 5 +++--
>  14 files changed, 43 insertions(+), 21 deletions(-)
> 
> diff --git a/package/cwiid/Config.in b/package/cwiid/Config.in
> index 6ae2ac9405..dff572f1f0 100644
> --- a/package/cwiid/Config.in
> +++ b/package/cwiid/Config.in
> @@ -19,6 +19,7 @@ config BR2_PACKAGE_CWIID_WMGUI
>  	bool "wmgui"
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libgtk2 -> pango -> harfbuzz
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libgtk2 -> pango -> harfbuzz
> +	depends on BR2_HOST_GCC_AT_LEAST_4_9 # libgtk2 -> pango -> host-harfbuzz
>  	depends on BR2_PACKAGE_XORG7 # libgtk2
>  	depends on BR2_USE_WCHAR # libgtk2 -> libglib2
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # libgtk2 -> libglib2
> diff --git a/package/enlightenment/Config.in b/package/enlightenment/Config.in
> index cd2b8cfe54..762768a900 100644
> --- a/package/enlightenment/Config.in
> +++ b/package/enlightenment/Config.in
> @@ -15,6 +15,7 @@ config BR2_PACKAGE_ENLIGHTENMENT
>  	# libevas-generic-loaders-svg -> librsvg -> pango -> harfbuzz
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
> +	depends on BR2_HOST_GCC_AT_LEAST_4_9
>  	select BR2_PACKAGE_EFL_X_XLIB
>  	select BR2_PACKAGE_EFL_EEZE
>  	select BR2_PACKAGE_EFL_JPEG # needed at runtime by enlightenment_start
> @@ -29,10 +30,10 @@ config BR2_PACKAGE_ENLIGHTENMENT
>  
>  	  http://www.enlightenment.org/
>  
> -comment "enlightenment needs udev /dev management and a toolchain w/ wchar, C++, threads, gcc >= 4.9"
> +comment "enlightenment needs udev /dev management and a toolchain w/ wchar, C++, threads, gcc >= 4.9, host gcc >= 4.9"
>  	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
>  	depends on BR2_PACKAGE_EFL && BR2_PACKAGE_XORG7 && BR2_USE_MMU
>  	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || \
>  		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
> -		!BR2_PACKAGE_HAS_UDEV
> +		!BR2_HOST_GCC_AT_LEAST_4_9 || !BR2_PACKAGE_HAS_UDEV
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4
> diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
> index d678e7eb14..acdb2f6b9e 100644
> --- a/package/gstreamer1/gst1-plugins-bad/Config.in
> +++ b/package/gstreamer1/gst1-plugins-bad/Config.in
> @@ -564,14 +564,16 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_RSVG
>  	depends on BR2_INSTALL_LIBSTDCPP # librsvg -> pango
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # librsvg -> pango -> harfbuzz
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # librsvg -> pango -> harfbuzz
> +	depends on BR2_HOST_GCC_AT_LEAST_4_9 # librsvg -> pango -> host-harfbuzz
>  	select BR2_PACKAGE_LIBRSVG
>  	help
>  	  RSVG plugin library
>  
> -comment "rsvg plugin needs a toolchain w/ C++, gcc >= 4.9"
> +comment "rsvg plugin needs a toolchain w/ C++, gcc >= 4.9, host gcc >= 4.9"
>  	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
>  	depends on !BR2_INSTALL_LIBSTDCPP || \
> -		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
> +		!BR2_HOST_GCC_AT_LEAST_4_9
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>  
>  config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SBC
> diff --git a/package/gstreamer1/gst1-plugins-base/Config.in b/package/gstreamer1/gst1-plugins-base/Config.in
> index 7ca94d7dc4..d28343eaeb 100644
> --- a/package/gstreamer1/gst1-plugins-base/Config.in
> +++ b/package/gstreamer1/gst1-plugins-base/Config.in
> @@ -294,13 +294,15 @@ config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_PANGO
>  	depends on BR2_INSTALL_LIBSTDCPP # pango -> freetype
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango -> harfbuzz
> +	depends on BR2_HOST_GCC_AT_LEAST_4_9 # pango -> host-harfbuzz
>  	select BR2_PACKAGE_PANGO
>  	help
>  	  Pango-based text rendering and overlay
>  
> -comment "pango plugin needs a toolchain w/ C++, gcc >= 4.9"
> +comment "pango plugin needs a toolchain w/ C++, gcc >= 4.9, host gcc >= 4.9"
>  	depends on !BR2_INSTALL_LIBSTDCPP || \
> -		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
> +		!BR2_HOST_GCC_AT_LEAST_4_9
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>  
>  config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_THEORA
> diff --git a/package/libfm/Config.in b/package/libfm/Config.in
> index e78bc99b76..227a65cde6 100644
> --- a/package/libfm/Config.in
> +++ b/package/libfm/Config.in
> @@ -7,6 +7,7 @@ config BR2_PACKAGE_LIBFM
>  	depends on BR2_INSTALL_LIBSTDCPP # libgtk2
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libgtk2 -> pango -> harfbuzz
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libgtk2 -> pango -> harfbuzz
> +	depends on BR2_HOST_GCC_AT_LEAST_4_9 # libgtk2 -> pango -> host-harfbuzz
>  	select BR2_PACKAGE_CAIRO
>  	select BR2_PACKAGE_LIBGLIB2
>  	select BR2_PACKAGE_LIBGTK2 if !BR2_PACKAGE_LIBGTK3_X11
> @@ -22,9 +23,10 @@ config BR2_PACKAGE_LIBFM
>  
>  	  http://wiki.lxde.org/en/Libfm
>  
> -comment "libfm needs X.org and a toolchain w/ wchar, threads, C++, gcc >= 4.9"
> +comment "libfm needs X.org and a toolchain w/ wchar, threads, C++, gcc >= 4.9, host gcc >= 4.9"
>  	depends on BR2_USE_MMU
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>  	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
>  		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
> +		!BR2_HOST_GCC_AT_LEAST_4_9 || \
>  		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_PACKAGE_XORG7
> diff --git a/package/libgtk2/Config.in b/package/libgtk2/Config.in
> index c75c37fb63..b78cc72a5c 100644
> --- a/package/libgtk2/Config.in
> +++ b/package/libgtk2/Config.in
> @@ -7,6 +7,7 @@ config BR2_PACKAGE_LIBGTK2
>  	depends on BR2_INSTALL_LIBSTDCPP # pango
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango -> harfbuzz
> +	depends on BR2_HOST_GCC_AT_LEAST_4_9 # pango -> host-harfbuzz
>  	select BR2_PACKAGE_ATK
>  	select BR2_PACKAGE_CAIRO
>  	select BR2_PACKAGE_CAIRO_PS
> @@ -34,10 +35,11 @@ config BR2_PACKAGE_LIBGTK2_DEMO
>  
>  endif
>  
> -comment "libgtk2 needs a toolchain w/ wchar, threads, C++, gcc >= 4.9"
> +comment "libgtk2 needs a toolchain w/ wchar, threads, C++, gcc >= 4.9, host gcc >= 4.9"
>  	depends on BR2_USE_MMU
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>  	depends on BR2_PACKAGE_XORG7
>  	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
>  		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
> +		!BR2_HOST_GCC_AT_LEAST_4_9 || \
>  		!BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/libgtk3/Config.in b/package/libgtk3/Config.in
> index bc8cacd9f5..df26163018 100644
> --- a/package/libgtk3/Config.in
> +++ b/package/libgtk3/Config.in
> @@ -1,9 +1,10 @@
> -comment "libgtk3 needs a toolchain w/ wchar, threads, C++, gcc >= 4.9"
> +comment "libgtk3 needs a toolchain w/ wchar, threads, C++, gcc >= 4.9, host gcc >= 4.9"
>  	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
>  	depends on BR2_USE_MMU
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>  	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
>  		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
> +		!BR2_HOST_GCC_AT_LEAST_4_9 || \
>  		!BR2_TOOLCHAIN_HAS_THREADS
>  
>  comment "libgtk3 needs an OpenGL or an OpenGL-EGL/wayland backend"
> @@ -21,6 +22,7 @@ config BR2_PACKAGE_LIBGTK3
>  	depends on BR2_INSTALL_LIBSTDCPP # pango
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango -> harfbuzz
> +	depends on BR2_HOST_GCC_AT_LEAST_4_9 # pango -> host-harfbuzz
>  	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND || \
>  		BR2_PACKAGE_HAS_LIBGL
>  	select BR2_PACKAGE_ATK
> diff --git a/package/librsvg/Config.in b/package/librsvg/Config.in
> index 270b524b37..2bf04e2c80 100644
> --- a/package/librsvg/Config.in
> +++ b/package/librsvg/Config.in
> @@ -7,6 +7,7 @@ config BR2_PACKAGE_LIBRSVG
>  	depends on BR2_INSTALL_LIBSTDCPP # pango
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango -> harfbuzz
> +	depends on BR2_HOST_GCC_AT_LEAST_4_9 # pango -> host-harfbuzz
>  	select BR2_PACKAGE_CAIRO
>  	select BR2_PACKAGE_CAIRO_PNG
>  	select BR2_PACKAGE_CAIRO_SCRIPT
> @@ -21,10 +22,10 @@ config BR2_PACKAGE_LIBRSVG
>  
>  	  https://wiki.gnome.org/Projects/LibRsvg
>  
> -comment "librsvg needs a toolchain w/ wchar, threads, C++, gcc >= 4.9"
> +comment "librsvg needs a toolchain w/ wchar, threads, C++, gcc >= 4.9, host gcc >= 4.9"
>  	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
>  	depends on BR2_USE_MMU
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>  	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
>  		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
> -		!BR2_INSTALL_LIBSTDCPP
> +		!BR2_HOST_GCC_AT_LEAST_4_9 || !BR2_INSTALL_LIBSTDCPP
> diff --git a/package/openbox/Config.in b/package/openbox/Config.in
> index e042ed2b48..f971e7d39d 100644
> --- a/package/openbox/Config.in
> +++ b/package/openbox/Config.in
> @@ -6,6 +6,7 @@ config BR2_PACKAGE_OPENBOX
>  	depends on BR2_USE_WCHAR # glib2
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango -> harfbuzz
> +	depends on BR2_HOST_GCC_AT_LEAST_4_9 # pango -> host-harfbuzz
>  	depends on BR2_INSTALL_LIBSTDCPP # pango -> freetype
>  	select BR2_PACKAGE_LIBGLIB2
>  	select BR2_PACKAGE_LIBXML2
> @@ -20,10 +21,10 @@ config BR2_PACKAGE_OPENBOX
>  
>  	  http://openbox.org
>  
> -comment "openbox needs a toolchain w/ C++, threads, wchar, gcc >= 4.9"
> +comment "openbox needs a toolchain w/ C++, threads, wchar, gcc >= 4.9, host gcc >= 4.9"
>  	depends on BR2_USE_MMU
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>  	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
>  		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
> -		!BR2_INSTALL_LIBSTDCPP
> +		!BR2_HOST_GCC_AT_LEAST_4_9 || !BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_PACKAGE_XORG7
> diff --git a/package/pango/Config.in b/package/pango/Config.in
> index e2b2e7fe2b..94bc0893d2 100644
> --- a/package/pango/Config.in
> +++ b/package/pango/Config.in
> @@ -6,6 +6,7 @@ config BR2_PACKAGE_PANGO
>  	depends on BR2_INSTALL_LIBSTDCPP # freetype support
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # harfbuzz
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # harfbuzz
> +	depends on BR2_HOST_GCC_AT_LEAST_4_9 # host-harfbuzz
>  	select BR2_PACKAGE_LIBGLIB2
>  	select BR2_PACKAGE_LIBFRIBIDI
>  	select BR2_PACKAGE_EXPAT
> @@ -24,9 +25,9 @@ config BR2_PACKAGE_PANGO
>  
>  	  https://pango.gnome.org/
>  
> -comment "pango needs a toolchain w/ wchar, threads, C++, gcc >= 4.9"
> +comment "pango needs a toolchain w/ wchar, threads, C++, gcc >= 4.9, host gcc >= 4.9"
>  	depends on BR2_USE_MMU
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>  	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
>  		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
> -		!BR2_INSTALL_LIBSTDCPP
> +		!BR2_HOST_GCC_AT_LEAST_4_9 || !BR2_INSTALL_LIBSTDCPP
> diff --git a/package/pcmanfm/Config.in b/package/pcmanfm/Config.in
> index 73b8c7c04c..acf0c516a0 100644
> --- a/package/pcmanfm/Config.in
> +++ b/package/pcmanfm/Config.in
> @@ -7,6 +7,7 @@ config BR2_PACKAGE_PCMANFM
>  	depends on BR2_INSTALL_LIBSTDCPP # libgtk2
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libgtk2 -> pango -> harfbuzz
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libgtk2 -> pango -> harfbuzz
> +	depends on BR2_HOST_GCC_AT_LEAST_4_9 # libgtk2 -> pango -> host-harfbuzz
>  	select BR2_PACKAGE_LIBFM
>  	select BR2_PACKAGE_MENU_CACHE
>  	select BR2_PACKAGE_LIBGLIB2
> @@ -18,10 +19,11 @@ config BR2_PACKAGE_PCMANFM
>  
>  	  http://wiki.lxde.org/en/PCManFM
>  
> -comment "pcmanfm needs a toolchain w/ wchar, threads, C++, gcc >= 4.9"
> +comment "pcmanfm needs a toolchain w/ wchar, threads, C++, gcc >= 4.9, host gcc >= 4.9"
>  	depends on BR2_USE_MMU
>  	depends on BR2_PACKAGE_XORG7
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>  	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
>  		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
> +		!BR2_HOST_GCC_AT_LEAST_4_9 || \
>  		!BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/pinentry/Config.in b/package/pinentry/Config.in
> index 3f005f8c58..cd222d5714 100644
> --- a/package/pinentry/Config.in
> +++ b/package/pinentry/Config.in
> @@ -55,16 +55,18 @@ config BR2_PACKAGE_PINENTRY_GTK2
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libgtk2 -> pango -> harfbuzz
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libgtk2 -> pango -> harfbuzz
> +	depends on BR2_HOST_GCC_AT_LEAST_4_9 # libgtk2 -> pango -> host-harfbuzz
>  	select BR2_PACKAGE_LIBGTK2
>  	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
>  	help
>  	  The pinentry-gtk2 tool
>  
> -comment "pinentry-gtk2 needs X and a toolchain w/ wchar, threads, C++, gcc >= 4.9"
> +comment "pinentry-gtk2 needs X and a toolchain w/ wchar, threads, C++, gcc >= 4.9, host gcc >= 4.9"
>  	depends on BR2_USE_MMU
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>  	depends on !BR2_PACKAGE_XORG7 || !BR2_USE_WCHAR || \
>  		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
> +		!BR2_HOST_GCC_AT_LEAST_4_9 || \
>  		!BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
>  
>  config BR2_PACKAGE_PINENTRY_QT5
> diff --git a/package/rrdtool/Config.in b/package/rrdtool/Config.in
> index 5ffdc92618..525b6744ed 100644
> --- a/package/rrdtool/Config.in
> +++ b/package/rrdtool/Config.in
> @@ -17,6 +17,7 @@ config BR2_PACKAGE_RRDTOOL_RRDGRAPH
>  	default y
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango -> harfbuzz
> +	depends on BR2_HOST_GCC_AT_LEAST_4_9 # pango -> host-harfbuzz
>  	depends on BR2_INSTALL_LIBSTDCPP # freetype support from pango
>  	select BR2_PACKAGE_CAIRO
>  	select BR2_PACKAGE_CAIRO_PDF
> @@ -28,9 +29,10 @@ config BR2_PACKAGE_RRDTOOL_RRDGRAPH
>  	  This enables the graphing capabilities ('rrdgraph').
>  	  Without this it will only act as a database backend.
>  
> -comment "rrd_graph support needs a toolchain w/ C++, gcc >= 4.9"
> +comment "rrd_graph support needs a toolchain w/ C++, gcc >= 4.9, host gcc >= 4.9"
>  	depends on !BR2_INSTALL_LIBSTDCPP || \
> -		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
> +		!BR2_HOST_GCC_AT_LEAST_4_9
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>  
>  endif
> diff --git a/package/xscreensaver/Config.in b/package/xscreensaver/Config.in
> index 787c3130ae..0a6ddbc74a 100644
> --- a/package/xscreensaver/Config.in
> +++ b/package/xscreensaver/Config.in
> @@ -7,6 +7,7 @@ config BR2_PACKAGE_XSCREENSAVER
>  	depends on BR2_USE_MMU # gdk-pixbuf, libgtk2 -> glib2
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libgtk2 -> pango -> harfbuzz
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libgtk2 -> pango -> harfbuzz
> +	depends on BR2_HOST_GCC_AT_LEAST_4_9 # libgtk2 -> pango -> host-harfbuzz
>  	select BR2_PACKAGE_GDK_PIXBUF
>  	select BR2_PACKAGE_LIBGLU if BR2_PACKAGE_HAS_LIBGL
>  	select BR2_PACKAGE_LIBGTK2
> @@ -25,10 +26,10 @@ config BR2_PACKAGE_XSCREENSAVER
>  
>  	  http://www.jwz.org/xscreensaver/
>  
> -comment "xscreensaver needs a toolchain w/ wchar, C++, threads, gcc >= 4.9"
> +comment "xscreensaver needs a toolchain w/ wchar, C++, threads, gcc >= 4.9, host gcc >= 4.9"
>  	depends on BR2_PACKAGE_XORG7
>  	depends on BR2_USE_MMU
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>  	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
>  		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
> -		!BR2_USE_WCHAR
> +		!BR2_HOST_GCC_AT_LEAST_4_9 || !BR2_USE_WCHAR
> -- 
> 2.33.0
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
