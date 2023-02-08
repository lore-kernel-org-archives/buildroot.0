Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96E26C05027
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 13:43:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2384040292;
	Wed,  8 Feb 2023 13:43:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2384040292
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BB-wsVUbo8m8; Wed,  8 Feb 2023 13:43:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA7B040890;
	Wed,  8 Feb 2023 13:43:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA7B040890
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A3D781BF3FD
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 13:43:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7B590610B0
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 13:43:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B590610B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J6u2zvUulowP for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 13:43:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EEC9F60EC6
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EEC9F60EC6
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 13:43:43 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BC5FC1C0005;
 Wed,  8 Feb 2023 13:43:41 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pPkjc-00GE1w-Vh; Wed, 08 Feb 2023 14:43:41 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Raphael Pavlidis <raphael.pavlidis@gmail.com>
References: <20221031124625.21172-1-raphael.pavlidis@gmail.com>
Date: Wed, 08 Feb 2023 14:43:40 +0100
In-Reply-To: <20221031124625.21172-1-raphael.pavlidis@gmail.com> (Raphael
 Pavlidis's message of "Mon, 31 Oct 2022 13:46:25 +0100")
Message-ID: <87h6vw5l2r.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1 1/1] package/sway: new package
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Raphael" == Raphael Pavlidis <raphael.pavlidis@gmail.com> writes:

 > i3-compatible Wayland compositor
 > This Wayland compositor can be used as a kiosk compositor like cage, but
 > with the advantage of better configuration of multiple monitor and
 > windows. For example, move a window by title to the output X or set the
 > resolution of Y to Z.

 > Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
 > ---
 >  DEVELOPERS             |  3 ++-
 >  package/Config.in      |  1 +
 >  package/sway/Config.in | 42 ++++++++++++++++++++++++++++++++++++++++++
 >  package/sway/sway.hash |  3 +++
 >  package/sway/sway.mk   | 36 ++++++++++++++++++++++++++++++++++++
 >  5 files changed, 84 insertions(+), 1 deletion(-)
 >  create mode 100644 package/sway/Config.in
 >  create mode 100644 package/sway/sway.hash
 >  create mode 100644 package/sway/sway.mk

 > +++ b/package/sway/Config.in
 > @@ -0,0 +1,42 @@
 > +config BR2_PACKAGE_SWAY
 > +	bool "sway"
 > +	depends on BR2_PACKAGE_SYSTEMD # is required by the sd-bus provider
 > +	depends on !BR2_STATIC_LIBS # wlroots
 > +	depends on BR2_TOOLCHAIN_HAS_THREADS # wlroots
 > +	depends on BR2_PACKAGE_HAS_LIBEGL # wlroots
 > +	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND # wlroots
 > +	depends on BR2_PACKAGE_HAS_LIBGLES # wlroots
 > +	depends on BR2_PACKAGE_HAS_UDEV # wlroots
 > +	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c
 > +	depends on BR2_USE_WCHAR # pango
 > +	depends on BR2_TOOLCHAIN_HAS_THREADS # pango
 > +	depends on BR2_USE_MMU # pango
 > +	depends on BR2_INSTALL_LIBSTDCPP # pango
 > +	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango
 > +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango
 > +	select BR2_PACKAGE_WLROOTS
 > +	select BR2_PACKAGE_JSON_C
 > +	select BR2_PACKAGE_PCRE
 > +	select BR2_PACKAGE_CAIRO
 > +	select BR2_PACKAGE_CAIRO_PNG
 > +	select BR2_PACKAGE_PANGO
 > +	help
 > +	  i3-compatible Wayland compositor 
 > +
 > +	  https://github.com/swaywm/sway
 > +
 > +comment "sway needs systemd, udev, EGL w/ Wayland backend and OpenGL ES support"
 > +	depends on !BR2_PACKAGE_SYSTEMD || \
 > +		!BR2_PACKAGE_HAS_UDEV || \
 > + 		!BR2_PACKAGE_HAS_LIBEGL || \
 > +		!BR2_PACKAGE_HAS_LIBEGL_WAYLAND || \
 > +		!BR2_PACKAGE_HAS_LIBGLES 

NIT: You have a number of trailing spaces here.

 > +++ b/package/sway/sway.mk
 > @@ -0,0 +1,36 @@
 > +################################################################################
 > +#
 > +# sway
 > +#
 > +################################################################################
 > +
 > +SWAY_VERSION = 1.7
 > +SWAY_SITE = $(call github,swaywm,sway,v$(SWAY_VERSION))
 > +SWAY_LICENSE = MIT
 > +SWAY_LICENSE_FILES = LICENSE
 > +SWAY_DEPENDENCIES = systemd host-pkgconf wlroots json-c pcre cairo pango
 > +SWAY_CONF_OPTS = \
 > +	-Dwerror=false \
 > +	-Ddefault-wallpaper=false \
 > +	-Dzsh-completions=false \
 > +	-Dbash-completions=false \
 > +	-Dfish-completions=false \
 > +	-Dswaybar=false \
 > +	-Dswaynag=false \
 > +	-Dtray=disabled \
 > +	-Dman-pages=disabled \
 > +	-Dsd-bus-provider=libsystemd
 > +
 > +ifeq ($(BR2_PACKAGE_WLROOTS_X11),y)
 > +SWAY_CONF_OPTS += -Dxwayland=enabled

How did you test this? Here wlroots with x11 support doesn't build as we
don't have an Xwayland .pc file or binary in Buildroot.

> +else
 > +SWAY_CONF_OPTS += -Dxwayland=disabled
 > +endif
 > +
 > +ifeq ($(BR2_PACKAGE_GDK_PIXBUF),y)
 > +SWAY_CONF_OPTS += -Dgdk-pixbuf=enabled

You also need to ensure that sway is built after gdk-pixbuf with:

SWAY_DEPENDENCIES += gdk-pixbuf

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
