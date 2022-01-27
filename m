Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9E8AC433F5
	for <buildroot@archiver.kernel.org>; Thu, 27 Jan 2022 21:09:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 501A160ABB;
	Thu, 27 Jan 2022 21:09:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LOK-rzbJBPXE; Thu, 27 Jan 2022 21:09:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C2E060AEE;
	Thu, 27 Jan 2022 21:09:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 933461BF369
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 21:09:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F26A2400CE
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 21:09:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vg1Ld7RPyQHc for <buildroot@lists.busybox.net>;
 Thu, 27 Jan 2022 21:09:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2604240017
 for <buildroot@buildroot.org>; Thu, 27 Jan 2022 21:09:31 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:cc8e:5bc6:13d0:52a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 22ADF200385;
 Thu, 27 Jan 2022 22:09:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1643317768;
 bh=5C5zwZp1hZzlEO2CWuszp9KkY1U/+U+BvlyojvaxgGo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JJrWKqJJdxzDV/V+6ROEfddrmaOWa4tTtA1/9Zm1u0C01QP3hrDeUW8+5BvGUTWAp
 kVUNqtSbNkO8xBmivt1VTPvU0ia4Q4Bps8Y6M0UyL9nq4Lh0SwmjTKpbOzs9HdpomG
 SAg3EafRJ/oObXuIJspcerE6yWlVhk08FuSUYf1iwkaU/16JinkjTNFju5CRdLrJmF
 nfXBem98uTeMNS0NPAL960oGB/SS5CK7K9j3il4VKh+L6IJdXRSc/FTfPktSUUTVWN
 GMwD3i96Yn2Uzoo6JvlWWRkzW1aeoW8t64x9LsrkoG4wDdPLUKA8o4JWWwwpRtly+f
 oFnbx3GiCtQAA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 27 Jan 2022 22:09:24 +0100
Date: Thu, 27 Jan 2022 22:09:24 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220127210924.GQ457876@scaer>
References: <20220127183924.1938903-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220127183924.1938903-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2022-01-27 11:39 -0700, James Hilliard spake thusly:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/network-manager/Config.in          |   1 +
>  package/network-manager/network-manager.mk | 100 ++++++++++-----------
>  2 files changed, 48 insertions(+), 53 deletions(-)
> 
> diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
> index a48cb37b15..da1a7d79b3 100644
> --- a/package/network-manager/Config.in
> +++ b/package/network-manager/Config.in
> @@ -40,6 +40,7 @@ config BR2_PACKAGE_NETWORK_MANAGER_TUI
>  config BR2_PACKAGE_NETWORK_MANAGER_MODEM_MANAGER
>  	bool "modem-manager support"
>  	select BR2_PACKAGE_MODEM_MANAGER
> +	select BR2_PACKAGE_MOBILE_BROADBAND_PROVIDER_INFO

It looks like this is totally unrelated to the switch to meson, and
should be applied in its own right, and then backported to the
maintenance branches, no?

If it is due to the switch to meson, then it should be explained in the
commit log.

Regards,
Yann E. MORIN.

>  	help
>  	  This option enables support for ModemManager
>  
> diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
> index 974320fce0..290333e16c 100644
> --- a/package/network-manager/network-manager.mk
> +++ b/package/network-manager/network-manager.mk
> @@ -9,7 +9,7 @@ NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).12
>  NETWORK_MANAGER_SOURCE = NetworkManager-$(NETWORK_MANAGER_VERSION).tar.xz
>  NETWORK_MANAGER_SITE = https://download.gnome.org/sources/NetworkManager/$(NETWORK_MANAGER_VERSION_MAJOR)
>  NETWORK_MANAGER_INSTALL_STAGING = YES
> -NETWORK_MANAGER_DEPENDENCIES = host-pkgconf udev gnutls libglib2 \
> +NETWORK_MANAGER_DEPENDENCIES = host-pkgconf dbus udev gnutls libglib2 \
>  	libgcrypt wireless_tools util-linux host-intltool libndp
>  NETWORK_MANAGER_LICENSE = GPL-2.0+ (app), LGPL-2.1+ (libnm)
>  NETWORK_MANAGER_LICENSE_FILES = COPYING COPYING.LGPL CONTRIBUTING.md
> @@ -17,129 +17,123 @@ NETWORK_MANAGER_CPE_ID_VENDOR = gnome
>  NETWORK_MANAGER_CPE_ID_PRODUCT = networkmanager
>  NETWORK_MANAGER_SELINUX_MODULES = networkmanager
>  
> -NETWORK_MANAGER_CONF_ENV = \
> -	ac_cv_path_LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config \
> -	ac_cv_file__etc_fedora_release=no \
> -	ac_cv_file__etc_mandriva_release=no \
> -	ac_cv_file__etc_debian_version=no \
> -	ac_cv_file__etc_redhat_release=no \
> -	ac_cv_file__etc_SuSE_release=no
> -
>  NETWORK_MANAGER_CONF_OPTS = \
> -	--disable-introspection \
> -	--disable-tests \
> -	--disable-qt \
> -	--disable-more-warnings \
> -	--with-crypto=gnutls \
> -	--with-iptables=/usr/sbin/iptables \
> -	--disable-ifupdown \
> -	--without-nm-cloud-setup
> +	-Dintrospection=false \
> +	-Ddocs=false \
> +	-Dtests=no \
> +	-Dqt=false \
> +	-Dcrypto=gnutls \
> +	-Diptables=/usr/sbin/iptables \
> +	-Difupdown=false \
> +	-Dnm_cloud_setup=false \
> +	-Dsession_tracking_consolekit=false
>  
>  ifeq ($(BR2_PACKAGE_AUDIT),y)
>  NETWORK_MANAGER_DEPENDENCIES += audit
> -NETWORK_MANAGER_CONF_OPTS += --with-libaudit
> +NETWORK_MANAGER_CONF_OPTS += -Dlibaudit=yes
>  else
> -NETWORK_MANAGER_CONF_OPTS += --without-libaudit
> +NETWORK_MANAGER_CONF_OPTS += -Dlibaudit=no
>  endif
>  
>  ifeq ($(BR2_PACKAGE_DHCP_CLIENT),y)
> -NETWORK_MANAGER_CONF_OPTS += --with-dhclient=/sbin/dhclient
> +NETWORK_MANAGER_CONF_OPTS += -Ddhclient=/sbin/dhclient
>  endif
>  
>  ifeq ($(BR2_PACKAGE_DHCPCD),y)
> -NETWORK_MANAGER_CONF_OPTS += --with-dhcpcd=/sbin/dhcpcd
> +NETWORK_MANAGER_CONF_OPTS += -Ddhcpcd=/sbin/dhcpcd
>  endif
>  
>  ifeq ($(BR2_PACKAGE_IWD),y)
>  NETWORK_MANAGER_DEPENDENCIES += iwd
> -NETWORK_MANAGER_CONF_OPTS += --with-iwd
> +NETWORK_MANAGER_CONF_OPTS += -Diwd=true
>  else
> -NETWORK_MANAGER_CONF_OPTS += --without-iwd
> +NETWORK_MANAGER_CONF_OPTS += -Diwd=false
>  endif
>  
>  ifeq ($(BR2_PACKAGE_LIBCURL),y)
>  NETWORK_MANAGER_DEPENDENCIES += libcurl
> -NETWORK_MANAGER_CONF_OPTS += --enable-concheck
> +NETWORK_MANAGER_CONF_OPTS += -Dconcheck=true
>  else
> -NETWORK_MANAGER_CONF_OPTS += --disable-concheck
> +NETWORK_MANAGER_CONF_OPTS += -Dconcheck=false
>  endif
>  
>  ifeq ($(BR2_PACKAGE_LIBPSL),y)
>  NETWORK_MANAGER_DEPENDENCIES += libpsl
> -NETWORK_MANAGER_CONF_OPTS += --with-libpsl
> +NETWORK_MANAGER_CONF_OPTS += -Dlibpsl=true
>  else
> -NETWORK_MANAGER_CONF_OPTS += --without-libpsl
> +NETWORK_MANAGER_CONF_OPTS += -Dlibpsl=false
>  endif
>  
>  ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
>  NETWORK_MANAGER_DEPENDENCIES += libselinux
> -NETWORK_MANAGER_CONF_OPTS += --with-selinux
> +NETWORK_MANAGER_CONF_OPTS += -Dselinux=true
>  else
> -NETWORK_MANAGER_CONF_OPTS += --without-selinux
> +NETWORK_MANAGER_CONF_OPTS += -Dselinux=false
>  endif
>  
>  ifeq ($(BR2_PACKAGE_NETWORK_MANAGER_MODEM_MANAGER),y)
> -NETWORK_MANAGER_DEPENDENCIES += modem-manager
> -NETWORK_MANAGER_CONF_OPTS += --with-modem-manager-1
> +NETWORK_MANAGER_DEPENDENCIES += modem-manager mobile-broadband-provider-info
> +NETWORK_MANAGER_CONF_OPTS += -Dmodem_manager=true
>  else
> -NETWORK_MANAGER_CONF_OPTS += --without-modem-manager-1
> +NETWORK_MANAGER_CONF_OPTS += -Dmodem_manager=false
>  endif
>  
>  ifeq ($(BR2_PACKAGE_NETWORK_MANAGER_OVS),y)
> -NETWORK_MANAGER_CONF_OPTS += --enable-ovs
> +NETWORK_MANAGER_CONF_OPTS += -Dovs=true
>  NETWORK_MANAGER_DEPENDENCIES += jansson
>  else
> -NETWORK_MANAGER_CONF_OPTS += --disable-ovs
> +NETWORK_MANAGER_CONF_OPTS += -Dovs=false
>  endif
>  
>  ifeq ($(BR2_PACKAGE_NETWORK_MANAGER_PPPD),y)
>  NETWORK_MANAGER_DEPENDENCIES += pppd
> -NETWORK_MANAGER_CONF_OPTS += --enable-ppp
> +NETWORK_MANAGER_CONF_OPTS += -Dppp=true
>  else
> -NETWORK_MANAGER_CONF_OPTS += --disable-ppp
> +NETWORK_MANAGER_CONF_OPTS += -Dppp=false
>  endif
>  
>  ifeq ($(BR2_PACKAGE_NETWORK_MANAGER_TUI),y)
>  NETWORK_MANAGER_DEPENDENCIES += newt
> -NETWORK_MANAGER_CONF_OPTS += --with-nmtui
> +NETWORK_MANAGER_CONF_OPTS += -Dnmtui=true
>  else
> -NETWORK_MANAGER_CONF_OPTS += --without-nmtui
> +NETWORK_MANAGER_CONF_OPTS += -Dnmtui=false
>  endif
>  
>  ifeq ($(BR2_PACKAGE_OFONO),y)
>  NETWORK_MANAGER_DEPENDENCIES += ofono
> -NETWORK_MANAGER_CONF_OPTS += --with-ofono
> +NETWORK_MANAGER_CONF_OPTS += -Dofono=true
>  else
> -NETWORK_MANAGER_CONF_OPTS += --without-ofono
> +NETWORK_MANAGER_CONF_OPTS += -Dofono=false
>  endif
>  
>  ifeq ($(BR2_PACKAGE_SYSTEMD),y)
>  NETWORK_MANAGER_DEPENDENCIES += systemd
>  NETWORK_MANAGER_CONF_OPTS += \
> -	--with-systemd-journal \
> -	--with-config-logging-backend-default=journal \
> -	--with-session-tracking=systemd \
> -	--with-suspend-resume=systemd
> +	-Dsystemd_journal=true \
> +	-Dconfig_logging_backend_default=journal \
> +	-Dsession_tracking=systemd \
> +	-Dsuspend_resume=systemd
>  else
>  NETWORK_MANAGER_CONF_OPTS += \
> -	--without-systemd-journal \
> -	--with-config-logging-backend-default=syslog \
> -	--without-session-tracking \
> -	--with-suspend-resume=upower
> +	-Dsystemd_journal=false \
> +	-Dconfig_logging_backend_default=syslog \
> +	-Dsession_tracking=no \
> +	-Dsuspend_resume=upower \
> +	-Dsystemdsystemunitdir=no
>  endif
>  
>  ifeq ($(BR2_PACKAGE_POLKIT),y)
>  NETWORK_MANAGER_DEPENDENCIES += polkit
> -NETWORK_MANAGER_CONF_OPTS += --enable-polkit
> +NETWORK_MANAGER_CONF_OPTS += -Dpolkit=true
>  else
> -NETWORK_MANAGER_CONF_OPTS += --disable-polkit
> +NETWORK_MANAGER_CONF_OPTS += -Dpolkit=false
>  endif
>  
>  ifeq ($(BR2_PACKAGE_READLINE),y)
>  NETWORK_MANAGER_DEPENDENCIES += readline
> -NETWORK_MANAGER_CONF_OPTS += --with-nmcli
> +NETWORK_MANAGER_CONF_OPTS += -Dnmcli=true
>  else
> -NETWORK_MANAGER_CONF_OPTS += --without-nmcli
> +NETWORK_MANAGER_CONF_OPTS += -Dnmcli=false
>  endif
>  
>  define NETWORK_MANAGER_INSTALL_INIT_SYSV
> @@ -152,4 +146,4 @@ define NETWORK_MANAGER_INSTALL_INIT_SYSTEMD
>  
>  endef
>  
> -$(eval $(autotools-package))
> +$(eval $(meson-package))
> -- 
> 2.25.1
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
