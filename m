Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E32EFC4829A
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 22:20:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C8A5418A3;
	Mon,  5 Feb 2024 22:20:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C8A5418A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4K1KQH8kMHw8; Mon,  5 Feb 2024 22:20:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9DFF418AC;
	Mon,  5 Feb 2024 22:20:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9DFF418AC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C462C1BF319
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 22:20:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9C65840198
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 22:20:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C65840198
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ns0mMCM-EXkQ for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 22:20:53 +0000 (UTC)
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0E8A540022
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 22:20:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E8A540022
Received: from ymorin.is-a-geek.org (unknown [194.78.211.220])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id BDD1319F741;
 Mon,  5 Feb 2024 23:20:48 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 05 Feb 2024 23:20:46 +0100
Date: Mon, 5 Feb 2024 23:20:46 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Joachim Wiberg <troglobit@gmail.com>
Message-ID: <ZcFfPoK1A5m53B5B@landeda>
References: <20240130215628.884512-1-troglobit@gmail.com>
 <20240130215628.884512-2-troglobit@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240130215628.884512-2-troglobit@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707171651;
 bh=6iopw7fpmN0fBZRizCOkYRa1Xg8/G09OG2eOWnt7gkk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cOcMPaOLqQrFv5fM9UHuQwVqkLYe8nG9a3brWaRa/dbtNY9IBPiLOr9Cin6UiSLDn
 UJSTdeOeUab/Lcv966tznZBGzWmkG5Tq/JsT2EBCQUbjfIoQgPkWlvIEtdkURVwBMU
 c9ATPz5+EhrTtXYfWKTgAcJ0uX0fKOrOmCr59dHn/d2XWmbbvpvo1dIP7V6zQnYvjm
 k7kl/K07oAHYNfgQT/H1pG7nCpRvuCcbmVhu0yQbDkUvfIOEToWIJjd3D0FP6dYsdE
 vM6/mCbXa10HhaF1yjU3e4SKtcw+mJk4CBk19QSc0rEbqAXtmx/bVV+QuP4vdLAtj6
 73XFVu7MALulw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=cOcMPaOL
Subject: Re: [Buildroot] [PATCH v2 1/2] package/watchdogd: bump to version
 4.0
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

Joachim, All,

On 2024-01-30 22:56 +0100, Joachim Wiberg spake thusly:
> For details, see https://github.com/troglobit/watchdogd/releases/tag/4.0
> 
>  - Major feature upgrade, command line and .conf files compatible
>  - LICENSE hash update due to update in copyright years
>  - Enabling system monitor plugins have changed syntax upstream.  The
>    `--with-foo=SECONDS` is now just `--with-foo`
> 
> This last upstream change require converting affected Config.in options
> from int -> bool.  Legacy _WRAP:ers have been added to Config.legacy.in,
> modeled on BR2_TARGET_ROOTFS_EXT2_BLOCKS.
> 
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
> ---
[--SNIP--]
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 82387338d9..b6e72d0f24 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -202,6 +202,64 @@ config BR2_KERNEL_HEADERS_6_5
>  	  Version 6.5.x of the Linux kernel headers are no longer
>  	  maintained upstream and are now removed.
>  
> +config BR2_PACKAGE_WATCHDOGD_GENERIC_POLL
> +	int "watchdogd generic poll has been replaced"
> +	default 0
> +	help
> +	  The generic script poll interval has been replaced upstream
> +	  with a boolean on/off.  Your configuration has been migrated.
> +
> +	  Set this legacy option to 0 here to remove the warning.
[--SNIP--]
> +# Note: BR2_PACKAGE_WATCHDOGD_*_POLL still referenced in package/watchdogd/Config.in

This comment is wrong: it's the _WRAP options that are referenced. So I
changed it. I also duplicated right above each such option so it's
easier to spot rather than a lone comment way below (I know you did like
the existing ext legacy, but that does not prevent improving! ;-) ).

Applied to master, thanks.

Regards,
Yann E. MORIN.

>  comment "Legacy options removed in 2023.11"
>  
>  config BR2_PACKAGE_PYTHON_PYXB
> diff --git a/package/watchdogd/Config.in b/package/watchdogd/Config.in
> index ca5933848d..0b0480ea27 100644
> --- a/package/watchdogd/Config.in
> +++ b/package/watchdogd/Config.in
> @@ -27,32 +27,28 @@ config BR2_PACKAGE_WATCHDOGD_TEST_SUITE
>  	  They can be used to verify correct operation of watchdogd and
>  	  the kernel watchdog driver.
>  
> -config BR2_PACKAGE_WATCHDOGD_GENERIC_POLL
> -	int "Generic script monitor poll interval (sec)"
> -	default "300"
> +config BR2_PACKAGE_WATCHDOGD_GENERIC
> +	bool "Generic script monitor"
> +	default y if BR2_PACKAGE_WATCHDOGD_GENERIC_POLL_WRAP # legacy 2024.02
>  	help
> -	  Poll interval for generic script monitor, in seconds.  A value
> -	  of zero (0) disables the monitor.
> +	  Enable generic script monitor.
>  
> -config BR2_PACKAGE_WATCHDOGD_LOADAVG_POLL
> -	int "CPU load average monitor poll interval (sec)"
> -	default "300"
> +config BR2_PACKAGE_WATCHDOGD_LOADAVG
> +	bool "CPU load average monitor"
> +	default y if BR2_PACKAGE_WATCHDOGD_LOADAVG_POLL_WRAP # legacy 2024.02
>  	help
> -	  Poll interval for CPU load average monitor, in seconds.  A
> -	  value of zero (0) disables the monitor.
> +	  Enable CPU load average monitor.
>  
> -config BR2_PACKAGE_WATCHDOGD_FILENR_POLL
> -	int "File descriptor leak monitor poll interval (sec)"
> -	default "300"
> +config BR2_PACKAGE_WATCHDOGD_FILENR
> +	bool "File descriptor leak monitor"
> +	default y if BR2_PACKAGE_WATCHDOGD_FILENR_POLL_WRAP # legacy 2024.02
>  	help
> -	  Poll interval for file descriptor leak monitor, in seconds.  A
> -	  value of zero (0) disables the monitor.
> +	  Enable file descriptor leak monitor.
>  
> -config BR2_PACKAGE_WATCHDOGD_MEMINFO_POLL
> -	int "Memory leak monitor poll interval (sec)"
> -	default "300"
> +config BR2_PACKAGE_WATCHDOGD_MEMINFO
> +	bool "Memory leak monitor"
> +	default y if BR2_PACKAGE_WATCHDOGD_MEMINFO_POLL_WRAP # legacy 2024.02
>  	help
> -	  Poll interval for memory leak monitor, in seconds.  A value of
> -	  zero (0) disables the monitor.
> +	  Enable memory leak monitor.
>  
>  endif
> diff --git a/package/watchdogd/watchdogd.hash b/package/watchdogd/watchdogd.hash
> index 4ff1a3485b..0c228666bd 100644
> --- a/package/watchdogd/watchdogd.hash
> +++ b/package/watchdogd/watchdogd.hash
> @@ -1,5 +1,5 @@
>  # Upstream .sha256 from GitHub
> -sha256  33ec4edc8cb4ada7a4d8324a27d897d33aae5e83257ed64d3d37508825c11237  watchdogd-3.5.tar.gz
> +sha256  7f38bc691353a51fc6feb2ccab60417c0284dd3f4d55c50d8b1781fda70d8101  watchdogd-4.0.tar.gz
>  
>  # Locally calculated
> -sha256  fd685e20931174308c45a26418a7ce34d66704c4e4b92ab1d8299deb255cd676  LICENSE
> +sha256  e233c56d807c74c67f2eff47ad03c216144cdd374d8d7578b996c28c260eadda  LICENSE
> diff --git a/package/watchdogd/watchdogd.mk b/package/watchdogd/watchdogd.mk
> index ea033b4e71..2e67c2847e 100644
> --- a/package/watchdogd/watchdogd.mk
> +++ b/package/watchdogd/watchdogd.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -WATCHDOGD_VERSION = 3.5
> +WATCHDOGD_VERSION = 4.0
>  WATCHDOGD_SITE = https://github.com/troglobit/watchdogd/releases/download/$(WATCHDOGD_VERSION)
>  WATCHDOGD_LICENSE = ISC
>  WATCHDOGD_LICENSE_FILES = LICENSE
> @@ -20,28 +20,29 @@ else
>  WATCHDOGD_CONF_OPTS += --enable-builtin-tests
>  endif
>  
> -ifeq ($(BR2_PACKAGE_WATCHDOGD_GENERIC_POLL),0)
> +ifneq ($(BR2_PACKAGE_WATCHDOGD_GENERIC),y)
>  WATCHDOGD_CONF_OPTS += --without-generic
>  else
> -WATCHDOGD_CONF_OPTS += --with-generic=$(BR2_PACKAGE_WATCHDOGD_GENERIC_POLL)
> +WATCHDOGD_CONF_OPTS += --with-generic
>  endif
>  
> -ifeq ($(BR2_PACKAGE_WATCHDOGD_LOADAVG_POLL),0)
> +ifneq ($(BR2_PACKAGE_WATCHDOGD_LOADAVG),y)
>  WATCHDOGD_CONF_OPTS += --without-loadavg
>  else
> -WATCHDOGD_CONF_OPTS += --with-loadavg=$(BR2_PACKAGE_WATCHDOGD_LOADAVG_POLL)
> +WATCHDOGD_CONF_OPTS += --with-loadavg
>  endif
>  
> -ifeq ($(BR2_PACKAGE_WATCHDOGD_FILENR_POLL),0)
> +ifneq ($(BR2_PACKAGE_WATCHDOGD_FILENR),y)
>  WATCHDOGD_CONF_OPTS += --without-filenr
>  else
> -WATCHDOGD_CONF_OPTS += --with-filenr=$(BR2_PACKAGE_WATCHDOGD_FILENR_POLL)
> +WATCHDOGD_CONF_OPTS += --with-filenr
>  endif
>  
> -ifeq ($(BR2_PACKAGE_WATCHDOGD_MEMINFO_POLL),0)
> +ifneq ($(BR2_PACKAGE_WATCHDOGD_MEMINFO),y)
>  WATCHDOGD_CONF_OPTS += --without-meminfo
>  else
> -WATCHDOGD_CONF_OPTS += --with-meminfo=$(BR2_PACKAGE_WATCHDOGD_MEMINFO_POLL)
> +WATCHDOGD_CONF_OPTS += --with-meminfo
> +endif
>  endif
>  
>  define WATCHDOGD_INSTALL_INIT_SYSV
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
