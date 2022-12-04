Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C0EEC4332F
	for <buildroot@archiver.kernel.org>; Sun,  4 Dec 2022 12:01:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCE82415DA;
	Sun,  4 Dec 2022 12:01:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BCE82415DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A9Lbpl43Bi0d; Sun,  4 Dec 2022 12:01:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 829A7415E7;
	Sun,  4 Dec 2022 12:01:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 829A7415E7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 607931BF232
 for <buildroot@lists.busybox.net>; Sun,  4 Dec 2022 12:01:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3C3FC40354
 for <buildroot@lists.busybox.net>; Sun,  4 Dec 2022 12:01:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C3FC40354
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TYKOfCY1eIho for <buildroot@lists.busybox.net>;
 Sun,  4 Dec 2022 12:01:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 19719401C2
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 19719401C2
 for <buildroot@buildroot.org>; Sun,  4 Dec 2022 12:01:32 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:d16b:268a:13f6:6145])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 41ECE19F5A8;
 Sun,  4 Dec 2022 13:01:28 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 04 Dec 2022 13:01:27 +0100
Date: Sun, 4 Dec 2022 13:01:27 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221204120127.GN3302@scaer>
References: <20221203221926.1188703-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221203221926.1188703-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1670155290;
 bh=/dXD5iMJz9wTa62Atf7uOD+eLt6pDiwmmaSqD/48K0M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OfkqQZflW6vmvUicl8UaknjHYFzNJIUQ1ogGMpMNfWWgC5vjjEwoFOjymEoiRvlFw
 CrGNKYG4GydY6KZdMDAORgqvnd/HmaYHp9UURKShbfs0kONekYLacksJasSukEGDMy
 qxoWUFA4bUjj28cVJ0G+2Rk02TEUicnx5pKWw//jPxP1BID2u4+rxrIhBXtmKI2ttg
 /kTxrcmGTIBpRqYa2SENq2EjJG+kM+LmS1N9T2qUl78lb/H4VXgLh+jeb1ifo8t1xI
 2qCpOJlZWPa2EZPOjUlgSgeTDUlCgn+xaIgepsn+oy9HDtMSGvmdjNeULrq4volM79
 FR2Mco8cq0kBw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=OfkqQZfl
Subject: Re: [Buildroot] [PATCH 1/1] package/gdb: zlib is mandatory,
 not optional
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

Fabrice, All,

On 2022-12-03 23:19 +0100, Fabrice Fontaine spake thusly:
> zlib is a mandatory dependency of gdb and by default, gdb will use its
> internal one. Moreover, --with-zlib has been replaced by
> --with-system-zlib since version 7.10 and
> https://github.com/bminor/binutils-gdb/commit/fa1f5da0b6ff3622f9bf60e348e149b76920abba

I checked if all the versions of gdb we have had this, and indeed, gdb
8.1 already had it.

> Fixes:
>  - https://bugs.buildroot.org/show_bug.cgi?id=15131
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/gdb/Config.in |  1 +
>  package/gdb/gdb.mk    | 12 ++++--------
>  2 files changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/package/gdb/Config.in b/package/gdb/Config.in
> index 273b3072ae..80b1185b5e 100644
> --- a/package/gdb/Config.in
> +++ b/package/gdb/Config.in
> @@ -17,6 +17,7 @@ config BR2_PACKAGE_GDB
>  	depends on BR2_PACKAGE_GDB_ARCH_SUPPORTS
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
>  	depends on BR2_INSTALL_LIBSTDCPP
> +	select BR2_PACKAGE_ZLIB
>  	# When the external toolchain gdbserver is copied to the
>  	# target, we don't allow building a separate gdbserver. The
>  	# one from the external toolchain should be used.
> diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
> index 45ce126bab..4b9c5c6b70 100644
> --- a/package/gdb/gdb.mk
> +++ b/package/gdb/gdb.mk
> @@ -32,7 +32,8 @@ GDB_PRE_CONFIGURE_HOOKS += GDB_CONFIGURE_SYMLINK
>  # also need ncurses.
>  # As for libiberty, gdb may use a system-installed one if present, so
>  # we must ensure ours is installed first.
> -HOST_GDB_DEPENDENCIES = host-expat host-libiberty host-ncurses
> +GDB_DEPENDENCIES = zlib
> +HOST_GDB_DEPENDENCIES = host-expat host-libiberty host-ncurses host-zlib
>  
>  # Disable building documentation
>  GDB_MAKE_OPTS += MAKEINFO=true
> @@ -130,6 +131,7 @@ GDB_CONF_OPTS = \
>  	--disable-sim \
>  	$(GDB_DISABLE_BINUTILS_CONF_OPTS) \
>  	--without-included-gettext \
> +	--with-system-zlib \
>  	--disable-werror \
>  	--enable-static \
>  	--without-mpfr
> @@ -212,13 +214,6 @@ else
>  GDB_CONF_OPTS += --without-lzma
>  endif
>  
> -ifeq ($(BR2_PACKAGE_ZLIB),y)
> -GDB_CONF_OPTS += --with-zlib
> -GDB_DEPENDENCIES += zlib
> -else
> -GDB_CONF_OPTS += --without-zlib
> -endif
> -
>  ifeq ($(BR2_PACKAGE_GDB_PYTHON),)
>  # This removes some unneeded Python scripts and XML target description
>  # files that are not useful for a normal usage of the debugger.
> @@ -256,6 +251,7 @@ HOST_GDB_CONF_OPTS = \
>  	--enable-threads \
>  	--disable-werror \
>  	--without-included-gettext \
> +	--with-system-zlib \
>  	--with-curses \
>  	--without-mpfr \
>  	$(GDB_DISABLE_BINUTILS_CONF_OPTS)
> -- 
> 2.35.1
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
