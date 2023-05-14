Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39B74C7EE22
	for <buildroot@archiver.kernel.org>; Sun, 14 May 2023 14:11:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D67F441FF4;
	Sun, 14 May 2023 14:11:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D67F441FF4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ea6Hx5qssmIE; Sun, 14 May 2023 14:11:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E9D541FEE;
	Sun, 14 May 2023 14:10:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E9D541FEE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4A5931BF3B9
 for <buildroot@lists.busybox.net>; Sun, 14 May 2023 14:10:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 21B3541FDF
 for <buildroot@lists.busybox.net>; Sun, 14 May 2023 14:10:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21B3541FDF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7w2pQ7_kZxwr for <buildroot@lists.busybox.net>;
 Sun, 14 May 2023 14:10:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 22E1441FDD
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 22E1441FDD
 for <buildroot@buildroot.org>; Sun, 14 May 2023 14:10:55 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:e91d:2912:5826:9d75])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 585FAB00535;
 Sun, 14 May 2023 16:10:50 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 14 May 2023 16:10:50 +0200
Date: Sun, 14 May 2023 16:10:50 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Daniel Lang <dalang@gmx.at>
Message-ID: <20230514141050.GJ2582048@scaer>
References: <20230514132831.3555614-1-dalang@gmx.at>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230514132831.3555614-1-dalang@gmx.at>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1684073453;
 bh=0OMirZdC0dWlKZ1rcwaCx5E8i6hC2YWL6TXB3u/xQIs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pDe0j2rfvFHgBNf8jZMEdXZT96Uduo/8gOwa1LNplycpSSLxfT4FqQRKcDRF2Pe/0
 ud0FEoei/r0W4FUa2DPH88FTPP7KUuTL2bAQtRTbq6EdziRHqnN5vAM6b9OJZ/gYwy
 79TQkMkJvXIYoqofXR+OOXnp7HV1Gvqh9D3Ma73A6SPJZTWewxOHcriu+VgoXqs4r0
 NYiwYrL4zxnpH/5Y1e7blOoxH4q4qx5vAXNmGRly5uwUbtq35Qq2hyiuMlT5yy/Bmu
 qZfBelFhLdxGIQJ3O57IXeOsvm2J2fhvpU3umiVaN0Fba29v8TFDgQbUa0pUOsuzhp
 /EGwErf8AaxEQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=pDe0j2rf
Subject: Re: [Buildroot] [PATCH v2] package/at-spi2-core: bump to version
 2.48.2
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Daniel, All,

On 2023-05-14 15:28 +0200, Daniel Lang spake thusly:
> https://gitlab.gnome.org/GNOME/at-spi2-core/-/blob/AT_SPI2_CORE_2_48_2/NEWS
> 
> Upstream patch is included in this version.
> 
> Signed-off-by: Daniel Lang <dalang@gmx.at>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> v1 -> v2:
> bump to 2.48.2 instead of 2.48.1
> 
> Signed-off-by: Daniel Lang <dalang@gmx.at>
> ---
>  ...iring-libsystemd-when-configured-to-.patch | 93 -------------------
>  package/at-spi2-core/at-spi2-core.hash        |  4 +-
>  package/at-spi2-core/at-spi2-core.mk          |  2 +-
>  3 files changed, 3 insertions(+), 96 deletions(-)
>  delete mode 100644 package/at-spi2-core/0001-meson-Avoid-requiring-libsystemd-when-configured-to-.patch
> 
> diff --git a/package/at-spi2-core/0001-meson-Avoid-requiring-libsystemd-when-configured-to-.patch b/package/at-spi2-core/0001-meson-Avoid-requiring-libsystemd-when-configured-to-.patch
> deleted file mode 100644
> index 78d206ed79..0000000000
> --- a/package/at-spi2-core/0001-meson-Avoid-requiring-libsystemd-when-configured-to-.patch
> +++ /dev/null
> @@ -1,93 +0,0 @@
> -From aeb14ffccaabe65a64e976576d71f30eb2165f43 Mon Sep 17 00:00:00 2001
> -From: Adrian Perez de Castro <aperez@igalia.com>
> -Date: Mon, 24 Apr 2023 12:09:50 +0300
> -Subject: [PATCH] meson: Avoid requiring libsystemd when configured to use
> - dbus-daemon
> -
> -Checks for dbus-daemon and dbus-broker only when they are chosen
> -with default_bus. This avoids requiring the systemd libraries if
> -one wants the built at-spi2-core to use dbus-daemon, but dbus-worker
> -is somehow available in the $PATH. A typical scenario is cross
> -compilation, where the build host may have a dbus-broker program
> -available, but the target system may not have it (or may not have
> -nor want to use the systemd libraries).
> -
> -Upstream: https://gitlab.gnome.org/GNOME/at-spi2-core/-/merge_requests/134
> -Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
> ----
> - bus/meson.build | 53 ++++++++++++++++++++++++-------------------------
> - 1 file changed, 26 insertions(+), 27 deletions(-)
> -
> -diff --git a/bus/meson.build b/bus/meson.build
> -index 22a1bce6..2f3c5621 100644
> ---- a/bus/meson.build
> -+++ b/bus/meson.build
> -@@ -46,39 +46,38 @@ launcher_args = [
> -              '-DDATADIR="@0@"'.format(atspi_datadir),
> -            ]
> - 
> --if get_option('dbus_daemon') != 'default'
> --  launcher_args += '-DDBUS_DAEMON="@0@"'.format(get_option('dbus_daemon'))
> --else
> --  dbus_daemon = find_program('dbus-daemon',
> --                             '/sbin/dbus-daemon',
> --                             '/usr/sbin/dbus-daemon',
> --                             '/libexec/dbus-daemon',
> --                             '/usr/libexec/dbus-daemon',
> --                             '/usr/lib/dbus-daemon',
> --                             '/usr/pkg/bin/dbus-daemon',
> --                             required: false)
> --  if dbus_daemon.found()
> --    launcher_args += '-DDBUS_DAEMON="@0@"'.format(dbus_daemon.full_path())
> --  endif
> --endif
> --
> - needs_systemd = false
> --if get_option('dbus_broker') != 'default'
> --  launcher_args += '-DDBUS_BROKER="@0@"'.format(get_option('dbus_broker'))
> --  needs_systemd = true
> -+if get_option('default_bus') == 'dbus-daemon'
> -+  if get_option('dbus_daemon') != 'default'
> -+    launcher_args += '-DDBUS_DAEMON="@0@"'.format(get_option('dbus_daemon'))
> -+  else
> -+    dbus_daemon = find_program('dbus-daemon',
> -+                               '/sbin/dbus-daemon',
> -+                               '/usr/sbin/dbus-daemon',
> -+                               '/libexec/dbus-daemon',
> -+                               '/usr/libexec/dbus-daemon',
> -+                               '/usr/lib/dbus-daemon',
> -+                               '/usr/pkg/bin/dbus-daemon',
> -+                               required: false)
> -+    if dbus_daemon.found()
> -+      launcher_args += '-DDBUS_DAEMON="@0@"'.format(dbus_daemon.full_path())
> -+    endif
> -+  endif
> - else
> --  dbus_broker = find_program('dbus-broker-launch',
> --                             required: false)
> --  if dbus_broker.found()
> --    launcher_args += '-DDBUS_BROKER="@0@"'.format(dbus_broker.full_path())
> -+  launcher_args += '-DWANT_DBUS_BROKER'
> -+  if get_option('dbus_broker') != 'default'
> -+    launcher_args += '-DDBUS_BROKER="@0@"'.format(get_option('dbus_broker'))
> -     needs_systemd = true
> -+  else
> -+    dbus_broker = find_program('dbus-broker-launch',
> -+                               required: false)
> -+    if dbus_broker.found()
> -+      launcher_args += '-DDBUS_BROKER="@0@"'.format(dbus_broker.full_path())
> -+      needs_systemd = true
> -+    endif
> -   endif
> - endif
> - 
> --if get_option('default_bus') == 'dbus-broker'
> --  launcher_args += '-DWANT_DBUS_BROKER'
> --endif
> --
> - if needs_systemd
> -   systemd_dep = dependency('libsystemd')
> - else
> --- 
> -2.34.1
> -
> diff --git a/package/at-spi2-core/at-spi2-core.hash b/package/at-spi2-core/at-spi2-core.hash
> index 9cf80d1cc0..db3ea7096e 100644
> --- a/package/at-spi2-core/at-spi2-core.hash
> +++ b/package/at-spi2-core/at-spi2-core.hash
> @@ -1,5 +1,5 @@
> -# From https://download.gnome.org/sources/at-spi2-core/2.48/at-spi2-core-2.48.0.sha256sum
> -sha256  905a5b6f1790b68ee803bffa9f5fab4ceb591fb4fae0b2f8c612c54f1d4e8a30  at-spi2-core-2.48.0.tar.xz
> +# From https://download.gnome.org/sources/at-spi2-core/2.48/at-spi2-core-2.48.2.sha256sum
> +sha256  86ebcb55f678381d7ed7825736add42dfccb70ad3b981dfd65d72e58f87828ee  at-spi2-core-2.48.2.tar.xz
>  
>  # locally calculated
>  sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
> diff --git a/package/at-spi2-core/at-spi2-core.mk b/package/at-spi2-core/at-spi2-core.mk
> index e4489f6f88..e9a93b3eda 100644
> --- a/package/at-spi2-core/at-spi2-core.mk
> +++ b/package/at-spi2-core/at-spi2-core.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  AT_SPI2_CORE_VERSION_MAJOR = 2.48
> -AT_SPI2_CORE_VERSION = $(AT_SPI2_CORE_VERSION_MAJOR).0
> +AT_SPI2_CORE_VERSION = $(AT_SPI2_CORE_VERSION_MAJOR).2
>  AT_SPI2_CORE_SOURCE = at-spi2-core-$(AT_SPI2_CORE_VERSION).tar.xz
>  AT_SPI2_CORE_SITE = https://download.gnome.org/sources/at-spi2-core/$(AT_SPI2_CORE_VERSION_MAJOR)
>  AT_SPI2_CORE_LICENSE = LGPL-2.1+
> -- 
> 2.40.1
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
