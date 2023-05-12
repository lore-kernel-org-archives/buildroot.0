Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD57FC77B7C
	for <buildroot@archiver.kernel.org>; Fri, 12 May 2023 07:50:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 636F784157;
	Fri, 12 May 2023 07:50:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 636F784157
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GTQA5I5_GW7I; Fri, 12 May 2023 07:50:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5BBB38414A;
	Fri, 12 May 2023 07:50:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5BBB38414A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A3B051BF404
 for <buildroot@lists.busybox.net>; Fri, 12 May 2023 07:50:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7BEC560A6B
 for <buildroot@lists.busybox.net>; Fri, 12 May 2023 07:50:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7BEC560A6B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EJt78uUcgwmT for <buildroot@lists.busybox.net>;
 Fri, 12 May 2023 07:50:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4594360594
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4594360594
 for <buildroot@buildroot.org>; Fri, 12 May 2023 07:50:21 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.8.36] ([89.144.220.58]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MkYXm-1qcRFN3NpG-00m1BN; Fri, 12
 May 2023 09:50:19 +0200
Message-ID: <18b89eae-3e78-7288-9680-432311e01e9d@gmx.at>
Date: Fri, 12 May 2023 09:50:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
From: Daniel Lang <dalang@gmx.at>
To: buildroot@buildroot.org
References: <20230511123040.398221-1-dalang@gmx.at>
In-Reply-To: <20230511123040.398221-1-dalang@gmx.at>
X-Provags-ID: V03:K1:WrI/UvtciGsgCmKJbkdeFctHxBkDxUD2OfEZePlhCtVoj0n02tc
 i8Ffqr+mZYT2v+/ec8l7KoqYC/X9VW51pB8Pxt0Olbmb51xHacvyz236hlW/Pi+w7KGQX46
 hWTPboNZywXslUx4M1++DqgFNhWryymS1AUoxaEuKEVQLPwKbOaee3SNGldHIv6DbBpQKUo
 syg2PG4V729ceK+pgTstA==
UI-OutboundReport: notjunk:1;M01:P0:Q0Iggwck44k=;un1Vp+aNN8dmsd+4WCMPqO1Mkka
 cOdxdGJV7ADQk2wIhLsp/vcq9BDFeTFRe+b1xQX2dMEbnMVOltlZESrOiYM4EP2xsjkCKoKpb
 8DsNEw4TKUaw7TR2dldIGCK6Kn+pV4WeVydozym12KNkvuxAQ2mlmMDsyVsAZ5OuRsbtVfk9f
 k0kRM54p5TuMgb/k7xgNzkTt5OSDoX37Hxob4UYogB41V6jKUmj2cdFIKV87m4KBslquUSSc9
 2tL/qN5iQjduvKREPYkkpG2mJ2mwDXVc3XS6TQswuG936X3dk1muwbGtOz27D/pPCtZn9/a12
 xINmfTvS3E7zs5dtjAmhWEyYmWoHh13pxTjvEYyrkcdG5DQ8OEOCeU6i+tA1BSiHwkbQOKjd3
 nZigdldoeTc7V0JVQee/Y11gGjDrlqDKFPI8Xds4iYYEkmXBQq9e8xOZfYYuThSlYrhbJzPru
 53efrCDE3kCSECxsRJKjpCluj4bo3sWKx2IVFkHg6NmNXUDTJXrogtrHMW+zftomHUwAmN2TK
 VsE/0ZGKbQnLkPKZxJRm4fUUhjLai7KgfLkvSghtHGEmcb+UlKflli4w9ErwA7Q81+jEURfUH
 r7aYlJxIIsEGstUEdY3heW/kTKSYQfN+gX/mGSsEjHpyteUNZB6NgXrYt9vb8vXcCSNw+ElYS
 Yq877I9CJjEegORO+p1ZltdBCNgfKek8tE2cg5pX6P5Q5LkoWEZgZ4J4/G9UMSL9YQ3NTgOl1
 7qOldAmXe85d8M0Rm9hqQVwQ4c+8uy9HJZeyCoorWYT8YMu4pOw5avRknKdQIXbXv2jQgEDtg
 JSteHxZXDiSlufw3elMYKe5PFbgVx3TviYh3y0jRvyx4004D+9m79rxe+I2+Q/zTx8C/qm0i7
 Gudskca/2pxe9ukiOxFUdvne6F37dbTKjLqzKTJdQcC6XiMKBrjzV/WHKF9TZK7BQJm/xzU8a
 V+5LORstfgV1Nk4F2H6c3Z4Rc4c=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.at; s=s31663417; 
 t=1683877819; i=dalang@gmx.at;
 bh=tH9pzIFOPcH7mEoTn8n/1agMDmpfa09IxdW5Wb2dW5o=;
 h=X-UI-Sender-Class:Date:Subject:From:To:Cc:References:In-Reply-To;
 b=THjNbI6n6WuFY4vEg3WCN0byPZbUUCr6nfa2TC2K4hKgpioySJtXlYOreo2f5Y84X
 XSYhb5Hog9i/1EWhMKWl8pcLRe5Lv8sYKsAxBBKLOWTSVi9tuxNGvdhddOUF4yv4Bn
 k2S6H4V37c5r6GO51lpj54tX3OT+r+BcL9G02Gmg4TB10xSQ7yv4hko79/rtcEvgeA
 woX71JFj9xOPbZsUbYxdtKTtluyVHK5ccHoQGTdnbKiAKBHuhk+IecfIhfm7J6qoZd
 q/PtR1PvG+po3al4Gh5nbPt4M4uKXrNmUAtO0GDZfsk6D/XknhKPnFYGicfxUtTnFd
 X2BO3AVjOKX1A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=THjNbI6n
Subject: Re: [Buildroot] [PATCH] package/at-spi2-core: bump to version 2.48.1
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 11.05.23 14:30, Daniel Lang wrote:
> https://gitlab.gnome.org/GNOME/at-spi2-core/-/blob/AT_SPI2_CORE_2_48_1/NEWS
>
> Upstream patch is included in this version.

2.48.2 was just released, less than 24 hours after 2.48.1,
to fix regressions introduced in 2.48.1.
I will mark this patch as superseded.

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
> index 9cf80d1cc0..d5b096efd0 100644
> --- a/package/at-spi2-core/at-spi2-core.hash
> +++ b/package/at-spi2-core/at-spi2-core.hash
> @@ -1,5 +1,5 @@
> -# From https://download.gnome.org/sources/at-spi2-core/2.48/at-spi2-core-2.48.0.sha256sum
> -sha256  905a5b6f1790b68ee803bffa9f5fab4ceb591fb4fae0b2f8c612c54f1d4e8a30  at-spi2-core-2.48.0.tar.xz
> +# From https://download.gnome.org/sources/at-spi2-core/2.48/at-spi2-core-2.48.1.sha256sum
> +sha256  abfe36b601884144699a577fed1e2cb2b5d6fdd88d60aa4d2e886d3737692e6d  at-spi2-core-2.48.1.tar.xz
>
>  # locally calculated
>  sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
> diff --git a/package/at-spi2-core/at-spi2-core.mk b/package/at-spi2-core/at-spi2-core.mk
> index e4489f6f88..3288b1aa2c 100644
> --- a/package/at-spi2-core/at-spi2-core.mk
> +++ b/package/at-spi2-core/at-spi2-core.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>
>  AT_SPI2_CORE_VERSION_MAJOR = 2.48
> -AT_SPI2_CORE_VERSION = $(AT_SPI2_CORE_VERSION_MAJOR).0
> +AT_SPI2_CORE_VERSION = $(AT_SPI2_CORE_VERSION_MAJOR).1
>  AT_SPI2_CORE_SOURCE = at-spi2-core-$(AT_SPI2_CORE_VERSION).tar.xz
>  AT_SPI2_CORE_SITE = https://download.gnome.org/sources/at-spi2-core/$(AT_SPI2_CORE_VERSION_MAJOR)
>  AT_SPI2_CORE_LICENSE = LGPL-2.1+

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
