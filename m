Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D40B0CD5BB9
	for <buildroot@archiver.kernel.org>; Tue, 19 Sep 2023 13:19:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D5D5615F8;
	Tue, 19 Sep 2023 13:19:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D5D5615F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dwFwE8ODzUDD; Tue, 19 Sep 2023 13:19:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A681760FA0;
	Tue, 19 Sep 2023 13:19:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A681760FA0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5648E1BF3CB
 for <buildroot@lists.busybox.net>; Tue, 19 Sep 2023 13:19:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2FD0C416F8
 for <buildroot@lists.busybox.net>; Tue, 19 Sep 2023 13:19:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2FD0C416F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eTqCpUtJ00Uy for <buildroot@lists.busybox.net>;
 Tue, 19 Sep 2023 13:19:36 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BDFBE400B9
 for <buildroot@buildroot.org>; Tue, 19 Sep 2023 13:19:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BDFBE400B9
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8228C240009;
 Tue, 19 Sep 2023 13:19:33 +0000 (UTC)
Date: Tue, 19 Sep 2023 15:19:32 +0200
To: kazemi.ms@gmail.com
Message-ID: <20230919151932.4fb03b01@windsurf>
In-Reply-To: <20230919125542.9100-1-kazemi.ms@gmail.com>
References: <20230919125542.9100-1-kazemi.ms@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1695129573;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4/P9kFO1+WP1ieJ3wWcX1y9R0xugx8t2OMlhbBNNm4w=;
 b=V/8lOfUCXrZIIaJgno4N42U3rVB8uNf20QqvGCOQV9eO18xIS+pXivMVeRV/dERPf09qbA
 LvUZ1LHyGelLdgn6A3dKCLuQ4oP1fJdlDyhQahaWHw8KpqmIBV2IyLqVsujAfVzSF10uGc
 sIgwfaIVLFZ5pqm4a87KMTh82nkpPlABbzuQ+93vcX57JSSMbRlBL6SqHAJeh6QMpX377u
 Fe4IiZky7efMl1I2dBRx/YSWkOU9lcOZekQzrBPNcQpKwIB6yhAB7O0LPiTm+9SJaKGuNL
 +W+etdYrrHSqYDgDDwVTZ0i/MLTE3FsyJX6RO2Lehw3G2bhFOG4eIHoUGKMS+Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=V/8lOfUC
Subject: Re: [Buildroot] [PATCH 1/1] package/mxt-app: new package
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

On Tue, 19 Sep 2023 14:55:42 +0200
kazemi.ms@gmail.com wrote:

> From: Saeed Kazemi <kazemi.ms@gmail.com>
> 
> mxt-app is a utility for managing Atmel maXTouch touch controllers
> and other devices that support Atmel Object Based Protocol.
> 
> Signed-off-by: Saeed Kazemi <kazemi.ms@gmail.com>

Thanks for this contribution! This looks pretty good, but I have a few
comments below.

> ---
>  package/Config.in            |  1 +
>  package/mxt-app/Config.in    |  8 ++++++++
>  package/mxt-app/mxt-app.hash |  2 ++
>  package/mxt-app/mxt-app.mk   | 20 ++++++++++++++++++++
>  4 files changed, 31 insertions(+)
>  create mode 100644 package/mxt-app/Config.in
>  create mode 100644 package/mxt-app/mxt-app.hash
>  create mode 100644 package/mxt-app/mxt-app.mk

Could you add an entry in the DEVELOPERS file for this package?

> diff --git a/package/mxt-app/Config.in b/package/mxt-app/Config.in
> new file mode 100644
> index 0000000000..7e8a5f4901
> --- /dev/null
> +++ b/package/mxt-app/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_MXT_APP
> +	bool "mxt-app"
> +	select BR2_PACKAGE_LIBUSB

You need to replicate the "depends on" from libusb:

        depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
        depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb


> +	help
> +	  mxt-app is a utility for managing Atmel maXTouch touch controllers
> +	  and other devices that support Atmel Object Based Protocol.
> +
> +	  https://github.com/atmel-maxtouch/mxt-app/

And add a Config.in comment:

comment "mxt-app needs a toolchain w/ threads, gcc >= 4.9"
        depends on !BR2_TOOLCHAIN_HAS_THREADS || \
                !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9


> diff --git a/package/mxt-app/mxt-app.hash b/package/mxt-app/mxt-app.hash
> new file mode 100644
> index 0000000000..abf20c728a
> --- /dev/null
> +++ b/package/mxt-app/mxt-app.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256  3639720ae1ea033bd982d68c5cab84432ce046fe14a66d9b2de07f115b642722  v1.36.tar.gz

We need the hash of the license file to be present.

> diff --git a/package/mxt-app/mxt-app.mk b/package/mxt-app/mxt-app.mk
> new file mode 100644
> index 0000000000..626cd352fc
> --- /dev/null
> +++ b/package/mxt-app/mxt-app.mk
> @@ -0,0 +1,20 @@
> +################################################################################
> +#
> +# mxt-app
> +#
> +################################################################################
> +
> +MXT_APP_VERSION = 1.36
> +MXT_APP_SOURCE = v$(MXT_APP_VERSION).tar.gz
> +MXT_APP_SITE = https://github.com/atmel-maxtouch/mxt-app/archive/refs/tags

Could you use the github macro instead?

MXT_APP_VERSION = 1.36
MXT_APP_SITE = $(call github,atmel-maxtouch,mxt-app,v$(MXT_APP_VERSION))

you will to adjust the hash file accordingly.

> +MXT_APP_LICENSE = Atmel License

The license is actually BSD-2-Clause

> +MXT_APP_LICENSE_FILES = LICENSE
> +MXT_APP_DEPENDENCIES = libusb
> +MXT_APP_INSTALL_STAGING = YES
> +MXT_APP_AUTORECONF = YES
> +MXT_APP_CONF_OPTS = --enable-debug

Why --enable-debug by default?

> +MXT_APP_CXXFLAGS = $(TARGET_CXXFLAGS)
> +MXT_APP_CONF_ENV = CXXFLAGS="$(MXT_APP_CXXFLAGS)"

I'm not sure what's the purpose of those two lines. CXXFLAGS are
already passed by the autotools-package infrastructure in the
environment of the configure script, so this seems redundant.

Could you rework the patch to take into account those suggestions, and
send an updated version?

Also, make sure to:

(1) Run "make check-package" to validate the coding style

(2) Use utils/test-pkg to validate that the package builds fine

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
