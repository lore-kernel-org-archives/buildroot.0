Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5A5EC433F5
	for <buildroot@archiver.kernel.org>; Sun, 27 Mar 2022 17:31:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74D0B60C33;
	Sun, 27 Mar 2022 17:31:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OhtifO-zOQr9; Sun, 27 Mar 2022 17:31:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D35B606E6;
	Sun, 27 Mar 2022 17:31:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AAC441BF3F6
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 17:31:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A4A57408BD
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 17:31:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3k9U_g1gkVkm for <buildroot@lists.busybox.net>;
 Sun, 27 Mar 2022 17:31:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8BE45408B8
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 17:31:42 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id q11so14516821iod.6
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 10:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FLhFe+E42ZlKDEbzrQrgIKaa07OVzWltiA+e64aDMKI=;
 b=BZg039nnzoJ0ACRh1sDImxBwjPMk3143D32FZQKPNj4+H+IrujFA5BjtzNFhzqouX8
 fK43ogAYkMz2Cn2EaE26gDL633c6vLPFEihWqhjYg2l1aholNTQf0wSjwoaTBd63c9Sh
 Q8ctKBKP7FueQZJxFnLqQdkhwlFJrbzTP5UkKVdRPTJSlSvhq2C/TMw1UoBD+rbUUJYd
 IXsQqEtl1xjTTJYORfrTnI7xVZFDgkffUjobM/E292dI3dAouM2OPaHpL2cSejn2m8Th
 XKInLgxB9OeqQDDAb5ahfYJkBdzm4ZpSSXQmdJBK4Peh4CN3gvFNFnjHW/DBBgHTbAVk
 OBAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FLhFe+E42ZlKDEbzrQrgIKaa07OVzWltiA+e64aDMKI=;
 b=d3ZshUvEmKMtUr8hJiSxtrF7O+3qzVXYPS4SkMbox7b9ADz8wcig2nUXAqcPPS/iSs
 IFb/2XtCZSKKK520ar3jyLolkCPjjuJCCxDWzma9yJTHB0qu1+vEG5bC5cy4bheJLj7x
 soLjiTr+nvKpiAdzXsvKd9esVDM/cjFMWdOZET8eVP0O8Pvx+S7CsZBBpvDEVZ8q0Ph2
 p0h42ej74UmZrredjSQKfya0wdalJwwRz0CPJ2zxbiRggVMsYo5afFH/R7BDKDivMMiy
 txRrOn8JSMTvOrKWv0jbzOVmfJVl3xw/mifAAthxJwn650SJyL1fhY1GCjKGMw34w8Oc
 ooOA==
X-Gm-Message-State: AOAM5321orS8uzEW2ZJpqfZZv4LPbE0LDTIX6qhH9py5mk2r7LT0bA3U
 jJsboeqNAQbt72g79kYBvLWMw9YzxleMew==
X-Google-Smtp-Source: ABdhPJzM6jczpfvXwXCkwlxMxCEKO1iT6cqw61sn/6/T0/mXn+FySG23XIFTetmliltMCKgtbkvgSQ==
X-Received: by 2002:a02:844d:0:b0:317:397b:1765 with SMTP id
 l13-20020a02844d000000b00317397b1765mr11453169jah.67.1648402301418; 
 Sun, 27 Mar 2022 10:31:41 -0700 (PDT)
Received: from james-x399.localdomain (71-218-122-133.hlrn.qwest.net.
 [71.218.122.133]) by smtp.gmail.com with ESMTPSA id
 g2-20020a056e021e0200b002c82a3f69cesm6810383ila.8.2022.03.27.10.31.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Mar 2022 10:31:41 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 27 Mar 2022 11:31:37 -0600
Message-Id: <20220327173137.2575467-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 1/1] package/network-manager: migrate
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
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

We need to add dbus as a build dependency since the meson build system
uses dbus pkg-config to determine install locations.

The meson build also requires mobile-broadband-info in order to get
the database pkg-config variable.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v2 -> v3:
  - rebase on version 1.36.4 update
Changes v1 -> v2:
  - add comments on new dependencies
---
 package/network-manager/Config.in          |   1 +
 package/network-manager/network-manager.mk | 106 ++++++++++-----------
 2 files changed, 51 insertions(+), 56 deletions(-)

diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
index a48cb37b15..da1a7d79b3 100644
--- a/package/network-manager/Config.in
+++ b/package/network-manager/Config.in
@@ -40,6 +40,7 @@ config BR2_PACKAGE_NETWORK_MANAGER_TUI
 config BR2_PACKAGE_NETWORK_MANAGER_MODEM_MANAGER
 	bool "modem-manager support"
 	select BR2_PACKAGE_MODEM_MANAGER
+	select BR2_PACKAGE_MOBILE_BROADBAND_PROVIDER_INFO
 	help
 	  This option enables support for ModemManager
 
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 3479bb3794..19f2eb3b59 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -9,7 +9,7 @@ NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).4
 NETWORK_MANAGER_SOURCE = NetworkManager-$(NETWORK_MANAGER_VERSION).tar.xz
 NETWORK_MANAGER_SITE = https://download.gnome.org/sources/NetworkManager/$(NETWORK_MANAGER_VERSION_MAJOR)
 NETWORK_MANAGER_INSTALL_STAGING = YES
-NETWORK_MANAGER_DEPENDENCIES = host-pkgconf udev gnutls libglib2 \
+NETWORK_MANAGER_DEPENDENCIES = host-pkgconf dbus udev gnutls libglib2 \
 	libgcrypt wireless_tools util-linux host-intltool libndp
 NETWORK_MANAGER_LICENSE = GPL-2.0+ (app), LGPL-2.1+ (libnm)
 NETWORK_MANAGER_LICENSE_FILES = COPYING COPYING.LGPL CONTRIBUTING.md
@@ -17,136 +17,130 @@ NETWORK_MANAGER_CPE_ID_VENDOR = gnome
 NETWORK_MANAGER_CPE_ID_PRODUCT = networkmanager
 NETWORK_MANAGER_SELINUX_MODULES = networkmanager
 
-NETWORK_MANAGER_CONF_ENV = \
-	ac_cv_path_LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config \
-	ac_cv_file__etc_fedora_release=no \
-	ac_cv_file__etc_mandriva_release=no \
-	ac_cv_file__etc_debian_version=no \
-	ac_cv_file__etc_redhat_release=no \
-	ac_cv_file__etc_SuSE_release=no
-
 NETWORK_MANAGER_CONF_OPTS = \
-	--disable-introspection \
-	--disable-tests \
-	--disable-qt \
-	--disable-more-warnings \
-	--with-crypto=gnutls \
-	--with-iptables=/usr/sbin/iptables \
-	--disable-ifupdown \
-	--without-nm-cloud-setup
+	-Dintrospection=false \
+	-Ddocs=false \
+	-Dtests=no \
+	-Dqt=false \
+	-Dcrypto=gnutls \
+	-Diptables=/usr/sbin/iptables \
+	-Difupdown=false \
+	-Dnm_cloud_setup=false \
+	-Dsession_tracking_consolekit=false
 
 ifeq ($(BR2_PACKAGE_AUDIT),y)
 NETWORK_MANAGER_DEPENDENCIES += audit
-NETWORK_MANAGER_CONF_OPTS += --with-libaudit
+NETWORK_MANAGER_CONF_OPTS += -Dlibaudit=yes
 else
-NETWORK_MANAGER_CONF_OPTS += --without-libaudit
+NETWORK_MANAGER_CONF_OPTS += -Dlibaudit=no
 endif
 
 ifeq ($(BR2_PACKAGE_DHCP_CLIENT),y)
-NETWORK_MANAGER_CONF_OPTS += --with-dhclient=/sbin/dhclient
+NETWORK_MANAGER_CONF_OPTS += -Ddhclient=/sbin/dhclient
 endif
 
 ifeq ($(BR2_PACKAGE_DHCPCD),y)
-NETWORK_MANAGER_CONF_OPTS += --with-dhcpcd=/sbin/dhcpcd
+NETWORK_MANAGER_CONF_OPTS += -Ddhcpcd=/sbin/dhcpcd
 endif
 
 ifeq ($(BR2_PACKAGE_IWD),y)
 NETWORK_MANAGER_DEPENDENCIES += iwd
-NETWORK_MANAGER_CONF_OPTS += --with-iwd
+NETWORK_MANAGER_CONF_OPTS += -Diwd=true
 ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT),y)
-NETWORK_MANAGER_CONF_OPTS += --with-config-wifi-backend-default=wpa_supplicant
+NETWORK_MANAGER_CONF_OPTS += -Dconfig_wifi_backend_default=wpa_supplicant
 else
-NETWORK_MANAGER_CONF_OPTS += --with-config-wifi-backend-default=iwd
+NETWORK_MANAGER_CONF_OPTS += -Dconfig_wifi_backend_default=iwd
 endif
 else
 NETWORK_MANAGER_CONF_OPTS += \
-	--without-iwd \
-	--with-config-wifi-backend-default=wpa_supplicant
+	-Diwd=false \
+	-Dconfig_wifi_backend_default=wpa_supplicant
 endif
 
 ifeq ($(BR2_PACKAGE_LIBCURL),y)
 NETWORK_MANAGER_DEPENDENCIES += libcurl
-NETWORK_MANAGER_CONF_OPTS += --enable-concheck
+NETWORK_MANAGER_CONF_OPTS += -Dconcheck=true
 else
-NETWORK_MANAGER_CONF_OPTS += --disable-concheck
+NETWORK_MANAGER_CONF_OPTS += -Dconcheck=false
 endif
 
 ifeq ($(BR2_PACKAGE_LIBPSL),y)
 NETWORK_MANAGER_DEPENDENCIES += libpsl
-NETWORK_MANAGER_CONF_OPTS += --with-libpsl
+NETWORK_MANAGER_CONF_OPTS += -Dlibpsl=true
 else
-NETWORK_MANAGER_CONF_OPTS += --without-libpsl
+NETWORK_MANAGER_CONF_OPTS += -Dlibpsl=false
 endif
 
 ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
 NETWORK_MANAGER_DEPENDENCIES += libselinux
-NETWORK_MANAGER_CONF_OPTS += --with-selinux
+NETWORK_MANAGER_CONF_OPTS += -Dselinux=true
 else
-NETWORK_MANAGER_CONF_OPTS += --without-selinux
+NETWORK_MANAGER_CONF_OPTS += -Dselinux=false
 endif
 
 ifeq ($(BR2_PACKAGE_NETWORK_MANAGER_MODEM_MANAGER),y)
-NETWORK_MANAGER_DEPENDENCIES += modem-manager
-NETWORK_MANAGER_CONF_OPTS += --with-modem-manager-1
+NETWORK_MANAGER_DEPENDENCIES += modem-manager mobile-broadband-provider-info
+NETWORK_MANAGER_CONF_OPTS += -Dmodem_manager=true
 else
-NETWORK_MANAGER_CONF_OPTS += --without-modem-manager-1
+NETWORK_MANAGER_CONF_OPTS += -Dmodem_manager=false
 endif
 
 ifeq ($(BR2_PACKAGE_NETWORK_MANAGER_OVS),y)
-NETWORK_MANAGER_CONF_OPTS += --enable-ovs
+NETWORK_MANAGER_CONF_OPTS += -Dovs=true
 NETWORK_MANAGER_DEPENDENCIES += jansson
 else
-NETWORK_MANAGER_CONF_OPTS += --disable-ovs
+NETWORK_MANAGER_CONF_OPTS += -Dovs=false
 endif
 
 ifeq ($(BR2_PACKAGE_NETWORK_MANAGER_PPPD),y)
 NETWORK_MANAGER_DEPENDENCIES += pppd
-NETWORK_MANAGER_CONF_OPTS += --enable-ppp
+NETWORK_MANAGER_CONF_OPTS += -Dppp=true
 else
-NETWORK_MANAGER_CONF_OPTS += --disable-ppp
+NETWORK_MANAGER_CONF_OPTS += -Dppp=false
 endif
 
 ifeq ($(BR2_PACKAGE_NETWORK_MANAGER_TUI),y)
 NETWORK_MANAGER_DEPENDENCIES += newt
-NETWORK_MANAGER_CONF_OPTS += --with-nmtui
+NETWORK_MANAGER_CONF_OPTS += -Dnmtui=true
 else
-NETWORK_MANAGER_CONF_OPTS += --without-nmtui
+NETWORK_MANAGER_CONF_OPTS += -Dnmtui=false
 endif
 
 ifeq ($(BR2_PACKAGE_OFONO),y)
 NETWORK_MANAGER_DEPENDENCIES += ofono
-NETWORK_MANAGER_CONF_OPTS += --with-ofono
+NETWORK_MANAGER_CONF_OPTS += -Dofono=true
 else
-NETWORK_MANAGER_CONF_OPTS += --without-ofono
+NETWORK_MANAGER_CONF_OPTS += -Dofono=false
 endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 NETWORK_MANAGER_DEPENDENCIES += systemd
 NETWORK_MANAGER_CONF_OPTS += \
-	--with-systemd-journal \
-	--with-config-logging-backend-default=journal \
-	--with-session-tracking=systemd \
-	--with-suspend-resume=systemd
+	-Dsystemd_journal=true \
+	-Dconfig_logging_backend_default=journal \
+	-Dsession_tracking=systemd \
+	-Dsuspend_resume=systemd
 else
 NETWORK_MANAGER_CONF_OPTS += \
-	--without-systemd-journal \
-	--with-config-logging-backend-default=syslog \
-	--without-session-tracking \
-	--with-suspend-resume=upower
+	-Dsystemd_journal=false \
+	-Dconfig_logging_backend_default=syslog \
+	-Dsession_tracking=no \
+	-Dsuspend_resume=upower \
+	-Dsystemdsystemunitdir=no
 endif
 
 ifeq ($(BR2_PACKAGE_POLKIT),y)
 NETWORK_MANAGER_DEPENDENCIES += polkit
-NETWORK_MANAGER_CONF_OPTS += --enable-polkit
+NETWORK_MANAGER_CONF_OPTS += -Dpolkit=true
 else
-NETWORK_MANAGER_CONF_OPTS += --disable-polkit
+NETWORK_MANAGER_CONF_OPTS += -Dpolkit=false
 endif
 
 ifeq ($(BR2_PACKAGE_READLINE),y)
 NETWORK_MANAGER_DEPENDENCIES += readline
-NETWORK_MANAGER_CONF_OPTS += --with-nmcli
+NETWORK_MANAGER_CONF_OPTS += -Dnmcli=true
 else
-NETWORK_MANAGER_CONF_OPTS += --without-nmcli
+NETWORK_MANAGER_CONF_OPTS += -Dnmcli=false
 endif
 
 define NETWORK_MANAGER_INSTALL_INIT_SYSV
@@ -159,4 +153,4 @@ define NETWORK_MANAGER_INSTALL_INIT_SYSTEMD
 
 endef
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
