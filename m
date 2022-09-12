Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA6C8ECAAD5
	for <buildroot@archiver.kernel.org>; Mon, 12 Sep 2022 09:10:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B07741729;
	Mon, 12 Sep 2022 09:10:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B07741729
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yRFFPNKMn97R; Mon, 12 Sep 2022 09:09:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC4E7424C0;
	Mon, 12 Sep 2022 09:09:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC4E7424C0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D9C161BF476
 for <buildroot@lists.busybox.net>; Mon, 12 Sep 2022 09:09:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ACC57424C0
 for <buildroot@lists.busybox.net>; Mon, 12 Sep 2022 09:09:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ACC57424C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cIw6is1zZT3S for <buildroot@lists.busybox.net>;
 Mon, 12 Sep 2022 09:09:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F69741729
Received: from relais-inet.orange.com (relais-inet.orange.com [80.12.70.36])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3F69741729
 for <buildroot@buildroot.org>; Mon, 12 Sep 2022 09:09:52 +0000 (UTC)
Received: from opfednr06.francetelecom.fr (unknown [xx.xx.xx.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by opfednr25.francetelecom.fr (ESMTP service) with ESMTPS id 4MR1594wBYzCrCQ; 
 Mon, 12 Sep 2022 11:09:49 +0200 (CEST)
Received: by tl-lnx-nyma7486 (sSMTP sendmail emulation);
 Mon, 12 Sep 2022 11:09:47 +0200
Date: Mon, 12 Sep 2022 11:09:47 +0200
From: <yann.morin@orange.com>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <7192_1662973789_631EF75D_7192_6_1_20220912090947.GE2865@tl-lnx-nyma7486>
References: <20220327173137.2575467-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220327173137.2575467-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Originating-IP: [10.115.26.52]
X-ClientProxiedBy: OPE16NORMBX502.corporate.adroot.infra.ftgroup
 (10.115.26.26) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; s=ORANGE001; t=1662973789;
 bh=aNzny1zlhQj9bPj8YvEuICFrJehysscKIQR+/Q03r/g=;
 h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
 b=TB0X/NaNF2SSyVk37kki3R/d7+2rMmMtzgq3D9XxWT5FAgUsIS8vEohlEsvTLwZ2/
 ThsZ/WNLN2tRMpeFquMQI2/urgm11C3rPgsu3DW+9JigQhsBj/oWL9yp8A9fFy8F2e
 zPtNQ04lidle1rtfRLe4SiJjI2nfN2vVoY56Vtug5KmbtGWVnQxr+8vXHSK1kBZRD0
 LQlaUOPplefAS2N7Qo+sOu5D3sEPR6jGda9eKG6zIUi7IQ5aLQ8mIHFSimAKVd2h9A
 z0gjSydhl1VymK6kGPlD6u7ARehDUWeO/sWVRmvN5+4T3p7QaCeJnvWAYihKnUuZdE
 bwxoMzs6JZSaw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=ORANGE001 header.b=TB0X/NaN
Subject: Re: [Buildroot] [PATCH v3 1/1] package/network-manager: migrate
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

On 2022-03-27 11:31 -0600, James Hilliard spake thusly:
> We need to add dbus as a build dependency since the meson build system
> uses dbus pkg-config to determine install locations.
> 
> The meson build also requires mobile-broadband-info in order to get
> the database pkg-config variable.

This switch to meson breaks the build with pppd:

    Has header "pppd/pppd.h" : YES
    Program pppd /sbin/pppd /usr/sbin/pppd found: NO

    ../../../O/br-2022.08/vtc/build/network-manager-1.36.4/meson.build:570:4: ERROR: Assert failed: pppd required but not found, please provide a valid pppd path or use -Dppp=false to disable it

So, it should not look into my host system to find the pppd executable,
this is plain wrong for cross-compilation.

I'll do some experiments using:
    -Dpppd=/usr/sbin/pppd -Dpppd_plugin_dir=/usr/lib/pppd/$(PPPD_VERSION)

Does that looks OK?

Regards,
Yann E. MORIN.

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
> Changes v2 -> v3:
>   - rebase on version 1.36.4 update
> Changes v1 -> v2:
>   - add comments on new dependencies
> ---
>  package/network-manager/Config.in          |   1 +
>  package/network-manager/network-manager.mk | 106 ++++++++++-----------
>  2 files changed, 51 insertions(+), 56 deletions(-)
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
>  	help
>  	  This option enables support for ModemManager
>  
> diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
> index 3479bb3794..19f2eb3b59 100644
> --- a/package/network-manager/network-manager.mk
> +++ b/package/network-manager/network-manager.mk
> @@ -9,7 +9,7 @@ NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).4
>  NETWORK_MANAGER_SOURCE = NetworkManager-$(NETWORK_MANAGER_VERSION).tar.xz
>  NETWORK_MANAGER_SITE = https://download.gnome.org/sources/NetworkManager/$(NETWORK_MANAGER_VERSION_MAJOR)
>  NETWORK_MANAGER_INSTALL_STAGING = YES
> -NETWORK_MANAGER_DEPENDENCIES = host-pkgconf udev gnutls libglib2 \
> +NETWORK_MANAGER_DEPENDENCIES = host-pkgconf dbus udev gnutls libglib2 \
>  	libgcrypt wireless_tools util-linux host-intltool libndp
>  NETWORK_MANAGER_LICENSE = GPL-2.0+ (app), LGPL-2.1+ (libnm)
>  NETWORK_MANAGER_LICENSE_FILES = COPYING COPYING.LGPL CONTRIBUTING.md
> @@ -17,136 +17,130 @@ NETWORK_MANAGER_CPE_ID_VENDOR = gnome
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
>  ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT),y)
> -NETWORK_MANAGER_CONF_OPTS += --with-config-wifi-backend-default=wpa_supplicant
> +NETWORK_MANAGER_CONF_OPTS += -Dconfig_wifi_backend_default=wpa_supplicant
>  else
> -NETWORK_MANAGER_CONF_OPTS += --with-config-wifi-backend-default=iwd
> +NETWORK_MANAGER_CONF_OPTS += -Dconfig_wifi_backend_default=iwd
>  endif
>  else
>  NETWORK_MANAGER_CONF_OPTS += \
> -	--without-iwd \
> -	--with-config-wifi-backend-default=wpa_supplicant
> +	-Diwd=false \
> +	-Dconfig_wifi_backend_default=wpa_supplicant
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
> @@ -159,4 +153,4 @@ define NETWORK_MANAGER_INSTALL_INIT_SYSTEMD
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
                                        ____________
.-----------------.--------------------:       _    :------------------.
|  Yann E. MORIN  | Real-Time Embedded |    __/ )   | /"\ ASCII RIBBON |
|                 | Software  Designer |  _/ - /'   | \ / CAMPAIGN     |
| +33 638.411.245 '--------------------: (_    `--, |  X  AGAINST      |
| yann.morin (at) orange.com           |_="    ,--' | / \ HTML MAIL    |
'--------------------------------------:______/_____:------------------'


_________________________________________________________________________________________________________________________

Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
