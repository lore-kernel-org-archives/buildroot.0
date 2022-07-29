Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FB05C00144
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 08:48:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B9CD83FEF;
	Fri, 29 Jul 2022 08:48:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B9CD83FEF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SHwYzBMZOsr9; Fri, 29 Jul 2022 08:48:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C64D83FEA;
	Fri, 29 Jul 2022 08:48:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C64D83FEA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 896BF1BF308
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 08:48:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5632D60E8A
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 08:48:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5632D60E8A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OXM1pmrxN9qh for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 08:47:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E938D60655
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E938D60655
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 08:47:58 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D46621BF205;
 Fri, 29 Jul 2022 08:47:55 +0000 (UTC)
Date: Fri, 29 Jul 2022 10:47:54 +0200
To: Angelo Compagnucci <angelo@amarulasolutions.com>
Message-ID: <20220729104754.2beb327c@windsurf>
In-Reply-To: <20220728211259.121416-1-angelo@amarulasolutions.com>
References: <20220728211259.121416-1-angelo@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659084476;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N48j5RkGv+3y2g6ty16tC4+5nQKxW8fXxD+U6i2Fo9M=;
 b=YJbcTaf+OLYeTD9RcVBarp1+8YkZQIdVhoq95dKJ+WE6Fs4kihs2I2coPJHqCHXweGFBdt
 TaP6+b59wvN90Y2NMAn+5IkghQKdjNlakZY4ZotMJcxtPlhuDSU92ZzHNALs4KfQJgg5YK
 a0J73/fLHeOP80EbCKznc2+hc0GVBEMH2AMORvpHgZXKPCBS/EoLbr1DezaLa9vtkcl+Bo
 pVA95Cjt/HTD/83lyh/NMgNO5M5LJKHuYpPejrHhZU88SKvzbalLKlUXuLdX+movMzOnRt
 UbXqIckAjyinGVVryWZ8b+Xo5rVw6xuJVQ0aPBzI7XKKNrc6XSYGPBrjtBOlSQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YJbcTaf+
Subject: Re: [Buildroot] [PATCH v2] package/libdill: new package
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

Hello Angelo,

On Thu, 28 Jul 2022 23:12:59 +0200
Angelo Compagnucci <angelo@amarulasolutions.com> wrote:

> Libdill is a C library that makes writing structured concurrent programs
> easy.
> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>

Looks good. A few comments/questions.


> diff --git a/package/libdill/Config.in b/package/libdill/Config.in
> new file mode 100644
> index 0000000000..0e6757b809
> --- /dev/null
> +++ b/package/libdill/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_LIBDILL
> +	bool "libdill"

No dependencies at all? Tested with test-pkg?

> diff --git a/package/libdill/libdill.mk b/package/libdill/libdill.mk
> new file mode 100644
> index 0000000000..822f07b939
> --- /dev/null
> +++ b/package/libdill/libdill.mk
> @@ -0,0 +1,26 @@
> +################################################################################
> +#
> +# libdill
> +#
> +################################################################################
> +
> +LIBDILL_VERSION = fa01648cf2a8d06e53c965b45eeacfb3ac57bd04
> +LIBDILL_SITE = $(call github,sustrik,libdill,$(LIBDILL_VERSION))
> +LIBDILL_LICENSE = MIT
> +LIBDILL_LICENSE_FILES = COPYING
> +LIBDILL_CPE_ID_VENDOR = libdill
> +LIBDILL_CPE_ID_PRODUCT = libdill

Could you add a link in the commit log that shows you have verified these?

> +LIBDILL_INSTALL_STAGING = YES
> +# Fetched from Github, with no configure script
> +LIBDILL_AUTORECONF = YES
> +
> +ifneq ($(BR2_TOOLCHAIN_HAS_THREADS),y)

ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)

> +LIBDILL_CONF_OPTS += --disable-threads
> +endif
> +
> +ifeq ($(BR2_PACKAGE_OPENSSL),y)
> +LIBDILL_DEPENDENCIES = openssl
> +LIBDILL_CONF_OPTS += --enable-tls

No "else" clause to explicitly disable?

> +endif

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
