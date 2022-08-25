Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3125C04AA5
	for <buildroot@archiver.kernel.org>; Thu, 25 Aug 2022 08:41:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27E27833AE;
	Thu, 25 Aug 2022 08:41:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 27E27833AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id luS5ZTdmhzQs; Thu, 25 Aug 2022 08:41:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8239983396;
	Thu, 25 Aug 2022 08:41:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8239983396
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B31EF1BF37C
 for <buildroot@lists.busybox.net>; Thu, 25 Aug 2022 08:41:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8AE4F41834
 for <buildroot@lists.busybox.net>; Thu, 25 Aug 2022 08:41:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8AE4F41834
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XgJIVJMuJF_A for <buildroot@lists.busybox.net>;
 Thu, 25 Aug 2022 08:41:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B74241832
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4B74241832
 for <buildroot@buildroot.org>; Thu, 25 Aug 2022 08:41:47 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:bf8e:81f2:3c80:6fd3])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id AE6C513F8B3;
 Thu, 25 Aug 2022 10:41:40 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 25 Aug 2022 10:41:40 +0200
Date: Thu, 25 Aug 2022 10:41:40 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Jesse Van Gavere <jesseevg@gmail.com>
Message-ID: <20220825084140.GC25468@scaer>
References: <20220825073951.3920874-1-jesseevg@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220825073951.3920874-1-jesseevg@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661416903;
 bh=McRIgyYq0LG35BfRBki9znr85ilcS5TCzLRsgkEqVrM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=K7LTjffjn4N0R6K1xdESnZpwchUKqgd5jJiGyjGJfSrIkrLQhRGG+Kmnm0P5u/iH/
 i8RKG40yMJSdD2zZbySdL3AkoS6PA+zI6tvami7nrGumiSDPQ+ny8azDQTqT3O/mlm
 ZUsox5uproeL/vJPqJbTHsf/DVsrsLws9IBEzmxVhVES9kvSQSkGtphJGUD40NDuqu
 H+3O9ieYAizka0vfpkbqbh55hDuvXM+UrASOYtxPlJVAC4R+dd/Rg+kEYzu4ytkjD+
 LLvrb/xPL8yi/TkEzqbTxLSkAOpTpstSQrqetBYNTJlbss/Zr4rcLOPQtPbLU0Q2cf
 GpyXxL/oiiRWA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=K7LTjffj
Subject: Re: [Buildroot] [PATCH 1/1] package/qt6/qt6base: extend qt6
 configuration
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Jesse, All,

On 2022-08-25 09:39 +0200, Jesse Van Gavere spake thusly:
> This will bring the qt6base functionality mostly on par with the qt5base
> package, building the package has been tested to the best of my ability
> and went without error as far as I can test.
> One bug to be noted is that for the GUI with fontconfig without harfbuzz
> support, this will produce incorrectly rendered text for version 6.3.1,
> see https://bugreports.qt.io/browse/QTBUG-101430
> I have however already verified that 6.3.2 and 6.4.0 will fix this issue
> so I've decided not to add harfbuzz as a fontconfig dependency as a
> version bump (which should be soon) will fix it.
> Also add the version hashes for qt6base.
> 
> Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>

Thank you for this patch, it's nice seeing the work being picked up!

However, this is a big patch. It would be nice if you could split it up
into smaller parts. For example, here's a suggestion shortlog:

    package/qt6base: add support for building examples
    package/qt6base: add support for network module
    package/qt6base: add support for concurrent module
    package/qt6base: add support for sql module w/ MySQL
    package/qt6base: add support for sql module w/ Postgre
    ...
    package/qt6base: add support for a custom config file

This is maybe a bit of work, but it will make it easier to review.

Regards,
Yann E. MORIN.

> ---
>  package/qt6/qt6base/Config.in    | 280 ++++++++++++++++++++++++++
>  package/qt6/qt6base/qt6base.hash |   9 +
>  package/qt6/qt6base/qt6base.mk   | 329 ++++++++++++++++++++++++++++++-
>  3 files changed, 616 insertions(+), 2 deletions(-)
>  create mode 100644 package/qt6/qt6base/qt6base.hash
> 
> diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
> index a489ce39fc..244e7d6760 100644
> --- a/package/qt6/qt6base/Config.in
> +++ b/package/qt6/qt6base/Config.in
> @@ -14,3 +14,283 @@ config BR2_PACKAGE_QT6BASE
>  	  QtWidgets, etc.
>  
>  	  http://qt.io
> +
> +if BR2_PACKAGE_QT6BASE
> +
> +config BR2_PACKAGE_QT6BASE_CUSTOM_CONF_OPTS
> +	string "Custom configuration options"
> +	help
> +	  Define custom qt6 configuration options which can be used to
> +	  enable or disable options not managed by buildroot. These
> +	  options are appended to the ones generated by buildroot and
> +	  passed to qt6base during configuration.
> +
> +	  Use cmake style '-Doption_name=ON' or -Doption_name=OFF'.
> +
> +config BR2_PACKAGE_QT6BASE_EXAMPLES
> +	bool "Compile and install examples (with code)"
> +	select BR2_PACKAGE_QT6BASE_NETWORK
> +	select BR2_PACKAGE_QT6BASE_XML
> +	help
> +	  If unsure, say N.
> +
> +config BR2_PACKAGE_QT6BASE_NETWORK
> +	bool "network module"
> +	help
> +	  This options enables the Qt6Network library.
> +
> +config BR2_PACKAGE_QT6BASE_CONCURRENT
> +	bool "concurrent module"
> +	help
> +	  This options enables the Qt6Concurrent library.
> +
> +config BR2_PACKAGE_QT6BASE_SQL
> +	bool "sql module"
> +	help
> +	  This options enables the Qt6Sql library.
> +
> +if BR2_PACKAGE_QT6BASE_SQL
> +config BR2_PACKAGE_QT6BASE_MYSQL
> +	bool "MySQL Plugin"
> +	depends on BR2_USE_MMU # mysql
> +	select BR2_PACKAGE_MYSQL
> +	select BR2_PACKAGE_NCURSES
> +	select BR2_PACKAGE_READLINE
> +	help
> +	  Build MySQL plugin
> +	  If unsure, say n.
> +
> +config BR2_PACKAGE_QT6BASE_PSQL
> +	bool "PostgreSQL Plugin"
> +	depends on BR2_USE_MMU # postgresql
> +	depends on !BR2_STATIC_LIBS
> +	depends on BR2_USE_WCHAR # postgresql
> +	select BR2_PACKAGE_POSTGRESQL
> +	help
> +	  Build PostgreSQL plugin
> +	  If unsure, say n.
> +
> +comment "PostgreSQL plugin needs a toolchain w/ wchar, dynamic library"
> +	depends on BR2_USE_MMU
> +	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR
> +
> +choice
> +	prompt "SQLite 3 support"
> +	default BR2_PACKAGE_QT6BASE_SQLITE_NONE
> +	help
> +	  Select SQLite support.
> +
> +config BR2_PACKAGE_QT6BASE_SQLITE_NONE
> +	bool "No sqlite support"
> +	help
> +	  Do not compile any kind of SQLite support.
> +
> +config BR2_PACKAGE_QT6BASE_SQLITE_QT
> +	bool "Qt SQLite"
> +	help
> +	  Use Qt bundled SQLite support.
> +
> +config BR2_PACKAGE_QT6BASE_SQLITE_SYSTEM
> +	bool "System SQLite"
> +	select BR2_PACKAGE_SQLITE
> +	select BR2_PACKAGE_SQLITE_ENABLE_COLUMN_METADATA
> +	help
> +	  Use system SQLite.
> +
> +endchoice
> +
> +endif
> +
> +config BR2_PACKAGE_QT6BASE_TEST
> +	bool "test module"
> +	help
> +	  This options enables the Qt6Test library.
> +
> +config BR2_PACKAGE_QT6BASE_XML
> +	bool "XML module"
> +	help
> +	  This options enables the Qt6Xml library.
> +
> +config BR2_PACKAGE_QT6BASE_GUI
> +	bool "gui module"
> +	select BR2_PACKAGE_FREETYPE
> +	# At least one graphic backend must be enabled, so enable
> +	# linuxfb if nothing is enabled.
> +	select BR2_PACKAGE_QT6BASE_LINUXFB if \
> +	       !BR2_PACKAGE_QT6BASE_DIRECTFB && \
> +	       !BR2_PACKAGE_QT6BASE_XCB && \
> +	       !BR2_PACKAGE_QT6BASE_EGLFS
> +	help
> +	  This option enables the Qt6Gui library.
> +
> +if BR2_PACKAGE_QT6BASE_GUI
> +
> +config BR2_PACKAGE_QT6BASE_WIDGETS
> +	bool "widgets module"
> +	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_QT6BASE_XCB
> +	help
> +	  This option enables the Qt6Widgets library.
> +
> +comment "OpenGL support needs an OpenGL-capable backend"
> +	depends on !BR2_PACKAGE_QT6_GL_AVAILABLE
> +
> +config BR2_PACKAGE_QT6BASE_OPENGL
> +	bool "OpenGL support"
> +	depends on BR2_PACKAGE_QT6_GL_AVAILABLE
> +	help
> +	  This option enables OpenGL support.
> +
> +if BR2_PACKAGE_QT6BASE_OPENGL
> +
> +choice
> +	prompt "OpenGL API"
> +	help
> +	  Select OpenGL API.
> +
> +config BR2_PACKAGE_QT6BASE_OPENGL_DESKTOP
> +	bool "Desktop OpenGL"
> +	depends on BR2_PACKAGE_HAS_LIBGL
> +	help
> +	  Use desktop OpenGL.
> +
> +config BR2_PACKAGE_QT6BASE_OPENGL_ES2
> +	bool "OpenGL ES 2.0+"
> +	depends on BR2_PACKAGE_HAS_LIBGLES
> +	help
> +	  Use OpenGL ES 2.0 and later versions.
> +
> +endchoice
> +
> +config BR2_PACKAGE_QT6BASE_OPENGL_LIB
> +	bool "opengl module"
> +	select BR2_PACKAGE_QT6BASE_WIDGETS
> +	help
> +	  This option enables the Qt6OpenGL library. This library
> +	  includes OpenGL support classes provided to ease porting
> +	  from Qt 4.x.
> +
> +endif
> +
> +config BR2_PACKAGE_QT6BASE_LINUXFB
> +	bool "linuxfb support"
> +
> +config BR2_PACKAGE_QT6BASE_DIRECTFB
> +	bool "directfb support"
> +	depends on BR2_PACKAGE_DIRECTFB
> +
> +comment "directfb backend available if directfb is enabled"
> +	depends on !BR2_PACKAGE_DIRECTFB
> +
> +config BR2_PACKAGE_QT6BASE_XCB
> +	bool "X.org XCB support"
> +	depends on BR2_PACKAGE_XORG7
> +	select BR2_PACKAGE_XLIB_LIBX11
> +	select BR2_PACKAGE_LIBXCB
> +	select BR2_PACKAGE_XCB_UTIL_IMAGE
> +	select BR2_PACKAGE_XCB_UTIL_KEYSYMS
> +	select BR2_PACKAGE_XCB_UTIL_RENDERUTIL
> +	select BR2_PACKAGE_XCB_UTIL_WM
> +	select BR2_PACKAGE_LIBXKBCOMMON
> +
> +comment "X.org XCB backend available if X.org is enabled"
> +	depends on !BR2_PACKAGE_XORG7
> +
> +config BR2_PACKAGE_QT6BASE_EGLFS
> +	bool "eglfs support"
> +	depends on BR2_PACKAGE_HAS_LIBEGL
> +	depends on BR2_PACKAGE_QT6_GL_AVAILABLE
> +	select BR2_PACKAGE_QT6BASE_OPENGL
> +
> +comment "eglfs backend available if OpenGL and EGL are enabled"
> +	depends on !BR2_PACKAGE_HAS_LIBEGL || !BR2_PACKAGE_QT6_GL_AVAILABLE
> +
> +config BR2_PACKAGE_QT6BASE_DEFAULT_QPA
> +	string "Default graphical platform"
> +	help
> +	  Choose the default platform abstraction to use for graphical
> +	  applications (e.g xcb, linuxfb, eglfs, ...). If this is
> +	  empty, the default for your architecture will be used
> +	  (usually this is eglfs).
> +
> +	  You can get a list of supported platforms by running a Qt
> +	  application with the option "-platform help" on your
> +	  target. You can choose a different platform at runtime with
> +	  the -platform option.
> +
> +config BR2_PACKAGE_QT6BASE_PRINTSUPPORT
> +	depends on BR2_PACKAGE_QT6BASE_WIDGETS
> +	def_bool y
> +
> +config BR2_PACKAGE_QT6BASE_FONTCONFIG
> +	bool "fontconfig support"
> +	select BR2_PACKAGE_FONTCONFIG
> +	help
> +	  This option enables Fontconfig and Freetype support using
> +	  the system fontconfig and freetype2 libraries.
> +
> +config BR2_PACKAGE_QT6BASE_HARFBUZZ
> +	bool "harfbuzz support"
> +	select BR2_PACKAGE_HARFBUZZ if \
> +		BR2_TOOLCHAIN_HAS_SYNC_4 && \
> +		BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
> +	help
> +	  This option enables HarfBuzz support (either system harfbuzz
> +	  if the toolchain supports __sync for 4 bytes, or the qt
> +	  provided one which avoids this dependency by using QAtomic).
> +
> +config BR2_PACKAGE_QT6BASE_GIF
> +	bool "GIF support"
> +	help
> +	  This compiles and installs the plugin for GIF reading support.
> +
> +config BR2_PACKAGE_QT6BASE_JPEG
> +	bool "JPEG support"
> +	select BR2_PACKAGE_JPEG
> +	help
> +	  This option enables JPEG support using the system libjpeg
> +	  library.
> +
> +config BR2_PACKAGE_QT6BASE_PNG
> +	bool "PNG support"
> +	select BR2_PACKAGE_LIBPNG
> +	help
> +	  This option enables PNG support using the system libpng
> +	  library.
> +
> +endif
> +
> +config BR2_PACKAGE_QT6BASE_SYSLOG
> +	bool "syslog support"
> +	help
> +	  Logs to the standard UNIX logging mechanism.
> +
> +config BR2_PACKAGE_QT6BASE_DBUS
> +	bool "DBus module"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_USE_MMU
> +	select BR2_PACKAGE_DBUS
> +	help
> +	  This option enables the D-Bus module.
> +
> +config BR2_PACKAGE_QT6BASE_ICU
> +	bool "Enable ICU support"
> +	depends on !BR2_BINFMT_FLAT # icu
> +	depends on BR2_HOST_GCC_AT_LEAST_4_9 # icu
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # icu
> +	select BR2_PACKAGE_ICU
> +	help
> +	  This option enables ICU support in Qt6. This is for example
> +	  needed for Qt6Webkit.
> +
> +comment "icu support needs a toolchain w/ gcc >= 4.9, host gcc >= 4.9"
> +	depends on !BR2_BINFMT_FLAT
> +	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
> +		!BR2_HOST_GCC_AT_LEAST_4_9
> +
> +config BR2_PACKAGE_QT6BASE_TSLIB
> +	bool "Enable Tslib support"
> +	select BR2_PACKAGE_TSLIB
> +	help
> +	  This options enables the Tslib plugin
> +
> +endif
> diff --git a/package/qt6/qt6base/qt6base.hash b/package/qt6/qt6base/qt6base.hash
> new file mode 100644
> index 0000000000..0f845ce38b
> --- /dev/null
> +++ b/package/qt6/qt6base/qt6base.hash
> @@ -0,0 +1,9 @@
> +# Hash from: https://download.qt.io/official_releases/qt/6.3/6.3.1/submodules/qtbase-everywhere-src-6.3.1.tar.xz.sha256
> +sha256  0a64421d9c2469c2c48490a032ab91d547017c9cc171f3f8070bc31888f24e03  qtbase-everywhere-src-6.3.1.tar.xz
> +# Hashes for license files:
> +sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
> +sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
> +sha256  0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d96cb819dd5652  LICENSE.GPL3-EXCEPT
> +sha256  88ec689407cf2df9b2eb5c45952564d51ce73c129a3bdffb15c0d2d161ad7558  LICENSE.LGPLv3
> +sha256  ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d  LICENSE.FDL
> +sha256  2a886915de4f296cdae5ed67064f86dba01d0c55286d86e8487f2a5caaf40216  src/3rdparty/harfbuzz-ng/COPYING
> diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
> index c67d94e193..439c644c30 100644
> --- a/package/qt6/qt6base/qt6base.mk
> +++ b/package/qt6/qt6base/qt6base.mk
> @@ -31,7 +31,27 @@ QT6BASE_CONF_OPTS = \
>  	-DFEATURE_system_doubleconversion=ON \
>  	-DFEATURE_system_pcre2=ON \
>  	-DFEATURE_system_zlib=ON \
> -	-DFEATURE_system_libb2=ON
> +	-DFEATURE_system_libb2=ON \
> +	-DQT_BUILD_TESTS=OFF
> +
> +QT6BASE_CONF_OPTS += -DFEATURE_sse2=$(if $(BR2_X86_CPU_HAS_SSE2),ON,OFF)
> +QT6BASE_CONF_OPTS += -DFEATURE_sse3=$(if $(BR2_X86_CPU_HAS_SSE3),ON,OFF)
> +QT6BASE_CONF_OPTS += -DFEATURE_sse4_1=$(if $(BR2_X86_CPU_HAS_SSE4),ON,OFF)
> +QT6BASE_CONF_OPTS += -DFEATURE_sse4_2=$(if $(BR2_X86_CPU_HAS_SSE42),ON,OFF)
> +QT6BASE_CONF_OPTS += -DFEATURE_ssse3=$(if $(BR2_X86_CPU_HAS_SSSE3),ON,OFF)
> +QT6BASE_CONF_OPTS += -DFEATURE_avx=$(if $(BR2_X86_CPU_HAS_AVX),ON,OFF)
> +QT6BASE_CONF_OPTS += -DFEATURE_avx2=$(if $(BR2_X86_CPU_HAS_AVX2),ON,OFF)
> +# no buildroot BR2_X86_CPU_HAS_AVX512 option yet
> +QT6BASE_CONF_OPTS += \
> +	-DFEATURE_avx512bw=OFF \
> +	-DFEATURE_avx512cd=OFF \
> +	-DFEATURE_avx512dq=OFF \
> +	-DFEATURE_avx512er=OFF \
> +	-DFEATURE_avx512f=OFF \
> +	-DFEATURE_avx512ifma=OFF \
> +	-DFEATURE_avx512pf=OFF \
> +	-DFEATURE_avx512vbmi=OFF \
> +	-DFEATURE_avx512vl=OFF
>  
>  define QT6BASE_BUILD_CMDS
>  	$(TARGET_MAKE_ENV) $(BR2_CMAKE) --build $(QT6BASE_BUILDDIR)
> @@ -65,7 +85,8 @@ HOST_QT6BASE_CONF_OPTS = \
>  	-DFEATURE_system_doubleconversion=ON \
>  	-DFEATURE_system_libb2=ON \
>  	-DFEATURE_system_pcre2=ON \
> -	-DFEATURE_system_zlib=ON
> +	-DFEATURE_system_zlib=ON \
> +	-DQT_BUILD_TESTS=OFF
>  
>  define HOST_QT6BASE_BUILD_CMDS
>  	$(HOST_MAKE_ENV) $(BR2_CMAKE) --build $(HOST_QT6BASE_BUILDDIR)
> @@ -75,5 +96,309 @@ define HOST_QT6BASE_INSTALL_CMDS
>  	$(HOST_MAKE_ENV) $(BR2_CMAKE) --install $(HOST_QT6BASE_BUILDDIR)
>  endef
>  
> +ifeq ($(BR2_ENABLE_DEBUG),y)
> +QT6BASE_CONF_OPTS += -DCMAKE_BUILD_TYPE=Debug
> +else
> +QT6BASE_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
> +endif
> +
> +ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
> +QT6BASE_CONF_OPTS += -DFEATURE_libudev=ON
> +QT6BASE_DEPENDENCIES += udev
> +else
> +QT6BASE_CONF_OPTS += -DFEATURE_libudev=OFF
> +endif
> +
> +# Qt6 SQL Plugins
> +ifeq ($(BR2_PACKAGE_QT6BASE_SQL),y)
> +QT6BASE_CONF_OPTS += -DFEATURE_sql=ON
> +QT6BASE_CONF_OPTS += -DFEATURE_sql_db2=OFF -DFEATURE_sql_ibase=OFF -DFEATURE_sql_oci=OFF -DFEATURE_sql_odbc=OFF
> +
> +ifeq ($(BR2_PACKAGE_QT6BASE_MYSQL),y)
> +QT6BASE_CONF_OPTS += -DFEATURE_sql_mysql=ON
> +QT6BASE_DEPENDENCIES += mysql
> +else
> +QT6BASE_CONF_OPTS += -DFEATURE_sql_mysql=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_QT6BASE_PSQL),y)
> +QT6BASE_CONF_OPTS += -DFEATURE_sql_psql=ON
> +QT6BASE_DEPENDENCIES += postgresql
> +else
> +QT6BASE_CONF_OPTS += -DFEATURE_sql_psql=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_QT6BASE_SQLITE_SYSTEM),y)
> +QT6BASE_CONF_OPTS += -DFEATURE_sql_sqlite=ON -DFEATURE_system_sqlite=ON
> +QT6BASE_DEPENDENCIES += sqlite
> +else ifeq ($(BR2_PACKAGE_QT6BASE_SQLITE_QT),y)
> +QT6BASE_CONF_OPTS += -DFEATURE_sql_sqlite=ON -DFEATURE_system_sqlite=OFF
> +else
> +QT6BASE_CONF_OPTS += -DFEATURE_sql_sqlite=OFF
> +endif
> +
> +else
> +QT6BASE_CONF_OPTS += -DFEATURE_sql=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_QT6BASE_GUI),y)
> +QT6BASE_CONF_OPTS += -DFEATURE_gui=ON -DFEATURE_freetype=ON
> +#QT6BASE_CONF_OPTS += -DFEATURE_opengles2=OFF -DFEATURE_opengles3=OFF -DFEATURE_opengles31=OFF -DFEATURE_opengles32=OFF -DFEATURE_gbm=OFF -DFEATURE_vnc=OFF -DFEATURE_sessionmanager=OFF
> +QT6BASE_DEPENDENCIES += freetype
> +QT6BASE_CONF_OPTS += -DFEATURE_vulkan=OFF
> +
> +ifeq ($(BR2_PACKAGE_QT6BASE_HARFBUZZ),y)
> +QT6BASE_CONF_OPTS += -DFEATURE_harfbuzz=ON
> +ifeq ($(BR2_TOOLCHAIN_HAS_SYNC_4),y)
> +# system harfbuzz in case __sync for 4 bytes is supported
> +QT6BASE_CONF_OPTS += -DQT_USE_BUNDLED_BundledHarfbuzz=OFF
> +QT6BASE_DEPENDENCIES += harfbuzz
> +else #BR2_TOOLCHAIN_HAS_SYNC_4
> +# qt harfbuzz otherwise (using QAtomic instead)
> +QT6BASE_CONF_OPTS += -DQT_USE_BUNDLED_BundledHarfbuzz=ON
> +QT6BASE_LICENSE += , MIT (harfbuzz)
> +QT6BASE_LICENSE_FILES += src/3rdparty/harfbuzz-ng/COPYING
> +endif
> +else
> +QT6BASE_CONF_OPTS += -DFEATURE_harfbuzz=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_QT6BASE_PNG),y)
> +QT6BASE_CONF_OPTS += -DFEATURE_png=ON -DFEATURE_system_png=ON
> +QT6BASE_DEPENDENCIES += libpng
> +else
> +QT6BASE_CONF_OPTS += -DFEATURE_png=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_QT6BASE_GIF),y)
> +QT6BASE_CONF_OPTS += -DFEATURE_gif=ON
> +else
> +QT6BASE_CONF_OPTS += -DFEATURE_gif=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_QT6BASE_JPEG),y)
> +QT6BASE_CONF_OPTS += -DFEATURE_jpeg=ON
> +QT6BASE_DEPENDENCIES += jpeg
> +else
> +QT6BASE_CONF_OPTS += -DFEATURE_jpeg=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_CUPS), y)
> +QT6BASE_CONF_OPTS += -DFEATURE_cups=ON
> +QT6BASE_DEPENDENCIES += cups
> +else
> +QT6BASE_CONF_OPTS += -DFEATURE_cups=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBDRM),y)
> +QT6BASE_CONF_OPTS += -DFEATURE_kms=ON
> +QT6BASE_DEPENDENCIES += libdrm
> +else
> +QT6BASE_CONF_OPTS += -DFEATURE_kms=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_QT6BASE_FONTCONFIG),y)
> +QT6BASE_CONF_OPTS += -DFEATURE_fontconfig=ON
> +QT6BASE_DEPENDENCIES += fontconfig
> +else
> +QT6BASE_CONF_OPTS += -DFEATURE_fontconfig=OFF
> +endif
> +
> +# Uses libgbm from mesa3d
> +ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_EGL),y)
> +QT6BASE_CONF_OPTS += -DFEATURE_gbm=ON
> +QT6BASE_DEPENDENCIES += mesa3d
> +else ifeq ($(BR2_PACKAGE_GCNANO_BINARIES),y)
> +QT6BASE_CONF_OPTS += -DFEATURE_gbm=ON
> +QT6BASE_DEPENDENCIES += gcnano-binaries
> +else ifeq ($(BR2_PACKAGE_TI_SGX_LIBGBM),y)
> +QT6BASE_CONF_OPTS += -DFEATURE_gbm=ON
> +QT6BASE_DEPENDENCIES += ti-sgx-libgbm
> +else ifeq ($(BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_WL),y)
> +QT6BASE_CONF_OPTS += -DFEATURE_gbm=ON
> +QT6BASE_DEPENDENCIES += imx-gpu-viv
> +else
> +QT6BASE_CONF_OPTS += -DFEATURE_gbm=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_QT6BASE_EGLFS),y)
> +QT6BASE_CONF_OPTS += -DFEATURE_eglfs=ON
> +QT6BASE_DEPENDENCIES += libegl
> +else
> +QT6BASE_CONF_OPTS += -DFEATURE_eglfs=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBINPUT),y)
> +QT6BASE_CONF_OPTS += -DFEATURE_libinput=ON
> +QT6BASE_DEPENDENCIES += libinput
> +else
> +QT6BASE_CONF_OPTS += -DFEATURE_libinput=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_QT6BASE_TSLIB),y)
> +QT6BASE_CONF_OPTS += -DFEATURE_tslib=ON
> +QT6BASE_DEPENDENCIES += tslib
> +else
> +QT6BASE_CONF_OPTS += -DFEATURE_tslib=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_QT6BASE_OPENGL_DESKTOP),y)
> +QT6BASE_CONF_OPTS += -DFEATURE_opengl=ON -DFEATURE_opengl_desktop=ON
> +QT6BASE_DEPENDENCIES += libgl
> +else ifeq ($(BR2_PACKAGE_QT6BASE_OPENGL_ES2),y)
> +QT6BASE_CONF_OPTS += -DFEATURE_opengl=ON -DFEATURE_opengles2=ON
> +QT6BASE_DEPENDENCIES += libgles
> +else
> +QT6BASE_CONF_OPTS += -DFEATURE_opengl=OFF -DINPUT_opengl=no
> +endif
> +
> +# only enable gtk support if libgtk3 X11 backend is enabled
> +ifeq ($(BR2_PACKAGE_LIBGTK3)$(BR2_PACKAGE_LIBGTK3_X11),yy)
> +QT6BASE_CONF_OPTS += -DFEATURE_gtk3=ON
> +QT6BASE_DEPENDENCIES += libgtk3
> +else
> +QT6BASE_CONF_OPTS += -DFEATURE_gtk3=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_QT6BASE_WIDGETS),y)
> +QT6BASE_CONF_OPTS += -DFEATURE_widgets=ON
> +ifeq ($(BR2_PACKAGE_QT6BASE_LINUXFB),y)
> +QT6BASE_CONF_OPTS += -DFEATURE_linuxfb=ON
> +else
> +QT6BASE_CONF_OPTS += -DFEATURE_linuxfb=OFF
> +endif
> +ifeq ($(BR2_PACKAGE_QT6BASE_DIRECTFB),y)
> +QT6BASE_CONF_OPTS += -DFEATURE_directfb=ON
> +QT6BASE_DEPENDENCIES += directfb
> +else
> +QT6BASE_CONF_OPTS += -DFEATURE_directfb=OFF
> +endif
> +ifeq ($(BR2_PACKAGE_QT6BASE_XCB),y)
> +QT6BASE_CONF_OPTS += \
> +	-DFEATURE_xcb=ON \
> +	-DFEATURE_xcb_xlib=ON \
> +	-DFEATURE_xkbcommon=ON \
> +	-DFEATURE_xkbcommon_x11=ON
> +QT6BASE_DEPENDENCIES += \
> +	libxcb \
> +	xcb-util-wm \
> +	xcb-util-image \
> +	xcb-util-keysyms \
> +	xcb-util-renderutil \
> +	xlib_libX11 \
> +	libxkbcommon
> +QT6BASE_DEPENDENCIES += xlib_libXext
> +else
> +QT6BASE_CONF_OPTS += -DFEATURE_xcb=OFF
> +endif
> +else #BR2_PACKAGE_QT6BASE_WIDGETS
> +QT6BASE_CONF_OPTS += -DFEATURE_widgets=OFF
> +endif
> +
> +else #BR2_PACKAGE_QT6BASE_GUI
> +QT6BASE_CONF_OPTS += -DFEATURE_gui=OFF
> +endif
> +
> +QT6BASE_DEFAULT_QPA = $(call qstrip,$(BR2_PACKAGE_QT6BASE_DEFAULT_QPA))
> +QT6BASE_CONF_OPTS += $(if $(QT6BASE_DEFAULT_QPA),-DQT_QPA_DEFAULT_PLATFORM=$(QT6BASE_DEFAULT_QPA))
> +
> +ifeq ($(BR2_PACKAGE_OPENSSL),y)
> +QT6BASE_CONF_OPTS += -DINPUT_openssl=yes
> +QT6BASE_DEPENDENCIES += openssl
> +else
> +QT6BASE_CONF_OPTS += -DINPUT_openssl=no
> +endif
> +
> +ifeq ($(BR2_PACKAGE_QT6BASE_DBUS),y)
> +QT6BASE_CONF_OPTS += -DFEATURE_dbus=ON
> +QT6BASE_CONF_OPTS += -DINPUT_dbus=linked
> +QT6BASE_DEPENDENCIES += dbus
> +HOST_QT6BASE_CONF_OPTS += -DFEATURE_dbus=ON
> +HOST_QT6BASE_DEPENDENCIES += host-dbus
> +else
> +QT6BASE_CONF_OPTS += -DFEATURE_dbus=OFF
> +HOST_QT6BASE_CONF_OPTS += -DFEATURE_dbus=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
> +QT6BASE_CONF_OPTS += -DFEATURE_glib=ON
> +QT6BASE_DEPENDENCIES += libglib2
> +else
> +QT6BASE_CONF_OPTS += -DFEATURE_glib=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_QT6BASE_ICU),y)
> +QT6BASE_CONF_OPTS += -DFEATURE_icu=ON
> +QT6BASE_DEPENDENCIES += icu
> +else
> +QT6BASE_CONF_OPTS += -DFEATURE_icu=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_QT6BASE_EXAMPLES),y)
> +QT6BASE_CONF_OPTS += -DQT_BUILD_EXAMPLES=ON
> +else
> +QT6BASE_CONF_OPTS += -DQT_BUILD_EXAMPLES=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_QT6BASE_NETWORK),y)
> +QT6BASE_CONF_OPTS += -DFEATURE_network=ON
> +else
> +QT6BASE_CONF_OPTS += -DFEATURE_network=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_QT6BASE_CONCURRENT),y)
> +QT6BASE_CONF_OPTS += -DFEATURE_concurrent=ON
> +else
> +QT6BASE_CONF_OPTS += -DFEATURE_concurrent=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_QT6BASE_TEST),y)
> +QT6BASE_CONF_OPTS += -DFEATURE_testlib=ON
> +else
> +QT6BASE_CONF_OPTS += -DFEATURE_testlib=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_QT6BASE_XML),y)
> +QT6BASE_CONF_OPTS += -DFEATURE_xml=ON
> +else
> +QT6BASE_CONF_OPTS += -DFEATURE_xml=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_SYSTEMD),y)
> +QT6BASE_CONF_OPTS += -DFEATURE_journald=ON
> +QT6BASE_DEPENDENCIES += systemd
> +else
> +QT6BASE_CONF_OPTS += -DFEATURE_journald=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_ZSTD),y)
> +QT6BASE_CONF_OPTS += -DFEATURE_zstd=ON
> +QT6BASE_DEPENDENCIES += zstd
> +else
> +QT6BASE_CONF_OPTS += -DFEATURE_zstd=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_QT6BASE_SYSLOG),y)
> +QT6BASE_CONF_OPTS += -DFEATURE_syslog=ON
> +else
> +QT6BASE_CONF_OPTS += -DFEATURE_syslog=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_IMX_GPU_VIV),y)
> +# use vivante backend
> +QT6BASE_EGLFS_DEVICE = EGLFS_DEVICE_INTEGRATION = eglfs_viv
> +else ifeq ($(BR2_PACKAGE_SUNXI_MALI_MAINLINE),y)
> +# use mali backend
> +QT6BASE_EGLFS_DEVICE = EGLFS_DEVICE_INTEGRATION = eglfs_mali
> +endif
> +
> +ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
> +# Qt 5.8 needs atomics, which on various architectures are in -latomic
> +QT6BASE_CONF_OPTS += -DCMAKE_SHARED_LINKER_FLAGS="-latomic"
> +endif
> +
> +# Must be last so can override all options set by Buildroot
> +QT6BASE_CONF_OPTS += $(call qstrip,$(BR2_PACKAGE_QT6BASE_CUSTOM_CONF_OPTS))
> +
>  $(eval $(cmake-package))
>  $(eval $(host-cmake-package))
> -- 
> 2.34.1
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
