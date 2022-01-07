Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E230C433EF
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 18:51:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A213C607A4;
	Fri,  7 Jan 2022 18:51:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ho22Lnsqf1jk; Fri,  7 Jan 2022 18:51:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C4D6960803;
	Fri,  7 Jan 2022 18:51:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1D2451BF317
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 18:51:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1581B60803
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 18:51:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iQ9xIXTjOuU0 for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 18:51:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E46DC607A4
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 18:51:39 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id DE84D240003;
 Fri,  7 Jan 2022 18:51:37 +0000 (UTC)
Date: Fri, 7 Jan 2022 19:51:36 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: azxxza22 <amrtmoh2006@gmail.com>
Message-ID: <20220107195136.183a4555@windsurf>
In-Reply-To: <20220102181525.9494-1-amrtmoh2006@gmail.com>
References: <20220102181525.9494-1-amrtmoh2006@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] nodogsplash package added
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

First of all, thanks a lot for your contribution! Please see below a
number of comments. It would be good if you could address those
comments and send an updated version.

On Sun,  2 Jan 2022 20:15:24 +0200
azxxza22 <amrtmoh2006@gmail.com> wrote:

> Signed-off-by: azxxza22 <amrtmoh2006@gmail.com>

We need contributions to be made under a real name. Could you adjust
this?

>  package/Config.in                  |  1 +
>  package/nodogsplash/Config.in      |  9 ++++++++
>  package/nodogsplash/nodogsplash.mk | 37 ++++++++++++++++++++++++++++++
>  3 files changed, 47 insertions(+)

You also need to add an entry in the DEVELOPERS file, so that we know
who maintains this package.


> diff --git a/package/nodogsplash/Config.in b/package/nodogsplash/Config.in
> new file mode 100644
> index 0000000000..7a68bcccb0
> --- /dev/null
> +++ b/package/nodogsplash/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_NODOGSPLASH
> +	bool "nodogsplash"
> +	depends on BR2_PACKAGE_LIBMICROHTTPD

This should be:

	select BR2_PACKAGE_LIBMICROHTTPD

It would be useful to test the package with ./utils/test-pkg to make
sure you have captured all toolchain dependencies.

> +	help
> +	   Nodogsplash is a Captive Portal that offers 
> +	   a simple way to provide restricted access to the Internet by 
> +	   showing a splash page to the user before Internet access is granted

I think this last line is too long. Could you run "make check-package"
and make sure you haven't introduced new warnings?

> +	   https://github.com/nodogsplash/nodogsplash/
> diff --git a/package/nodogsplash/nodogsplash.mk b/package/nodogsplash/nodogsplash.mk
> new file mode 100644
> index 0000000000..3075b7e9f1
> --- /dev/null
> +++ b/package/nodogsplash/nodogsplash.mk
> @@ -0,0 +1,37 @@
> +################################################################################
> +#
> +# nodogsplash
> +#
> +################################################################################

Empty new line needed here.

> +NODOGSPLASH_VERSION = v4.5.1

Should be without the "v".

> +NODOGSPLASH_SITE = git://github.com/nodogsplash/nodogsplash.git
> +NODOGSPLASH_SITE_METHOD = git

Instead of those two lines, use:

NODOGSPLASH_SITE = $(call github,nodogsplash,nodogsplash,v$(NODOGSPLASH_VERSION))

> +NODOGSPLASH_LICENSE = GPL-2.0
> +NODOGSPLASH_LICENSE_FILES = COPYING
> +NODOGSPLASH_DEPENDENCIES = libmicrohttpd
> +NODOGSPLASH_INSTALL_STAGING = YES

Why is this needed in staging? Does it install some library that
another package will link against ?

> +
> +define NODOGSPLASH_BUILD_CMDS
> +	$(MAKE1) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D)

Why is $(MAKE1) used? Isn't $(MAKE) working?

Ideally, this should be:

	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)

> +endef
> +
> +define NODOGSPLASH_INSTALL_EXTRA_FILES
> +	mkdir -p $(TARGET_DIR)/usr/bin
> +	mkdir -p $(TARGET_DIR)/etc/nodogsplash/htdocs/images
> +	cp $(@D)/resources/nodogsplash.conf $(TARGET_DIR)/etc/nodogsplash/
> +	cp $(@D)/resources/splash.html $(TARGET_DIR)/etc/nodogsplash/htdocs/
> +	cp $(@D)/resources/splash.css $(TARGET_DIR)/etc/nodogsplash/htdocs/
> +	cp $(@D)/resources/status.html $(TARGET_DIR)/etc/nodogsplash/htdocs/
> +	cp $(@D)/resources/splash.jpg $(TARGET_DIR)/etc/nodogsplash/htdocs/images/

Use:

	$(INSTALL) -D -m 0644 src dst

it will automatically create any missing destination directory for you.

> +endef
> +
> +NODOGSPLASH_POST_INSTALL_TARGET_HOOKS += NODOGSPLASH_INSTALL_EXTRA_FILES

There's no need for a post-install target hook, just put the commands
directly inside NODOGSPLASH_INSTALL_TARGET_CMDS.

> +
> +define NODOGSPLASH_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/nodogsplash $(TARGET_DIR)/usr/bin
> +	$(INSTALL) -D -m 0755 $(@D)/ndsctl $(TARGET_DIR)/usr/bin

Please use full destination paths, i.e:

	$(INSTALL) -D -m 0755 $(@D)/nodogsplash $(TARGET_DIR)/usr/bin/nodogsplash
	$(INSTALL) -D -m 0755 $(@D)/ndsctl $(TARGET_DIR)/usr/bin/ndsctl

But I see the Makefile of the upstream project has an install target
which seems to do the right thing. Why don't you use it?

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
