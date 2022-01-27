Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABB22C433F5
	for <buildroot@archiver.kernel.org>; Thu, 27 Jan 2022 21:18:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3971840137;
	Thu, 27 Jan 2022 21:18:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eH7QzlPXcznk; Thu, 27 Jan 2022 21:18:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C990B4020B;
	Thu, 27 Jan 2022 21:18:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 65EC31BF369
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 21:18:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6023B40137
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 21:18:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Yrw5dou971VI for <buildroot@lists.busybox.net>;
 Thu, 27 Jan 2022 21:18:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DB8DC40017
 for <buildroot@buildroot.org>; Thu, 27 Jan 2022 21:18:51 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 c3-20020a9d6c83000000b00590b9c8819aso3826737otr.6
 for <buildroot@buildroot.org>; Thu, 27 Jan 2022 13:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=F70cidQ7IAiMxuS2YzVtCETKSz5TPAc+gx8YDF+EEiI=;
 b=mkoVbPkvsyOV8gG0Ap01uUVQcQqr3fq6ycRlaRENcm3awAI+tyWXLngjiP96zzY/MV
 jaZYKu1E//E6H8tcfgWW0uTNeMMvq2ygOfR9Pu7BDrjIHaLYV+c2OQrV11I4lkeVvoBT
 uFhN7sWDvMOccHyzUTDUcwMmIr0VyjOjxF+oKIuH7TIROTVZMN8O5FeCbCWpkKEcZsLS
 Cx6NvPOHQBM5/8+68mhWu5Sa4j3xFhMj0lTgoXSPjg2ss5hKaQwADcDwiT6edxP3gg8I
 B0XDDrqtLmAB4EG1dF0xM2bUHwdKX23enOmhsp4vGzzGkNEN+ytq/oNhIfeKDSUmGEP9
 Bxrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=F70cidQ7IAiMxuS2YzVtCETKSz5TPAc+gx8YDF+EEiI=;
 b=2xj0Hv+guLb5nkGS1s7sfxjvMP27OfvyBY2PPE9Ug6/mNa9SLuqop3ABdvOWGYjUa4
 cYkN+qVX4M8QQE4K1o5tB9oBXcRoNJ2mrxc+EOz30uZZKBgQ2JxTN05q1xTVEKaRzZkw
 LUDfF+LwBIW4dUe95xJrZjtYvfRTGG2m/7UiAkBoj/HKk8AUsalAJvy5/VroNIxJqgxu
 PWqllItbPdU9L0ZlvJkbShEQuJ4uDqK/bxQiuHkj+X60iXnbVtugBe5dCefFLyTJdNj5
 x83cgeYExywXUgtwXRODqwUqIuriNkU0acyPpsJY5w5Ze0Zy8Im1fvpcfZ+iaIBrijnE
 OS6Q==
X-Gm-Message-State: AOAM533B/z6xuw74RDtuHaxmqG4hN21qfz6hy5/QLNGM5l1os6AexdeF
 qAp9Kip3n1/9mgGrti1WBqBVtbUXh7S7mwdKx90acyT9
X-Google-Smtp-Source: ABdhPJziREawT2jcjXTUjKGKJG2GTEGA98uYcM5giSfkTJryo04DyberLhnWTVyjgHVtwFrgF/1HMw1Ynt+uOIylNhs=
X-Received: by 2002:a9d:7383:: with SMTP id j3mr3253029otk.167.1643318330747; 
 Thu, 27 Jan 2022 13:18:50 -0800 (PST)
MIME-Version: 1.0
References: <20220127183924.1938903-1-james.hilliard1@gmail.com>
 <20220127210924.GQ457876@scaer>
In-Reply-To: <20220127210924.GQ457876@scaer>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 27 Jan 2022 14:18:39 -0700
Message-ID: <CADvTj4qiMBPcdxp_rffUwS2Rb4F9e6UnEi3q4WFK85yw2p3stQ@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
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
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, Jan 27, 2022 at 2:09 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> James, All,
>
> On 2022-01-27 11:39 -0700, James Hilliard spake thusly:
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  package/network-manager/Config.in          |   1 +
> >  package/network-manager/network-manager.mk | 100 ++++++++++-----------
> >  2 files changed, 48 insertions(+), 53 deletions(-)
> >
> > diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
> > index a48cb37b15..da1a7d79b3 100644
> > --- a/package/network-manager/Config.in
> > +++ b/package/network-manager/Config.in
> > @@ -40,6 +40,7 @@ config BR2_PACKAGE_NETWORK_MANAGER_TUI
> >  config BR2_PACKAGE_NETWORK_MANAGER_MODEM_MANAGER
> >       bool "modem-manager support"
> >       select BR2_PACKAGE_MODEM_MANAGER
> > +     select BR2_PACKAGE_MOBILE_BROADBAND_PROVIDER_INFO
>
> It looks like this is totally unrelated to the switch to meson, and
> should be applied in its own right, and then backported to the
> maintenance branches, no?
>
> If it is due to the switch to meson, then it should be explained in the
> commit log.

Well meson is enforcing that dependency is present while autotools was not.

I'm not really sure if it's actually a hard requirement for the modem manager
integration to work correctly.

>
> Regards,
> Yann E. MORIN.
>
> >       help
> >         This option enables support for ModemManager
> >
> > diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
> > index 974320fce0..290333e16c 100644
> > --- a/package/network-manager/network-manager.mk
> > +++ b/package/network-manager/network-manager.mk
> > @@ -9,7 +9,7 @@ NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).12
> >  NETWORK_MANAGER_SOURCE = NetworkManager-$(NETWORK_MANAGER_VERSION).tar.xz
> >  NETWORK_MANAGER_SITE = https://download.gnome.org/sources/NetworkManager/$(NETWORK_MANAGER_VERSION_MAJOR)
> >  NETWORK_MANAGER_INSTALL_STAGING = YES
> > -NETWORK_MANAGER_DEPENDENCIES = host-pkgconf udev gnutls libglib2 \
> > +NETWORK_MANAGER_DEPENDENCIES = host-pkgconf dbus udev gnutls libglib2 \
> >       libgcrypt wireless_tools util-linux host-intltool libndp
> >  NETWORK_MANAGER_LICENSE = GPL-2.0+ (app), LGPL-2.1+ (libnm)
> >  NETWORK_MANAGER_LICENSE_FILES = COPYING COPYING.LGPL CONTRIBUTING.md
> > @@ -17,129 +17,123 @@ NETWORK_MANAGER_CPE_ID_VENDOR = gnome
> >  NETWORK_MANAGER_CPE_ID_PRODUCT = networkmanager
> >  NETWORK_MANAGER_SELINUX_MODULES = networkmanager
> >
> > -NETWORK_MANAGER_CONF_ENV = \
> > -     ac_cv_path_LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config \
> > -     ac_cv_file__etc_fedora_release=no \
> > -     ac_cv_file__etc_mandriva_release=no \
> > -     ac_cv_file__etc_debian_version=no \
> > -     ac_cv_file__etc_redhat_release=no \
> > -     ac_cv_file__etc_SuSE_release=no
> > -
> >  NETWORK_MANAGER_CONF_OPTS = \
> > -     --disable-introspection \
> > -     --disable-tests \
> > -     --disable-qt \
> > -     --disable-more-warnings \
> > -     --with-crypto=gnutls \
> > -     --with-iptables=/usr/sbin/iptables \
> > -     --disable-ifupdown \
> > -     --without-nm-cloud-setup
> > +     -Dintrospection=false \
> > +     -Ddocs=false \
> > +     -Dtests=no \
> > +     -Dqt=false \
> > +     -Dcrypto=gnutls \
> > +     -Diptables=/usr/sbin/iptables \
> > +     -Difupdown=false \
> > +     -Dnm_cloud_setup=false \
> > +     -Dsession_tracking_consolekit=false
> >
> >  ifeq ($(BR2_PACKAGE_AUDIT),y)
> >  NETWORK_MANAGER_DEPENDENCIES += audit
> > -NETWORK_MANAGER_CONF_OPTS += --with-libaudit
> > +NETWORK_MANAGER_CONF_OPTS += -Dlibaudit=yes
> >  else
> > -NETWORK_MANAGER_CONF_OPTS += --without-libaudit
> > +NETWORK_MANAGER_CONF_OPTS += -Dlibaudit=no
> >  endif
> >
> >  ifeq ($(BR2_PACKAGE_DHCP_CLIENT),y)
> > -NETWORK_MANAGER_CONF_OPTS += --with-dhclient=/sbin/dhclient
> > +NETWORK_MANAGER_CONF_OPTS += -Ddhclient=/sbin/dhclient
> >  endif
> >
> >  ifeq ($(BR2_PACKAGE_DHCPCD),y)
> > -NETWORK_MANAGER_CONF_OPTS += --with-dhcpcd=/sbin/dhcpcd
> > +NETWORK_MANAGER_CONF_OPTS += -Ddhcpcd=/sbin/dhcpcd
> >  endif
> >
> >  ifeq ($(BR2_PACKAGE_IWD),y)
> >  NETWORK_MANAGER_DEPENDENCIES += iwd
> > -NETWORK_MANAGER_CONF_OPTS += --with-iwd
> > +NETWORK_MANAGER_CONF_OPTS += -Diwd=true
> >  else
> > -NETWORK_MANAGER_CONF_OPTS += --without-iwd
> > +NETWORK_MANAGER_CONF_OPTS += -Diwd=false
> >  endif
> >
> >  ifeq ($(BR2_PACKAGE_LIBCURL),y)
> >  NETWORK_MANAGER_DEPENDENCIES += libcurl
> > -NETWORK_MANAGER_CONF_OPTS += --enable-concheck
> > +NETWORK_MANAGER_CONF_OPTS += -Dconcheck=true
> >  else
> > -NETWORK_MANAGER_CONF_OPTS += --disable-concheck
> > +NETWORK_MANAGER_CONF_OPTS += -Dconcheck=false
> >  endif
> >
> >  ifeq ($(BR2_PACKAGE_LIBPSL),y)
> >  NETWORK_MANAGER_DEPENDENCIES += libpsl
> > -NETWORK_MANAGER_CONF_OPTS += --with-libpsl
> > +NETWORK_MANAGER_CONF_OPTS += -Dlibpsl=true
> >  else
> > -NETWORK_MANAGER_CONF_OPTS += --without-libpsl
> > +NETWORK_MANAGER_CONF_OPTS += -Dlibpsl=false
> >  endif
> >
> >  ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
> >  NETWORK_MANAGER_DEPENDENCIES += libselinux
> > -NETWORK_MANAGER_CONF_OPTS += --with-selinux
> > +NETWORK_MANAGER_CONF_OPTS += -Dselinux=true
> >  else
> > -NETWORK_MANAGER_CONF_OPTS += --without-selinux
> > +NETWORK_MANAGER_CONF_OPTS += -Dselinux=false
> >  endif
> >
> >  ifeq ($(BR2_PACKAGE_NETWORK_MANAGER_MODEM_MANAGER),y)
> > -NETWORK_MANAGER_DEPENDENCIES += modem-manager
> > -NETWORK_MANAGER_CONF_OPTS += --with-modem-manager-1
> > +NETWORK_MANAGER_DEPENDENCIES += modem-manager mobile-broadband-provider-info
> > +NETWORK_MANAGER_CONF_OPTS += -Dmodem_manager=true
> >  else
> > -NETWORK_MANAGER_CONF_OPTS += --without-modem-manager-1
> > +NETWORK_MANAGER_CONF_OPTS += -Dmodem_manager=false
> >  endif
> >
> >  ifeq ($(BR2_PACKAGE_NETWORK_MANAGER_OVS),y)
> > -NETWORK_MANAGER_CONF_OPTS += --enable-ovs
> > +NETWORK_MANAGER_CONF_OPTS += -Dovs=true
> >  NETWORK_MANAGER_DEPENDENCIES += jansson
> >  else
> > -NETWORK_MANAGER_CONF_OPTS += --disable-ovs
> > +NETWORK_MANAGER_CONF_OPTS += -Dovs=false
> >  endif
> >
> >  ifeq ($(BR2_PACKAGE_NETWORK_MANAGER_PPPD),y)
> >  NETWORK_MANAGER_DEPENDENCIES += pppd
> > -NETWORK_MANAGER_CONF_OPTS += --enable-ppp
> > +NETWORK_MANAGER_CONF_OPTS += -Dppp=true
> >  else
> > -NETWORK_MANAGER_CONF_OPTS += --disable-ppp
> > +NETWORK_MANAGER_CONF_OPTS += -Dppp=false
> >  endif
> >
> >  ifeq ($(BR2_PACKAGE_NETWORK_MANAGER_TUI),y)
> >  NETWORK_MANAGER_DEPENDENCIES += newt
> > -NETWORK_MANAGER_CONF_OPTS += --with-nmtui
> > +NETWORK_MANAGER_CONF_OPTS += -Dnmtui=true
> >  else
> > -NETWORK_MANAGER_CONF_OPTS += --without-nmtui
> > +NETWORK_MANAGER_CONF_OPTS += -Dnmtui=false
> >  endif
> >
> >  ifeq ($(BR2_PACKAGE_OFONO),y)
> >  NETWORK_MANAGER_DEPENDENCIES += ofono
> > -NETWORK_MANAGER_CONF_OPTS += --with-ofono
> > +NETWORK_MANAGER_CONF_OPTS += -Dofono=true
> >  else
> > -NETWORK_MANAGER_CONF_OPTS += --without-ofono
> > +NETWORK_MANAGER_CONF_OPTS += -Dofono=false
> >  endif
> >
> >  ifeq ($(BR2_PACKAGE_SYSTEMD),y)
> >  NETWORK_MANAGER_DEPENDENCIES += systemd
> >  NETWORK_MANAGER_CONF_OPTS += \
> > -     --with-systemd-journal \
> > -     --with-config-logging-backend-default=journal \
> > -     --with-session-tracking=systemd \
> > -     --with-suspend-resume=systemd
> > +     -Dsystemd_journal=true \
> > +     -Dconfig_logging_backend_default=journal \
> > +     -Dsession_tracking=systemd \
> > +     -Dsuspend_resume=systemd
> >  else
> >  NETWORK_MANAGER_CONF_OPTS += \
> > -     --without-systemd-journal \
> > -     --with-config-logging-backend-default=syslog \
> > -     --without-session-tracking \
> > -     --with-suspend-resume=upower
> > +     -Dsystemd_journal=false \
> > +     -Dconfig_logging_backend_default=syslog \
> > +     -Dsession_tracking=no \
> > +     -Dsuspend_resume=upower \
> > +     -Dsystemdsystemunitdir=no
> >  endif
> >
> >  ifeq ($(BR2_PACKAGE_POLKIT),y)
> >  NETWORK_MANAGER_DEPENDENCIES += polkit
> > -NETWORK_MANAGER_CONF_OPTS += --enable-polkit
> > +NETWORK_MANAGER_CONF_OPTS += -Dpolkit=true
> >  else
> > -NETWORK_MANAGER_CONF_OPTS += --disable-polkit
> > +NETWORK_MANAGER_CONF_OPTS += -Dpolkit=false
> >  endif
> >
> >  ifeq ($(BR2_PACKAGE_READLINE),y)
> >  NETWORK_MANAGER_DEPENDENCIES += readline
> > -NETWORK_MANAGER_CONF_OPTS += --with-nmcli
> > +NETWORK_MANAGER_CONF_OPTS += -Dnmcli=true
> >  else
> > -NETWORK_MANAGER_CONF_OPTS += --without-nmcli
> > +NETWORK_MANAGER_CONF_OPTS += -Dnmcli=false
> >  endif
> >
> >  define NETWORK_MANAGER_INSTALL_INIT_SYSV
> > @@ -152,4 +146,4 @@ define NETWORK_MANAGER_INSTALL_INIT_SYSTEMD
> >
> >  endef
> >
> > -$(eval $(autotools-package))
> > +$(eval $(meson-package))
> > --
> > 2.25.1
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
