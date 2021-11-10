Return-Path: <SRS0=ghJV=P5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A149EC433F5
	for <buildroot@archiver.kernel.org>; Wed, 10 Nov 2021 20:46:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 311F161213
	for <buildroot@archiver.kernel.org>; Wed, 10 Nov 2021 20:46:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 311F161213
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E39D3401F0;
	Wed, 10 Nov 2021 20:46:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nfyMeENoi6UD; Wed, 10 Nov 2021 20:46:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DBF504020B;
	Wed, 10 Nov 2021 20:46:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 560D71BF2F1
 for <buildroot@lists.busybox.net>; Wed, 10 Nov 2021 20:46:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5251D4047E
 for <buildroot@lists.busybox.net>; Wed, 10 Nov 2021 20:46:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rj6wfBtSWHvi for <buildroot@lists.busybox.net>;
 Wed, 10 Nov 2021 20:46:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8DAF04044C
 for <buildroot@buildroot.org>; Wed, 10 Nov 2021 20:46:23 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:90c4:eaed:10a6:22de])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 6F1415FF95;
 Wed, 10 Nov 2021 21:46:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1636577180;
 bh=3a2zjk686dMaPTTk1Kf5aliysZGl7ZHEly9bvd3BSxU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mk9wAPicMScPb/CQ1tpHvKuSe63TvpvCEM62PSZlAc817MSlw4yqGdWZczx0PYxdR
 iNs6djP96fnGysTfywueGyBLqHX/8vx9/+vuz7x2RA+FYx/j/XBKXuvMVF4l21fm/6
 sDoaUppWZ1TrxSjVoPPQXejYtITFThZmJBXwJQNtw+ckeVtuY1HFuwDxmDUgByhzpV
 2bRY+ht3+ww0+5Jan/ruzw8ER2fNuBRfE/EOMzB8yARxUjiDVl3w6AZwB3MXit227v
 a22KCMfUX3PmOUct7kz8OR4IHE5PPs/sTDN83QAznJjj9vyhtVDNXzw0HxVZHv4utH
 2b7IZNXdDgZyg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 10 Nov 2021 21:46:12 +0100
Date: Wed, 10 Nov 2021 21:46:12 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211110204612.GO2084998@scaer>
References: <20211110174609.1927002-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211110174609.1927002-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/binutils: zlib is mandatory
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2021-11-10 18:46 +0100, Fabrice Fontaine spake thusly:
> As found out by Yann [1], if zlib is not provided by the system,
> binutils will use a bundled version.

This is not exactly true: indeed, even when zlib is provided by the
system, binutils *will* use its bundled copy, *unless* explicitly told
not to.

> So use --with-system-zlib which is
> available since version 2.21 and
> https://github.com/bminor/binutils-gdb/commit/700d40ca16eb3ba1ecc1e602cb3eec175bdf70f0
> 
> This will fix the following build failure with oprofile:

... in a static configuration without zlib enabled.

I've extended the commit log with those two refinements, and applied to
master, thanks.

Regards,
Yann E. MORIN.

> checking for bfd_openr in -lbfd... no
> checking for compress in -lz... no
> configure: error: libz library not found; required by libbfd
> 
> As found out by Arnout [1], this fails infrequently because static is
> already pretty rare, but in addition zlib is almost always selected by
> some other package.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/0e1d16dfbb455a08db80ac5d35613908c3b4163f
> 
> [1] https://patchwork.ozlabs.org/project/buildroot/patch/20211030214734.2154583-1-fontaine.fabrice@gmail.com/
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/binutils/Config.in   | 1 +
>  package/binutils/binutils.mk | 7 ++-----
>  2 files changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/package/binutils/Config.in b/package/binutils/Config.in
> index e17a8ec65a..5e1a769998 100644
> --- a/package/binutils/Config.in
> +++ b/package/binutils/Config.in
> @@ -2,6 +2,7 @@ config BR2_PACKAGE_BINUTILS
>  	bool "binutils"
>  	depends on !BR2_nios2
>  	depends on BR2_USE_WCHAR
> +	select BR2_PACKAGE_ZLIB
>  	help
>  	  Install binutils on the target
>  
> diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
> index bfad25422d..13f61be035 100644
> --- a/package/binutils/binutils.mk
> +++ b/package/binutils/binutils.mk
> @@ -25,7 +25,7 @@ BINUTILS_SITE ?= $(BR2_GNU_MIRROR)/binutils
>  BINUTILS_SOURCE ?= binutils-$(BINUTILS_VERSION).tar.xz
>  BINUTILS_EXTRA_CONFIG_OPTIONS = $(call qstrip,$(BR2_BINUTILS_EXTRA_CONFIG_OPTIONS))
>  BINUTILS_INSTALL_STAGING = YES
> -BINUTILS_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
> +BINUTILS_DEPENDENCIES = zlib $(TARGET_NLS_DEPENDENCIES)
>  BINUTILS_MAKE_OPTS = LIBS=$(TARGET_NLS_LIBS)
>  BINUTILS_LICENSE = GPL-3.0+, libiberty LGPL-2.1+
>  BINUTILS_LICENSE_FILES = COPYING3 COPYING.LIB
> @@ -51,6 +51,7 @@ BINUTILS_CONF_OPTS = \
>  	--target=$(GNU_TARGET_NAME) \
>  	--enable-install-libiberty \
>  	--enable-build-warnings=no \
> +	--with-system-zlib \
>  	$(BINUTILS_DISABLE_GDB_CONF_OPTS) \
>  	$(BINUTILS_EXTRA_CONFIG_OPTIONS)
>  
> @@ -74,10 +75,6 @@ ifeq ($(BR2_ARM_CPU_ARMV7M)$(BR2_OPTIMIZE_S),yy)
>  BINUTILS_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -O2"
>  endif
>  
> -ifeq ($(BR2_PACKAGE_ZLIB),y)
> -BINUTILS_DEPENDENCIES += zlib
> -endif
> -
>  # "host" binutils should actually be "cross"
>  # We just keep the convention of "host utility" for now
>  HOST_BINUTILS_CONF_OPTS = \
> -- 
> 2.33.0
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
