Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 687EDC47422
	for <buildroot@archiver.kernel.org>; Sun, 21 Jan 2024 15:32:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D127240280;
	Sun, 21 Jan 2024 15:32:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D127240280
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id spnxtrHk7zeq; Sun, 21 Jan 2024 15:32:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B722F40556;
	Sun, 21 Jan 2024 15:32:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B722F40556
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3D10F1BF577
 for <buildroot@lists.busybox.net>; Sun, 21 Jan 2024 15:32:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E9905417DA
 for <buildroot@lists.busybox.net>; Sun, 21 Jan 2024 15:32:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9905417DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rTjiZzrPwX92 for <buildroot@lists.busybox.net>;
 Sun, 21 Jan 2024 15:32:05 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A0674417E5
 for <buildroot@buildroot.org>; Sun, 21 Jan 2024 15:32:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0674417E5
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id A88E413F880;
 Sun, 21 Jan 2024 16:31:59 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 21 Jan 2024 16:31:59 +0100
Date: Sun, 21 Jan 2024 16:31:59 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <Za0478tdOijKbdho@landeda>
References: <20240116183629.365115-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240116183629.365115-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1705851122;
 bh=vE6UndKQeJ4IL0W2IGhlHhPAMlmcParuU7DErXEf7jE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eoYmo89P18beTIzPtlsx7VXjBqxam/MgCWIz17SjbSNP1zpxeXVVuyvLraDwOq+aF
 K/dPwk6I2gf2ol1V2mN+cowcIik3lPQCpNVkHcTeEhFOwHYLlL171hdaH8boAYZknJ
 8L36SHi+Lv8tn6NJ4CK2KmqkyMhyTj2E2jLJWmGUhCETKysxenYuWSAEgvgPvU4XWf
 WkxP1MQGa1vWzWpMOx88S7QfbIfGn/Y8murtFnoD1Ig6dcxbAZcFlUly4v/kjsqxiw
 cSesIymOgNOVyQk3k0F76efHxdq9dabmB7VPfX2WKHuLgPkYPO6cw4v79n6iZ2mid5
 LrPZIomaRRrKg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=eoYmo89P
Subject: Re: [Buildroot] [PATCH 1/1] package/micropython: libffi is optional,
 not mandatory
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
Cc: Chris Packham <judge.packham@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2024-01-16 19:36 +0100, Fabrice Fontaine spake thusly:
> libffi is optional, not mandatory since bump to version 1.22.0 in commit
> 1e12b7dd49d1c64a5195f226e9e4da21e84f5d0c and
> https://github.com/micropython/micropython/commit/89b320737652829edbab921e86d7ad3962d86d9e
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/micropython/Config.in      | 1 -
>  package/micropython/micropython.mk | 9 ++++++++-
>  2 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/package/micropython/Config.in b/package/micropython/Config.in
> index b5dc47279d..30161c8b70 100644
> --- a/package/micropython/Config.in
> +++ b/package/micropython/Config.in
> @@ -2,7 +2,6 @@ config BR2_PACKAGE_MICROPYTHON
>  	bool "micropython"
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on !BR2_STATIC_LIBS
> -	select BR2_PACKAGE_LIBFFI
>  	help
>  	  Micro Python is a lean and fast implementation of the Python
>  	  3 programming language that is optimised to run on a
> diff --git a/package/micropython/micropython.mk b/package/micropython/micropython.mk
> index 6e0af59f06..c7873ab62a 100644
> --- a/package/micropython/micropython.mk
> +++ b/package/micropython/micropython.mk
> @@ -12,7 +12,7 @@ MICROPYTHON_SOURCE = micropython-$(MICROPYTHON_VERSION).tar.xz
>  # and most of the copied code is not used in the unix build.
>  MICROPYTHON_LICENSE = MIT, BSD-1-Clause, BSD-3-Clause, Zlib
>  MICROPYTHON_LICENSE_FILES = LICENSE
> -MICROPYTHON_DEPENDENCIES = host-pkgconf libffi host-python3
> +MICROPYTHON_DEPENDENCIES = host-python3
>  MICROPYTHON_CPE_ID_VENDOR = micropython
>  
>  # Use fallback implementation for exception handling on architectures that don't
> @@ -36,6 +36,13 @@ MICROPYTHON_MAKE_OPTS += \
>  	LDFLAGS_EXTRA="$(TARGET_LDFLAGS)" \
>  	CWARN=
>  
> +ifeq ($(BR2_PACKAGE_LIBFFI),y)
> +MICROPYTHON_DEPENDENCIES += host-pkgconf libffi
> +MICROPYTHON_MAKE_OPTS += MICROPY_PY_FFI=1
> +else
> +MICROPYTHON_MAKE_OPTS += MICROPY_PY_FFI=0
> +endif
> +
>  define MICROPYTHON_BUILD_CMDS
>  	$(MICROPYTHON_MAKE_ENV) $(MAKE) -C $(@D)/mpy-cross
>  	$(MICROPYTHON_MAKE_ENV) $(MAKE) -C $(@D)/ports/unix \
> -- 
> 2.43.0
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
