Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08495C001DE
	for <buildroot@archiver.kernel.org>; Sun, 23 Jul 2023 18:10:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64138408C3;
	Sun, 23 Jul 2023 18:10:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64138408C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KRb9FowIzf1S; Sun, 23 Jul 2023 18:10:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F273F40874;
	Sun, 23 Jul 2023 18:10:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F273F40874
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2D2311BF59E
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 18:10:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0430340874
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 18:10:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0430340874
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dWwcmZzyxf1x for <buildroot@lists.busybox.net>;
 Sun, 23 Jul 2023 18:10:13 +0000 (UTC)
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7A2B340627
 for <buildroot@buildroot.org>; Sun, 23 Jul 2023 18:10:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A2B340627
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:22c7:ca40:1a2e:1362])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 67F045FF27;
 Sun, 23 Jul 2023 20:10:06 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 23 Jul 2023 20:10:06 +0200
Date: Sun, 23 Jul 2023 20:10:06 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Alistair Francis <alistair23@gmail.com>
Message-ID: <20230723181006.GA3544423@scaer>
References: <20230721032102.782318-1-alistair.francis@wdc.com>
 <20230721032102.782318-2-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230721032102.782318-2-alistair.francis@wdc.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1690135810;
 bh=jWA8UEC3P23JvGsqPtPM+rXF3m57W4eBD3L01nSd1+Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QrvFEZN7ZfgxykorJZYT3Ii49GEFYXbq3QCyY/LyDSZ6uiykBCaJ4O8r1SiI64Lqu
 p/RD2oyzSl4gZaZbWSOPULMSs2ImwsOHENsSl6nb2YOWhfZA50lSl9yXsCwshGySpy
 OBv2uPL118pGq7NhPJjp8yj48XnPI5lUfhh9J7XopYGEeFu/zIxj3d/7lGsHZYEPpK
 rz+5kGAQMZyCAV/XFn6+2HpFrqBYqAhKxB69CXVHu7NXspUiWeRDAcimycxkZwOeNk
 zaIwtdNJ+EewcYaOhbKv0Fas4DyZeEkLSoqcA4/QoCVce0wfZAEjPbvSX+5fnieCxa
 hRzItybhcMfng==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=QrvFEZN7
Subject: Re: [Buildroot] [PATCH 2/2] package/libspdm: Initial commit
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
Cc: Samuel Martin <s.martin49@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Alistair, All,

On 2023-07-21 13:21 +1000, Alistair Francis spake thusly:
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
[--SNIP--]
> diff --git a/package/libspdm/Config.in b/package/libspdm/Config.in
> new file mode 100644
> index 0000000000..3051fc8c59
> --- /dev/null
> +++ b/package/libspdm/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_LIBSPDM
> +	bool "libspdm"
> +	depends on BR2_PACKAGE_OPENSSL

You can select BR2_PACKAGE_OPENSSL. That will ensure that either openssl
(libopenssl) or libressl are enabled. If your package can work with
either, then you're all set with just that:

    select BR2_PACKAGE_OPENSSL

If your package really want opensll (libopenssl), then you must state
so:

    select BR2_PACKAGE_OPENSSL
    select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL

[--SNIP--]
> diff --git a/package/libspdm/libspdm.mk b/package/libspdm/libspdm.mk
> new file mode 100644
> index 0000000000..1f8012f599
> --- /dev/null
> +++ b/package/libspdm/libspdm.mk
> @@ -0,0 +1,75 @@
> +################################################################################
> +#
> +# libspdm
> +#
> +################################################################################
> +
> +LIBSPDM_VERSION = 3.0.0
> +LIBSPDM_SITE = $(call github,DMTF,libspdm,$(LIBSPDM_VERSION))
> +LIBSPDM_LICENSE = BSD-3-Clause
> +LIBSPDM_LICENSE_FILES = LICENSE.md
> +
> +LIBSPDM_INSTALL_STAGING = YES
> +LIBSPDM_INSTALL_TARGET = YES
> +
> +LIBSPDM_DEPENDENCIES += openssl
> +
> +ifeq ($(BR2_arcle)$(BR2_arceb),y)
> +LIBSPDM_TARGET_CPU_FAMILY = arc
> +else ifeq ($(BR2_arm)$(BR2_armeb),y)
> +LIBSPDM_TARGET_CPU_FAMILY = arm
> +else ifeq ($(BR2_aarch64)$(BR2_aarch64_be),y)
> +LIBSPDM_TARGET_CPU_FAMILY = aarch64
> +else ifeq ($(BR2_i386),y)
> +LIBSPDM_TARGET_CPU_FAMILY = ia32
> +else ifeq ($(BR2_riscv)$(BR2_RISCV_32),yy)
> +LIBSPDM_TARGET_CPU_FAMILY = riscv32
> +else ifeq ($(BR2_riscv)$(BR2_RISCV_64),yy)
> +LIBSPDM_TARGET_CPU_FAMILY = riscv64
> +else ifeq ($(BR2_x86_64),y)
> +LIBSPDM_TARGET_CPU_FAMILY = x64
> +else
> +LIBSPDM_TARGET_CPU_FAMILY = $(ARCH)
> +endif

I like that such conditions be written in Config.in, even if this is not
a hard requirement:

    config BR2_PACKAGE_LIBSPDM_CPU_FAMILLY
        string
        default "arc" if BR2_arcle || BR2_arceb
        default "arm" if BR2_arm || BR2_armeb
        ...
        default BR2_ARCH  # Yes, this should work...

and then in the .mk:

    LIBSPDM_TARGET_CPU_FAMILY = $(call qstrip,$(BR2_PACKAGE_LIBSPDM_CPU_FAMILLY))

[--SNIP--]
> +define LIBSPDM_INSTALL_STAGING_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/lib/* $(STAGING_DIR)/usr/lib/

You need to ensure that the destination direcotry exists before you copy
multiple files in one go there; what we usually do is:

    $(INSTALL) -m 075 -t $(STAGING_DIR)/usr/lib/ $(@D)/lib/*

or the usual mkdir-then-install dance.

> +	$(INSTALL) -d $(STAGING_DIR)/usr/include/library

The set of isntall directories:
    /usr/include/library/
    /usr/include/internal/
    /usr/include/hal/
    /usr/include/industry_standard/

are very generic and confusing. Should they not be in a common
sub-directory, e.g.:
    /usr/include/spdm/library/
    /usr/include/spdm/internal/
    /usr/include/spdm/hal/
    /usr/include/spdm/industry_standard/

Because I can at least see 'hal' conflict with a lot of other HALs (and
don't wait for Dave...)

Regards,
Yann E. MORIN.

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
