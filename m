Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C0ABEB64DD
	for <buildroot@archiver.kernel.org>; Wed, 12 Jul 2023 19:38:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC47B41F0E;
	Wed, 12 Jul 2023 19:38:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC47B41F0E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fyLSpJBjHBjv; Wed, 12 Jul 2023 19:38:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6FB6441F14;
	Wed, 12 Jul 2023 19:38:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6FB6441F14
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 74AE61BF3BD
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 19:38:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 59DDC41F07
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 19:38:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 59DDC41F07
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XUIltq1aEhlO for <buildroot@lists.busybox.net>;
 Wed, 12 Jul 2023 19:38:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 086B94088B
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 086B94088B
 for <buildroot@buildroot.org>; Wed, 12 Jul 2023 19:38:36 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:e245:939f:c022:28d9])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 3C3B013F87F;
 Wed, 12 Jul 2023 21:38:32 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 12 Jul 2023 21:38:31 +0200
Date: Wed, 12 Jul 2023 21:38:31 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Ismael Luceno <ismael@iodev.co.uk>
Message-ID: <20230712193831.GI188780@scaer>
References: <20230708193606.32014-1-ismael@iodev.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230708193606.32014-1-ismael@iodev.co.uk>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1689190714;
 bh=R0YcKwbSc34qQAdEn2g/WYuvErE5Pdz2JhQ/uQXLx/Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CI+jJOZ+O9S0l53m92AFdOwBIH4WfW+KDTuKx/HXDAD/td5UIXy02hUphVnGQrUUQ
 6P8NemjWVuQFMMps52anCOC7v7X8U9DuytJQF4en55iwyt8Bco8+Va0XV+WoemII9W
 1EqbeUpUyURizAIRn1jKlXtpOm1DREbcqvF9gOYI7Lx3aQXY8qidoO/0W8TzGIeGLg
 pjuMpcrwf8ve64Wv835aqyhc00Tu16Oxy6tJJVl7N+8ZnSJzJz85V2YSuTtSCUZKNK
 5kFEutlKlbenyw22CsP4APtkS7lwlkpRkM2nSETyWTcbZaIrm2uZ9XMDeLFtz7dmqI
 WaXReKINWjxng==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=CI+jJOZ+
Subject: Re: [Buildroot] [PATCH] package/pounce: New package
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

Ismael, All,

On 2023-07-08 21:36 +0200, Ismael Luceno spake thusly:
> Simple IRC bouncer.
> 
> Signed-off-by: Ismael Luceno <ismael@iodev.co.uk>
> ---
[--SNIP--]
> diff --git a/package/pounce/Config.in b/package/pounce/Config.in
> new file mode 100644
> index 000000000000..83bb66643652
> --- /dev/null
> +++ b/package/pounce/Config.in
> @@ -0,0 +1,18 @@
> +config BR2_PACKAGE_POUNCE
> +	bool "pounce"
> +	select BR2_PACKAGE_LIBRESSL

    $ ./utils/docker-run make check-package
    package/pounce/Config.in:3: BR2_PACKAGE_LIBRESSL is part of a "choice" and should not be "select"ed

However, the situation is tricky: it seems that pounce does indeed
require libressl, and not libopenssl, because it really wants libtls.

In Buildroot, libopenssl and libressl are exclusive one to the other; we
then have two possible situations for a package:

  - works equally well with either libopenssl or libressl

  - only works with libopenssl

We have no way to represent this new case for pounce, which is:

  - only work with libressl.

So, the only solution is to actually depend on libressl:

    config BR2_PACKAGE_POUNCE
        bool "pounce"
        depends on BR2_PACKAGE_LIBRESSL
        [...]


    comment "pounce needs openssl support w/ libressl"
        depends on !BR2_PACKAGE_LIBRESSL

Unfortunately, for now, this is the only case, so we'll need a few other
cases before we look into providing a way to fore-se;ect libressl...

> +	help
> +	  pounce is a multi-client, TLS-only IRC bouncer. It maintains a
> +	  persistent connection to an IRC server, acting as a proxy and
> +	  buffer for a number of clients. When a client connects, any
> +	  messages received since it last disconnected will be relayed to
> +	  it. Unlike some other bouncers, pounce uses a single buffer for
> +	  all IRC messages, which acts as a queue from which each client
> +	  reads messages independently.
> +
> +	  pounce speaks regular modern IRC to both servers and clients, using
> +	  the server-time extension to indicate when messages originally
> +	  occurred. Clients identify themselves to pounce by their IRC
> +	  usernames.
> +
> +	  https://git.causal.agency/pounce/

    $ ./utils/docker-run make check-package
    package/pounce/Config.in:8: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)
    package/pounce/Config.in:9: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)
    package/pounce/Config.in:13: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)

Also, I think a better "homepage" would be:

    https://git.causal.agency/pounce/about/

> diff --git a/package/pounce/pounce.hash b/package/pounce/pounce.hash
> new file mode 100644
> index 000000000000..a827bd389f40
> --- /dev/null
> +++ b/package/pounce/pounce.hash
> @@ -0,0 +1,3 @@
> +# Locally computed
> +sha256  97f245556b1cc940553fca18f4d7d82692e6c11a30f612415e5e391e5d96604e  pounce-3.1.tar.gz
> +sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE
> diff --git a/package/pounce/pounce.mk b/package/pounce/pounce.mk
> new file mode 100644
> index 000000000000..b0a28efd91bd
> --- /dev/null
> +++ b/package/pounce/pounce.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# pounce
> +#
> +################################################################################
> +
> +POUNCE_VERSION = 3.1
> +POUNCE_SITE = https://git.causal.agency/pounce/snapshot
> +POUNCE_SOURCE = pounce-$(POUNCE_VERSION).tar.gz

    $ ./utils/docker-run make check-package
    package/pounce/pounce.mk:9: remove default value of _SOURCE variable (http://nightly.buildroot.org/#generic-package-reference)

> +POUNCE_LICENSE = GPL-3.0+
> +POUNCE_LICENSE_FILES = LICENSE
> +POUNCE_DEPENDENCIES = libressl
> +
> +$(eval $(autotools-package))

It is not an autotools package: the configure script is hand-written, so
it should not use the autotools infra.

The configure script calls pkg-config, so you need it in the
dependencies.

The configure script is not playing nice with cross-compilation: it
calls 'uname' to decide what to do, which is incorrect. It happens that
we are running on linux and targetting linux, so it works by accident.
We should however make sure that this is going to always be the case.

    POUNCE_DEPENDENCIES = host=pkgconf libressl

    define POUNCE_FAKE_UNAME
        $(Q)mkdir -p $(@D)/bin
        $(Q)printf '#!/bin/sh\necho Linux\n' >$(@D)/bin/uname
        $(Q)chmod 755 $(@D)/bin/uname
    endef
    POUNCE_POST_EXTRACT_HOOKS += POUNCE_FAKE_UNAME

    define POUNCE_CONFIGURE_CMDS
        cd $(@D) && \
        PATH=$(@D)/bin:$(BR_PATH) \
        ./configure \
            --prefix=/usr
    endef

    define POUNCE_BUILD_CMDS
        $(TARGET_CONFIGURE_OPTS) \
        $(TARGET_MAKE_ENV) \
        $(MAKE) \
            -C $(@D)
    endef

    define POUNCE_INSTALL_TARGET_CMDS
        $(TARGET_CONFIGURE_OPTS) \
        $(TARGET_MAKE_ENV) \
        $(MAKE) \
            -C $(@D) \
            DESTDIR=$(TARGET_DIR) \
            install
    endef

    $(eval $(generic-package))

Of course, totally untested... ;-)

Can you update, check, and respin, please?

Regards,
Yann E. MORIN.

> -- 
> 2.40.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
