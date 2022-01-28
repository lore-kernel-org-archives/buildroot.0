Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22697C433EF
	for <buildroot@archiver.kernel.org>; Fri, 28 Jan 2022 19:23:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B780660C24;
	Fri, 28 Jan 2022 19:23:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LVi0JV5-c_GA; Fri, 28 Jan 2022 19:23:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F66360C0B;
	Fri, 28 Jan 2022 19:23:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6DD8B1BF345
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 19:23:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 58B9B405B5
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 19:23:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uYOEPAEzvhDk for <buildroot@lists.busybox.net>;
 Fri, 28 Jan 2022 19:23:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com
 [IPv6:2607:f8b0:4864:20::c2a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1BA1540590
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 19:23:34 +0000 (UTC)
Received: by mail-oo1-xc2a.google.com with SMTP id
 u25-20020a4ad0d9000000b002e8d4370689so1658838oor.12
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 11:23:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=M/w/T0kLTGmzjGjSFlPBWRUV3Fb5zW4aisJdijbSz/8=;
 b=aFedCuFibMBsTFh/cMiS01iEmPxGwHIs7h068h9LwqpxC5IiAKtQqRPt+or++Ehnrf
 sW7X8HRYcjEqhePrVqrIU2VzNT4pKVI7abG0M51lYHIgHbDW6L3f4XCAQ/oUS0ZaQRMx
 CXxRHpmsAZNGGy78UFBIvW4lFMgs5VDsA3SMHG3Le6p0b6eIsMxcKIsH6m+75iyGgYei
 pOlVSoyTCMECtbMBic59LaXb+uz5zHcw1j5QCDVIQ0oeUnUnnpsuGjCET73h8IaX+ibp
 alw1voS7M/5MBy5j+YkO0WzN7CoU8TtFT2rcU99kgaPCKpJhk/9cNu2unOf/HY/XT0uu
 iWPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M/w/T0kLTGmzjGjSFlPBWRUV3Fb5zW4aisJdijbSz/8=;
 b=exrNA6XoQcmqMyLpy7DDV0tvwm6u0glVQXM0zbGAithZKkkTO5VEVcdrWPwOgAfFhZ
 Q0RhFbCyAuGEuc2FCepu92ekT0LYcofxE1XuLKkJF7U1iGA42bndVse/jj529s8DY5c5
 JZRTf2TrbAG6JaNnQ2lX56SpRkI83AmZ8eFSJxiWU02OPdEeOM11ABj3XOFu8nyjEh0n
 4CWwtWJHvkU9aSqJVvrv67D6FMKteoGH3m1MHIzbxF6phEEDaB6Xkmhebo7dysKPXzc6
 NGJnTmSNdZwNR2IlO0xVM/Gzt1bXoyX55xhw8KMXT90J4x8QLZjIorxiIenJS/4YCC3m
 wOCA==
X-Gm-Message-State: AOAM530SWyV7ZiZMbjbaH2C2IiJnknJhWYyW14N+zvHaU+aZqAvoR4iA
 Z9/riDoTK0NBhGL9x1I0XSdMQV56QRivPngnMFs=
X-Google-Smtp-Source: ABdhPJzivgfHQziqi3OAwbVC2D44Y3F/L6wbn03vtyTle5yulV8090JzXP+qasF5Uru2TUTOxnyYs8cHrZQuQTpFtQI=
X-Received: by 2002:a05:6820:610:: with SMTP id
 e16mr5030085oow.69.1643397812953; 
 Fri, 28 Jan 2022 11:23:32 -0800 (PST)
MIME-Version: 1.0
References: <20220127183924.1938903-1-james.hilliard1@gmail.com>
 <20220127210924.GQ457876@scaer> <20220128085017.786b1c13@gmx.net>
In-Reply-To: <20220128085017.786b1c13@gmx.net>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 28 Jan 2022 12:23:21 -0700
Message-ID: <CADvTj4r4rugBpXmijqthsynG-AW_xY-AnA5DqQbKbOF5pfbSog@mail.gmail.com>
To: Peter Seiderer <ps.report@gmx.net>
Subject: Re: [Buildroot] [PATCH 1/1] package/network-manager: migrate
 autotools build system to meson
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
 "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, Jan 28, 2022 at 12:50 AM Peter Seiderer <ps.report@gmx.net> wrote:
>
> Hello James, Yann,
>
> On Thu, 27 Jan 2022 22:09:24 +0100, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
>
> > James, All,
> >
> > On 2022-01-27 11:39 -0700, James Hilliard spake thusly:
> > > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > > ---
> > >  package/network-manager/Config.in          |   1 +
> > >  package/network-manager/network-manager.mk | 100 ++++++++++-----------
> > >  2 files changed, 48 insertions(+), 53 deletions(-)
> > >
> > > diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
> > > index a48cb37b15..da1a7d79b3 100644
> > > --- a/package/network-manager/Config.in
> > > +++ b/package/network-manager/Config.in
> > > @@ -40,6 +40,7 @@ config BR2_PACKAGE_NETWORK_MANAGER_TUI
> > >  config BR2_PACKAGE_NETWORK_MANAGER_MODEM_MANAGER
> > >     bool "modem-manager support"
> > >     select BR2_PACKAGE_MODEM_MANAGER
> > > +   select BR2_PACKAGE_MOBILE_BROADBAND_PROVIDER_INFO
> >
> > It looks like this is totally unrelated to the switch to meson, and
> > should be applied in its own right, and then backported to the
> > maintenance branches, no?
> >
> > If it is due to the switch to meson, then it should be explained in the
> > commit log.
> >
> > Regards,
> > Yann E. MORIN.
> >
> > >     help
> > >       This option enables support for ModemManager
> > >
> > > diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
> > > index 974320fce0..290333e16c 100644
> > > --- a/package/network-manager/network-manager.mk
> > > +++ b/package/network-manager/network-manager.mk
> > > @@ -9,7 +9,7 @@ NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).12
> > >  NETWORK_MANAGER_SOURCE = NetworkManager-$(NETWORK_MANAGER_VERSION).tar.xz
> > >  NETWORK_MANAGER_SITE = https://download.gnome.org/sources/NetworkManager/$(NETWORK_MANAGER_VERSION_MAJOR)
> > >  NETWORK_MANAGER_INSTALL_STAGING = YES
> > > -NETWORK_MANAGER_DEPENDENCIES = host-pkgconf udev gnutls libglib2 \
> > > +NETWORK_MANAGER_DEPENDENCIES = host-pkgconf dbus udev gnutls libglib2 \
>
> Same comment as Yann beofore, here for added dbus dependency...

Yeah, seems both are just needed due to the pkg-config variables being needed:
https://patchwork.ozlabs.org/project/buildroot/patch/20220128191952.2776015-1-james.hilliard1@gmail.com/

>
> Regards,
> Peter
>
> > >     libgcrypt wireless_tools util-linux host-intltool libndp
> > >  NETWORK_MANAGER_LICENSE = GPL-2.0+ (app), LGPL-2.1+ (libnm)
> > >  NETWORK_MANAGER_LICENSE_FILES = COPYING COPYING.LGPL CONTRIBUTING.md
> > > @@ -17,129 +17,123 @@ NETWORK_MANAGER_CPE_ID_VENDOR = gnome
> > >  NETWORK_MANAGER_CPE_ID_PRODUCT = networkmanager
> > >  NETWORK_MANAGER_SELINUX_MODULES = networkmanager
> > >
> > > -NETWORK_MANAGER_CONF_ENV = \
> > > -   ac_cv_path_LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config \
> > > -   ac_cv_file__etc_fedora_release=no \
> > > -   ac_cv_file__etc_mandriva_release=no \
> > > -   ac_cv_file__etc_debian_version=no \
> > > -   ac_cv_file__etc_redhat_release=no \
> > > -   ac_cv_file__etc_SuSE_release=no
> > > -
> > >  NETWORK_MANAGER_CONF_OPTS = \
> > > -   --disable-introspection \
> > > -   --disable-tests \
> > > -   --disable-qt \
> > > -   --disable-more-warnings \
> > > -   --with-crypto=gnutls \
> > > -   --with-iptables=/usr/sbin/iptables \
> > > -   --disable-ifupdown \
> > > -   --without-nm-cloud-setup
> > > +   -Dintrospection=false \
> > > +   -Ddocs=false \
> > > +   -Dtests=no \
> > > +   -Dqt=false \
> > > +   -Dcrypto=gnutls \
> > > +   -Diptables=/usr/sbin/iptables \
> > > +   -Difupdown=false \
> > > +   -Dnm_cloud_setup=false \
> > > +   -Dsession_tracking_consolekit=false
> > >
> > >  ifeq ($(BR2_PACKAGE_AUDIT),y)
> > >  NETWORK_MANAGER_DEPENDENCIES += audit
> > > -NETWORK_MANAGER_CONF_OPTS += --with-libaudit
> > > +NETWORK_MANAGER_CONF_OPTS += -Dlibaudit=yes
> > >  else
> > > -NETWORK_MANAGER_CONF_OPTS += --without-libaudit
> > > +NETWORK_MANAGER_CONF_OPTS += -Dlibaudit=no
> > >  endif
> > >
> > >  ifeq ($(BR2_PACKAGE_DHCP_CLIENT),y)
> > > -NETWORK_MANAGER_CONF_OPTS += --with-dhclient=/sbin/dhclient
> > > +NETWORK_MANAGER_CONF_OPTS += -Ddhclient=/sbin/dhclient
> > >  endif
> > >
> > >  ifeq ($(BR2_PACKAGE_DHCPCD),y)
> > > -NETWORK_MANAGER_CONF_OPTS += --with-dhcpcd=/sbin/dhcpcd
> > > +NETWORK_MANAGER_CONF_OPTS += -Ddhcpcd=/sbin/dhcpcd
> > >  endif
> > >
> > >  ifeq ($(BR2_PACKAGE_IWD),y)
> > >  NETWORK_MANAGER_DEPENDENCIES += iwd
> > > -NETWORK_MANAGER_CONF_OPTS += --with-iwd
> > > +NETWORK_MANAGER_CONF_OPTS += -Diwd=true
> > >  else
> > > -NETWORK_MANAGER_CONF_OPTS += --without-iwd
> > > +NETWORK_MANAGER_CONF_OPTS += -Diwd=false
> > >  endif
> > >
> > >  ifeq ($(BR2_PACKAGE_LIBCURL),y)
> > >  NETWORK_MANAGER_DEPENDENCIES += libcurl
> > > -NETWORK_MANAGER_CONF_OPTS += --enable-concheck
> > > +NETWORK_MANAGER_CONF_OPTS += -Dconcheck=true
> > >  else
> > > -NETWORK_MANAGER_CONF_OPTS += --disable-concheck
> > > +NETWORK_MANAGER_CONF_OPTS += -Dconcheck=false
> > >  endif
> > >
> > >  ifeq ($(BR2_PACKAGE_LIBPSL),y)
> > >  NETWORK_MANAGER_DEPENDENCIES += libpsl
> > > -NETWORK_MANAGER_CONF_OPTS += --with-libpsl
> > > +NETWORK_MANAGER_CONF_OPTS += -Dlibpsl=true
> > >  else
> > > -NETWORK_MANAGER_CONF_OPTS += --without-libpsl
> > > +NETWORK_MANAGER_CONF_OPTS += -Dlibpsl=false
> > >  endif
> > >
> > >  ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
> > >  NETWORK_MANAGER_DEPENDENCIES += libselinux
> > > -NETWORK_MANAGER_CONF_OPTS += --with-selinux
> > > +NETWORK_MANAGER_CONF_OPTS += -Dselinux=true
> > >  else
> > > -NETWORK_MANAGER_CONF_OPTS += --without-selinux
> > > +NETWORK_MANAGER_CONF_OPTS += -Dselinux=false
> > >  endif
> > >
> > >  ifeq ($(BR2_PACKAGE_NETWORK_MANAGER_MODEM_MANAGER),y)
> > > -NETWORK_MANAGER_DEPENDENCIES += modem-manager
> > > -NETWORK_MANAGER_CONF_OPTS += --with-modem-manager-1
> > > +NETWORK_MANAGER_DEPENDENCIES += modem-manager mobile-broadband-provider-info
> > > +NETWORK_MANAGER_CONF_OPTS += -Dmodem_manager=true
> > >  else
> > > -NETWORK_MANAGER_CONF_OPTS += --without-modem-manager-1
> > > +NETWORK_MANAGER_CONF_OPTS += -Dmodem_manager=false
> > >  endif
> > >
> > >  ifeq ($(BR2_PACKAGE_NETWORK_MANAGER_OVS),y)
> > > -NETWORK_MANAGER_CONF_OPTS += --enable-ovs
> > > +NETWORK_MANAGER_CONF_OPTS += -Dovs=true
> > >  NETWORK_MANAGER_DEPENDENCIES += jansson
> > >  else
> > > -NETWORK_MANAGER_CONF_OPTS += --disable-ovs
> > > +NETWORK_MANAGER_CONF_OPTS += -Dovs=false
> > >  endif
> > >
> > >  ifeq ($(BR2_PACKAGE_NETWORK_MANAGER_PPPD),y)
> > >  NETWORK_MANAGER_DEPENDENCIES += pppd
> > > -NETWORK_MANAGER_CONF_OPTS += --enable-ppp
> > > +NETWORK_MANAGER_CONF_OPTS += -Dppp=true
> > >  else
> > > -NETWORK_MANAGER_CONF_OPTS += --disable-ppp
> > > +NETWORK_MANAGER_CONF_OPTS += -Dppp=false
> > >  endif
> > >
> > >  ifeq ($(BR2_PACKAGE_NETWORK_MANAGER_TUI),y)
> > >  NETWORK_MANAGER_DEPENDENCIES += newt
> > > -NETWORK_MANAGER_CONF_OPTS += --with-nmtui
> > > +NETWORK_MANAGER_CONF_OPTS += -Dnmtui=true
> > >  else
> > > -NETWORK_MANAGER_CONF_OPTS += --without-nmtui
> > > +NETWORK_MANAGER_CONF_OPTS += -Dnmtui=false
> > >  endif
> > >
> > >  ifeq ($(BR2_PACKAGE_OFONO),y)
> > >  NETWORK_MANAGER_DEPENDENCIES += ofono
> > > -NETWORK_MANAGER_CONF_OPTS += --with-ofono
> > > +NETWORK_MANAGER_CONF_OPTS += -Dofono=true
> > >  else
> > > -NETWORK_MANAGER_CONF_OPTS += --without-ofono
> > > +NETWORK_MANAGER_CONF_OPTS += -Dofono=false
> > >  endif
> > >
> > >  ifeq ($(BR2_PACKAGE_SYSTEMD),y)
> > >  NETWORK_MANAGER_DEPENDENCIES += systemd
> > >  NETWORK_MANAGER_CONF_OPTS += \
> > > -   --with-systemd-journal \
> > > -   --with-config-logging-backend-default=journal \
> > > -   --with-session-tracking=systemd \
> > > -   --with-suspend-resume=systemd
> > > +   -Dsystemd_journal=true \
> > > +   -Dconfig_logging_backend_default=journal \
> > > +   -Dsession_tracking=systemd \
> > > +   -Dsuspend_resume=systemd
> > >  else
> > >  NETWORK_MANAGER_CONF_OPTS += \
> > > -   --without-systemd-journal \
> > > -   --with-config-logging-backend-default=syslog \
> > > -   --without-session-tracking \
> > > -   --with-suspend-resume=upower
> > > +   -Dsystemd_journal=false \
> > > +   -Dconfig_logging_backend_default=syslog \
> > > +   -Dsession_tracking=no \
> > > +   -Dsuspend_resume=upower \
> > > +   -Dsystemdsystemunitdir=no
> > >  endif
> > >
> > >  ifeq ($(BR2_PACKAGE_POLKIT),y)
> > >  NETWORK_MANAGER_DEPENDENCIES += polkit
> > > -NETWORK_MANAGER_CONF_OPTS += --enable-polkit
> > > +NETWORK_MANAGER_CONF_OPTS += -Dpolkit=true
> > >  else
> > > -NETWORK_MANAGER_CONF_OPTS += --disable-polkit
> > > +NETWORK_MANAGER_CONF_OPTS += -Dpolkit=false
> > >  endif
> > >
> > >  ifeq ($(BR2_PACKAGE_READLINE),y)
> > >  NETWORK_MANAGER_DEPENDENCIES += readline
> > > -NETWORK_MANAGER_CONF_OPTS += --with-nmcli
> > > +NETWORK_MANAGER_CONF_OPTS += -Dnmcli=true
> > >  else
> > > -NETWORK_MANAGER_CONF_OPTS += --without-nmcli
> > > +NETWORK_MANAGER_CONF_OPTS += -Dnmcli=false
> > >  endif
> > >
> > >  define NETWORK_MANAGER_INSTALL_INIT_SYSV
> > > @@ -152,4 +146,4 @@ define NETWORK_MANAGER_INSTALL_INIT_SYSTEMD
> > >
> > >  endef
> > >
> > > -$(eval $(autotools-package))
> > > +$(eval $(meson-package))
> > > --
> > > 2.25.1
> > >
> > > _______________________________________________
> > > buildroot mailing list
> > > buildroot@buildroot.org
> > > https://lists.buildroot.org/mailman/listinfo/buildroot
> >
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
