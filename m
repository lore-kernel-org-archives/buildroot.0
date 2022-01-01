Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B28CC433EF
	for <buildroot@archiver.kernel.org>; Sat,  1 Jan 2022 11:01:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A944040098;
	Sat,  1 Jan 2022 11:01:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GksqYPNT0i2p; Sat,  1 Jan 2022 11:01:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2B46404B6;
	Sat,  1 Jan 2022 11:01:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1FB871BF5A8
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 11:01:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 19F974012F
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 11:01:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id akVS33fLAzz8 for <buildroot@lists.busybox.net>;
 Sat,  1 Jan 2022 11:01:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5E2C6400D9
 for <buildroot@buildroot.org>; Sat,  1 Jan 2022 11:01:36 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:b440:9a6c:7abd:86f8])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id CBDEA5FFA8;
 Sat,  1 Jan 2022 12:01:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1641034894;
 bh=wMbsFTU/E1+hGds3JDFfH6vjDsRY+MnWDGGIhw2STEo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mSxmXs8o3IKD/RGfFtUIB24Mj7YD/laiVxpYXPtl5MANEhF7FoAj7h2kdTz0fM3FS
 AhcQ9V0ugQ92QszojByHQ6vkZR9jWnHDZhSoDHoDFBI1IZuAMiPfSq6oYQEpgLQdhk
 vnhLW4UtLB0QiDyzn8BUel+JQjV4DlbE7rQyJeqW00QP4l9jun9ptdBnPOTrvxDAj9
 WBGED7enaYuFHumCLsdtR1IdKYObcuH2vVBI6GqT+TsGBU6HRbjAV9yWFlilXHMbD+
 4g9Lb3u+fREAB5Ds2DMW/KVWXEnRnlcjS8KVLCqVtK3V6yA+R5DeQXw5uGfEMvWVfT
 D33LF1GFIZ8YQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 01 Jan 2022 12:01:27 +0100
Date: Sat, 1 Jan 2022 12:01:27 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220101110127.GE3390456@scaer>
References: <20211227124417.1509743-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211227124417.1509743-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/freeipmi: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2021-12-27 13:44 +0100, Fabrice Fontaine spake thusly:
> FreeIPMI provides in-band and out-of-band IPMI software based on the
> IPMI v1.5/2.0 specification.
> 
> The IPMI specification defines a set of interfaces for platform
> management and is implemented by a number vendors for system management.
> The features of IPMI that most users will be interested in are sensor
> monitoring, system event monitoring, power control, and serial-over-LAN
> (SOL).
> 
> https://www.gnu.org/software/freeipmi/
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[--SNIP--]
> diff --git a/package/freeipmi/0001-fix-build-on-musl.patch b/package/freeipmi/0001-fix-build-on-musl.patch
> new file mode 100644
> index 0000000000..0a570b8841
> --- /dev/null
> +++ b/package/freeipmi/0001-fix-build-on-musl.patch
> @@ -0,0 +1,49 @@
> +From 6295c96ae54cb16efe41e53f526a4dc19cd719f2 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Sat, 30 Oct 2021 00:26:40 +0200
> +Subject: [PATCH] fix build on musl
> +
> +musl doesn't provide getmsg or putmsg even if stropts.h is available
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Retrieved from:
> +https://github.com/chu11/freeipmi-mirror/commit/6295c96ae54cb16efe41e53f526a4dc19cd719f2]

I've changed that to point to the official git repository:
https://git.savannah.gnu.org/cgit/freeipmi.git/commit/?id=6295c96ae54cb16efe41e53f526a4dc19cd719f2

Applied to master, thanks.

Regards,
Yann E. MORIN.

> +---
> + configure.ac                            | 1 +
> + libfreeipmi/driver/ipmi-sunbmc-driver.c | 4 ++--
> + 2 files changed, 3 insertions(+), 2 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 562dd624e..711b27674 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -479,6 +479,7 @@ AC_CHECK_FUNCS([flockfile fputs_unlocked fwrite_unlocked])
> + AC_CHECK_FUNCS([iopl])
> + AC_CHECK_FUNCS([asprintf])
> + AC_CHECK_FUNCS([cbrt])
> ++AC_CHECK_FUNCS([getmsg putmsg])
> + 
> + dnl sighandler_t apparently not defined in Apple/OS X
> + AC_CHECK_TYPES([sighandler_t], [], [], [[#include <signal.h>]])
> +diff --git a/libfreeipmi/driver/ipmi-sunbmc-driver.c b/libfreeipmi/driver/ipmi-sunbmc-driver.c
> +index 05caca8b6..4ae8c5719 100644
> +--- a/libfreeipmi/driver/ipmi-sunbmc-driver.c
> ++++ b/libfreeipmi/driver/ipmi-sunbmc-driver.c
> +@@ -423,7 +423,7 @@ _sunbmc_write (ipmi_sunbmc_ctx_t ctx,
> +   assert (ctx->io_init);
> +   assert (ctx->putmsg_intf);
> + 
> +-#if defined(HAVE_SYS_STROPTS_H)
> ++#if defined(HAVE_SYS_STROPTS_H) && defined(HAVE_PUTMSG)
> +   memset (&sbuf, '\0', sizeof (struct strbuf));
> + 
> +   /* Due to API differences, we need to extract the cmd out of the
> +@@ -573,7 +573,7 @@ _sunbmc_read (ipmi_sunbmc_ctx_t ctx,
> +       return (-1);
> +     }
> + 
> +-#if defined(HAVE_SYS_STROPTS_H)
> ++#if defined(HAVE_SYS_STROPTS_H) && defined(HAVE_GETMSG)
> +   if (getmsg (ctx->device_fd, NULL, &sbuf, &flags) < 0)
> +     {
> +       SUNBMC_ERRNO_TO_SUNBMC_ERRNUM (ctx, errno);
> diff --git a/package/freeipmi/Config.in b/package/freeipmi/Config.in
> new file mode 100644
> index 0000000000..8ef2e137fa
> --- /dev/null
> +++ b/package/freeipmi/Config.in
> @@ -0,0 +1,20 @@
> +config BR2_PACKAGE_FREEIPMI
> +	bool "freeipmi"
> +	depends on BR2_USE_MMU # fork()
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL
> +	help
> +	  FreeIPMI provides in-band and out-of-band IPMI software based
> +	  on the IPMI v1.5/2.0 specification.
> +
> +	  The IPMI specification defines a set of interfaces for
> +	  platform management and is implemented by a number vendors
> +	  for system management. The features of IPMI that most users
> +	  will be interested in are sensor monitoring, system event
> +	  monitoring, power control, and serial-over-LAN (SOL).
> +
> +	  https://www.gnu.org/software/freeipmi/
> +
> +comment "freeipmi needs a toolchain w/ threads"
> +	depends on BR2_USE_MMU
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/freeipmi/freeipmi.hash b/package/freeipmi/freeipmi.hash
> new file mode 100644
> index 0000000000..f73b4a25fe
> --- /dev/null
> +++ b/package/freeipmi/freeipmi.hash
> @@ -0,0 +1,15 @@
> +# Locally computed:
> +sha256  4aa46a269ecc1bbff9412451f17b5408f64395e7dc45b713edf5eb5362700a71  freeipmi-1.6.8.tar.gz
> +sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
> +sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING.bmc-watchdog
> +sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING.ipmiconsole
> +sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING.ipmi-dcmi
> +sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING.ipmidetect
> +sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING.ipmi-fru
> +sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING.ipmimonitoring
> +sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING.ipmiping
> +sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING.ipmipower
> +sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING.ipmiseld
> +sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING.pstdout
> +sha256  48f44386b3f359e70d7e4a5d7f1d529d8591a7c64c47df3f4abdf2ad45a6d537  COPYING.sunbmc
> +sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING.ZRESEARCH
> diff --git a/package/freeipmi/freeipmi.mk b/package/freeipmi/freeipmi.mk
> new file mode 100644
> index 0000000000..b25ef0a4c6
> --- /dev/null
> +++ b/package/freeipmi/freeipmi.mk
> @@ -0,0 +1,35 @@
> +################################################################################
> +#
> +# freeipmi
> +#
> +################################################################################
> +
> +FREEIPMI_VERSION = 1.6.8
> +FREEIPMI_SITE = https://ftp.gnu.org/gnu/freeipmi
> +FREEIPMI_LICENSE = GPL-3.0+, BSD-like (sunbmc)
> +FREEIPMI_LICENSE_FILES = \
> +	COPYING COPYING.bmc-watchdog COPYING.ipmiconsole COPYING.ipmi-dcmi \
> +	COPYING.ipmidetect COPYING.ipmi-fru COPYING.ipmimonitoring \
> +	COPYING.ipmiping COPYING.ipmipower COPYING.ipmiseld COPYING.pstdout \
> +	COPYING.sunbmc COPYING.ZRESEARCH
> +FREEIPMI_DEPENDENCIES = host-pkgconf
> +FREEIPMI_INSTALL_STAGING = YES
> +# We're patching configure.ac
> +FREEIPMI_AUTORECONF = YES
> +# Disable checking for /dev/urandom and /dev/random through AC_CHECK_FILE
> +FREEIPMI_CONF_OPTS = --without-random-device
> +
> +# Work around for uClibc or musl toolchains which lack argp_*()
> +# functions.
> +ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
> +FREEIPMI_DEPENDENCIES += argp-standalone
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
> +FREEIPMI_CONF_OPTS += --with-encryption
> +FREEIPMI_DEPENDENCIES += libgcrypt
> +else
> +FREEIPMI_CONF_OPTS += --without-encryption
> +endif
> +
> +$(eval $(autotools-package))
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
