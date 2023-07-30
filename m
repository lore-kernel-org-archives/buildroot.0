Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E62A5C001DE
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 14:16:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7570940525;
	Sun, 30 Jul 2023 14:16:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7570940525
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZewPM18wAkm3; Sun, 30 Jul 2023 14:16:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9659A40558;
	Sun, 30 Jul 2023 14:16:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9659A40558
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CF58A1BF3F2
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 14:16:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9153D40345
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 14:16:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9153D40345
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dBYOruQnP096 for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 14:16:24 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C2C4C40340
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 14:16:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C2C4C40340
Received: by mail.gandi.net (Postfix) with ESMTPSA id CDDFD60003;
 Sun, 30 Jul 2023 14:16:20 +0000 (UTC)
Date: Sun, 30 Jul 2023 16:16:19 +0200
To: Joachim Wiberg <troglobit@gmail.com>
Message-ID: <20230730161619.2b8417cc@windsurf>
In-Reply-To: <20230123055259.2285749-1-troglobit@gmail.com>
References: <20230123055259.2285749-1-troglobit@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690726581;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pjYsX4nICNZZ/fpDpyG/FcWRvHHu5PSAvqqp5FzBQdw=;
 b=HtJt7hkwfPRPdOhjr84PFLKWN44t19SpxDy/HBT0sxqv6q491g2Gh6s83bFeul3WvWSUG0
 rYZFeESw6kGb+fmKIFx70L9G6CxHxpGALHhti9WM2MGLsYD2YKAdnGEKcja360vo4lCJfp
 Q9+DZV1mGDKwFdNwws+eW2IilHQo7rdRxd+gOzyoEp3Imb16g622u3BqTQoXQ9bTq/H5kn
 dwIGny83qqkyCGhixWbliJj46VwkKLVVsMWKOY0BvlIkoMWiXXji4sxo24vtiUlIvXGbJP
 UDwP76I4qcbT8xjT4yTvmMAiTWlh7KmjcNf7cIfS4weDz6Qqdcd66IBLJVCEgA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HtJt7hkw
Subject: Re: [Buildroot] [PATCH 1/1] package/mdnsd: new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Mon, 23 Jan 2023 06:52:58 +0100
Joachim Wiberg <troglobit@gmail.com> wrote:

> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>

Thanks, I've applied with those changes. See below.

> diff --git a/package/mdnsd/Config.in b/package/mdnsd/Config.in
> new file mode 100644
> index 0000000000..095a924e98
> --- /dev/null
> +++ b/package/mdnsd/Config.in
> @@ -0,0 +1,50 @@
> +config BR2_PACKAGE_MDNSD
> +	bool "mdnsd"
> +	depends on BR2_USE_MMU # fork()
> +	help
> +	  Small mDNS-SD daemon for advertising services and device discovery,
> +	  similar to Avahi and Bonjour.
> +
> +	  By default, mdnsd runs on all interfaces that support multicast.
> +	  It reads services to announce from /etc/mdns.d/*.service, a few
> +	  common services are included below.  To override the defaults,
> +	  e.g., path to services, TTL of multicast frames, or the default
> +	  interface, set MDNSD_ARGS in /etc/default/mdnsd
> +
> +	  Note: currently no NSS integration with GLIBC.

Some of the lines here were too long, causing a check-package warning.
Also the upstream URL of the project was missing as a last line in the
help text.

> +
> +if BR2_PACKAGE_MDNSD
> +
> +config BR2_PACKAGE_MDNSD_MQUERY
> +	bool "mquery"
> +	default n

Not needed, being disabled is the default.

> +	help
> +  	  Scan a LAN for mDNS capable devices, or query specific records,
> +	  similar to the mdns-scan tool.  Useful for verifying multicast
> +	  connectivity or locating neighbors with link-local address.

Some of the lines here were too long, causing a check-package warning.

> +comment "Services to advertise"
> +
> +config BR2_PACKAGE_MDNSD_FTP_SERVICE
> +	bool "FTP service"
> +	default n
> +
> +config BR2_PACKAGE_MDNSD_HTTP_SERVICE
> +	bool "HTTP service"
> +	default n
> +
> +config BR2_PACKAGE_MDNSD_IPP_SERVICE
> +	bool "IPP service"
> +	default n
> +
> +config BR2_PACKAGE_MDNSD_PRINTER_SERVICE
> +	bool "Printer service"
> +	default n

Same comment as above about "default n".

> diff --git a/package/mdnsd/mdnsd.hash b/package/mdnsd/mdnsd.hash
> new file mode 100644
> index 0000000000..2fa7552d85
> --- /dev/null
> +++ b/package/mdnsd/mdnsd.hash
> @@ -0,0 +1,6 @@
> +# Upstream sha256 from GitHub
> +sha256  1af8742ab82a0af88d99d0b15508358ad4305879ab039631bea889138f5c87e8  mdnsd-0.12.tar.gz
> +
> +# Locally computed
> +sha256  2969546227b58ce1b431cc4c36c9a9b45d604e6b94fb8b787ea5d3696f3eee3b  LICENSE
> +

This final empty line was causing a check-package warning.

> diff --git a/package/mdnsd/mdnsd.mk b/package/mdnsd/mdnsd.mk
> new file mode 100644
> index 0000000000..90a4d4c051
> --- /dev/null
> +++ b/package/mdnsd/mdnsd.mk
> @@ -0,0 +1,75 @@
> +################################################################################
> +#
> +# mdnsd
> +#
> +################################################################################
> +
> +MDNSD_VERSION = 0.12
> +MDNSD_SITE = https://github.com/troglobit/mdnsd/releases/download/v$(MDNSD_VERSION)
> +MDNSD_LICENSE = BSD-3-Clause
> +MDNSD_LICENSE_FILES = LICENSE
> +MDNSD_DEPENDENCIES = host-pkgconf
> +
> +ifeq ($(BR2_PACKAGE_MDNSD_MQUERY),y)
> +MDNSD_CONF_OPTS += --with-mquery
> +else
> +MDNSD_CONF_OPTS += --without-mquery
> +endif
> +
> +ifeq ($(BR2_PACKAGE_SYSTEMD),y)
> +MDNSD_DEPENDENCIES += systemd
> +MDNSD_CONF_OPTS += --with-systemd
> +else
> +MDNSD_CONF_OPTS += --without-systemd
> +endif
> +
> +ifeq ($(BR2_PACKAGE_MDNSD_FTP_SERVICE),y)
> +define MDNSD_INSTALL_FTP_SERVICE
> +	$(INSTALL) -D -m 0644 package/mdnsd/ftp.service \
> +		$(TARGET_DIR)/etc/mdns.d/
> +endef
> +MDNSD_POST_INSTALL_TARGET_HOOKS += MDNSD_INSTALL_FTP_SERVICE
> +endif
> +
> +ifeq ($(BR2_PACKAGE_MDNSD_HTTP_SERVICE),y)
> +define MDNSD_INSTALL_HTTP_SERVICE
> +	$(INSTALL) -D -m 0644 package/mdnsd/http.service \
> +		$(TARGET_DIR)/etc/mdns.d/
> +endef
> +MDNSD_POST_INSTALL_TARGET_HOOKS += MDNSD_INSTALL_HTTP_SERVICE
> +endif
> +
> +ifeq ($(BR2_PACKAGE_MDNSD_IPP_SERVICE),y)
> +define MDNSD_INSTALL_IPP_SERVICE
> +	$(INSTALL) -D -m 0644 package/mdnsd/ipp.service \
> +		$(TARGET_DIR)/etc/mdns.d/
> +endef
> +MDNSD_POST_INSTALL_TARGET_HOOKS += MDNSD_INSTALL_IPP_SERVICE
> +endif
> +
> +ifeq ($(BR2_PACKAGE_MDNSD_PRINTER_SERVICE),y)
> +define MDNSD_INSTALL_PRINTER_SERVICE
> +	$(INSTALL) -D -m 0644 package/mdnsd/printer.service \
> +		$(TARGET_DIR)/etc/mdns.d/
> +endef
> +MDNSD_POST_INSTALL_TARGET_HOOKS += MDNSD_INSTALL_PRINTER_SERVICE
> +endif
> +
> +ifeq ($(BR2_PACKAGE_MDNSD_SSH_SERVICE),y)
> +define MDNSD_INSTALL_SSH_SERVICE
> +	$(INSTALL) -D -m 0644 package/mdnsd/ssh.service \
> +		$(TARGET_DIR)/etc/mdns.d/
> +endef
> +MDNSD_POST_INSTALL_TARGET_HOOKS += MDNSD_INSTALL_SSH_SERVICE
> +endif

All of this service handling stuff was very verbose. I've refactored it
like this:

MDNSD_SERVICES_$(BR2_PACKAGE_MDNSD_FTP_SERVICE) += ftp
MDNSD_SERVICES_$(BR2_PACKAGE_MDNSD_HTTP_SERVICE) += http
MDNSD_SERVICES_$(BR2_PACKAGE_MDNSD_IPP_SERVICE) += ipp
MDNSD_SERVICES_$(BR2_PACKAGE_MDNSD_PRINTER_SERVICE) += printer
MDNSD_SERVICES_$(BR2_PACKAGE_MDNSD_SSH_SERVICE) += ssh

define MDNSD_INSTALL_SERVICES
        $(foreach service,$(MDNSD_SERVICES_y),\
                $(INSTALL) -D -m 0644 package/mdnsd/$(service).service \
                        $(TARGET_DIR)/etc/mdns.d/$(service).service
        )
endef
MDNSD_POST_INSTALL_TARGET_HOOKS += MDNSD_INSTALL_SERVICES

> +define MDNSD_INSTALL_INIT_SYSV
> +	$(INSTALL) -m 755 -D package/mdnsd/S50mdnsd $(TARGET_DIR)/etc/init.d/

You need a full destination path here.

As said above: I fixed those various small things when applying.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
