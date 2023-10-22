Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57116C001DF
	for <buildroot@archiver.kernel.org>; Sun, 22 Oct 2023 13:37:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E16D64F50B;
	Sun, 22 Oct 2023 13:37:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E16D64F50B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HCIzqcTspFiB; Sun, 22 Oct 2023 13:37:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 297AE4F50C;
	Sun, 22 Oct 2023 13:37:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 297AE4F50C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3F5371BF276
 for <buildroot@lists.busybox.net>; Sun, 22 Oct 2023 13:37:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EB7514F50D
 for <buildroot@lists.busybox.net>; Sun, 22 Oct 2023 13:37:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB7514F50D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 11JCgKWHmwsO for <buildroot@lists.busybox.net>;
 Sun, 22 Oct 2023 13:37:28 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7D0AD4F50B
 for <buildroot@buildroot.org>; Sun, 22 Oct 2023 13:37:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D0AD4F50B
Received: by mail.gandi.net (Postfix) with ESMTPSA id E6EC7C0003;
 Sun, 22 Oct 2023 13:37:24 +0000 (UTC)
Date: Sun, 22 Oct 2023 15:37:24 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20231022153724.7ae6a9f1@windsurf>
In-Reply-To: <20231019214953.4002609-1-bernd@kuhls.net>
References: <20231019214953.4002609-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1697981845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=appydjVH7B14wP125UmPAERaqCUa6vJY+lS9+7dWOas=;
 b=h3BzI3ZMnnB7U6VIsWtwwnE3/0pihyvMif8PfcVfcdbztj7spYX9Ec2rW1BjD7hasGJDN4
 nAcbYXAFHxTfcsENnqBXsEe6pjDMCfeVgV6n2BwyqzX3fc6Rjo2zH6O2w35zCuee0jd2zO
 c9tPcWJM6nqTVyGUAuxxI2vMZk+8r5SpgbtgfECaEaE1mqsNr69P6gvt0k+of/9CZaxdJl
 gmGRr+yGf5fyYzq9xQHCYpx4jeagnkPWI1+qkHMk4Lyl+15EY0s22ExOr7vwBKriTL79PA
 M0FhB61ILr+YHtdl4dfG4ppvm4l8ChkT+JVXJM+asG+AtXfdTd+4Iiej8dUJDw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=h3BzI3ZM
Subject: Re: [Buildroot] [PATCH 1/1] package/elfutils: enable on musl
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
Cc: Laurent Vivier <laurent@vivier.eu>, "Wojciech M
 . Zabolotny" <wzab01@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>,
 Tobias Waldekranz <tobias@waldekranz.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 19 Oct 2023 23:49:53 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> diff --git a/package/elfutils/elfutils.mk b/package/elfutils/elfutils.mk
> index 0757851b72..ebe30f63fa 100644
> --- a/package/elfutils/elfutils.mk
> +++ b/package/elfutils/elfutils.mk
> @@ -61,7 +61,7 @@ HOST_ELFUTILS_CONF_OPTS += --disable-libdebuginfod --disable-debuginfod
>  ELFUTILS_CONF_ENV += \
>  	LDFLAGS="$(ELFUTILS_LDFLAGS)"
>  
> -ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
> +ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
>  ELFUTILS_DEPENDENCIES += argp-standalone
>  ELFUTILS_CONF_OPTS += --disable-symbol-versioning

Are you sure this is correct? Indeed, argp-standalone is selected for
both uclibc and musl, but I don't think musl needs
--disable-symbol-versioning. A previous patch enabling elfutils on musl
had this instead:

-ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
+ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),)
 ELFUTILS_DEPENDENCIES += argp-standalone
+endif
+
+ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
 ELFUTILS_CONF_OPTS += --disable-symbol-versioning
 endif

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
