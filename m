Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D01FC433FE
	for <buildroot@archiver.kernel.org>; Fri, 28 Jan 2022 07:50:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8574941687;
	Fri, 28 Jan 2022 07:50:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R0aPBBZIAEtX; Fri, 28 Jan 2022 07:50:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D255417D2;
	Fri, 28 Jan 2022 07:50:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 879711BF3BC
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 07:50:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 75EFF60B9A
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 07:50:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0QHDSiT6-oyv for <buildroot@lists.busybox.net>;
 Fri, 28 Jan 2022 07:50:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C76E060B49
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 07:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643356218;
 bh=kLcd32NI9ft0/i4Qvh9L/rAhNXEZVCDzoo33WMZrY44=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=azV8UHlwyrq5Xi1cf6K5IFgmjRH1krJSj3t47w563gnVqxy2duWhzVkuwWTx6RUjz
 nSDVgAjBXNy4LNEECSiQMC8Wg1aIWj52269y3Bv0qaN0y6chjaexyiIAJcP0DpTS/M
 9A0ATJMNBVfLiPMQywOGSQzeOtH+p1nipDx5H4Qc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.233]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MBlxM-1n7phe2f6a-00CBgS; Fri, 28
 Jan 2022 08:50:18 +0100
Date: Fri, 28 Jan 2022 08:50:17 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20220128085017.786b1c13@gmx.net>
In-Reply-To: <20220127210924.GQ457876@scaer>
References: <20220127183924.1938903-1-james.hilliard1@gmail.com>
 <20220127210924.GQ457876@scaer>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:aLXq6i/eVV6JfQKemg0Ln4Hjf+TkdZ+n6RbsNS65ydfrdwSMmeQ
 JA9NsTcWgcrDwj5Zi+hiImabe/dQ741CzDwjxYTG6yk5Fmxq4f/XHJHQO9VFgDnyuW5RqWK
 eeAo5pio3qcmdC0S9OocZp/ULuXwhPljfoW70+pIqi483HRIGu4Ixb8GVODsR9m6khud0WS
 OsRjaExwJirxyqZ1iWleQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:NXSIvQputoI=:7yUtgrSUbebbFTIisACSWb
 jXp2ApZ3/RZmgqz8bQ7wLsbYEQxUtQWhB1N4U9QAQBY4Khwi2aiyTkdMNvTiCbRAseb8pdKjI
 oWHsuHMJQkQ4W6qQICWHl4OwN8Mty73lppgP0C5XkxgdbhQgbRscO0kddw6wMPvdqYXgw2YYF
 gvhaEUAjl4iLeWuOeh5CKtQXwXvorCLLFAPDsYRi1Fym763pPLb532//QrOF1O9lOXV8AytQc
 v10ipMY+BsGomAvE5qaXjJeFxiwsIrS1yBPb/BzqE3ICUCzW5E8/EkR0A56lAblJ3mcfrKHCx
 bz75Gi9Z+fgNHY6AssuaqikPaFR3wdPiQLjwLZgtTHEsaifhXMK0uB8IjKJCmZsE8usXGqnw0
 I1JsSVCyAjirK/Uu2pt+eQuvZFXvJbGIFXK+bwifyvd1o9u93vwf034dhE3WZZm3s/T41h1rp
 N86+6mDZVXWR2GmiPT493aToKFPhwlTbUvXZg6iabQMZF+Yk9uxqj2cyrZN1+Ml2lFp+zgET4
 656p4Xs8fSkVQQaJlaOCDaiM2ZZKXi3sQiICP+khwCam0OQkD0cffyrQ6VVJq2vXfBla265EU
 jlTzxQp1/fUjQkFg4VjiZUaSIgD8H9Uz0rtrRUEqyJxdfzUSt+zF/9jNHzQQ9HoAyTGyoeNSF
 labOEhG9dW6QvyYcrSCtzti92YZROI33xZ7nQkawphEECptU8sk1Alr2EmqTRB+d0afO+31x+
 pgps2eYwzQS5FNu3UC/Rbjp5CHzbQ8tqLRHQtKJ+FJq7RVOkShwgnbf24ozhZrOSj9xhtQnZS
 nIFiwlsQj4doKdBJcQyS8i0rXl8M3oOKBvjs7LAkLV/1FA0TcV0K6MCLSXipjJ5A9i6W7Vwgj
 BmC7SRIt3oUzHO0tfF0yFODyAavZ7YogKVS4ng4futAKWRTHed37V3LmpCyuenxRt2W6PMpma
 WMZWSrH2t3CtY7J7lCV86N/F6mkoOLOezYrOzMM7O5KQO6lmdKdpjOsIn1/IfaB1QRAVOFtRv
 K4PABgUY5Tyccmblxs77lYQdaHfWPi853G9tBkl4TDMwZ2FcS3CyZ1rgJS/ecKld3cZ97Vdjo
 CYWzrRpjj7cZbE=
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
 James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello James, Yann,

On Thu, 27 Jan 2022 22:09:24 +0100, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

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
> >  	bool "modem-manager support"
> >  	select BR2_PACKAGE_MODEM_MANAGER
> > +	select BR2_PACKAGE_MOBILE_BROADBAND_PROVIDER_INFO
>
> It looks like this is totally unrelated to the switch to meson, and
> should be applied in its own right, and then backported to the
> maintenance branches, no?
>
> If it is due to the switch to meson, then it should be explained in the
> commit log.
>
> Regards,
> Yann E. MORIN.
>
> >  	help
> >  	  This option enables support for ModemManager
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

Same comment as Yann beofore, here for added dbus dependency...

Regards,
Peter

> >  	libgcrypt wireless_tools util-linux host-intltool libndp
> >  NETWORK_MANAGER_LICENSE = GPL-2.0+ (app), LGPL-2.1+ (libnm)
> >  NETWORK_MANAGER_LICENSE_FILES = COPYING COPYING.LGPL CONTRIBUTING.md
> > @@ -17,129 +17,123 @@ NETWORK_MANAGER_CPE_ID_VENDOR = gnome
> >  NETWORK_MANAGER_CPE_ID_PRODUCT = networkmanager
> >  NETWORK_MANAGER_SELINUX_MODULES = networkmanager
> >
> > -NETWORK_MANAGER_CONF_ENV = \
> > -	ac_cv_path_LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config \
> > -	ac_cv_file__etc_fedora_release=no \
> > -	ac_cv_file__etc_mandriva_release=no \
> > -	ac_cv_file__etc_debian_version=no \
> > -	ac_cv_file__etc_redhat_release=no \
> > -	ac_cv_file__etc_SuSE_release=no
> > -
> >  NETWORK_MANAGER_CONF_OPTS = \
> > -	--disable-introspection \
> > -	--disable-tests \
> > -	--disable-qt \
> > -	--disable-more-warnings \
> > -	--with-crypto=gnutls \
> > -	--with-iptables=/usr/sbin/iptables \
> > -	--disable-ifupdown \
> > -	--without-nm-cloud-setup
> > +	-Dintrospection=false \
> > +	-Ddocs=false \
> > +	-Dtests=no \
> > +	-Dqt=false \
> > +	-Dcrypto=gnutls \
> > +	-Diptables=/usr/sbin/iptables \
> > +	-Difupdown=false \
> > +	-Dnm_cloud_setup=false \
> > +	-Dsession_tracking_consolekit=false
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
> > -	--with-systemd-journal \
> > -	--with-config-logging-backend-default=journal \
> > -	--with-session-tracking=systemd \
> > -	--with-suspend-resume=systemd
> > +	-Dsystemd_journal=true \
> > +	-Dconfig_logging_backend_default=journal \
> > +	-Dsession_tracking=systemd \
> > +	-Dsuspend_resume=systemd
> >  else
> >  NETWORK_MANAGER_CONF_OPTS += \
> > -	--without-systemd-journal \
> > -	--with-config-logging-backend-default=syslog \
> > -	--without-session-tracking \
> > -	--with-suspend-resume=upower
> > +	-Dsystemd_journal=false \
> > +	-Dconfig_logging_backend_default=syslog \
> > +	-Dsession_tracking=no \
> > +	-Dsuspend_resume=upower \
> > +	-Dsystemdsystemunitdir=no
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

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
