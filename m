Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D757C61DA4
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 11:22:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 342B9416F9;
	Mon,  6 Feb 2023 11:22:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 342B9416F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1XZdu-YBg2wk; Mon,  6 Feb 2023 11:22:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0E9B4156C;
	Mon,  6 Feb 2023 11:22:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0E9B4156C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 17CD61BF397
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 11:22:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DEF5560A8C
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 11:22:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DEF5560A8C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UrtlSPfGcBFq for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 11:22:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 76379605AF
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 76379605AF
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 11:22:02 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [85.119.216.19])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 7F8D813F88E;
 Mon,  6 Feb 2023 12:21:56 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 06 Feb 2023 12:21:56 +0100
Date: Mon, 6 Feb 2023 12:21:56 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Petr Vorel <pevik@seznam.cz>
Message-ID: <20230206112156.GC3565@scaer>
References: <20221126003807.462157-1-pevik@seznam.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221126003807.462157-1-pevik@seznam.cz>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1675682519;
 bh=LfqIOPgS9Ove+oVHV1k2sCmVHAg8z2C0t7/EoOqC2Lg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=F5KNBnEmQbf9zuUZSIgT2iOGCdy+QWuTjbjHEisJn+PT/twlM27GQ+vbtKDyJZaG1
 j8mqlrwHNvlh8+7xDFLF98SamY2IbvfPuDCzU07OMNM1bdkJ27WPfXA+6tTDFFw0cg
 zC1afD5kAQgaBKlLdOsUxCjJ/m31WEw0pxWN4O7LPy34YiVvk9jzf4RRwAelHFSxHR
 iyvH7xGOe/s3gY6Md+lGx5W43igMtgIvxRgjNYBDP9K8JOr2rLnCJW+0c6J/D+BP6A
 m79g5HFTYiHFeFnHpNrgdXfuKTY5Sn6Y0UuDL58pwG9fhSZGPQ0TFw3hh7w5s2WB/l
 AMGxXBmuXLmnQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=F5KNBnEm
Subject: Re: [Buildroot] [PATCH 1/1] package/iputils: bump version to
 20221126
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
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Petr, All,

On 2022-11-26 01:38 +0100, Petr Vorel spake thusly:
> From: Petr Vorel <petr.vorel@gmail.com>
> 
> This release removed: ninfod, rarpd, rdisc
> => add entries to Config.in.legacy.
> 
> LICENSE file got updated (just to use SPDX)
> => update checksum.
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  Config.in.legacy             | 24 ++++++++++++++++++++++++
>  package/iputils/Config.in    | 25 -------------------------
>  package/iputils/iputils.hash |  6 +++---
>  package/iputils/iputils.mk   |  9 ++-------
>  4 files changed, 29 insertions(+), 35 deletions(-)
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index b3c35d6b07..6d20092ca4 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,6 +146,30 @@ endif
>  
>  comment "Legacy options removed in 2022.11"
>  
> +config BR2_PACKAGE_IPUTILS_NINFOD
> +	bool "iputils 20221126 removed ninfod"
> +	select BR2_LEGACY
> +	help
> +	  iputils 20221126 removed ninfod.
> +
> +config BR2_PACKAGE_IPUTILS_RARPD
> +	bool "iputils 20221126 removed rarpd"
> +	select BR2_LEGACY
> +	help
> +	  iputils 20221126 removed rarpd.
> +
> +config BR2_PACKAGE_IPUTILS_RDISC
> +	bool "iputils 20221126 removed rdisc"
> +	select BR2_LEGACY
> +	help
> +	  iputils 20221126 removed rdisc.
> +
> +config BR2_PACKAGE_IPUTILS_RDISC_SERVER
> +	bool "iputils 20221126 removed rdisc"
> +	select BR2_LEGACY
> +	help
> +	  iputils 20221126 removed rdisc.
> +
>  config BR2_PACKAGE_LIBOPENSSL_ENABLE_RC5
>  	bool "libopenssl rc5 was never enabled"
>  	select BR2_LEGACY
> diff --git a/package/iputils/Config.in b/package/iputils/Config.in
> index 1a8b555570..ec7bc5418d 100644
> --- a/package/iputils/Config.in
> +++ b/package/iputils/Config.in
> @@ -28,37 +28,12 @@ config BR2_PACKAGE_IPUTILS_PING
>  	help
>  	  Installs ping.
>  
> -config BR2_PACKAGE_IPUTILS_RARPD
> -	bool "rarpd"
> -	help
> -	  Installs rarpd.
> -
> -config BR2_PACKAGE_IPUTILS_RDISC
> -	bool "rdisc"
> -	default y
> -	help
> -	  Installs rdisc.
> -
> -config BR2_PACKAGE_IPUTILS_RDISC_SERVER
> -	bool "rdisc (server code)"
> -	default y
> -	depends on BR2_PACKAGE_IPUTILS_RDISC
> -	help
> -	  Builds rdisc with server code.
> -
>  config BR2_PACKAGE_IPUTILS_TRACEPATH
>  	bool "tracepath"
>  	default y
>  	help
>  	  Installs tracepath.
>  
> -config BR2_PACKAGE_IPUTILS_NINFOD
> -	bool "ninfod"
> -	default y
> -	depends on BR2_TOOLCHAIN_HAS_THREADS # ninfod requires <pthread.h>
> -	help
> -	  Installs ninfod.
> -
>  comment "ninfod needs a toolchain w/ threads"
>  	depends on !BR2_TOOLCHAIN_HAS_THREADS
>  
> diff --git a/package/iputils/iputils.hash b/package/iputils/iputils.hash
> index db52d990f2..ea23f27f3c 100644
> --- a/package/iputils/iputils.hash
> +++ b/package/iputils/iputils.hash
> @@ -1,6 +1,6 @@
> -# https://github.com/iputils/iputils/releases/download/20211215/sha256sum.asc
> -sha256  b6f67fc705490673ff4471d006221b4a2f1b1180b929d9fefd771352621ccedf  iputils-20211215.tar.gz
> +# https://github.com/iputils/iputils/releases/download/20221126/sha256sum.asc
> +sha256  745ea711fe06d5c57d470d21acce3c3ab866eb6afb69379a16c6d60b89bd4311  iputils-20221126.tar.gz
>  # Locally computed
> -sha256  973281334c2da6364fa6bdc44c1f0f8d60d80d73c782982ffc5d53b0a31aa042  LICENSE
> +sha256  2c9f29d982c48665c30b3adaf400c048988fd256eb91c691e351eb3b6a8b2036  LICENSE
>  sha256  9acc4bc871a4742550158e3696dcb381953172ef808d04ca248184f9f6322712  Documentation/LICENSE.BSD3
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  Documentation/LICENSE.GPL2
> diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
> index 84059de330..fe4468ec19 100644
> --- a/package/iputils/iputils.mk
> +++ b/package/iputils/iputils.mk
> @@ -11,7 +11,7 @@
>  # and IPv6 updates.
>  # http://www.spinics.net/lists/netdev/msg279881.html
>  
> -IPUTILS_VERSION = 20211215
> +IPUTILS_VERSION = 20221126
>  IPUTILS_SITE = $(call github,iputils,iputils,$(IPUTILS_VERSION))
>  IPUTILS_LICENSE = GPL-2.0+, BSD-3-Clause
>  IPUTILS_LICENSE_FILES = LICENSE Documentation/LICENSE.BSD3 Documentation/LICENSE.GPL2
> @@ -21,19 +21,14 @@ IPUTILS_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
>  # Selectively build binaries
>  IPUTILS_CONF_OPTS += \
>  	-DBUILD_CLOCKDIFF=$(if $(BR2_PACKAGE_IPUTILS_CLOCKDIFF),true,false) \
> -	-DBUILD_RARPD=$(if $(BR2_PACKAGE_IPUTILS_RARPD),true,false) \
> -	-DBUILD_RDISC=$(if $(BR2_PACKAGE_IPUTILS_RDISC),true,false) \
> -	-DENABLE_RDISC_SERVER=$(if $(BR2_PACKAGE_IPUTILS_RDISC_SERVER),true,false) \
>  	-DBUILD_TRACEPATH=$(if $(BR2_PACKAGE_IPUTILS_TRACEPATH),true,false) \
> -	-DBUILD_NINFOD=$(if $(BR2_PACKAGE_IPUTILS_NINFOD),true,false) \
>  	-DSKIP_TESTS=true
>  
>  # Selectively select the appropriate SELinux refpolicy modules
>  IPUTILS_SELINUX_MODULES = \
>  	$(if $(BR2_PACKAGE_IPUTILS_ARPING),netutils) \
>  	$(if $(BR2_PACKAGE_IPUTILS_PING),netutils) \
> -	$(if $(BR2_PACKAGE_IPUTILS_TRACEPATH),netutils) \
> -	$(if $(BR2_PACKAGE_IPUTILS_RDISC),rdisc)
> +	$(if $(BR2_PACKAGE_IPUTILS_TRACEPATH),netutils)
>  
>  #
>  # arping
> -- 
> 2.38.1
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
