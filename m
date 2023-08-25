Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C14C5EE49A6
	for <buildroot@archiver.kernel.org>; Fri, 25 Aug 2023 21:38:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3788C83EC2;
	Fri, 25 Aug 2023 21:38:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3788C83EC2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ndj1D8ZhSaYO; Fri, 25 Aug 2023 21:38:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 67F3383B52;
	Fri, 25 Aug 2023 21:38:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67F3383B52
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 029751BF2A5
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 21:38:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BFB1683B52
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 21:38:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BFB1683B52
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iVfOQd27hR9S for <buildroot@lists.busybox.net>;
 Fri, 25 Aug 2023 21:38:01 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2E153832E7
 for <buildroot@buildroot.org>; Fri, 25 Aug 2023 21:38:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E153832E7
Received: by mail.gandi.net (Postfix) with ESMTPSA id A6E4440003;
 Fri, 25 Aug 2023 21:37:55 +0000 (UTC)
Date: Fri, 25 Aug 2023 23:37:54 +0200
To: Sergey Romanov via buildroot <buildroot@buildroot.org>
Message-ID: <20230825233754.608732c7@windsurf>
In-Reply-To: <20230525215103.37218-3-svromanov@sberdevices.ru>
References: <20230525215103.37218-1-svromanov@sberdevices.ru>
 <20230525215103.37218-3-svromanov@sberdevices.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692999478;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DY7zbs0q0JqNsiy9uPdxxlIE1pvgmU7sijXRypyZNcU=;
 b=bbRr8os5StkLvBToTt/uIb2yrnWQQ0wnqjX02mYwi2QzlnvWSZTskqr+4SwaFue3QPmCgB
 6Yw+mQeXFC3rAXYhxMb1E/vxkXwfN/KuKPGqBCSxwYzn+dSk2E7XGif2/YY2CmkTQXJajt
 Bnd91KS9mwq/819xgTPdxNgYzNh2iQc3/n1kkc2Ql/OPn8+QLMyFwfX9tT57Ozy5mGwivW
 pXDwps9o5dtR6vGSxQuvCxo5/+YyDyyVGa4d15GqsO9sYc9bSP/voLT+IZjXcvZTJ6Ap54
 LOD0R3OiiXAKEhwGriS01ssVjL7bw6OnUU3RXtWgniKe35bVASX1LsrFqKEdMw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bbRr8os5
Subject: Re: [Buildroot] [RFC PATCH v1 2/2] package/sysbench: new package
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
Cc: Sergey Romanov <svromanov@sberdevices.ru>, chip-club@ya.ru,
 akopytov@gmail.com, sbahra@repnop.org, sdfw_system_team@sberdevices.ru,
 kernel@sberdevices.ru
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Sergey,

On Fri, 26 May 2023 00:51:03 +0300
Sergey Romanov via buildroot <buildroot@buildroot.org> wrote:

> diff --git a/package/sysbench/Config.in b/package/sysbench/Config.in
> new file mode 100644
> index 0000000000..a8377b5bfd
> --- /dev/null
> +++ b/package/sysbench/Config.in
> @@ -0,0 +1,28 @@
> +config BR2_PACKAGE_SYSBENCH
> +	bool "sysbench"
> +	select BR2_PACKAGE_LUAJIT
> +	select BR2_PACKAGE_CK

You need to replicate the dependencies of those options, so:

	depends on !BR2_STATIC_LIBS # luajit
	depends on !BR2_PACKAGE_LUA # luajit
	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS # luajit
	depends on !BR2_TOOLCHAIN_USES_UCLIBC # ck

> +	help
> +	  This benchmark was designed for identifying basic
> +	  system parameters, as they are important for system
> +	  using MySQL (w Innodb) under intensive load.
> +	  Handling of IO in case of many parallel requests,
> +	  checked as well as memory allocation/transfer
> +	  speed and scheduler performance.
> +	  CPU is benchmarked by using 64bit integer manipulation
> +	  using Euklid algorithms for prime number computation.
> +	  Benchmarks are designed to show benefit of multiple
> +	  CPUs as well as of multiple hard drives,
> +	  battery backed up write cache.

The wrapping of those lines look really weird. Can you ask your text
editor to wrap this automatically, and get some more consistent
wrapping?

> +
> +	  https://github.com/akopytov/sysbench.git
> +
> +if BR2_PACKAGE_SYSBENCH
> +
> +config BR2_PACKAGE_SYSBENCH_WITH_MYSQL
> +	bool "configure with mysql"
> +	select BR2_PACKAGE_MYSQL
> +	help
> +	  Configure with mysql

You can drop this option and test BR2_PACKAGE_MYSQL in the .mk file.

> diff --git a/package/sysbench/sysbench.mk b/package/sysbench/sysbench.mk
> new file mode 100644
> index 0000000000..748014f564
> --- /dev/null
> +++ b/package/sysbench/sysbench.mk
> @@ -0,0 +1,30 @@
> +################################################################################
> +#
> +# SYSBENCH
> +#
> +################################################################################
> +
> +SYSBENCH_VERSION = 1.0.20
> +SYSBENCH_SITE = $(call github,akopytov,sysbench,$(SYSBENCH_VERSION))
> +SYSBENCH_LICENSE = GPLv2

GPL-2.0, not GPLv2. But from a quick look at the code, it seems like
the license is actually GPL-2.0+.

> +SYSBENCH_LICENSE_FILES = COPYING
> +
> +SYSBENCH_AUTORECONF = YES

> +
> +SYSBENCH_DEPENDENCIES = host-pkgconf
> +SYSBENCH_DEPENDENCIES += ck
> +SYSBENCH_DEPENDENCIES += luajit

Please change to:

SYSBENCH_DEPENDENCIES = host-pkgconf ck luajit

> +SYSBENCH_CONF_OPTS += --without-lib-prefix
> +SYSBENCH_CONF_OPTS += --with-system-luajit
> +SYSBENCH_CONF_OPTS += --with-system-ck

Please change to:

SYSBENCH_CONF_OPTS = \
	--without-lib-prefix \
	--with-system-luajit \
	--with-system-ck

> +
> +ifneq ($(BR2_PACKAGE_SYSBENCH_WITH_MYSQL), y)
> +SYSBENCH_CONF_OPTS += --without-mysql
> +else
> +SYSBENCH_DEPENDENCIES += mysql
> +SYSBENCH_CONF_OPTS += --with-mysql-includes=$(STAGING_DIR)/usr/include/mysql
> +SYSBENCH_CONF_OPTS += --with-mysql-libs=$(STAGING_DIR)/usr/lib
> +endif

Please change to:

ifeq ($(BR2_PACKAGE_MYSQL),y)
SYSBENCH_DEPENDENCIES += mysql
SYSBENCH_CONF_OPTS += \
	--with-mysql \
	--with-mysql-includes=$(STAGING_DIR)/usr/include/mysql \
	--with-mysql-libs=$(STAGING_DIR)/usr/lib
else
SYSBENCH_CONF_OPTS += --without-mysql
endif

Could you rework this and send a v2?

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
