Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B032FC19F2B
	for <buildroot@archiver.kernel.org>; Wed,  3 Aug 2022 20:41:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27A2F60A69;
	Wed,  3 Aug 2022 20:41:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 27A2F60A69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HTR2TUEg1SSl; Wed,  3 Aug 2022 20:41:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 253146080A;
	Wed,  3 Aug 2022 20:41:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 253146080A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 32DCD1BF3CA
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 20:41:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 08F976080A
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 20:41:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08F976080A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qMTJ9JTN5gmM for <buildroot@lists.busybox.net>;
 Wed,  3 Aug 2022 20:41:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6EE05607C1
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6EE05607C1
 for <buildroot@buildroot.org>; Wed,  3 Aug 2022 20:41:19 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0574E200003;
 Wed,  3 Aug 2022 20:41:15 +0000 (UTC)
Date: Wed, 3 Aug 2022 22:41:14 +0200
To: Jan Havran <havran.jan@email.cz>
Message-ID: <20220803224114.7bdc21f2@windsurf>
In-Reply-To: <YhJLS73VW3szIXR+@arch-zen.localdomain>
References: <YhJLS73VW3szIXR+@arch-zen.localdomain>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659559276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WHXfotoAoH1d19O8eKVyEw3ytMpNgXKP+ONWevmODsg=;
 b=T8shYkrzMvnXlt2xPjEwmNz3uuUM/uAD3EJlr/e3ZuSJy4KUc7kEtpxGJ5F5H1dEisoMsu
 jCVPFI7kCSuSryDEJkmRPtaTXW1CckwlYyMw2A2dCSOg+2+Ph9D1u5oKSoNf2B0t/+DK15
 9NTNdYW+H21VaiL+M5GlY6uPnqFdcyyD0M+Hq/jAQccxI0F9vnI5nHJlikKAhEIoq+1Y+s
 MqqDRpjNh6dS482pvq6fhEArfgr1pMwku2fAKXBL7xjUTj/ZF/q7qU3MH3griTu7S4JSOA
 R3nYcl3dl0REKJDgKoXz1oWbB4u9TwDUvAn3s3t8UnEP017rntCvQpWHLHSj6A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=T8shYkrz
Subject: Re: [Buildroot] [PATCH 1/1] package/rtklib: new package
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

Hello Jan,

On Sun, 20 Feb 2022 15:08:11 +0100
Jan Havran <havran.jan@email.cz> wrote:

> RTKLIB is an open source program package for standard and precise
> positioning with GNSS.
> 
> Version used here is from rtkexplorer, which is better optimized
> and more frequently updated than original version by Tomoji Takasu.
> 
> Signed-off-by: Jan Havran <havran.jan@email.cz>

Thanks for your contribution, and sorry for the huge delay in getting
back to you.

I reviewed this today, but unfortunately there are too many things that
are wrong in rtklib itself (not in your patch).

First and foremost, the Github repository comes with pre-compiled code:
lib/iers/gcc/iers.a and lib/openblas/libopenblas.a.

Then, when you compile the rnx2rtkp application, it links with iers.a
(precompiled). I was surprised that this could work, because iers.a
contains x86-64 objects, while I was cross-compiling for ARM.

Turns that our that the rnx2rtkp links the executable with the iers.a
library... but doesn't use any symbols of it. It also links with
libgfortran for no reason (because it's iers.a that contains Fortran
code).

Of course, this means it "works", but it gives a very very bad feeling
about the rtklib build system overall.

Finally, the makefile machinery in rtklib doesn't allow passing custom
CFLAGS to amend/override the CFLAGS defined by the rtklib makefiles
themselves. So Buildroot optimization/debug flags are not taken into
account.

If you're still interested by this package, could you have a look, and
perhaps work out these issues upstream?


> diff --git a/package/rtklib/rtklib.hash b/package/rtklib/rtklib.hash
> new file mode 100644
> index 0000000000..faed92243b
> --- /dev/null
> +++ b/package/rtklib/rtklib.hash
> @@ -0,0 +1,3 @@
> +# Locally computed
> +sha256  735d43939ae08b0da64d75afe5750bc983032144c5622e620eee987508946fc5  rtklib-b34e.tar.gz
> +sha256  219747832d49ee958457b2934080ab8d94bd9d8e45fcb1c36f89776fd2c5ed8a  license.txt
> diff --git a/package/rtklib/rtklib.mk b/package/rtklib/rtklib.mk
> new file mode 100644
> index 0000000000..421cdddfcd
> --- /dev/null
> +++ b/package/rtklib/rtklib.mk
> @@ -0,0 +1,31 @@
> +################################################################################
> +#
> +# rtklib
> +#
> +################################################################################
> +
> +RTKLIB_VERSION = b34e
> +RTKLIB_SITE = $(call github,rtklibexplorer,RTKLIB,$(RTKLIB_VERSION))
> +RTKLIB_LICENSE = BSD-2-Clause
> +RTKLIB_LICENSE_FILES = license.txt
> +
> +RTKLIB_APPS += $(if $(BR2_PACKAGE_RTKLIB_CONVBIN),convbin,)
> +RTKLIB_APPS += $(if $(BR2_PACKAGE_RTKLIB_POS2KML),pos2kml,)
> +RTKLIB_APPS += $(if $(BR2_PACKAGE_RTKLIB_RNX2RTKP),rnx2rtkp,)
> +RTKLIB_APPS += $(if $(BR2_PACKAGE_RTKLIB_RTKRCV),rtkrcv,)
> +RTKLIB_APPS += $(if $(BR2_PACKAGE_RTKLIB_STR2STR),str2str,)

Can be simplified as:

RTKLIB_APPS = \
        $(if $(BR2_PACKAGE_RTKLIB_CONVBIN),convbin) \
        $(if $(BR2_PACKAGE_RTKLIB_POS2KML),pos2kml) \
        $(if $(BR2_PACKAGE_RTKLIB_RNX2RTKP),rnx2rtkp) \
        $(if $(BR2_PACKAGE_RTKLIB_RTKRCV),rtkrcv) \
        $(if $(BR2_PACKAGE_RTKLIB_STR2STR),str2str)

> +define RTKLIB_BUILD_CMDS
> +	for APP in $(RTKLIB_APPS); do \
> +		cd $(@D)/app/consapp/$$APP/gcc ; \
> +		$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" CCFLAGS="$(TARGET_CFLAGS) $(TARGET_LDFLAGS)" ; \
> +	done
> +endef

Instead of a shell "for" loop, using a make "foreach" loop, so that the
loops abort if there is a failure.

Instead of cd-ing into the directory, use make -C option.

CCFLAGS is not used anywhere in the rtklib build system, so passing
CCFLAGS has no effect.

At the end of my experiments, I had:

define RTKLIB_BUILD_CMDS
	find $(@D) -name '*.a' | xargs rm -f
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/lib/iers/gcc \
	 	CC="$(TARGET_CC)" \
	 	F77="$(TARGET_FC)"
	$(foreach app,$(RTKLIB_APPS),\
		$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/app/consapp/$(app)/gcc \
			CC="$(TARGET_CC)"
	)
endef

Which got rid of pre-compiled .a files, and rebuilds iers.a from
source. That's when I understood/discovered that iers.a was not even
used, and decided the rtklib build system was definitely too broken.

> +define RTKLIB_INSTALL_TARGET_CMDS
> +	for APP in $(RTKLIB_APPS); do \
> +		$(INSTALL) -m 0755 $(@D)/app/consapp/$$APP/gcc/$$APP $(TARGET_DIR)/usr/bin/$$APP ; \
> +	done
> +endef

I had replaced this with:

define RTKLIB_INSTALL_TARGET_CMDS
	$(foreach app,$(RTKLIB_APPS), \
		$(INSTALL) -m 0755 $(@D)/app/consapp/$(app)/gcc/$(app) \
			$(TARGET_DIR)/usr/bin/$(app)
	)
endef

also to use a make "foreach" loop.

Could you have a look at those issues, and if you're interested, send
an updated patch?

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
