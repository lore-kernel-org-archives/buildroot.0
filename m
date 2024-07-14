Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7F58C3DA42
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 21:42:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 26C1440431;
	Sun, 14 Jul 2024 21:42:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aOMWJCqeyp6l; Sun, 14 Jul 2024 21:42:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 718B440106
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 718B440106;
	Sun, 14 Jul 2024 21:42:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E1C911BF3CE
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 21:42:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DB7CE40106
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 21:42:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AciV59OMf0lx for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 21:42:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a02:598:128:8a00::1000:a54; helo=mxd-1-a54.seznam.cz;
 envelope-from=havran.jan@email.cz; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A2CBF40026
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A2CBF40026
Received: from mxd-1-a54.seznam.cz (mxd-1-a54.seznam.cz
 [IPv6:2a02:598:128:8a00::1000:a54])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A2CBF40026
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 21:42:39 +0000 (UTC)
Received: from email.seznam.cz by smtpc-mxd-989f5b47-nqqg5
 (smtpc-mxd-989f5b47-nqqg5 [2a02:598:128:8a00::1000:a54])
 id 0fa70e238f4064be0dd3304d; Sun, 14 Jul 2024 23:42:36 +0200 (CEST)
Received: from arch-zen.localdomain (havhav.seb.rev-fortech.cz [213.250.223.2])
 by smtpd-relay-685c4db54c-csssw (szn-email-smtpd/2.0.19) with ESMTPA
 id 595c5181-0d48-4158-a2b0-5a4cd7c994ca;
 Sun, 14 Jul 2024 23:42:34 +0200
Date: Sun, 14 Jul 2024 23:42:25 +0200
From: Jan Havran <havran.jan@email.cz>
To: yann.morin@orange.com
Message-ID: <ZpRGQburrLdTTapj@arch-zen.localdomain>
References: <cover.1720535037.git.yann.morin@orange.com>
 <e6e9df5fad92d96444cebc9ebc8c137b83f929a6.1720535037.git.yann.morin@orange.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e6e9df5fad92d96444cebc9ebc8c137b83f929a6.1720535037.git.yann.morin@orange.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=email.cz; s=szn20221014; t=1720993356;
 bh=GEK4MLOYzuzikVMI7ekNnC5+8QVq4RknLOlwJUZknB0=;
 h=Received:Date:From:To:Cc:Subject:Message-ID:References:
 MIME-Version:Content-Type:Content-Disposition:
 Content-Transfer-Encoding:In-Reply-To;
 b=SWupIU9rTiM2TfgiyuQSzZMYQK8XcytmtBbE+EWpY02Ry1Q0dAEzNG8jr9wwhkj5R
 b0UH5wdMcRmqRxWuJdI0DBVpNVQggyY+Lzxf0B8KZLDoXTWm6PgxA9XgsdAVrUMVFP
 Ah0fSYIXJdfAXjpPditkNEMYJaAIH/W7rAomsHW0sW43zwlHLlRx7BDlVu5AO3oOOt
 7F5cnsdaQLPf085fOOfTQb3Y2FLwi6j14bA29e19PNG5lpIr/5KFvh1k1I78Q/2+ix
 EbASmDhcV6aA25Vf5cf7fRU7F15KyHwqSVA6C1Cnnq9h7pzCztsMXTlo52sW1Fz4C4
 bfeOa4eKwdn6w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=email.cz
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=email.cz header.i=@email.cz header.a=rsa-sha256
 header.s=szn20221014 header.b=SWupIU9r
Subject: Re: [Buildroot] [PATCH 5/5] package/gpsd: add option to
 enable/disable the daemon
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
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

V=A0Tue, Jul 09, 2024 at 04:24:01PM +0200,=A0yann.morin@orange.com napsal(a=
):
> From: "Yann E. MORIN" <yann.morin@orange.com>
> =

> Some scenarii, like building an RTK base, does not require a gpsd
> daemon, but just a few python based tools (e.g. the python scripts
> to configure a GNSS device).
> =

> Add an option to enable or disable building and instaling the daemon.
> We make it enabled by default, for legacy purposes.
> =

> When the daemon is installed, it also installs a few ancillary helpers,
> which need some of the clients (e.g. the udev rule will use gpsdctl), so
> ensure they are enabled with the daemon.
> =

> Speaking of the udev rule: without the daemon, it does not need to be
> installed, so only try to fix its mode when the daemomn is installed.
> =

> Similarly for systemd, no need to install the drop-in when the daemon is
> not installed. And for sysv init, no need for a startup script without
> the daemon either.
> =

> Now that everything is optional, daemon, clients, and python stuff, we
> need to ensure that at least something is installed. The obvious
> solution would be to ensure that the daemon is installed, but that
> causes conflicts in the Kconfig depencies (elided for readability):
> =

>     config BR2_PACAKGE_GPSD
>         bool "gpsd:
>         select BR2_PACKAGE_GPSD_DAEMON if ! BR2_PACKAGE_GPSD_CLIENTS \
>                                        && ! BR2_PACKAGE_GPSD_PYTHON
> =

>     config BR2_PACKAGE_GPSD_DAEMON
>         bool "daemon"
>         select BR2_PACKAGE_GPSD_CLIENTS
> =

> would cause errors like:
> =

>     package/gpsd/Config.in:27:error: recursive dependency detected!
>     package/gpsd/Config.in:27:      symbol BR2_PACKAGE_GPSD_DAEMON is sel=
ected by BR2_PACKAGE_GPSD_CLIENTS
>     package/gpsd/Config.in:226:     symbol BR2_PACKAGE_GPSD_CLIENTS is se=
lected by BR2_PACKAGE_GPSD_DAEMON
> =

> So we chose the next best option: ensure that the clients get built, if
> nothing else does.
> =

> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
> Cc: Bernd Kuhls <bernd@kuhls.net>

Tested this with Raspberry Pi 0w with U-Blox module. First time I enabled
Python tools only (tested ubxtool), then the daemon with clients.

Looks good to me.

Reviewed-by: Jan Havran <havran.jan@email.cz>
Tested-by: Jan Havran <havran.jan@email.cz>

> ---
>  package/gpsd/Config.in | 13 +++++++++
>  package/gpsd/gpsd.mk   | 62 ++++++++++++++++++++++++------------------
>  2 files changed, 49 insertions(+), 26 deletions(-)
> =

> diff --git a/package/gpsd/Config.in b/package/gpsd/Config.in
> index cbdcdb5725..92a124b8ac 100644
> --- a/package/gpsd/Config.in
> +++ b/package/gpsd/Config.in
> @@ -9,6 +9,8 @@ menuconfig BR2_PACKAGE_GPSD
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	# Always tries to build a shared library
>  	depends on !BR2_STATIC_LIBS
> +	select BR2_PACKAGE_GPSD_CLIENTS if !BR2_PACKAGE_GPSD_DAEMON \
> +				       && !BR2_PACKAGE_GPSD_PYTHON
>  	help
>  	  gpsd is a service daemon that monitors one or more GPSes or
>  	  AIS receivers attached to a host computer through serial or
> @@ -22,6 +24,15 @@ menuconfig BR2_PACKAGE_GPSD
>  =

>  if BR2_PACKAGE_GPSD
>  =

> +config BR2_PACKAGE_GPSD_DAEMON
> +	bool "gpsd daemon"
> +	default y # legacy
> +	select BR2_PACKAGE_GPSD_CLIENTS
> +	help
> +	  Build and install the gpsd daemon itself
> +
> +if BR2_PACKAGE_GPSD_DAEMON
> +
>  config BR2_PACKAGE_GPSD_DEVICES
>  	string "Where to look for GPSes"
>  	default "/dev/ttyS1"
> @@ -210,6 +221,8 @@ config BR2_PACKAGE_GPSD_UBX
>  	help
>  	  uBlox UBX binary support
>  =

> +endif  # GPSD_DAEMON
> +
>  config BR2_PACKAGE_GPSD_CLIENTS
>  	bool "gpsd clients"
>  	default y # legacy
> diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
> index 77c6f6c562..8f87766dcc 100644
> --- a/package/gpsd/gpsd.mk
> +++ b/package/gpsd/gpsd.mk
> @@ -26,8 +26,7 @@ GPSD_SCONS_OPTS =3D \
>  	prefix=3D/usr \
>  	sysroot=3D$(STAGING_DIR) \
>  	strip=3Dno \
> -	qt=3Dno \
> -	systemd=3D$(if $(BR2_INIT_SYSTEMD),yes,no)
> +	qt=3Dno
>  =

>  ifeq ($(BR2_PACKAGE_NCURSES),y)
>  GPSD_DEPENDENCIES +=3D ncurses
> @@ -178,6 +177,40 @@ ifeq ($(BR2_PACKAGE_GPSD_MAX_DEV),y)
>  GPSD_SCONS_OPTS +=3D max_devices=3D$(BR2_PACKAGE_GPSD_MAX_DEV_VALUE)
>  endif
>  =

> +ifeq ($(BR2_PACKAGE_GPSD_DAEMON),y)
> +GPSD_SCONS_OPTS +=3D \
> +	gpsd=3Dyes \
> +	systemd=3D$(if $(BR2_INIT_SYSTEMD),yes,no)
> +
> +GPSD_INSTALL_RULE =3D $(if $(BR2_PACKAGE_HAS_UDEV),udev-install,install)
> +
> +# When using chrony, wait for after Buildroot's chrony.service
> +ifeq ($(BR2_PACKAGE_CHRONY),y)
> +define GPSD_INSTALL_INIT_SYSTEMD
> +	$(INSTALL) -D -m 0644 $(GPSD_PKGDIR)/br-chrony.conf \
> +		$(TARGET_DIR)/usr/lib/systemd/system/gpsd.service.d/br-chrony.conf
> +endef
> +endif
> +
> +define GPSD_INSTALL_INIT_SYSV
> +	$(INSTALL) -m 0755 -D package/gpsd/S50gpsd $(TARGET_DIR)/etc/init.d/S50=
gpsd
> +	$(SED) 's,^DEVICES=3D.*,DEVICES=3D$(BR2_PACKAGE_GPSD_DEVICES),' $(TARGE=
T_DIR)/etc/init.d/S50gpsd
> +endef
> +
> +# After the udev rule is installed, make it writable so that this
> +# package can be re-built/re-installed.
> +ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
> +define GPSD_INSTALL_UDEV_RULES
> +	chmod u+w $(TARGET_DIR)/lib/udev/rules.d/25-gpsd.rules
> +endef
> +GPSD_POST_INSTALL_TARGET_HOOKS +=3D GPSD_INSTALL_UDEV_RULES
> +endif
> +
> +else # GPSD_DAEMON
> +GPSD_SCONS_OPTS +=3D gpsd=3Dno systemd=3Dno
> +GPSD_INSTALL_RULE =3D install
> +endif
> +
>  ifeq ($(BR2_PACKAGE_GPSD_CLIENTS),y)
>  GPSD_SCONS_OPTS +=3D gpsdclients=3Dyes
>  else
> @@ -211,22 +244,9 @@ define GPSD_INSTALL_TARGET_CMDS
>  		DESTDIR=3D$(TARGET_DIR) \
>  		$(SCONS) \
>  		$(GPSD_SCONS_OPTS) \
> -		$(if $(BR2_PACKAGE_HAS_UDEV),udev-install,install))
> +		$(GPSD_INSTALL_RULE))
>  endef
>  =

> -define GPSD_INSTALL_INIT_SYSV
> -	$(INSTALL) -m 0755 -D package/gpsd/S50gpsd $(TARGET_DIR)/etc/init.d/S50=
gpsd
> -	$(SED) 's,^DEVICES=3D.*,DEVICES=3D$(BR2_PACKAGE_GPSD_DEVICES),' $(TARGE=
T_DIR)/etc/init.d/S50gpsd
> -endef
> -
> -# When using chrony, wait for after Buildroot's chrony.service
> -ifeq ($(BR2_PACKAGE_CHRONY),y)
> -define GPSD_INSTALL_INIT_SYSTEMD
> -	$(INSTALL) -D -m 0644 $(GPSD_PKGDIR)/br-chrony.conf \
> -		$(TARGET_DIR)/usr/lib/systemd/system/gpsd.service.d/br-chrony.conf
> -endef
> -endif
> -
>  define GPSD_INSTALL_STAGING_CMDS
>  	(cd $(@D); \
>  		$(GPSD_SCONS_ENV) \
> @@ -236,14 +256,4 @@ define GPSD_INSTALL_STAGING_CMDS
>  		install)
>  endef
>  =

> -# After the udev rule is installed, make it writable so that this
> -# package can be re-built/re-installed.
> -ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
> -define GPSD_INSTALL_UDEV_RULES
> -	chmod u+w $(TARGET_DIR)/lib/udev/rules.d/25-gpsd.rules
> -endef
> -
> -GPSD_POST_INSTALL_TARGET_HOOKS +=3D GPSD_INSTALL_UDEV_RULES
> -endif
> -
>  $(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
