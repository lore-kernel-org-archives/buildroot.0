Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D3C0C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 13:48:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A1E0D40577;
	Wed, 27 Jul 2022 13:48:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A1E0D40577
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3WQXUllIGfEZ; Wed, 27 Jul 2022 13:48:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 33257403FB;
	Wed, 27 Jul 2022 13:48:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33257403FB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 683771BF2BA
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 13:48:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4E92F40761
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 13:48:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E92F40761
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qDiZQHLyK6fG for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 13:48:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F2CD4067F
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com
 [IPv6:2607:f8b0:4864:20::e2c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2F2CD4067F
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 13:48:00 +0000 (UTC)
Received: by mail-vs1-xe2c.google.com with SMTP id 66so13862688vse.4
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 06:48:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bQKq6Fg3At43P4fvRv0W8B0iWoOqoNSehSd/nLKPSpA=;
 b=PQlOKbuxEdcsuWFTEZSnRnPiV6a6m77k8Bl1ne6cxwmtVS70VNvHquyNPumUFcJ1k4
 4Tz3fW+Tc0LYRJFxP1Y4unKQHyGzaw5gdFIJy17l7UFqaWDl0fKtQB+OD4UZv0EoxVAU
 u2cQ8q6ldbtwmfAgwKFrlySZvZz/AUPwVrcPCLWnYqC/Hs5RMuhozC2BfbJSReG9hZMA
 bQ7qev7sAGj1bDduGheGngZ4gP73fgz0JAzsup+xUMKKURbWeZOg4rXR61GndXNHaIaQ
 c9sYWKKQ4CG8ddPxYw4HRjkRQ7+vRm7sCY1XEcFSVeZM9fR0PlmvLb6rgX1d9bgpy0+p
 Y+Ew==
X-Gm-Message-State: AJIora+AMZj8FsSzRb9qfrAf9ABH43qwrv+lqmyd4RjhVafgucSR2pAq
 YaLVOQe2lvg1xYCELusbksdYdV0I5niXGW/ylvpclZWOn0I=
X-Google-Smtp-Source: AGRyM1vV95ch4rtmrQ0RfZtgypgDM7OheBKgA9w1wSlqy8Le2ziDbQNU6ZZZBg3PvHW4ZYMrencBxghTjk+wvdThJQg=
X-Received: by 2002:a67:d79e:0:b0:358:59c7:f480 with SMTP id
 q30-20020a67d79e000000b0035859c7f480mr5456266vsj.69.1658929678775; Wed, 27
 Jul 2022 06:47:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220109221650.777610-1-nolange79@gmail.com>
 <2288ff34-d140-a1a0-3f8e-86baf04f4dee@mind.be>
In-Reply-To: <2288ff34-d140-a1a0-3f8e-86baf04f4dee@mind.be>
From: Norbert Lange <nolange79@gmail.com>
Date: Wed, 27 Jul 2022 15:47:47 +0200
Message-ID: <CADYdroP82ZnJLWzL0=DP1r2T-0nJe3c7xxC4QgwkNtF5dkC_8A@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=bQKq6Fg3At43P4fvRv0W8B0iWoOqoNSehSd/nLKPSpA=;
 b=Xp25pyG4q47HZPC4a8PvUGPctzyiWHSWSaTaQvyW3p07on/zjbnoi9QEgRgPWQCrib
 Ez6VOrqRHpqgeJYg5HaEouRjF4afnxk7RF63w40JldNaaHRm8b1Pm+q40J2/y1bcKrzE
 mj7YewzwlJAo0uIhOnRDDLhmKiwVxB1NlX0T11PALNougqS8DDbx6CDlihaUu6LjgRaR
 BWhH/y6y93sFsjE22C0xTx7S18/QfZ8Ktucdcu3IMMJlLgtV00aey4SuI/WVdEXsXNPi
 g09rnIvr+8wZyojBl9338K3m3iD2DYRb96JhDMWFsBNpVVbZqYDQHlJbLjRla45yk8uM
 Vwfg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Xp25pyG4
Subject: Re: [Buildroot] [PATCH v6 1/4] package/dbus-broker: new package
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am Mi., 27. Juli 2022 um 13:08 Uhr schrieb Arnout Vandecappelle
<arnout@mind.be>:
>
>   Norbert, Yann,
>
>   As usual, apologies for taking so long to review this. It's because it's a bit
> complicated. I actually tried to look at it just after our hackaton in January
> but it was too complicated to quickly get my head around.
>
> On 09/01/2022 23:16, Norbert Lange wrote:
> > dbus-broker is an alternate implementation of a dbus dameon. It can be
> > used as a drop-in replacement for the system bus daemon, as well as the
> > session bus daemon.
> >
> > dbus-broker is (basically, and as far as we're concerned in Buildroot)
> > split in two components:
> >
> >    - the actual message bus daemon, that relays messages across clients
> >
> >    - a launcher, which is responsible for setting various aspects of the
> >      bus, like setting the policy et al. and opening the socket(s) the
> >      message bus daemon will have to listen on...
> >
> > The launcher can only be used in a systemd setup (it makes heavy use of
> > systemd facilities), while the message bus is generic. However, the
> > message bus daemon is useless without a launcher. There does not exist a
> > non-systemd launcher, which makes dbus-broker actually a systemd-only
> > package; this can be revisited when/if a non-systemd launcher appears.
> >
> > Note, however, that libdbus is not provided by dbus-borker. People who
> > want to use dbus-broker as the bus daemon, and need libdbus, will have
> > to enable both, see below.
> >
> > There are two cases:
> >
> >   1. original dbus disabled
> >
> >      Here, we install the config files and systemd socket activation
> >      units; dbus-broker provides the system and sessions bus daemons.
> >
> >      In this case, libdbus is not available.
> >
> >   2. original dbus enabled
> >
> >      In this case, we do not install the config files and systemd socket
> >      activation units, or define a user: they all are provided by the
> >      original dbus, and we piggy-back on those.
> >
> >      In this situation, the default system and sessions message bus are
> >      the original dbus, and libdbus is available; dbus-broker is not
> >      enabled.
> >
> >      So far, we believe it would be over-engineered to provide a way
> >      to allow choosing the bus daemon in the configuraiton. However,
> >      users may opt-in to use dbus-broker in a few ways:
> >        - at build-time: by calling systemctl enable/disable from a
> >          post-build script (preferred), or by providing drop-in units
> >          or presets in an overlay (less preferred) or custom skeleton
> >          (as a last resort),
> >        - at runtime (on a RW filesystem): by calling systemctl
> >          enable/disable
>
>   I don't know... To me it seems logical that if both are enabled, that you use
> dbus-broker for the bus and only use original dbus for libdbus.

Would be fine by me, back then most distros required you to
manually enable dbus-broker, now it seems they shift to using
it by default if installed.

>   So to me the proper approach seems to change dbus itself so the daemon is
> optional, i.e. only libdbus is installed if the daemon is not enabled, similar
> to e.g. libcurl. BR2_PACKAGE_DBUS_DAEMON should default to y because that's what
> most people want. We'd have to go through existing packages to check if they
> depend on libdbus or on the daemon - mostly it will be the first. If there is a
> package that really needs the daemon (I don't actually think so), then we might
> need to introduce a virtual package for the daemon. Regardless, dbus-broker
> should depend on !BR2_PACKAGE_DBUS_DAEMON.

Debian does something similar, including splitting of the xml config files
and actual daemons into their own packages.

see [1].

> > Note about the user: the path to the system bus socket is a so-called
> > "well-known location": it is expected to be there, by spec. Moving it
> > elsewhere is going to break existing programs. So, the user running the
> > system bus daemon must be able to create that socket.
> >
> > As we may have two packages providing a system bus daemon, they have to
> > be both able to create the socket, and thus must both be able to write
> > in the directory containing the socket. And since they can be switched
> > at runtime, they must be running as the same user.
> >
> > We can't just reference the original dbus user, so we duplicate the
> > entry. What is important, is that the user be named 'dbus', as that's
> > what we use in both cases.
>
>   If it's a virtual package, then the user could be created by the virtual
> package itself.

with systemd you probably dont even need a real user for the isolation
benefits.
So maybe this would just be necessary if dbus utilities are used,
you can also just let systemd create that user dynamically:

[Service]
...
User=dbus
Group=dbus
DynamicUser=true
ExecStart=!/usr/bin/dbus-broker-launch --scope system --audit
ExecReload=!/usr/bin/busctl call org.freedesktop.DBus
/org/freedesktop/DBus org.freedesktop.DBus ReloadConfig


> > Finally, the licensing terms are pretty trivial for dbus-broker itself,
> > but it makes use of third-party code that it inherits as git submodules
> > (that are bundled in the release archive).
>
>   Ugh, bundling...
>
> > Thus the licensing is a bit
> > convoluted... The third-party codes claim to be licensed as "Apache-2.0
> > and LGP-2.1+" in their AUTHORS files, but at the same time claim
> > "**Apache-2.0** OR **LGPL-2.1-or-later**" in their README files. The
> > individual source files (that are used) do not seem to have any
> > licensing header to clarify the situation. So we represent the situation
> > with "Apache-2.0 and/or LGPL-2.1+".
>
>   That's rather f**d than convoluted :-)
>
> >
> > Signed-off-by: Norbert Lange <nolange79@gmail.com>
> > [yann.morin.1998@free.fr:
> >    - don't select systemd; depend on it instead
> >    - only install config files and systemd units without original dbus
> >    - install a user to run the message bus as
> >    - fix licensing info
> >    - entirely reword and extend the commit log
> >    - add myself to DEVELOPERS as well
> > ]
> > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
>
> [snip]
> > diff --git a/package/dbus-broker/Config.in b/package/dbus-broker/Config.in
> > new file mode 100644
> > index 0000000000..c7206232da
> > --- /dev/null
> > +++ b/package/dbus-broker/Config.in
> > @@ -0,0 +1,23 @@
> > +config BR2_PACKAGE_DBUS_BROKER
> > +     bool "dbus-broker"
> > +     depends on BR2_USE_MMU
> > +     depends on BR2_TOOLCHAIN_HAS_THREADS
> > +     depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_17
> > +     depends on BR2_PACKAGE_SYSTEMD
> > +     select BR2_PACKAGE_EXPAT
> > +     help
> > +       Linux D-Bus Message Broker.
> > +
> > +       The dbus-broker project is an implementation of a message bus
> > +       as defined by the D-Bus specification. Its aim is to provide
> > +       high performance and reliability, while keeping compatibility
> > +       to the D-Bus reference implementation.
> > +
> > +       It is exclusively written for Linux systems, and makes use of
> > +       many modern features provided by recent linux kernel releases.
> > +
> > +       https://github.com/bus1/dbus-broker/wiki
> > +
> > +comment "dbusbroker needs systemd and a toolchain w/ threads"
> > +     depends on BR2_USE_MMU
> > +     depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_PACKAGE_SYSTEMD
>
>   It's a nitpick, but: I think since dbus-broker is so tightly integrated with
> systemd, there's no point really to show the comment if systemd is not enabled.
>
> > diff --git a/package/dbus-broker/dbus-broker.hash b/package/dbus-broker/dbus-broker.hash
> > new file mode 100644
> > index 0000000000..26ebab7ac1
> > --- /dev/null
> > +++ b/package/dbus-broker/dbus-broker.hash
> > @@ -0,0 +1,3 @@
> > +# Locally calculated
> > +sha256  4eca425db52b7ab1027153e93fea9b3f11759db9e93ffbf88759b73ddfb8026a  dbus-broker-29.tar.xz
> > +sha256  3cda3630283eda0eab825abe5ac84d191248c6b3fe1c232a118124959b96c6a4  LICENSE
> > diff --git a/package/dbus-broker/dbus-broker.mk b/package/dbus-broker/dbus-broker.mk
> > new file mode 100644
> > index 0000000000..547b79eb84
> > --- /dev/null
> > +++ b/package/dbus-broker/dbus-broker.mk
> > @@ -0,0 +1,71 @@
> > +################################################################################
> > +#
> > +# dbus-broker
> > +#
> > +################################################################################
> > +
> > +DBUS_BROKER_VERSION = 29
>
>   By now we're at 31 already.
>
>   The new version uses meson's wrapgit feature instead of submodules, but
> fortunately the release tarball still include them.
>
> > +DBUS_BROKER_SOURCE = dbus-broker-$(DBUS_BROKER_VERSION).tar.xz
> > +DBUS_BROKER_SITE = https://github.com/bus1/dbus-broker/releases/download/v$(DBUS_BROKER_VERSION)
> > +
> > +# For the third-party code, the licensing legla-info is inconsistent between
> > +# the AUTHORS and README, so keep both
> > +DBUS_BROKER_LICENSE = \
> > +     Apache-2.0, \
> > +     Apache-2.0 and/or LGPL-2.1+ (c-dvar, c-ini, c-list, c-rbtree, c-shquote, c-stdaux, c-utf8)
> > +DBUS_BROKER_LICENSE_FILES = \
> > +     LICENSE \
> > +     subprojects/c-dvar/AUTHORS subprojects/c-dvar/README.md \
> > +     subprojects/c-ini/AUTHORS subprojects/c-ini/README.md \
> > +     subprojects/c-list/AUTHORS subprojects/c-list/README.md \
> > +     subprojects/c-rbtree/AUTHORS subprojects/c-rbtree/README.md \
> > +     subprojects/c-shquote/AUTHORS subprojects/c-shquote/README.md \
> > +     subprojects/c-stdaux/AUTHORS subprojects/c-stdaux/README.md \
> > +     subprojects/c-utf8/AUTHORS subprojects/c-utf8/README.md
> > +
> > +DBUS_BROKER_DEPENDENCIES = expat systemd
> > +DBUS_BROKER_CONF_OPTS = -Dlauncher=true
> > +
> > +ifeq ($(BR2_PACKAGE_AUDIT),y)
> > +DBUS_BROKER_DEPENDENCIES += audit
> > +DBUS_BROKER_CONF_OPTS += -Daudit=true
> > +else
> > +DBUS_BROKER_CONF_OPTS += -Daudit=false
> > +endif
> > +
> > +ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
> > +DBUS_BROKER_DEPENDENCIES += libselinux
> > +DBUS_BROKER_CONF_OPTS += -Dselinux=true
> > +else
> > +DBUS_BROKER_CONF_OPTS += -Dselinux=false
> > +endif
> > +
> > +# We must be using the same user as the original dbus, so we can share
> > +# the home directory and create a socket there. As a consequence, the
> > +# username and groupname must be dbus:dbus, and they both need to have
> > +# the same home.
> > +define DBUS_BROKER_USERS
> > +     dbus -1 dbus -1 * /run/dbus - dbus DBus messagebus user
> > +endef
> > +
> > +# Only install units for system bus daemon socket if original dbus is not present
> > +# Only install config and service files if original dbus is not present
> > +#
> > +# Note: BR2_COREUTILS_HOST_DEPENDENCY to be able to use ln --relative
> > +ifeq ($(BR2_PACKAGE_DBUS),)
> > +DBUS_BROKER_DEPENDENCIES += $(BR2_COREUTILS_HOST_DEPENDENCY)
> > +
> > +define DBUS_BROKER_INSTALL_INIT_SYSTEMD
> > +     $(INSTALL) -D -m 0644 $(DBUS_BROKER_PKGDIR)/session.conf \
> > +             $(TARGET_DIR)/usr/share/dbus-1/session.conf
> > +     $(INSTALL) -D -m 0644 $(DBUS_BROKER_PKGDIR)/system.conf \
> > +             $(TARGET_DIR)/usr/share/dbus-1/system.conf
> > +     $(INSTALL) -D -m 0644 $(DBUS_BROKER_PKGDIR)/dbus.socket \
> > +             $(TARGET_DIR)/usr/lib/systemd/system/dbus.socket
>
>   I'm surprised that these files either isn't needed for original dbus, or that
> it's included in original dbus but not in dbus-broker...

Not sure I understand what you are saying. They are needed for the
original dbus,
and not included in dbus-broker as the IPC daemon could
(theoretically) run without.
See [2].

>
> > +     $(HOST_MAKE_ENV) ln -sf --relative \
> > +             $(TARGET_DIR)/usr/lib/systemd/system/dbus.socket \
> > +             $(TARGET_DIR)/usr/lib/systemd/system/sockets.target.wants/dbus.socket
>
>   Is it really useful too include the coreutils dependency and HOST_MAKE_ENV,
> just to avoid having to put
>
>         ln -sf ../dbus-socket \
>                 $(TARGET_DIR)/usr/lib/systemd/system/sockets.target.wants/dbus.socket

Yann is very determined about that [3].

>   I'm going to work more on and hopefully merge this series later today. I have
> some local changes already (spelling mistakes), so please don't resend just yet.
>
>   Regards,
>   Arnout
>
>
> > +endef
> > +endif # !BR2_PACKAGE_DBUS
> > +
> > +$(eval $(meson-package))
>
> [snip]

Norbert

[1] - https://packages.debian.org/source/sid/dbus.
[2] - https://github.com/bus1/dbus-broker/issues/262
[3] - http://lists.busybox.net/pipermail/buildroot/2020-June/587178.html
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
