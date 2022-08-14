Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CBE2C25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 15:58:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EAB7060D5F;
	Sun, 14 Aug 2022 15:58:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EAB7060D5F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id grvcztgBiNSY; Sun, 14 Aug 2022 15:58:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9BCC60BE2;
	Sun, 14 Aug 2022 15:58:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D9BCC60BE2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8119E1BF422
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 15:58:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 68ACD60BE2
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 15:58:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 68ACD60BE2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Eo0NjbitKAXZ for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 15:58:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0940460BC6
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0940460BC6
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 15:58:44 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4cac:4fa9:6c11:832f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id D361A6012F;
 Sun, 14 Aug 2022 17:58:38 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 14 Aug 2022 17:58:38 +0200
Date: Sun, 14 Aug 2022 17:58:38 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220814155838.GK2775145@scaer>
References: <20220813083521.1382565-1-thomas.petazzoni@bootlin.com>
 <20220813083521.1382565-3-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220813083521.1382565-3-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1660492722;
 bh=IwVOsidMdXKDUFhyya+xLW8RhVtTDd6+8ST+pb53gOc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NC1lvCtd7sJu4t4gcVVIPb30tS6ZAw6UZcD/mQSPRtJANCbY/dWvI29WdDLf3poNA
 kljP4Egq1dztDIjBlMryKw3ybicCq6/0AwuCdCnFMqOGsaKAUt0DuL/t+SDAASBHbW
 9cCJ6bjRQCFOIPs6irJEudRl8knlVy6nqyIBql8x32/mhqgRRYCn8ECsZ/TX8ShasN
 6UxXGajvxl/3yt6H50GRum4BMKH5yDZbwFFZb0iObiWFyepe/xPiAgur5NII3ywNdV
 JmuYJ0XxTw0oaQHCjtNzrPgLgrJ+bWpbwHUP+AdTZ3DvKZgoQHQgA9WF8FqALPursd
 BLQvQxEaUeJ1g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=NC1lvCtd
Subject: Re: [Buildroot] [PATCH 3/4] package/gdb: switch to GDB 11.x as the
 default version
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
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2022-08-13 10:35 +0200, Thomas Petazzoni via buildroot spake thusly:
> Now that GDB 12.x has been added, and GDB 9.x removed, we can make GDB
> 11.x the default version.
> 
> The handling of the GMP dependency needs a bit of change. Until now,
> the GMP dependency was needed when building full GDB (host or target)
> in version 11.x or 12.x, so we were explicitly checking whether those
> versions were enabled.
> 
> Now that only GDB 10.x and the ARC-specific version of GDB are the
> only remaining ones not needing GDB, we invert the logic: only those
                                 ,^^^
GMP ----------------------------'

> two versions do not trigger the addition of the GMP dependency.

I agree that we can invert the logic now, to simplify things later when
we eventually drop the older versions, but I fail to see how this is
related to changing the default version of gdb.

I've split the two changes into separate patches, fixed the typo, and
applied to next, thanks.

Regards,
Yann E. MORIN.

> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/gdb/Config.in      |  3 +--
>  package/gdb/Config.in.host |  6 +++---
>  package/gdb/gdb.mk         | 14 +++++++-------
>  3 files changed, 11 insertions(+), 12 deletions(-)
> 
> diff --git a/package/gdb/Config.in b/package/gdb/Config.in
> index c50c3d517a..273b3072ae 100644
> --- a/package/gdb/Config.in
> +++ b/package/gdb/Config.in
> @@ -51,8 +51,7 @@ config BR2_PACKAGE_GDB_DEBUGGER
>  	bool "full debugger"
>  	depends on BR2_USE_WCHAR
>  	depends on !BR2_sh
> -	select BR2_PACKAGE_GMP if BR2_GDB_VERSION_11
> -	select BR2_PACKAGE_GMP if BR2_GDB_VERSION_12
> +	select BR2_PACKAGE_GMP if !BR2_GDB_VERSION_10 && !BR2_arc
>  	select BR2_PACKAGE_NCURSES
>  
>  comment "full gdb on target needs a toolchain w/ wchar"
> diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
> index 9876c4e8bc..33ffc632ee 100644
> --- a/package/gdb/Config.in.host
> +++ b/package/gdb/Config.in.host
> @@ -41,7 +41,7 @@ config BR2_PACKAGE_HOST_GDB_SIM
>  
>  choice
>  	prompt "GDB debugger Version"
> -	default BR2_GDB_VERSION_10
> +	default BR2_GDB_VERSION_11
>  	depends on !BR2_arc
>  	help
>  	  Select the version of gdb you wish to use.
> @@ -63,8 +63,8 @@ endif
>  config BR2_GDB_VERSION
>  	string
>  	default "arc-2020.09-release-gdb" if BR2_arc
> -	default "10.2"	   if BR2_GDB_VERSION_10 || !BR2_PACKAGE_HOST_GDB
> -	default "11.2"     if BR2_GDB_VERSION_11
> +	default "10.2"	   if BR2_GDB_VERSION_10
> +	default "11.2"     if BR2_GDB_VERSION_11 || !BR2_PACKAGE_HOST_GDB
>  	default "12.1"     if BR2_GDB_VERSION_12
>  	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_HOST_GDB
>  
> diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
> index dd126b42ce..d2bbfcb290 100644
> --- a/package/gdb/gdb.mk
> +++ b/package/gdb/gdb.mk
> @@ -65,8 +65,9 @@ GDB_DEPENDENCIES += host-flex host-bison
>  HOST_GDB_DEPENDENCIES += host-flex host-bison
>  endif
>  
> -# Add the necessary host-gmp dependency for the newer releases of GDB
> -ifeq ($(BR2_GDB_VERSION_11)$(BR2_GDB_VERSION_12),y)
> +# All newer versions of GDB need host-gmp, so it's only for older
> +# versions that the dependency can be avoided.
> +ifeq ($(BR2_GDB_VERSION_10)$(BR2_arc),)
>  HOST_GDB_DEPENDENCIES += host-gmp
>  endif
>  
> @@ -154,11 +155,10 @@ GDB_CONF_OPTS += \
>  	--without-curses
>  endif
>  
> -# When GDB >= 11.x (because it's enabled for the host) and we're
> -# building the full gdb for the target, we need gmp as a
> -# dependency. For now the default gdb version in Buildroot doesn't
> -# require gmp.
> -ifeq ($(BR2_GDB_VERSION_11)$(BR2_GDB_VERSION_12):$(BR2_PACKAGE_GDB_DEBUGGER),y:y)
> +# Starting from GDB 11.x, gmp is needed as a dependency to build full
> +# gdb. So we avoid the dependency only for GDB 10.x and the special
> +# version used on ARC.
> +ifeq ($(BR2_GDB_VERSION_10)$(BR2_arc):$(BR2_PACKAGE_GDB_DEBUGGER),:y)
>  GDB_CONF_OPTS += \
>  	--with-libgmp-prefix=$(STAGING_DIR)/usr
>  GDB_DEPENDENCIES += gmp
> -- 
> 2.37.1
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
