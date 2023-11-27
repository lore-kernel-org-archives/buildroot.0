Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64EFCC4167B
	for <buildroot@archiver.kernel.org>; Mon, 27 Nov 2023 18:22:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15E11817A7;
	Mon, 27 Nov 2023 18:22:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 15E11817A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b--LC3m7bbwn; Mon, 27 Nov 2023 18:22:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C34FD817B3;
	Mon, 27 Nov 2023 18:22:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C34FD817B3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 044EA1BF348
 for <buildroot@lists.busybox.net>; Mon, 27 Nov 2023 18:21:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D129A814B7
 for <buildroot@lists.busybox.net>; Mon, 27 Nov 2023 18:21:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D129A814B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vm6a3V8Funwg for <buildroot@lists.busybox.net>;
 Mon, 27 Nov 2023 18:21:23 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5947B8175F
 for <buildroot@busybox.net>; Mon, 27 Nov 2023 18:21:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5947B8175F
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:7618:50d5:c153:9a40])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 1C3D5B005A4;
 Mon, 27 Nov 2023 19:21:16 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 27 Nov 2023 19:21:16 +0100
Date: Mon, 27 Nov 2023 19:21:16 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Baruch Siach <baruch@tkos.co.il>
Message-ID: <20231127182116.GW3177259@scaer>
References: <c7671eb7fe22f65212c2d1aa88d4c5d415eab668.1701103430.git.baruch@tkos.co.il>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c7671eb7fe22f65212c2d1aa88d4c5d415eab668.1701103430.git.baruch@tkos.co.il>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1701109280;
 bh=uX2cSo730T25irOpM3IwIIbDd/oR1Zbgk2YQE2bhH8Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=O+4n4UQWn8YkS/bbwlEJhe0bbm5DpXllQT9EwU2iijNkTkLsdtdv7H00e2U6l3j5l
 P4LRfZn9Wp4OcgJpv3AJwutKfRPP9LTRKutRiKVEUNV0FJMiH1h5iZ1SohUAbyTYrD
 DAz+OYEQUBoqIJ6pG8NjotDxq19O6zY+UWCLY27hBRPvcRXha0NzgVe6hP912VdbvZ
 i2koy1dDNA/BnQ84qHc69EisJ8GS+g8MCC8VQMglb+QyUNmhptkIC4Ts/IfzrQEw47
 aSCNH5fy8ULRsjnPUS9+opWPeGUMQqfE2zGaEourLUdx5mce8WR+EdDrz+tPkny0jf
 7GQLWTxJjALBA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=O+4n4UQW
Subject: Re: [Buildroot] [PATCH] package/socat: bump to version 1.8.0.0
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Baruch, All,

On 2023-11-27 18:43 +0200, Baruch Siach via buildroot spake thusly:
> Update README hash for changed not related to license.
> 
> Change patch 0001 to git format. socat is now hosted on git. Also,
> update to apply to current version.
> 
> Add upstream status to both patches.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  .checkpackageignore                           |  2 --
>  package/socat/0001-no-documentation.patch     | 34 ++++++++++++++-----
>  .../0002-compat-set-NETDB_INTERNAL.patch      |  7 ++--
>  package/socat/socat.hash                      |  6 ++--
>  package/socat/socat.mk                        |  2 +-
>  5 files changed, 33 insertions(+), 18 deletions(-)
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index 0663149d01cb..e9fdf9f01cac 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -1292,8 +1292,6 @@ package/snort/0005-fix-sparc.patch Upstream
>  package/snort/0006-Fix-compile-error-when-building-against-uclibc-or-mu.patch Upstream
>  package/snort/0007-Fix-error-when-building-on-a-Fedora-host-machine.patch Upstream
>  package/snort/0008-Fix-NO-OPTIMIZE.patch Upstream
> -package/socat/0001-no-documentation.patch Upstream
> -package/socat/0002-compat-set-NETDB_INTERNAL.patch Upstream
>  package/socketcand/0001-Fix-GCC10-build-failure.patch Upstream
>  package/softether/0001-Create-autotools-plumbing-for-SoftEther.patch Upstream
>  package/softether/0002-Create-libsoftether.so-and-dynamically-link.patch Upstream
> diff --git a/package/socat/0001-no-documentation.patch b/package/socat/0001-no-documentation.patch
> index ce088dfafc83..b4c3e1ffde41 100644
> --- a/package/socat/0001-no-documentation.patch
> +++ b/package/socat/0001-no-documentation.patch
> @@ -1,37 +1,53 @@
> -socat: disable documentation build/installation
> +From 01463f5dbe19501948dec26160e0cc3b4e9167b4 Mon Sep 17 00:00:00 2001
> +From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> +Date: Mon, 27 Nov 2023 18:09:57 +0200
> +Subject: [PATCH] socat: disable documentation build/installation
>  
>  The documentation generation process requires a special yold2man
>  program, for which we don't have a package in Buildroot. Since we
>  generally don't care much about documentation of packages, just adjust
>  the package Makefile.in to not build/install its documentation.
>  
> +Upstream: N/A
>  Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> +[baruch: update for 1.8.0.0; git patch format]
> +Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> +---
> + Makefile.in | 7 ++-----
> + 1 file changed, 2 insertions(+), 5 deletions(-)
>  
> -Index: b/Makefile.in
> -===================================================================
> +diff --git a/Makefile.in b/Makefile.in
> +index c01b1a4a2306..fd89acb06f3c 100644
>  --- a/Makefile.in
>  +++ b/Makefile.in
> -@@ -93,7 +93,7 @@
> - 	Config/Makefile.Cygwin-1-5-25 Config/config.Cygwin-1-5-25.h \
> - 	Config/Makefile.MacOSX-10-5 Config/config.MacOSX-10-5.h
> +@@ -82,7 +82,7 @@ SHFILES = socat-chain.sh socat-mux.sh socat-broker.sh \
> + TESTFILES = test.sh socks4echo.sh proxyecho.sh readline-test.sh \
> + 	proxy.sh socks4a-echo.sh
>   
>  -all: progs doc
>  +all: progs
>   
>   scmclean: gitclean
>   
> -@@ -136,13 +136,11 @@
> +@@ -128,7 +128,7 @@ libxio.a: $(XIOOBJS) $(UTLOBJS)
>   strip: progs
>   	strip $(PROGS)
>   
>  -install: progs $(srcdir)/doc/socat.1
>  +install: progs
>   	mkdir -p $(DESTDIR)$(BINDEST)
> - 	$(INSTALL) -m 755 socat $(DESTDIR)$(BINDEST)
> + 	$(INSTALL) -m 755 socat $(DESTDIR)$(BINDEST)/socat1
> + 	ln -sf socat1 $(DESTDIR)$(BINDEST)/socat
> +@@ -137,9 +137,6 @@ install: progs $(srcdir)/doc/socat.1
> + 	$(INSTALL) -m 755 socat-broker.sh $(DESTDIR)$(BINDEST)
>   	$(INSTALL) -m 755 procan $(DESTDIR)$(BINDEST)
>   	$(INSTALL) -m 755 filan $(DESTDIR)$(BINDEST)
>  -	mkdir -p $(DESTDIR)$(MANDEST)/man1
> --	$(INSTALL) -m 644 $(srcdir)/doc/socat.1 $(DESTDIR)$(MANDEST)/man1/
> +-	$(INSTALL) -m 644 $(srcdir)/doc/socat.1 $(DESTDIR)$(MANDEST)/man1/socat1.1
> +-	ln -sf socat1.1 $(DESTDIR)$(MANDEST)/man1/socat.1
>   
>   uninstall:
>   	rm -f $(DESTDIR)$(BINDEST)/socat
> +-- 
> +2.42.0
> +
> diff --git a/package/socat/0002-compat-set-NETDB_INTERNAL.patch b/package/socat/0002-compat-set-NETDB_INTERNAL.patch
> index da31073ba558..f526664210dd 100644
> --- a/package/socat/0002-compat-set-NETDB_INTERNAL.patch
> +++ b/package/socat/0002-compat-set-NETDB_INTERNAL.patch
> @@ -1,4 +1,4 @@
> -From e7804d1750652e39c7a5803d360b29b2637a695f Mon Sep 17 00:00:00 2001
> +From 4b86f141c7c4725093fb2e12c769fec393727519 Mon Sep 17 00:00:00 2001
>  From: Romain Naour <romain.naour@gmail.com>
>  Date: Sun, 28 Aug 2016 21:04:01 +0200
>  Subject: [PATCH] compat: set NETDB_INTERNAL
> @@ -12,16 +12,17 @@ Based on [2].
>  [1] https://sourceware.org/git/?p=glibc.git;a=blob;f=resolv/netdb.h;h=3aba530932c7a62a4f23e3193e9186da677f552b;hb=fdfc9260b61d3d72541f18104d24c7bcb0ce5ca2#l74
>  [2] http://git.alpinelinux.org/cgit/aports/tree/main/socat/netdb-internal.patch?id=5a45173b50892cb634197c30b3506ebff98d3b7d
>  
> +Upstream: sent to socat@dest-unreach.org
>  Signed-off-by: Romain Naour <romain.naour@gmail.com>
>  ---
>   compat.h | 2 ++
>   1 file changed, 2 insertions(+)
>  
>  diff --git a/compat.h b/compat.h
> -index 19a929f..4f5ee6d 100644
> +index bb7e2d8f1782..72e73c701f64 100644
>  --- a/compat.h
>  +++ b/compat.h
> -@@ -666,6 +666,8 @@ typedef int sig_atomic_t;
> +@@ -851,6 +851,8 @@ typedef unsigned long T_sigset;
>   
>   #if !defined(NETDB_INTERNAL) && defined(h_NETDB_INTERNAL)
>   #  define NETDB_INTERNAL h_NETDB_INTERNAL
> diff --git a/package/socat/socat.hash b/package/socat/socat.hash
> index 2113e1b3a485..2a14d7530301 100644
> --- a/package/socat/socat.hash
> +++ b/package/socat/socat.hash
> @@ -1,8 +1,8 @@
>  # From http://www.dest-unreach.org/socat/download.md5sum
> -md5  a605d3779465f42c07fc507cfbfb08f9  socat-1.7.4.4.tar.bz2
> +md5  51f9ecdf5d942d0a3c150ea400eb89ef  socat-1.8.0.0.tar.bz2
>  # From http://www.dest-unreach.org/socat/download.sha256sum
> -sha256  fbd42bd2f0e54a3af6d01bdf15385384ab82dbc0e4f1a5e153b3e0be1b6380ac  socat-1.7.4.4.tar.bz2
> +sha256  e1de683dd22ee0e3a6c6bbff269abe18ab0c9d7eb650204f125155b9005faca7  socat-1.8.0.0.tar.bz2
>  # Locally calculated
> -sha256  3555c6bc2779ff0f9a7145d1e3cd1d8fde59548bcd3364a23b907de21eec5aa8  README
> +sha256  de9d702354b2e748ea87eb20d18c3d90ebede5dc6d2fc3c2e0645d139a5181bc  README
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
>  sha256  fd9e48ca316a5032069b9521f4f4b4d9b1c60365012bae1e62286bcd5bd2e761  COPYING.OpenSSL
> diff --git a/package/socat/socat.mk b/package/socat/socat.mk
> index f958f26522fa..1e2880c028d8 100644
> --- a/package/socat/socat.mk
> +++ b/package/socat/socat.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -SOCAT_VERSION = 1.7.4.4
> +SOCAT_VERSION = 1.8.0.0
>  SOCAT_SOURCE = socat-$(SOCAT_VERSION).tar.bz2
>  SOCAT_SITE = http://www.dest-unreach.org/socat/download
>  SOCAT_LICENSE = GPL-2.0 with OpenSSL exception
> -- 
> 2.42.0
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
