Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D36F2C4332F
	for <buildroot@archiver.kernel.org>; Mon, 12 Dec 2022 20:00:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4280740154;
	Mon, 12 Dec 2022 20:00:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4280740154
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1IQit_d8efU7; Mon, 12 Dec 2022 20:00:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4BCCE403FF;
	Mon, 12 Dec 2022 20:00:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4BCCE403FF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 17E471BF35E
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 20:00:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E71C260AD2
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 20:00:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E71C260AD2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lPkvzImycmzp for <buildroot@lists.busybox.net>;
 Mon, 12 Dec 2022 20:00:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1AEE60B79
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D1AEE60B79
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 20:00:53 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id t17so926700pjo.3
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 12:00:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=as0uyt9rPnLy4GqPsiao1G3yxhOh16vPD6G12/QgXU0=;
 b=7JGNqTBGan+PuxtmSowvxvvbYi38dwAIjYi/deTOl2KPfPC5qgFgdgl6pdUsQxR2E1
 ra4dTiNw/trAdRFqYuMTipGJ5+ijCOxJD2+xrNDfSRAi9mQVQhDRpgJR5yT0Qcx5r1B/
 mx1QJJhEoV60pNNWLxJq1DR7KMjYHQL9kPR1wSX93dQ71XyXSLMxhFNvGfqVp1/weKie
 aoSgUesBm7J7RaO7J6E6plUOtVrbt0HQlE/TGMrwJPPtADyBQVgU9ADOa+/nBggsf8Kq
 Bfe8tqv0kG5yy6CSUbKYmZdjSAQYyZjHWJMsjEn0O9fpCeEGS8dwdLdGBk+dXNjCz84g
 AsBA==
X-Gm-Message-State: ANoB5pnoGdWp2ZqbT7SDU4K2rJASEbSWupuN0lu1AmT9Sdno/rGKnSmS
 Erwx8cFCO77Y1MMlRNYIOaOw6xnaC5x5lJzSa43OaH4w
X-Google-Smtp-Source: AA0mqf6vjdsMn2b+UoY9uVHa6wLM/n28zv7oVaO+Ieu1zEIv8lOXi5ZYh2V1OzX+5Ke9zTDZi49xIFrWtbnBs2A584c=
X-Received: by 2002:a17:90a:bd92:b0:219:861b:b108 with SMTP id
 z18-20020a17090abd9200b00219861bb108mr28266pjr.121.1670875252170; Mon, 12 Dec
 2022 12:00:52 -0800 (PST)
MIME-Version: 1.0
References: <20221212193528.23168-1-heiko.thiery@gmail.com>
In-Reply-To: <20221212193528.23168-1-heiko.thiery@gmail.com>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Mon, 12 Dec 2022 21:00:39 +0100
Message-ID: <CAEyMn7YBq8OA0GveazYw7bq6_3+K+Bg3NJTAM4PtQ5Z7e5Ps4Q@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=as0uyt9rPnLy4GqPsiao1G3yxhOh16vPD6G12/QgXU0=;
 b=owge/CUdTzHl9ccKv62ov8Ue7lVHzS4SDmzZmLKRHnH8IrNMXmzOfGqciV0p1VfCsV
 cR1AoK5i4p8WiMzqPfRM6pyknbM90bJ7uAqdom3cIl6Vta2Rvv6x6mTMaWBXlOmVvsDv
 SGBAa8/4y3CLYvIbuf1dcjb8IwK49TqiNOLbnpHd1kj+tIbTA145cL8eBX2tWwovi9lG
 9Yx8MrSBNSaKqyZk+pRKgkw1qQYpULmZFRkgv3iIZhiNDZcnP9TOYV182bQUzUJGI8BF
 uPHhke7gog6AHOqdiyNQN2TyjJFzm5vqaEw0RMWXy8IkYD1W9mRUzUsLK8i0bj+WJq/6
 qdWg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=owge/CUd
Subject: Re: [Buildroot] [PATCH v3] package/modem-manager: bump version to
 1.20.2
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Aleksander Morgado <aleksander@aleksander.es>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

Am Mo., 12. Dez. 2022 um 20:35 Uhr schrieb Heiko Thiery
<heiko.thiery@gmail.com>:
>
> Switch package type to meson as the primary supported build system from now
> on is meson and the autotools support as despricated. The package tarball
> is no longer support, thus the MODEM_MANAGER_SOURCE is changed to the
> gitlab archive URL.
>
> All previously supported options are converted to the meson configuraiton
> options and support for new ones is added. The new options are:
> bash_completion, polkit, systemd, qrtr.
>
> The dbus build dependency is needed since the meson build system
> uses dbus pkg-config to determine install locations. The 'udevdir' has
> to be specified also in case dbus is not installed. Modem-manager will
> use its own built-in udev rule parser to determine modem specific values.
>
> For building with libqmi support version 1.32.2 is required and for
> libmbim version 1.28.2 is required.
>
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---

I forgot to add the history ;-/

v3:
 - remove mention of runtime dependency in Config.in
 - explained in commit log why dbus dependency is need and why udevdir needed

-- 
Heiko

>  package/modem-manager/Config.in          |  2 +-
>  package/modem-manager/modem-manager.hash |  2 +-
>  package/modem-manager/modem-manager.mk   | 72 ++++++++++++++++++------
>  3 files changed, 56 insertions(+), 20 deletions(-)
>
> diff --git a/package/modem-manager/Config.in b/package/modem-manager/Config.in
> index c4c723776d..d211d68ee1 100644
> --- a/package/modem-manager/Config.in
> +++ b/package/modem-manager/Config.in
> @@ -3,7 +3,7 @@ config BR2_PACKAGE_MODEM_MANAGER
>         depends on BR2_USE_WCHAR # libglib2 and gnutls
>         depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
>         depends on BR2_USE_MMU # dbus
> -       select BR2_PACKAGE_DBUS # runtime dependency
> +       select BR2_PACKAGE_DBUS
>         select BR2_PACKAGE_LIBGLIB2
>         select BR2_PACKAGE_LIBGUDEV if BR2_PACKAGE_HAS_UDEV
>         help
> diff --git a/package/modem-manager/modem-manager.hash b/package/modem-manager/modem-manager.hash
> index 40c8ad703f..e6967f8d62 100644
> --- a/package/modem-manager/modem-manager.hash
> +++ b/package/modem-manager/modem-manager.hash
> @@ -1,4 +1,4 @@
>  #Locally calculated after checking https://www.freedesktop.org/software/ModemManager/ModemManager-1.18.12.tar.xz.asc
> -sha256  b464e4925d955a6ca86dd08616e763b26ae46d7fd37dbe281678e34065b1e430  ModemManager-1.18.12.tar.xz
> +sha256  ba56aa764edc148f58348a589743cf1c1e27c55dcd7ebd820dcedd52fb8d7179  ModemManager-1.20.2.tar.gz
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
>  sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
> diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
> index d0c9b7377b..8a0dbba3a4 100644
> --- a/package/modem-manager/modem-manager.mk
> +++ b/package/modem-manager/modem-manager.mk
> @@ -4,42 +4,78 @@
>  #
>  ################################################################################
>
> -MODEM_MANAGER_VERSION = 1.18.12
> -MODEM_MANAGER_SOURCE = ModemManager-$(MODEM_MANAGER_VERSION).tar.xz
> -MODEM_MANAGER_SITE = http://www.freedesktop.org/software/ModemManager
> +MODEM_MANAGER_VERSION = 1.20.2
> +MODEM_MANAGER_SOURCE = ModemManager-$(MODEM_MANAGER_VERSION).tar.gz
> +MODEM_MANAGER_SITE = https://gitlab.freedesktop.org/mobile-broadband/ModemManager/-/archive/$(MODEM_MANAGER_VERSION)
>  MODEM_MANAGER_LICENSE = GPL-2.0+ (programs, plugins), LGPL-2.0+ (libmm-glib)
>  MODEM_MANAGER_LICENSE_FILES = COPYING COPYING.LIB
>  MODEM_MANAGER_SELINUX_MODULES = modemmanager
> -MODEM_MANAGER_DEPENDENCIES = host-pkgconf libglib2 $(TARGET_NLS_DEPENDENCIES)
> +MODEM_MANAGER_DEPENDENCIES = host-pkgconf dbus libglib2 $(TARGET_NLS_DEPENDENCIES) host-libxslt
>  MODEM_MANAGER_INSTALL_STAGING = YES
> -MODEM_MANAGER_CONF_OPTS = --disable-more-warnings
> +MODEM_MANAGER_CONF_OPTS = \
> +       -Dpowerd_suspend_resume=false \
> +       -Dudevdir=/usr/lib/udev
>
> -ifeq ($(BR2_PACKAGE_MODEM_MANAGER_LIBQMI),y)
> -MODEM_MANAGER_DEPENDENCIES += libqmi
> -MODEM_MANAGER_CONF_OPTS += --with-qmi
> +ifeq ($(BR2_PACKAGE_LIBGUDEV),y)
> +MODEM_MANAGER_DEPENDENCIES += libgudev
> +MODEM_MANAGER_CONF_OPTS += -Dudev=true
>  else
> -MODEM_MANAGER_CONF_OPTS += --without-qmi
> +MODEM_MANAGER_CONF_OPTS += -Dudev=false
>  endif
>
> -ifeq ($(BR2_PACKAGE_LIBGUDEV),y)
> -MODEM_MANAGER_DEPENDENCIES += libgudev
> -MODEM_MANAGER_CONF_OPTS += --with-udev
> +ifeq ($(BR2_PACKAGE_MODEM_MANAGER_LIBQMI),y)
> +MODEM_MANAGER_DEPENDENCIES += libqmi
> +MODEM_MANAGER_CONF_OPTS += -Dqmi=true
>  else
> -MODEM_MANAGER_CONF_OPTS += --without-udev
> +MODEM_MANAGER_CONF_OPTS += -Dqmi=false
>  endif
>
>  ifeq ($(BR2_PACKAGE_MODEM_MANAGER_LIBMBIM),y)
>  MODEM_MANAGER_DEPENDENCIES += libmbim
> -MODEM_MANAGER_CONF_OPTS += --with-mbim
> +MODEM_MANAGER_CONF_OPTS += -Dmbim=true
> +else
> +MODEM_MANAGER_CONF_OPTS += -Dmbim=false
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBQRTR_GLIB),y)
> +MODEM_MANAGER_DEPENDENCIES += libqrtr-glib
> +MODEM_MANAGER_CONF_OPTS += -Dqrtr=true
> +else
> +MODEM_MANAGER_CONF_OPTS += -Dqrtr=false
> +endif
> +
> +ifeq ($(BR2_PACKAGE_SYSTEMD),y)
> +MODEM_MANAGER_DEPENDENCIES += systemd
> +MODEM_MANAGER_CONF_OPTS += \
> +       -Dsystemd_journal=true \
> +       -Dsystemd_suspend_resume=true \
> +       -Dsystemdsystemunitdir=/usr/lib/systemd/system
> +else
> +MODEM_MANAGER_CONF_OPTS += \
> +       -Dsystemd_journal=false \
> +       -Dsystemd_suspend_resume=false \
> +       -Dsystemdsystemunitdir=no
> +endif
> +
> +ifeq ($(BR2_PACKAGE_POLKIT),y)
> +MODEM_MANAGER_DEPENDENCIES += polkit
> +MODEM_MANAGER_CONF_OPTS += -Dpolkit=strict
>  else
> -MODEM_MANAGER_CONF_OPTS += --without-mbim
> +MODEM_MANAGER_CONF_OPTS += -Dpolkit=no
>  endif
>
>  ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
>  MODEM_MANAGER_DEPENDENCIES += gobject-introspection
> -MODEM_MANAGER_CONF_OPTS += --enable-introspection
> +MODEM_MANAGER_CONF_OPTS += -Dintrospection=true
> +else
> +MODEM_MANAGER_CONF_OPTS += -Dintrospection=false
> +endif
> +
> +ifeq ($(BR2_PACKAGE_BASH_COMPLETION),y)
> +MODEM_MANAGER_DEPENDENCIES += bash-completion
> +MODEM_MANAGER_CONF_OPTS += -Dbash_completion=true
>  else
> -MODEM_MANAGER_CONF_OPTS += --disable-introspection
> +MODEM_MANAGER_CONF_OPTS += -Dbash_completion=false
>  endif
>
>  define MODEM_MANAGER_INSTALL_INIT_SYSV
> @@ -47,4 +83,4 @@ define MODEM_MANAGER_INSTALL_INIT_SYSV
>                 $(TARGET_DIR)/etc/init.d/S44modem-manager
>  endef
>
> -$(eval $(autotools-package))
> +$(eval $(meson-package))
> --
> 2.20.1
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
