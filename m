Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CD00C001DE
	for <buildroot@archiver.kernel.org>; Sun, 23 Jul 2023 14:19:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C63A081858;
	Sun, 23 Jul 2023 14:19:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C63A081858
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t--rOqs1MC67; Sun, 23 Jul 2023 14:19:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E5E47817EB;
	Sun, 23 Jul 2023 14:19:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5E47817EB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B8F3E1BF3EB
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 14:19:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F98340151
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 14:19:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F98340151
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D_AyOmZtTt3b for <buildroot@lists.busybox.net>;
 Sun, 23 Jul 2023 14:19:23 +0000 (UTC)
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AF8D0400A6
 for <buildroot@buildroot.org>; Sun, 23 Jul 2023 14:19:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF8D0400A6
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:46bc:e175:93d0:2fb4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 9B6595FF9A;
 Sun, 23 Jul 2023 16:19:18 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 23 Jul 2023 16:19:18 +0200
Date: Sun, 23 Jul 2023 16:19:18 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230723141918.GE2503916@scaer>
References: <20230723083152.3147145-1-bernd@kuhls.net>
 <20230723083152.3147145-2-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230723083152.3147145-2-bernd@kuhls.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1690121960;
 bh=NS2Mk9KOUnaEX1BjdonJxngupSRZzIrxTQCgFWTKzbs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=A8Uxc4Je8e0Cs/E43v/WPYlV2s8PNKXU1T7FW/TM+9Q1HNa/5COm9lnoqiwbJKabd
 03AQaG8O9SQ0sb5qQvjKZnBaF7Dnh1DyJ97StnGY9vQWm3GHdfoXSP+6y2k4lwk7Q4
 TfFOLnGq11pWDvgFFKt5K6CjzBFv2AmIlGAVYJdOXP84pyZSsW97zVnnlCwQqwUCeA
 rWaimCjj5RAyZMniZrA1tUczsgiow/GG9as7AaEibLR3tuEMLU4gSBRykLtsLQo9aZ
 C06WU9g/+zlkvnhyiJ6pK5NGC4twN532zA7vnXLhvD4Nec73QOXkGwyx2xEGBD4y6T
 bTc43vPbMffMQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=A8Uxc4Je
Subject: Re: [Buildroot] [PATCH v2 2/2] package/transmission: fix gtk
 dependencies
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

Bernd, All,

On 2023-07-23 10:31 +0200, Bernd Kuhls spake thusly:
> Buildroot commit 80793107a65d95f8dfd0317a726d3a737c78ef67 forgot to add
> packages needed for gtk support:
> https://github.com/transmission/transmission/blob/main/CMakeLists.txt#L40
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
> v2: removed unneeded glibmm, added gtkmm3 dependencies (Thomas)
> 
>  package/transmission/Config.in       | 8 +++++++-
>  package/transmission/transmission.mk | 2 +-
>  2 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/package/transmission/Config.in b/package/transmission/Config.in
> index fd4c897497..7ac18ae6d9 100644
> --- a/package/transmission/Config.in
> +++ b/package/transmission/Config.in
> @@ -37,11 +37,17 @@ config BR2_PACKAGE_TRANSMISSION_DAEMON
>  
>  config BR2_PACKAGE_TRANSMISSION_GTK
>  	bool "transmission-gtk"
> +	depends on !BR2_nios2 # gtkmm3
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pangomm, libgtk3 -> pango -> harfbuzz -> gtkmm3
> +	depends on BR2_INSTALL_LIBSTDCPP # glibmm, libpangomm -> glibmm/pango -> gtkmm3
> +	depends on BR2_USE_WCHAR # *mm/libgtk3 -> libglib2 -> gtkmm3

C++ and xide-char are alrady dependencies of transmission, so no need to
replicate them here (yeah, the rule is fuzzy and unwritten, and there is
historical baggage where they are replicated).

>  	depends on BR2_PACKAGE_LIBGTK3 && BR2_SYSTEM_ENABLE_NLS
> +	select BR2_PACKAGE_GTKMM3
>  	help
>  	  Install transmission GTK-based GUI interface.
>  
> -comment "transmission-gtk needs NLS enabled"
> +comment "transmission-gtk needs libgtk3 and a toolchain with NLS enabled"
> +	depends on !BR2_nios2
>  	depends on BR2_PACKAGE_LIBGTK3 && !BR2_SYSTEM_ENABLE_NLS

Still, the sync-4 dependency is missing here, no?

Applied to master with the above changes, thanks.

Regards,
Yann E. MORIN.

>  endif
>  
> diff --git a/package/transmission/transmission.mk b/package/transmission/transmission.mk
> index f3a200ced3..26deeefa34 100644
> --- a/package/transmission/transmission.mk
> +++ b/package/transmission/transmission.mk
> @@ -74,7 +74,7 @@ endif
>  
>  ifeq ($(BR2_PACKAGE_TRANSMISSION_GTK),y)
>  TRANSMISSION_CONF_OPTS += -DENABLE_GTK=ON
> -TRANSMISSION_DEPENDENCIES += libgtk3
> +TRANSMISSION_DEPENDENCIES += gtkmm3 libgtk3
>  else
>  TRANSMISSION_CONF_OPTS += -DENABLE_GTK=OFF
>  endif
> -- 
> 2.39.2
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
