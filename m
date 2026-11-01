Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDACD606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 16:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ZPjoIGn8
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5944605EC;
	Sun,  1 Nov 2026 16:43:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L8zeAdQOGXxv; Sun,  1 Nov 2026 16:43:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 24751605EF
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793551432;
	b=MFv24l9CsERRVe1pZ7JrJBmpRTb6xs4yGV1S5xRwI6Vgn/exFwIZKfv3cGAzUplb+EGC
	 qvSBmpMyI9B4IFd6lqCbgnY1RqKCSuiy6xWvYLZ73NQBMpjvrRjUYakkY1O6gCsh0KZbt
	 IA1xXwhcn+ftWUHAGPhTAH8Rbbn5D850VbkNrhGllPtZFl3BaNJuYj7MX+H8ZegTHxu3E
	 N1WmX326ZBwagxgNz61oqli8EQkbDLj+qXB0mCpLv5gAUebxIBPIBX1cyNKoPCikoe7Na
	 lDRqzGBD2lsw2EAtoFk/MswKIc2pdlUR79VsHCj9sefHwm+ICFu3qI3cGetBX0LfvsQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793551432;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=r8jtye/2uGnl5wYYxPCQlc9B0ShJi6snVNGC5rqqIgk=;
	b=prw8u8QaETm53Ig/mVyL6hVxOnVgAVG1y6w54vH4k8926YKKduG2wraNLtmV2kKc/Qci
	 OuCg2uNfewzAojJrNm0cjNZZPzJoiiZ416DNL6RCjreYGk6yegMZivKhaKzwfTXlXSFEg
	 W08bskWtAEQkdjS+PKyRfhfXFq6x6hSFLtqxCsOmAVu2ZLU8n6oM0+K9nCTS+d+atYoAm
	 F9FPNNKaL+r1hjRxyzXgOnDpyDqBlh0OX4EUGy+hwtl4eYwMMtBH57BdCx86SCYUg0hpU
	 IYitaxE4ESeTHo/u71fgeZbsViXdxcgBjGEThdSDA4OXnsZLtmWaXLgtKklFNZMtYTg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793551432;
	bh=r8jtye/2uGnl5wYYxPCQlc9B0ShJi6snVNGC5rqqIgk=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZPjoIGn8xpzdQX3iexBU6QbhecbKdWa0nHswcdYXWKdOpDd0UmroSAf4QeKCM0oeR
	 pMRANtJ/QvVo4OjIdWClaOBRZX18MLF2opOpLud2w3CaXbvhSCtZj1MHNUxM1NVrPx
	 vk1KsbNpHNXGob7rhIqsFUtUAeqBxPTrSEAvygJuc7ldoIJPw9s+xYgGHAbWjNaQVo
	 5L0DSVU4ePJzq0r7KX5t2KfaoeNsq9mbJ7DmBzZIew9d9iCKnnOrgUccp6ydaEuCv4
	 47W1aUx16s8YJ232r6C4H7Y7qAqNAJUKdp+CyY6DduZTxsEM1tMUr9pMRVCEKrZVr3
	 gXuoScK/WLLEw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24751605EF;
	Sun,  1 Nov 2026 16:43:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 96857156
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 16:43:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7CCF340098
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 16:43:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v10ps0V4QBRJ for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 16:43:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 878BF4004D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793551429;
 b=j7SzrnCFn+Kykt4rrvdlXJo4WdI/bVEpttH59INclaWBn1UpAwxtUzHcqZhf6e1G9Ec+
 UdhY28SlZzNfuV1oGiVtQXF09I/2xv/R6PxEvI+zWCipxG/N9TixYMKf2EPuJUqQC+HIr
 WkdG5JUz7MsV1sCLPIEFr+C74DPfp/E6/Kg1Yd6szacROz2cRh6Z+PP/gOpbED79368R8
 mUeTKfSZC5oQ1elGhZAFN+0RM0j1uFV9j1fykjAClTR7lQqbOa+hu/82VSUZDAQbZNBn2
 bFHJqLQ+IhKJ3OPszz8YGFnHZexSifCBcgKjZ7TbdngqGv6bdZ0n0dTmXf06vtQktbg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793551429;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=N41iTUWVxBbz6M9QJKo4zAwF4DaJHrgh6SfaTjy0tqI=;
 b=akOYhg1soZeYtDDlQYtBp0j5+mI3F13gn/JjWDjOVcU1W4Wy11hsNQsz87EZQboNTqEv
 jVBityBlzludccSMzIQdNY70vQgchc5i/h2au631Fg8juOW9lg9UebFTA7yAyT5t9J5DT
 T+htcKbto/ZJWuARyE8e4azw7BiE5MteTP3VWS1QVVuf1fMYi6soUlPoFM2w+QWyo8di9
 /OhdHwjiGeDWAZkhEOoqJi/sof93bnyD1bGm/BIiJ87CDZRuokCfaR9MYynL4qKfZV4eq
 iCxGp49ogUkezhbYd9ios0sM5s4nixUUl01nqDWgSG/we/OGILrq2gJx4IrSi67VfDg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=UjcYKlnR; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 878BF4004D
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 16:43:47 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 285C11A13F8
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 16:43:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id F0CC860750;
 Sun,  1 Nov 2026 16:43:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B26BB10329162; Sun,  1 Nov 2026 17:43:44 +0100 (CET)
Date: Sun, 1 Nov 2026 17:43:44 +0100
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <audrTUDPjZfZpyNG@windsurf>
References: <20261031183632.1561453-1-thomas@devoogdt.com>
 <20261031183632.1561453-2-thomas@devoogdt.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261031183632.1561453-2-thomas@devoogdt.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v1 2/2] package/libgtk4: bump to version
 4.24.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Oct 31, 2026 at 07:36:32PM +0100, Thomas Devoogdt wrote:
> Changelog: https://gitlab.gnome.org/GNOME/gtk/-/blob/4.24.1/NEWS
> 
> Highlights of the changes since 4.21.0:
>  - librsvg is no longer a dependency, as GTK can now render SVG
>    images natively; this also drops the rustc host requirement
>  - New GtkSvgWidget for displaying (interactive) SVG, used for all
>    SVG icons and GtkSpinner
>  - Wayland: support for text protocol v3.2 and
>    xdg-session-management-v1
>  - GSK: 10bit image formats support, rewritten cache allocator,
>    clip masks to reduce the number of offscreens
>  - Session saving support is back
> 
> Since 4.24, GTK unconditionally links against libpng and libjpeg
> (previously only needed via the gdk-pixbuf loaders), so select
> BR2_PACKAGE_LIBPNG and BR2_PACKAGE_JPEG.
> 
> Also list cairo, harfbuzz and libfribidi in LIBGTK4_DEPENDENCIES
> as GTK links against them directly, and add the X11 libraries
> (GTK links against x11, xext, xrender, xi, xcursor, xdamage,
> xfixes, xrandr, xinerama, fontconfig) that are missing from the
> X11 backend dependency list, so that all direct dependencies are
> correctly built before libgtk4.
> 
> Finally, added two patches to fix fenv usage on uclibc toolchains.
> 
> Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>

Thanks for this update! I have a number of questions/comments below.

> diff --git a/package/libgtk4/0001-meson.build-add-a-check-for-the-fenv-header.patch b/package/libgtk4/0001-meson.build-add-a-check-for-the-fenv-header.patch
> new file mode 100644
> index 00000000000..788c190d865
> --- /dev/null
> +++ b/package/libgtk4/0001-meson.build-add-a-check-for-the-fenv-header.patch
> @@ -0,0 +1,26 @@
> +From d126fca3178004ab7d540d067e8c39745b69820f Mon Sep 17 00:00:00 2001
> +From: Thomas Devoogdt <thomas@devoogdt.com>
> +Date: Fri, 15 Nov 2024 08:22:23 +0100
> +Subject: [PATCH] meson.build: add a check for the fenv header
> +
> +Upstream: https://gitlab.gnome.org/GNOME/gtk/-/merge_requests/7925
> +Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>

> diff --git a/package/libgtk4/0002-gtk-gtkcssnumbervalue.c-fix-compilation-if-fenv.h-is.patch b/package/libgtk4/0002-gtk-gtkcssnumbervalue.c-fix-compilation-if-fenv.h-is.patch
> new file mode 100644
> index 00000000000..38c5b7573e1
> --- /dev/null
> +++ b/package/libgtk4/0002-gtk-gtkcssnumbervalue.c-fix-compilation-if-fenv.h-is.patch
> @@ -0,0 +1,106 @@
> +From 734fcd35e1d82a9b68b7c6aff7cd2b27d557b29e Mon Sep 17 00:00:00 2001
> +From: Thomas Devoogdt <thomas@devoogdt.com>
> +Date: Fri, 15 Nov 2024 08:22:40 +0100
> +Subject: [PATCH] gtk/gtkcssnumbervalue.c: fix compilation if fenv.h is missing
> +
> +../gtk/gtkcssnumbervalue.c:29:10: fatal error: fenv.h: No such file or directory
> +   29 | #include <fenv.h>
> +      |
> +
> +Upstream: https://gitlab.gnome.org/GNOME/gtk/-/merge_requests/7925
> +Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>

These two patches should probably have been squashed together in one
commit, because they form one single logical change. That being said,
if you submitted upstream as-is, fair enough, that is mostly a
suggestion.

> diff --git a/package/libgtk4/libgtk4.hash b/package/libgtk4/libgtk4.hash
> index dff32c57b48..ffa90911e58 100644
> --- a/package/libgtk4/libgtk4.hash
> +++ b/package/libgtk4/libgtk4.hash
> @@ -1,5 +1,5 @@
> -# From https://download.gnome.org/sources/gtk/4.21/gtk-4.21.0.sha256sum
> -sha256  f52475c5041dfd02cc4eed22ee94f12ec310c16a68fda9203dc54ffd5daa6e6f  gtk-4.21.0.tar.xz
> +# From https://download.gnome.org/sources/gtk/4.24/gtk-4.24.1.sha256sum
> +sha256  e98abe720e16129c8c0f50761dee0a2e9ae2478055e31018f6cf977fcf6513e9  gtk-4.24.1.tar.xz
>  
>  # Hash for license file:
>  sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
> diff --git a/package/libgtk4/libgtk4.mk b/package/libgtk4/libgtk4.mk
> index 9a5ed651a82..26346dad29d 100644
> --- a/package/libgtk4/libgtk4.mk
> +++ b/package/libgtk4/libgtk4.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>  
> -LIBGTK4_VERSION_MAJOR = 4.21
> -LIBGTK4_VERSION = $(LIBGTK4_VERSION_MAJOR).0
> +LIBGTK4_VERSION_MAJOR = 4.24
> +LIBGTK4_VERSION = $(LIBGTK4_VERSION_MAJOR).1
>  LIBGTK4_SOURCE = gtk-$(LIBGTK4_VERSION).tar.xz
>  LIBGTK4_SITE = https://download.gnome.org/sources/gtk/$(LIBGTK4_VERSION_MAJOR)
>  LIBGTK4_LICENSE = LGPL-2.0+
> @@ -17,12 +17,17 @@ LIBGTK4_INSTALL_STAGING = YES
>  LIBGTK4_DEPENDENCIES = \
>  	host-pkgconf \
>  	host-libgtk4 \
> +	cairo \

This already had a "select" in Config.in. Was it a bug that it wasn't
in the DEPENDENCIES? Should this be considered a fix? If this is
unrelated to the bump, should ideally be a separate commit.

>  	gdk-pixbuf \
>  	graphene \
> +	harfbuzz \

harfbuzz is not selected by BR2_PACKAGE_LIBGTK4, so a select should be
added if libgtk4 directly links against it. If this was already the
case prior to the bump, should be a separate patch.

> +	jpeg \
>  	libepoxy \
> +	libfribidi \

libfribidi is not selected by BR2_PACKAGE_LIBGTK4, so a select should
be added if libgtk4 links against it. If this was already the
case prior to the bump, should be a separate patch.

>  	libglib2 \
> -	librsvg \
> +	libpng \
>  	pango \
> +	tiff \

Same question as for cairo.

>  	$(TARGET_NLS_DEPENDENCIES)
>  
>  LIBGTK4_CONF_OPTS = \
> @@ -46,7 +51,17 @@ LIBGTK4_CONF_OPTS += -Dintrospection=disabled
>  endif
>  
>  ifeq ($(BR2_PACKAGE_LIBGTK4_X11),y)
> -LIBGTK4_DEPENDENCIES += xlib_libXcursor xlib_libXi xlib_libXinerama
> +LIBGTK4_DEPENDENCIES += \
> +	fontconfig \
> +	xlib_libX11 \
> +	xlib_libXcursor \
> +	xlib_libXdamage \
> +	xlib_libXext \
> +	xlib_libXfixes \
> +	xlib_libXi \
> +	xlib_libXinerama \
> +	xlib_libXrandr \
> +	xlib_libXrender

All these new packages need to be selected in Config.in. Also, is this
related to the bump, or already the case with the current version of
libgtk4 in Buildroot?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
