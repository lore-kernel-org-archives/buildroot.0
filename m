Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9019CC61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 09:12:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2483382331;
	Tue, 21 Feb 2023 09:12:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2483382331
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PG4I9cDtyGVO; Tue, 21 Feb 2023 09:12:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BD8E82B97;
	Tue, 21 Feb 2023 09:12:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4BD8E82B97
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D36251BF578
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 09:12:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B944A42C93
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 09:12:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B944A42C93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1QFz5KFDE9u5 for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 09:12:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4734442C7B
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4734442C7B
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 09:12:37 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 025C3240006;
 Tue, 21 Feb 2023 09:12:34 +0000 (UTC)
Date: Tue, 21 Feb 2023 10:12:33 +0100
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230221101233.039af4c5@windsurf>
In-Reply-To: <20230207220941.58066-4-ju.o@free.fr>
References: <20230207220941.58066-1-ju.o@free.fr>
 <20230207220941.58066-4-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1676970755;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uK7PB2/OaSb2YQBmohtM8oxtKF4GC/sIOVQW6ctF7NM=;
 b=I0ZsTsHuUSu1TAbGO/oSRP2UGsW+ZddsB7AKfddeoFa+ns8W2UIBkVkB0e1Ra1H8JB0oZT
 3wKNC+qyt201vkgljFEdGNSmPFwyA7Iy8n3RLWeRk3uQWZ/K+Et3OwBLN46Rv9AYZhz/FT
 ZnQtYZAzc3X8qvMBgH0LGzq3th7XbcRE1ddLq0qNn1EaBbLqthEJVvglEUAX19x1n940F6
 qtdnRitTPZUuiA7DYI6l5uXcTWdJ2GP6zbZ0xrQ49DtScf5oC/FvfOsXXQGPxjb0LvLY7g
 pmnf7GRIN7v51mo/CQz7yhln7o8dZ4Ntpspi+InVmNMM9AsyPnXA/vTE2TmoeA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=I0ZsTsHu
Subject: Re: [Buildroot] [PATCH 4/5] package/openmpi-examples: new package
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

Hello Julien,

On Tue,  7 Feb 2023 23:09:40 +0100
Julien Olivain <ju.o@free.fr> wrote:

> diff --git a/package/openmpi-examples/Config.in b/package/openmpi-examples/Config.in
> new file mode 100644
> index 0000000000..caaa02d802
> --- /dev/null
> +++ b/package/openmpi-examples/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_OPENMPI_EXAMPLES
> +	bool "openmpi-examples"
> +	select BR2_PACKAGE_OPENMPI
> +	help
> +	  This package includes the hello_c example from openmpi. It
> +	  is mainly used as a simple openmpi program to test the
> +	  libraries. It is also a recipe example for cross compiling
> +	  an openmpi program with the mpicc wrappers.
> diff --git a/package/openmpi-examples/openmpi-examples.hash b/package/openmpi-examples/openmpi-examples.hash
> new file mode 120000
> index 0000000000..b8afe5e2d9
> --- /dev/null
> +++ b/package/openmpi-examples/openmpi-examples.hash
> @@ -0,0 +1 @@
> +../openmpi/openmpi.hash
> \ No newline at end of file
> diff --git a/package/openmpi-examples/openmpi-examples.mk b/package/openmpi-examples/openmpi-examples.mk
> new file mode 100644
> index 0000000000..be679333c7
> --- /dev/null
> +++ b/package/openmpi-examples/openmpi-examples.mk
> @@ -0,0 +1,29 @@
> +################################################################################
> +#
> +# openmpi-examples
> +#
> +################################################################################
> +
> +OPENMPI_EXAMPLES_VERSION = $(OPENMPI_VERSION)
> +OPENMPI_EXAMPLES_SOURCE = $(OPENMPI_SOURCE)
> +OPENMPI_EXAMPLES_DL_SUBDIR = openmpi
> +OPENMPI_EXAMPLES_SITE = $(OPENMPI_SITE)
> +OPENMPI_EXAMPLES_LICENSE = $(OPENMPI_LINCENSE)
> +OPENMPI_EXAMPLES_LICENSE_FILES = $(OPENMPI_LICENSE_FILES)

Why is this a separate package? If those examples come with openmpi,
then building the examples should be a suboption of the openmpi package.

> +OPENMPI_EXAMPLES_DEPENDENCIES = openmpi
> +
> +define OPENMPI_EXAMPLES_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) PATH=$(STAGING_DIR)/usr/bin:$(BR_PATH) OPAL_DESTDIR=$(STAGING_DIR)/usr \

Adding $(STAGING_DIR)/usr/bin in the PATH is a bad idea, as it contains
a lot of tools/binaries cross-compiled for the target.

> +	mpicc \
> +		$(TARGET_CFLAGS) $(TARGET_LDFLAGS) \
> +		-o $(@D)/examples/hello_c \
> +		$(@D)/examples/hello_c.c

So either, we need to change things so that mpicc is installed to
$(HOST_DIR), or you need to invoke it as $(STAGING_DIR)/usr/bin/mpicc.

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
