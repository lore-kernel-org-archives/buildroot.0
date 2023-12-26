Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32FA2C46CD3
	for <buildroot@archiver.kernel.org>; Tue, 26 Dec 2023 21:39:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D4ADB40A41;
	Tue, 26 Dec 2023 21:39:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D4ADB40A41
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PmR27NIboyiX; Tue, 26 Dec 2023 21:39:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6681F40A58;
	Tue, 26 Dec 2023 21:39:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6681F40A58
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 162611BF36A
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 21:39:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E1FD840A77
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 21:39:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E1FD840A77
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tq1RmrjtW01G for <buildroot@lists.busybox.net>;
 Tue, 26 Dec 2023 21:39:16 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 03DFA40A8B
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 21:39:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 03DFA40A8B
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 2D48DB0037C;
 Tue, 26 Dec 2023 22:39:12 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 26 Dec 2023 22:39:11 +0100
Date: Tue, 26 Dec 2023 22:39:11 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZYtH_zeuCWBidlf5@landeda>
References: <20231226135941.2784505-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231226135941.2784505-1-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1703626754;
 bh=cDyc4E41sbYdq6eoJ7Yy9wlm5ToE0rNmdS7JMCU79LM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HTqFCyIBtfXszMjTF/cYnW2Eje7Jszf+nBOT0DBHGF6aCDPU3mOieTVAUh9alSYy9
 5hGI5osVCb7Fp8IkxYwDXjCxLp8zYMbv9PA+s2PZzeZbJ463XNd7HUEvxZj5kUoq6G
 17ExqpMIMFJW8uHK258vDf3Jx9Dxmlhx5JrqfPGAg546T09OWBpOru/mPpBxDiWHud
 BWRgN0eY/ZGrMew4Rsee3bzDGq3KVZc+rnZsGoroik/wvh0pds0UWusT0DpbO6rfe9
 9Y5lsquCrBq4QOL+d6qGd5JlmeQt6OwUyAqLRi83qgwMgz2HcDl4q3zIUKHaj5n2qr
 CBjR0y4iVJUQw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=HTqFCyIB
Subject: Re: [Buildroot] [PATCH v2 1/2] package/gmpc: remove package
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

Thomas, All,

On 2023-12-26 14:59 +0100, Thomas Petazzoni via buildroot spake thusly:
> This package is unmaintained upstream:
> 
> - The URL in our Config.in,
>   http://gmpcwiki.sarine.nl/index.php?title=GMPC, no longer works
> 
> - https://github.com/DaveDavenport/gmpc says it's unmaintained
> 
> - The official lists of MPD clients at
>   https://www.musicpd.org/clients/ says it's maintained, and points at
>   http://gmpclient.org/, which is no longer owned by the developers of
>   GMPC.
> 
> - It still uses libsoup (2) which we want to get rid of at some
>   point.
> 
> - It was added by Gustavo Zacarias, and no version bumped occurred
>   since 2011.
> 
> So let's kill this package.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Both applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  Config.in.legacy       |  7 +++++++
>  package/Config.in      |  1 -
>  package/gmpc/Config.in | 26 --------------------------
>  package/gmpc/gmpc.hash |  3 ---
>  package/gmpc/gmpc.mk   | 18 ------------------
>  5 files changed, 7 insertions(+), 48 deletions(-)
>  delete mode 100644 package/gmpc/Config.in
>  delete mode 100644 package/gmpc/gmpc.hash
>  delete mode 100644 package/gmpc/gmpc.mk
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index d46bd97442..0ab9dcadff 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,6 +146,13 @@ endif
>  
>  comment "Legacy options removed in 2023.11"
>  
> +config BR2_PACKAGE_GMPC
> +	bool "gmpc package was removed"
> +	select BR2_LEGACY
> +	help
> +	  The gmpc package was removed because it was unmaintained,
> +	  and still using the old libsoup2 library.
> +
>  config BR2_PACKAGE_ONEVPL
>  	bool "onevpl package was renamed"
>  	select BR2_LEGACY
> diff --git a/package/Config.in b/package/Config.in
> index 98653ff29d..34efaf29e5 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -405,7 +405,6 @@ comment "X applications"
>  	source "package/dillo/Config.in"
>  	source "package/docker/Config.in"
>  	source "package/feh/Config.in"
> -	source "package/gmpc/Config.in"
>  	source "package/gtkperf/Config.in"
>  	source "package/leafpad/Config.in"
>  	source "package/mupdf/Config.in"
> diff --git a/package/gmpc/Config.in b/package/gmpc/Config.in
> deleted file mode 100644
> index 1aa74251f0..0000000000
> --- a/package/gmpc/Config.in
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -config BR2_PACKAGE_GMPC
> -	bool "gmpc"
> -	depends on BR2_PACKAGE_LIBGTK2
> -	depends on BR2_USE_WCHAR # glib2
> -	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
> -	depends on BR2_USE_MMU # glib2
> -	depends on BR2_PACKAGE_XORG7
> -	select BR2_PACKAGE_LIBGLIB2
> -	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
> -	select BR2_PACKAGE_LIBMPD
> -	select BR2_PACKAGE_LIBSOUP
> -	select BR2_PACKAGE_LIBXML2
> -	select BR2_PACKAGE_SQLITE
> -	select BR2_PACKAGE_XLIB_LIBICE
> -	select BR2_PACKAGE_XLIB_LIBSM
> -	select BR2_PACKAGE_XLIB_LIBX11
> -	help
> -	  Gnome Music Player Client is a GNOME/GTK2.2 client for
> -	  Music Player Daemon.
> -
> -	  http://gmpcwiki.sarine.nl/index.php?title=GMPC
> -
> -comment "gmpc needs a toolchain w/ wchar, threads"
> -	depends on BR2_USE_MMU
> -	depends on BR2_PACKAGE_XORG7 && BR2_PACKAGE_LIBGTK2
> -	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/gmpc/gmpc.hash b/package/gmpc/gmpc.hash
> deleted file mode 100644
> index 66de8b6226..0000000000
> --- a/package/gmpc/gmpc.hash
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -# Locally calculated
> -sha256  a69414f35396846733632ca9619921d7acda537ffd6d49bd84b444945cb76b2c  gmpc-11.8.16.tar.gz
> -sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
> diff --git a/package/gmpc/gmpc.mk b/package/gmpc/gmpc.mk
> deleted file mode 100644
> index 40b77eb189..0000000000
> --- a/package/gmpc/gmpc.mk
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -################################################################################
> -#
> -# gmpc
> -#
> -################################################################################
> -
> -GMPC_VERSION = 11.8.16
> -GMPC_SITE = http://download.sarine.nl/Programs/gmpc/$(GMPC_VERSION)
> -GMPC_CONF_ENV = ac_cv_path_GOB2=$(GOB2_HOST_BINARY)
> -GMPC_CONF_OPTS = --disable-mmkeys --disable-unique
> -GMPC_LICENSE = GPL-2.0+
> -GMPC_LICENSE_FILES = COPYING
> -GMPC_DEPENDENCIES = host-gob2 host-intltool host-pkgconf host-vala \
> -	libglib2 libgtk2 libmpd libsoup sqlite \
> -	xlib_libICE xlib_libSM xlib_libX11 \
> -	$(TARGET_NLS_DEPENDENCIES)
> -
> -$(eval $(autotools-package))
> -- 
> 2.43.0
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
