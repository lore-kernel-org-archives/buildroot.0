Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AF88C46CD2
	for <buildroot@archiver.kernel.org>; Sat, 27 Jan 2024 17:18:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A16DD40998;
	Sat, 27 Jan 2024 17:18:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A16DD40998
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vetVee_3I9el; Sat, 27 Jan 2024 17:18:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3B7940A01;
	Sat, 27 Jan 2024 17:18:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B3B7940A01
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 07B321BF2E3
 for <buildroot@lists.busybox.net>; Sat, 27 Jan 2024 17:18:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D3833401F1
 for <buildroot@lists.busybox.net>; Sat, 27 Jan 2024 17:18:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D3833401F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z93hQNhY8MpH for <buildroot@lists.busybox.net>;
 Sat, 27 Jan 2024 17:18:46 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 55C37401A1
 for <buildroot@buildroot.org>; Sat, 27 Jan 2024 17:18:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 55C37401A1
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 906F813F8B9;
 Sat, 27 Jan 2024 18:18:42 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 27 Jan 2024 18:18:42 +0100
Date: Sat, 27 Jan 2024 18:18:42 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Joachim Wiberg <troglobit@gmail.com>
Message-ID: <ZbU68sY6d4uvT-M0@landeda>
References: <20240115074112.157216-1-troglobit@gmail.com>
 <20240115074112.157216-3-troglobit@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240115074112.157216-3-troglobit@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1706375924;
 bh=pQJsakcSA8JSVlSMuwpla5T6xrf2M2HEHIB+N5lWqv4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rlc9SWiOHGq3deu2XTbFQkGjiSjfmjpMpEQdLtF6UeEReJeVIfqabbc87AKpWubF+
 4ORR6HLHxmUQgVLGtr7a28iPNFCXaUGaJzdDmhmNMQKisX9tRJmCKzgyat3YimliQ/
 xOjd3yaMCVOWwlL0LCiwEFzuwubFhIoPuf/pkVXYMKA/OxlsxENzT3nyNxEVs4FVUz
 OdUqdAlo4jpnV5OYkT0Tq32RY8G66oOoqCwmlUTvJRhYHSS3mIWJ8PRTtVQczl/Hv0
 OFewFuiAPYGwBxRwPeuQNyZtV3MmgpUKLcHFn11sfFmroSfkSMl5qMXc5quOn5Nkkh
 x9ogORz8n0t8A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=rlc9SWiO
Subject: Re: [Buildroot] [PATCH 2/3] package/watchdogd: convert Config.in
 options, int -> bool
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

On 2024-01-15 08:41 +0100, Joachim Wiberg spake thusly:
> Enabling the optional system monitor plugins have changed syntax
> upstream.  The `--with-foo=SECONDS` is now `--with-foo`.
> 
> This patch converts the menuconfig options from int to bool by renaming
> the config options and adding legacy option conversion support.

This change should be done as part of the version bump. Indeed, if the
version bump was applied but not this path (see below why), the .mk
would not set the proper options at build time.

So this really belongs to the version bump, and I was about to merge the
two together, when...

    $ make check-package
    package/watchdogd/Config.in:32: BR2_PACKAGE_WATCHDOGD_GENERIC_POLL referenced but not defined
    package/watchdogd/Config.in:38: BR2_PACKAGE_WATCHDOGD_LOADAVG_POLL referenced but not defined
    package/watchdogd/Config.in:44: BR2_PACKAGE_WATCHDOGD_FILENR_POLL referenced but not defined
    package/watchdogd/Config.in:50: BR2_PACKAGE_WATCHDOGD_MEMINFO_POLL referenced but not defined

...

> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
> ---
>  package/watchdogd/Config.in    | 36 +++++++++++++++-------------------
>  package/watchdogd/watchdogd.mk | 17 ++++++++--------
>  2 files changed, 25 insertions(+), 28 deletions(-)
> 
> diff --git a/package/watchdogd/Config.in b/package/watchdogd/Config.in
> index ca5933848d..db1bee94c2 100644
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
> +	default y if BR2_PACKAGE_WATCHDOGD_GENERIC_POLL != 0 # legacy

... Indeed BR2_PACKAGE_WATCHDOGD_GENERIC_POLL is the old config option
name. but it is now defined nowhere.

When we want to handle legacy symbols, we add the old symbols to the
top-level Config.in.legacy file. For boolweans, it is trivial, but for
int (or strings) we need a little trick, like (adapt the help text as
appropriate, I'm mostly making the reason up):

    Config.in.legacy:

    config BR2_PACKAGE_WATCHDOGD_GENERIC_POLL
        int
        default 0
        help
          The BR2_PACKAGE_WATCHDOGD_GENERIC_POLL value is now runtime
          configurable, and only the generic feature is configurable
          with BR2_PACKAGE_WATCHDOGD_GENERIC.

    config BR2_PACKAGE_WATCHDOGD_GENERIC_POLL_WRAP
        bool
        default y if BR2_PACKAGE_WATCHDOGD_GENERIC_POLL != 0
        select BR2_LEGACY

And then in the package Config.in, what you did is OK.

Care to fix up, squash patches 1 and 2, and respin, please?

Regards,
Yann E. MORIN.

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
> +	default y if BR2_PACKAGE_WATCHDOGD_LOADAVG_POLL != 0 # legacy
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
> +	default y if BR2_PACKAGE_WATCHDOGD_FILENR_POLL != 0 # legacy
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
> +	default y if BR2_PACKAGE_WATCHDOGD_MEMINFO_POLL != 0 # legacy
>  	help
> -	  Poll interval for memory leak monitor, in seconds.  A value of
> -	  zero (0) disables the monitor.
> +	  Enable memory leak monitor.
>  
>  endif
> diff --git a/package/watchdogd/watchdogd.mk b/package/watchdogd/watchdogd.mk
> index d140039540..9af71dbfaa 100644
> --- a/package/watchdogd/watchdogd.mk
> +++ b/package/watchdogd/watchdogd.mk
> @@ -20,28 +20,29 @@ else
>  WATCHDOGD_CONF_OPTS += --enable-builtin-tests
>  endif
>  
> -ifeq ($(BR2_PACKAGE_WATCHDOGD_GENERIC_POLL),0)
> +ifeq ($(BR2_PACKAGE_WATCHDOGD_GENERIC),y)
>  WATCHDOGD_CONF_OPTS += --without-generic
>  else
> -WATCHDOGD_CONF_OPTS += --with-generic=$(BR2_PACKAGE_WATCHDOGD_GENERIC_POLL)
> +WATCHDOGD_CONF_OPTS += --with-generic
>  endif
>  
> -ifeq ($(BR2_PACKAGE_WATCHDOGD_LOADAVG_POLL),0)
> +ifeq ($(BR2_PACKAGE_WATCHDOGD_LOADAVG),y)
>  WATCHDOGD_CONF_OPTS += --without-loadavg
>  else
> -WATCHDOGD_CONF_OPTS += --with-loadavg=$(BR2_PACKAGE_WATCHDOGD_LOADAVG_POLL)
> +WATCHDOGD_CONF_OPTS += --with-loadavg
>  endif
>  
> -ifeq ($(BR2_PACKAGE_WATCHDOGD_FILENR_POLL),0)
> +ifeq ($(BR2_PACKAGE_WATCHDOGD_FILENR),y)
>  WATCHDOGD_CONF_OPTS += --without-filenr
>  else
> -WATCHDOGD_CONF_OPTS += --with-filenr=$(BR2_PACKAGE_WATCHDOGD_FILENR_POLL)
> +WATCHDOGD_CONF_OPTS += --with-filenr
>  endif
>  
> -ifeq ($(BR2_PACKAGE_WATCHDOGD_MEMINFO_POLL),0)
> +ifeq ($(BR2_PACKAGE_WATCHDOGD_MEMINFO),y)
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
