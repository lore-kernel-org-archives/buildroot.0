Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BFC6C77B7F
	for <buildroot@archiver.kernel.org>; Mon,  8 May 2023 11:36:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EECF04154A;
	Mon,  8 May 2023 11:36:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EECF04154A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hg5GqRFfotpl; Mon,  8 May 2023 11:36:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B562415C3;
	Mon,  8 May 2023 11:35:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B562415C3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4FF281BF2BD
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 11:35:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3720983C1C
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 11:35:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3720983C1C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MUSo8nqNtXIt for <buildroot@lists.busybox.net>;
 Mon,  8 May 2023 11:35:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 00CD583C1A
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 00CD583C1A
 for <buildroot@buildroot.org>; Mon,  8 May 2023 11:35:54 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:7bde:4dbc:bac0:54b7])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 69E6D2003F6;
 Mon,  8 May 2023 13:35:42 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 08 May 2023 13:35:42 +0200
Date: Mon, 8 May 2023 13:35:42 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Devoogdt <thomas@devoogdt.com>
Message-ID: <20230508113542.GX252090@scaer>
References: <20230428075920.3750005-1-thomas@devoogdt.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230428075920.3750005-1-thomas@devoogdt.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683545751;
 bh=Lc3pMuvqZaqA4hg7c53H+cxDi4+tHzUCApJQtdXkQ3E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EVD8wDXwZ1ZkvVlyQrSpAZuRMiGF/qL6G3UJjyh/r38vMLdp1L7UfvQM1zGXxqCrS
 FpqMMrzl9xELC5EL6iTNV4JKoLxexnlQvukyzICv+YxxOScjbSbBsHI08Hnv8w46f9
 aq2TDQgFAKk93Y38Cu7vGJR3QPiHmMjRQ7G73ABgX/QSj8Cpf4eIODrvqTqU4xLx96
 d3ls+L7ZqLZbOktSQPnXZcHwb2mbCaxQwB758/TcspeoVUJbD9Y1QOcupl20x6eC1r
 ddHcRqW6sHr/AmRzobuoXHqYiTK++glImaNRfO+lTD9cV1ISJygnO20q8Dcf+NOpSe
 AEGZNBPnateiw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=EVD8wDXw
Subject: Re: [Buildroot] [PATCH v7 1/5] package/at-spi2-core: bump to
 version 2.48.0
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>, Daniel Lang <d.lang@abatec.at>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>,
 James Knight <james.knight@collins.com>, buildroot@buildroot.org,
 Adrian Perez de Castro <aperez@igalia.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, Daniel, All,

On 2023-04-28 09:59 +0200, Thomas Devoogdt spake thusly:
> From: Daniel Lang <d.lang@abatec.at>
> 
> https://gitlab.gnome.org/GNOME/at-spi2-core/-/blob/AT_SPI2_CORE_2_48_0/NEWS
> 
> - X11 is now optional.
> - libxml2 is no longer optional.
> - atk and at-spi2-atk have been merged into at-spi2-core.
> - atk introspection option added.
> - Added patch to which avoids requiring libsystemd when configured to use dbus-daemon.
> - Added check on dlopen.
> 
> Signed-off-by: Daniel Lang <d.lang@abatec.at>
> Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>

I wanted to apply this patch series, but unfiortuantely, there is
missing piece, see below...

[--SNIP--]
> diff --git a/package/at-spi2-core/0001-meson-Avoid-requiring-libsystemd-when-configured-to-.patch b/package/at-spi2-core/0001-meson-Avoid-requiring-libsystemd-when-configured-to-.patch
> new file mode 100644
> index 0000000000..29c3de8d2d
> --- /dev/null
> +++ b/package/at-spi2-core/0001-meson-Avoid-requiring-libsystemd-when-configured-to-.patch
> @@ -0,0 +1,92 @@
> +From aeb14ffccaabe65a64e976576d71f30eb2165f43 Mon Sep 17 00:00:00 2001
> +From: Adrian Perez de Castro <aperez@igalia.com>
> +Date: Mon, 24 Apr 2023 12:09:50 +0300
> +Subject: [PATCH] meson: Avoid requiring libsystemd when configured to use
> + dbus-daemon
> +
> +Checks for dbus-daemon and dbus-broker only when they are chosen
> +with default_bus. This avoids requiring the systemd libraries if
> +one wants the built at-spi2-core to use dbus-daemon, but dbus-worker
> +is somehow available in the $PATH. A typical scenario is cross
> +compilation, where the build host may have a dbus-broker program
> +available, but the target system may not have it (or may not have
> +nor want to use the systemd libraries).
> +
> +upstream: https://gitlab.gnome.org/GNOME/at-spi2-core/-/merge_requests/134

This patch is missing a SoB of you guys that grabbed it from upstream,
i.e. Daniel and Thomas, even if the upstream commit has no SoB itself.

And nit: the upstream tag takes a uppercase 'U'.

    $ ./utils/docker-run make check-package
    package/at-spi2-core/0001-meson-Avoid-requiring-libsystemd-when-configured-to-.patch:0: missing Signed-off-by in the header (http://nightly.buildroot.org/#_format_and_licensing_of_the_package_patches)
    package/at-spi2-core/0001-meson-Avoid-requiring-libsystemd-when-configured-to-.patch:0: missing Upstream in the header (http://nightly.buildroot.org/#_additional_patch_documentation)

I could fix the Upstream issue, but I can't add a SoB for others. But if
you reply here with your SoB lines, Daniel and/or Thomas, I can add them
when applying.

Regards,
Yann E. MORIN.

> +---
> + bus/meson.build | 53 ++++++++++++++++++++++++-------------------------
> + 1 file changed, 26 insertions(+), 27 deletions(-)
> +
> +diff --git a/bus/meson.build b/bus/meson.build
> +index 22a1bce6..2f3c5621 100644
> +--- a/bus/meson.build
> ++++ b/bus/meson.build
> +@@ -46,39 +46,38 @@ launcher_args = [
> +              '-DDATADIR="@0@"'.format(atspi_datadir),
> +            ]
> + 
> +-if get_option('dbus_daemon') != 'default'
> +-  launcher_args += '-DDBUS_DAEMON="@0@"'.format(get_option('dbus_daemon'))
> +-else
> +-  dbus_daemon = find_program('dbus-daemon',
> +-                             '/sbin/dbus-daemon',
> +-                             '/usr/sbin/dbus-daemon',
> +-                             '/libexec/dbus-daemon',
> +-                             '/usr/libexec/dbus-daemon',
> +-                             '/usr/lib/dbus-daemon',
> +-                             '/usr/pkg/bin/dbus-daemon',
> +-                             required: false)
> +-  if dbus_daemon.found()
> +-    launcher_args += '-DDBUS_DAEMON="@0@"'.format(dbus_daemon.full_path())
> +-  endif
> +-endif
> +-
> + needs_systemd = false
> +-if get_option('dbus_broker') != 'default'
> +-  launcher_args += '-DDBUS_BROKER="@0@"'.format(get_option('dbus_broker'))
> +-  needs_systemd = true
> ++if get_option('default_bus') == 'dbus-daemon'
> ++  if get_option('dbus_daemon') != 'default'
> ++    launcher_args += '-DDBUS_DAEMON="@0@"'.format(get_option('dbus_daemon'))
> ++  else
> ++    dbus_daemon = find_program('dbus-daemon',
> ++                               '/sbin/dbus-daemon',
> ++                               '/usr/sbin/dbus-daemon',
> ++                               '/libexec/dbus-daemon',
> ++                               '/usr/libexec/dbus-daemon',
> ++                               '/usr/lib/dbus-daemon',
> ++                               '/usr/pkg/bin/dbus-daemon',
> ++                               required: false)
> ++    if dbus_daemon.found()
> ++      launcher_args += '-DDBUS_DAEMON="@0@"'.format(dbus_daemon.full_path())
> ++    endif
> ++  endif
> + else
> +-  dbus_broker = find_program('dbus-broker-launch',
> +-                             required: false)
> +-  if dbus_broker.found()
> +-    launcher_args += '-DDBUS_BROKER="@0@"'.format(dbus_broker.full_path())
> ++  launcher_args += '-DWANT_DBUS_BROKER'
> ++  if get_option('dbus_broker') != 'default'
> ++    launcher_args += '-DDBUS_BROKER="@0@"'.format(get_option('dbus_broker'))
> +     needs_systemd = true
> ++  else
> ++    dbus_broker = find_program('dbus-broker-launch',
> ++                               required: false)
> ++    if dbus_broker.found()
> ++      launcher_args += '-DDBUS_BROKER="@0@"'.format(dbus_broker.full_path())
> ++      needs_systemd = true
> ++    endif
> +   endif
> + endif
> + 
> +-if get_option('default_bus') == 'dbus-broker'
> +-  launcher_args += '-DWANT_DBUS_BROKER'
> +-endif
> +-
> + if needs_systemd
> +   systemd_dep = dependency('libsystemd')
> + else
> +-- 
> +2.34.1
> +
> diff --git a/package/at-spi2-core/Config.in b/package/at-spi2-core/Config.in
> index f56c5b93c4..2a1b21d375 100644
> --- a/package/at-spi2-core/Config.in
> +++ b/package/at-spi2-core/Config.in
> @@ -1,12 +1,13 @@
>  config BR2_PACKAGE_AT_SPI2_CORE
>  	bool "at-spi2-core"
> -	depends on BR2_PACKAGE_XORG7 # xlib-libxtst
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, glib2
>  	depends on BR2_USE_MMU # glib2
>  	depends on BR2_USE_WCHAR # glib2
> +	depends on !BR2_STATIC_LIBS # dlopen()
>  	select BR2_PACKAGE_DBUS
>  	select BR2_PACKAGE_LIBGLIB2
> -	select BR2_PACKAGE_XLIB_LIBXTST
> +	select BR2_PACKAGE_LIBXML2
> +	select BR2_PACKAGE_XLIB_LIBXTST if BR2_PACKAGE_XORG7 # optionally for X11
>  	help
>  	  The At-Spi2 Core package is a part of the GNOME
>  	  Accessibility Project. It provides a Service Provider
> @@ -16,10 +17,6 @@ config BR2_PACKAGE_AT_SPI2_CORE
>  
>  	  https://wiki.gnome.org/Accessibility
>  
> -comment "at-spi2-core needs a toolchain w/ wchar, threads"
> +comment "at-spi2-core needs a toolchain w/ dynamic library, wchar, threads"
>  	depends on BR2_USE_MMU
> -	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
> -
> -comment "at-spi2-core depends on X.org"
> -	depends on BR2_USE_MMU
> -	depends on !BR2_PACKAGE_XORG7
> +	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/at-spi2-core/at-spi2-core.hash b/package/at-spi2-core/at-spi2-core.hash
> index 764e4c3661..9cf80d1cc0 100644
> --- a/package/at-spi2-core/at-spi2-core.hash
> +++ b/package/at-spi2-core/at-spi2-core.hash
> @@ -1,5 +1,5 @@
> -# From https://download.gnome.org/sources/at-spi2-core/2.36/at-spi2-core-2.36.0.sha256sum
> -sha256  88da57de0a7e3c60bc341a974a80fdba091612db3547c410d6deab039ca5c05a  at-spi2-core-2.36.0.tar.xz
> +# From https://download.gnome.org/sources/at-spi2-core/2.48/at-spi2-core-2.48.0.sha256sum
> +sha256  905a5b6f1790b68ee803bffa9f5fab4ceb591fb4fae0b2f8c612c54f1d4e8a30  at-spi2-core-2.48.0.tar.xz
>  
>  # locally calculated
>  sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
> diff --git a/package/at-spi2-core/at-spi2-core.mk b/package/at-spi2-core/at-spi2-core.mk
> index f0b019c0ed..e4489f6f88 100644
> --- a/package/at-spi2-core/at-spi2-core.mk
> +++ b/package/at-spi2-core/at-spi2-core.mk
> @@ -4,17 +4,31 @@
>  #
>  ################################################################################
>  
> -AT_SPI2_CORE_VERSION_MAJOR = 2.36
> +AT_SPI2_CORE_VERSION_MAJOR = 2.48
>  AT_SPI2_CORE_VERSION = $(AT_SPI2_CORE_VERSION_MAJOR).0
>  AT_SPI2_CORE_SOURCE = at-spi2-core-$(AT_SPI2_CORE_VERSION).tar.xz
>  AT_SPI2_CORE_SITE = https://download.gnome.org/sources/at-spi2-core/$(AT_SPI2_CORE_VERSION_MAJOR)
>  AT_SPI2_CORE_LICENSE = LGPL-2.1+
>  AT_SPI2_CORE_LICENSE_FILES = COPYING
>  AT_SPI2_CORE_INSTALL_STAGING = YES
> -AT_SPI2_CORE_DEPENDENCIES = host-pkgconf dbus libglib2 xlib_libXtst \
> +AT_SPI2_CORE_DEPENDENCIES = host-pkgconf dbus libglib2 libxml2 \
>  	$(TARGET_NLS_DEPENDENCIES)
>  AT_SPI2_CORE_CONF_OPTS = -Ddbus_daemon=/usr/bin/dbus-daemon
>  
> +ifeq ($(BR2_PACKAGE_XORG7),y)
> +AT_SPI2_CORE_CONF_OPTS += -Dx11=enabled
> +AT_SPI2_CORE_DEPENDENCIES += xlib_libXtst
> +else
> +AT_SPI2_CORE_CONF_OPTS += -Dx11=disabled
> +endif
> +
> +ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
> +AT_SPI2_CORE_CONF_OPTS += -Dintrospection=enabled
> +AT_SPI2_CORE_DEPENDENCIES += gobject-introspection
> +else
> +AT_SPI2_CORE_CONF_OPTS += -Dintrospection=disabled
> +endif
> +
>  AT_SPI2_CORE_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
>  
>  $(eval $(meson-package))
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
