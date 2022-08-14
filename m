Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AADC0C25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 16:08:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3595A60D9C;
	Sun, 14 Aug 2022 16:08:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3595A60D9C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5ocEpqEcpCTl; Sun, 14 Aug 2022 16:08:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0834F60D4E;
	Sun, 14 Aug 2022 16:08:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0834F60D4E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E4B8D1BF410
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 16:08:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CD4E760BE2
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 16:08:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD4E760BE2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id egxcdo4gGGxI for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 16:08:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB20060BC6
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DB20060BC6
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 16:08:13 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4cac:4fa9:6c11:832f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 3010B6014A;
 Sun, 14 Aug 2022 18:08:09 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 14 Aug 2022 18:08:08 +0200
Date: Sun, 14 Aug 2022 18:08:08 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220814160808.GN2775145@scaer>
References: <20220813083521.1382565-1-thomas.petazzoni@bootlin.com>
 <20220813083521.1382565-4-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220813083521.1382565-4-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1660493292;
 bh=FGjkdtekAxCIYR7eMoDZQMRGv5sgHqUTzXfk0kgTKKc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZokPnMAb8AaDLD8K/jUfUPs7AkfC1JX3DjngFjgDMd1k42vJbkBVdWxJ83n0NcUFj
 swyicv4GfF3ISPaVhELzFyXVRF2Z8Q16y6+9dhtfoDgxsUT/ssxKraKuCLnYM/eKq5
 HpicumZ6AgN9BWu6j0Kyb1B4zVhxybb95kQ5MiaPzWBajAF/ubfDaCfnqGxN01TSKv
 DVym139YeC3NuiqKhKKhcMHkojo7i5OIIUJlYk4rAASWC1+SqkZxX4CoJXEdBo83Bs
 9rxi4wIkGYGoygMwsEf65EFf09kfQEL1JfJFEjNuaOGFDxzeMH17uxrdPu7CRNQJji
 46J3iuagZsFzw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ZokPnMAb
Subject: Re: [Buildroot] [PATCH 4/4] package/gdb: remove
 BR2_PACKAGE_GDB_TOPLEVEL
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
> This option was needed to build versions of GDB < 10.x. As we just
> dropped support for GDB 9.x, this logic can now be removed.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
[--SNIP--]
> diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
> index d2bbfcb290..45ce126bab 100644
> --- a/package/gdb/gdb.mk
> +++ b/package/gdb/gdb.mk
> @@ -18,23 +18,14 @@ GDB_LICENSE = GPL-2.0+, LGPL-2.0+, GPL-3.0+, LGPL-3.0+
>  GDB_LICENSE_FILES = COPYING COPYING.LIB COPYING3 COPYING3.LIB
>  GDB_CPE_ID_VENDOR = gnu
>  
> -# On gdb < 10, if you want to build only gdbserver, you need to
> -# configure only gdb/gdbserver.
> -ifeq ($(BR2_PACKAGE_GDB_DEBUGGER)$(BR2_PACKAGE_GDB_TOPLEVEL),)
> -GDB_SUBDIR = gdb/gdbserver

I got slightly confused here, so I added a little blurb in the commit
log to explain that it is correct to drop this.

Applied to next, thanks.

Regards,
Yann E. MORIN.

> -# When we want to build the full gdb, or for very recent versions of
> -# gdb with gdbserver at the top-level, out of tree build is mandatory,
> -# so we create a 'build' subdirectory in the gdb sources, and build
> -# from there.
> -else
> +# Out of tree build is mandatory, so we create a 'build' subdirectory
> +# in the gdb sources, and build from there.
>  GDB_SUBDIR = build
>  define GDB_CONFIGURE_SYMLINK
>  	mkdir -p $(@D)/$(GDB_SUBDIR)
>  	ln -sf ../configure $(@D)/$(GDB_SUBDIR)/configure
>  endef
>  GDB_PRE_CONFIGURE_HOOKS += GDB_CONFIGURE_SYMLINK
> -endif
>  
>  # For the host variant, we really want to build with XML support,
>  # which is needed to read XML descriptions of target architectures. We
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
