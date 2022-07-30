Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65038C04A68
	for <buildroot@archiver.kernel.org>; Sat, 30 Jul 2022 16:10:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 072B160E4D;
	Sat, 30 Jul 2022 16:10:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 072B160E4D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BnrylhVvCnZV; Sat, 30 Jul 2022 16:10:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1620660E13;
	Sat, 30 Jul 2022 16:10:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1620660E13
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6FFCB1BF33A
 for <buildroot@lists.busybox.net>; Sat, 30 Jul 2022 16:10:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 555BB60E13
 for <buildroot@lists.busybox.net>; Sat, 30 Jul 2022 16:10:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 555BB60E13
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JgesvejGshrE for <buildroot@lists.busybox.net>;
 Sat, 30 Jul 2022 16:10:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5155B60BDF
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5155B60BDF
 for <buildroot@buildroot.org>; Sat, 30 Jul 2022 16:10:14 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ed0d:5473:88a:e206])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id A5A1160128;
 Sat, 30 Jul 2022 18:10:09 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 30 Jul 2022 18:10:09 +0200
Date: Sat, 30 Jul 2022 18:10:09 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Angelo Compagnucci <angelo@amarulasolutions.com>
Message-ID: <20220730161009.GX3168@scaer>
References: <20220729220154.341187-1-angelo@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220729220154.341187-1-angelo@amarulasolutions.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1659197411;
 bh=a0VeQm0MnnTm0e0xfd3fWLFP0GsSXGay2J/9ULtu1ZE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=R4nYw+x6oZ22bHF6MlbatIQddExsrIFtBxccCkQYYu+M56D0plfKx0wgIvvfxEyLd
 LywPdMW7JMfZQ8naPU6mZZeFAZb1aZ6eKAmalK0QMZV01pIyMzAqUMOLtHNMEdWkFW
 Irua6zg47uW6g2HLq4L7Dowop0rNmnmHSkDTusSFHQtp1fULuZ7BPJPXB1PmZWxqi8
 Cnn4utRYv0ZUeAAqU1NKAE9C0mGr/l7b7uBcu4VFOUlsBFv/XOqZLCl+8Soe4hM997
 l7U+IgUzrMTwD3YFEf5uQWGmWRkD8ZinnyTTeyl/1ewQ88DimEDoB+IUZopFcopWsm
 GTPBWEGTM4Vvw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=R4nYw+x6
Subject: Re: [Buildroot] [PATCH v3] package/libdill: new package
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

Angelo, Al,

On 2022-07-30 00:01 +0200, Angelo Compagnucci spake thusly:
> Libdill is a C library that makes writing structured concurrent programs
> easy.
> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> ---
[--SNIP--]
> diff --git a/package/libdill/Config.in b/package/libdill/Config.in
> new file mode 100644
> index 0000000000..0e6757b809
> --- /dev/null
> +++ b/package/libdill/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_LIBDILL
> +	bool "libdill"
> +	help
> +	  Libdill is a C library that makes writing structured concurrent

    $ make check-package
    package/libdill/Config.in:4: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)

[--SNIP--]
> diff --git a/package/libdill/libdill.mk b/package/libdill/libdill.mk
> new file mode 100644
> index 0000000000..b73184f117
> --- /dev/null
> +++ b/package/libdill/libdill.mk
> @@ -0,0 +1,28 @@
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
> +LIBDILL_INSTALL_STAGING = YES
> +# Fetched from Github, with no configure script
> +LIBDILL_AUTORECONF = YES
> +
> +ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
> +LIBDILL_CONF_OPTS += --enable-threads
> +else
> +LIBDILL_CONF_OPTS += --disable-threads
> +endif
> +
> +ifeq ($(BR2_PACKAGE_OPENSSL),y)
> +LIBDILL_DEPENDENCIES = openssl

    $ make check-package
    package/libdill/libdill.mk:22: conditional override of variable LIBDILL_DEPENDENCIES

I've fixed both issues, and added a blurb to explain why we don't use a
version, and applied to master, thanks.

Regards,
Yann E. MORIN.

> +LIBDILL_CONF_OPTS += --enable-tls
> +else
> +LIBDILL_CONF_OPTS += --disable-tls
> +endif
> +
> +$(eval $(autotools-package))
> -- 
> 2.34.1
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
