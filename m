Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 305ADC433F5
	for <buildroot@archiver.kernel.org>; Sun, 20 Feb 2022 22:11:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2B18814AB;
	Sun, 20 Feb 2022 22:11:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q0ewV_Wru3WJ; Sun, 20 Feb 2022 22:11:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B034781463;
	Sun, 20 Feb 2022 22:11:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D15321BF393
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 22:11:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BE2D64049F
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 22:11:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id anUJ2gzHPF1B for <buildroot@lists.busybox.net>;
 Sun, 20 Feb 2022 22:11:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2A16D40400
 for <buildroot@buildroot.org>; Sun, 20 Feb 2022 22:11:26 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ec40:77b9:a48e:dc50])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 121DB2003B4;
 Sun, 20 Feb 2022 23:11:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1645395083;
 bh=UWzlzRkYjxDnpukSbXgjVUN3uemRsuxJTa8TPDT/lS4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=D0lifnhVdQ+T+Dt4eoD2libDzI035ZpGqmsAIF3khb4kC+78650uLzLwfgfl84saV
 0XlfbiqqD/oC/61hbtUQdftgwENOpH6w7t1uWnpNAjYlIWEiKqBrt0McGAx0WLMPcM
 CRlvppYWYqP4Mia97hVc1VP4eboYTZgAUvfeZamupM4NnFckqwZwBvqOxxT+MHMUoR
 YHOZ06zuZpHoF+ZCUyZDb0JqJbo2asezquF+bq61a7R8G0fhczrgyN5cdB5JA91Tae
 kTDzOrVgxvqY64ry59X521efu2uNhiBHn0ckX+jJNMnS88rSfs6K8yDI2gBBtVqCbg
 RMAABuiXWn+vw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 20 Feb 2022 23:11:20 +0100
Date: Sun, 20 Feb 2022 23:11:20 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220220221120.GA522310@scaer>
References: <20220220121637.200393-1-fontaine.fabrice@gmail.com>
 <20220220121637.200393-2-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220220121637.200393-2-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v2,
 2/2] package/librsvg: fix loaders.cache with with per-package
 directories
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

On 2022-02-20 13:16 +0100, Fabrice Fontaine spake thusly:
> host-librsvg invokes the gdk-pixbuf-queryloaders to update loaders.cache
> (which is originally built by host-gdk-pixbuf). loaders.cache contains
> the list of all the gdk-pixbuf modules; that includes paths to
> dlopen()ed shared libs. host-librsvg must update this file to add the
> path to its SVG shared library.
> 
> By default, gdk-pixbuf-queryloaders uses a hardcoded path to find the
> installed shared libs and this path will point to the location of the
> host-gdk-pixbuf per-package directory. Obviously, this is wrong, the SVG
> library installed by host-librsvg is installed in its own per-package
> directory.
> 
> So set GDK_PIXBUF_MODULEDIR to gdk_pixbuf_moduledir before calling
> gdk-pixbuf-query-loaders to build a correct loaders.cache.
> gdk_pixbuf_moduledir is already retrieved from host-pkgconfig in
> configure.ac and so will point to the correct location (thanks to
> PPD_FIXUP_PATHS).
> 
> After this update, the loaders.cache will be correctly updated in
> host-librsvg per-package directory and so the loaders.cache installed in
> adwaita-icon-theme per-package directory will also be correct (thanks to
> PPD_FIXUP_PATHS).
> 
> This will fix the following PPD build failure of adwaita-icon-theme:
> 
> Can't load file: Unrecognized image file format
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/0e00059b09b4445eaaec1030997883187c6a80d6
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Thank you very much for expanding on your previous commit log. It indeed
helps a lot to explain what is happening.

Still, I felt I needed to understand a bit more about the issue: why did
we have to fix it at build time for a file that is never isntalled?

Also, since we now configure gdk-pixbuf in a relocatable way, why was
the issue still happening?

So I investigated a bit, and substancially rewrote the commit log with
my findings.

Still, I must say that your second commit log was already very good, and
it really helped me understand the overall issue. Thanks for that! :-)

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2 (after review of Yann E. Morin):
>  - Enhance commit message
>  - Add patch upstream status
> 
>  ...r-Makefile.am-set-GDK_PIXBUF_MODULED.patch | 41 +++++++++++++++++++
>  package/librsvg/librsvg.mk                    |  2 +
>  2 files changed, 43 insertions(+)
>  create mode 100644 package/librsvg/0001-gdk-pixbuf-loader-Makefile.am-set-GDK_PIXBUF_MODULED.patch
> 
> diff --git a/package/librsvg/0001-gdk-pixbuf-loader-Makefile.am-set-GDK_PIXBUF_MODULED.patch b/package/librsvg/0001-gdk-pixbuf-loader-Makefile.am-set-GDK_PIXBUF_MODULED.patch
> new file mode 100644
> index 0000000000..761ff92605
> --- /dev/null
> +++ b/package/librsvg/0001-gdk-pixbuf-loader-Makefile.am-set-GDK_PIXBUF_MODULED.patch
> @@ -0,0 +1,41 @@
> +From 2c472bf55289ccbd7f305aa3e98d6fd70be4e3ab Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Sat, 19 Feb 2022 12:02:10 +0100
> +Subject: [PATCH] gdk-pixbuf-loader/Makefile.am: set GDK_PIXBUF_MODULEDIR
> +
> +Set GDK_PIXBUF_MODULEDIR to gdk_pixbuf_moduledir before calling
> +gdk-pixbuf-query-loaders to build a correct gdk_pixbuf_cache_file and
> +gdk-pixbuf.loaders on 'exotic' systems
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status:
> +https://gitlab.gnome.org/GNOME/librsvg/-/merge_requests/668]
> +---
> + gdk-pixbuf-loader/Makefile.am | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/gdk-pixbuf-loader/Makefile.am b/gdk-pixbuf-loader/Makefile.am
> +index c3493736..de1f9641 100644
> +--- a/gdk-pixbuf-loader/Makefile.am
> ++++ b/gdk-pixbuf-loader/Makefile.am
> +@@ -49,7 +49,7 @@ rsvg_loader_LDADD = \
> + EXTRA_rsvg_loader_DEPENDENCIES = libpixbufloader-svg.la gdk-pixbuf-loaders
> + 
> + gdk-pixbuf-loaders: Makefile
> +-	$(AM_V_GEN) ( $(GDK_PIXBUF_QUERYLOADERS) ./libpixbufloader-svg.la && $(GDK_PIXBUF_QUERYLOADERS)) > gdk-pixbuf.loaders 2>/dev/null
> ++	$(AM_V_GEN) ( $(GDK_PIXBUF_QUERYLOADERS) ./libpixbufloader-svg.la && GDK_PIXBUF_MODULEDIR=$(gdk_pixbuf_moduledir) $(GDK_PIXBUF_QUERYLOADERS)) > gdk-pixbuf.loaders 2>/dev/null
> + 
> + if CROSS_COMPILING
> + RUN_QUERY_LOADER_TEST=false
> +@@ -68,7 +68,7 @@ endif
> + install-data-hook:
> + 	@if $(RUN_QUERY_LOADER_TEST) ; then \
> + 		$(mkinstalldirs) $(DESTDIR)$(gdk_pixbuf_binarydir) ; \
> +-		$(GDK_PIXBUF_QUERYLOADERS) > $(DESTDIR)$(gdk_pixbuf_cache_file) ; \
> ++		GDK_PIXBUF_MODULEDIR=$(gdk_pixbuf_moduledir) $(GDK_PIXBUF_QUERYLOADERS) > $(DESTDIR)$(gdk_pixbuf_cache_file) ; \
> + 	else \
> + 	  echo "***" ; \
> + 	  echo "*** Warning: loaders.cache not built" ; \
> +-- 
> +2.34.1
> +
> diff --git a/package/librsvg/librsvg.mk b/package/librsvg/librsvg.mk
> index e4b1942b79..07a14b4366 100644
> --- a/package/librsvg/librsvg.mk
> +++ b/package/librsvg/librsvg.mk
> @@ -20,6 +20,8 @@ HOST_LIBRSVG_DEPENDENCIES = host-cairo host-gdk-pixbuf host-libglib2 host-libxml
>  LIBRSVG_LICENSE = LGPL-2.1+
>  LIBRSVG_LICENSE_FILES = COPYING.LIB
>  LIBRSVG_CPE_ID_VENDOR = gnome
> +# We're patching gdk-pixbuf-loader/Makefile.am
> +LIBRSVG_AUTORECONF = YES
>  
>  ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
>  LIBRSVG_CONF_OPTS += --enable-introspection
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
