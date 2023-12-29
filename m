Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17674C46CD4
	for <buildroot@archiver.kernel.org>; Fri, 29 Dec 2023 21:23:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B5A0443549;
	Fri, 29 Dec 2023 21:23:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B5A0443549
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xNaPwVOQ3uMa; Fri, 29 Dec 2023 21:23:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 78D05435F9;
	Fri, 29 Dec 2023 21:23:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 78D05435F9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 548FE1BF288
 for <buildroot@lists.busybox.net>; Fri, 29 Dec 2023 21:23:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3A88583521
 for <buildroot@lists.busybox.net>; Fri, 29 Dec 2023 21:23:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A88583521
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kx8KYF4-GY1Z for <buildroot@lists.busybox.net>;
 Fri, 29 Dec 2023 21:23:50 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1BBDD83518
 for <buildroot@buildroot.org>; Fri, 29 Dec 2023 21:23:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1BBDD83518
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 1A429B00535;
 Fri, 29 Dec 2023 22:23:45 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 29 Dec 2023 22:23:44 +0100
Date: Fri, 29 Dec 2023 22:23:44 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <ZY844BO8q9TJOtzs@landeda>
References: <20231227100158.124316-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231227100158.124316-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1703885028;
 bh=jRJTIH6/3lPbzbwEZ2/FjNHMYf1bE+94vr1Ko24nZww=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JYlpTiFBLGnN/1XUHlBD8xU2qFLwDlLQLO82Z8Eh0vs5dO3FXCxFOjg85kifjL5F3
 wmmmWsBTOrC3NplTONao0VaEz6UrBgrHpWsSIRRDh2gHThwJIGu7dD1SEvNsc0EIfh
 GVYmALLzF09mptAeTN9y//oSlCfyKAmlMckX8y7T4zwdOaseN+vxJXMzLVcQQ568x8
 R+qYag05+kPLPrWY48D6xEq2ZgWABrlTjyRZ9Scv3XuLG8zi3NbUVk0H1ZZ5JUflRj
 3Py4ZCMzkS8oCviKJ9iGr3zOUnvMf3EMESzVRBvMo2NbLOwPVGnRzQw2pulg9fXfoC
 Ik/r8Zp0klRdA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=JYlpTiFB
Subject: Re: [Buildroot] [PATCH 1/2] package/gssdp: bump to version 1.6.3
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
Cc: Rahul Bedarkar <rahulbedarkar89@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2023-12-27 11:01 +0100, Fabrice Fontaine spake thusly:
> - libsoup has been replaced by libsoup3 with
>   https://gitlab.gnome.org/GNOME/gssdp/-/commit/e223e6f75e370c3d9b2b402586521fe005f1a0da
> - Disable manpages which are enabled by default since their addition:
>   https://gitlab.gnome.org/GNOME/gssdp/-/commit/1970906319eefa0bf48553e60ee67b5a75b9e1c5
> 
> https://gitlab.gnome.org/GNOME/gssdp/-/blob/gssdp-1.6.3/NEWS
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/gssdp/Config.in  | 8 ++++----
>  package/gssdp/gssdp.hash | 4 ++--
>  package/gssdp/gssdp.mk   | 9 +++++----
>  3 files changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/package/gssdp/Config.in b/package/gssdp/Config.in
> index 80c5edfffc..5a9317f486 100644
> --- a/package/gssdp/Config.in
> +++ b/package/gssdp/Config.in
> @@ -1,10 +1,10 @@
>  config BR2_PACKAGE_GSSDP
>  	bool "gssdp"
> -	depends on BR2_USE_WCHAR # glib2, libsoup
> -	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2, libsoup
> -	depends on BR2_USE_MMU # glib2, libsoup
> +	depends on BR2_USE_WCHAR # glib2, libsoup3
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2, libsoup3
> +	depends on BR2_USE_MMU # glib2, libsoup3
>  	select BR2_PACKAGE_LIBGLIB2
> -	select BR2_PACKAGE_LIBSOUP
> +	select BR2_PACKAGE_LIBSOUP3
>  	help
>  	  GSSDP implements resource discovery and announcement over
>  	  SSDP.
> diff --git a/package/gssdp/gssdp.hash b/package/gssdp/gssdp.hash
> index 34ccfa8044..06bf51090f 100644
> --- a/package/gssdp/gssdp.hash
> +++ b/package/gssdp/gssdp.hash
> @@ -1,5 +1,5 @@
> -# Hash from: https://download.gnome.org/sources/gssdp/1.4/gssdp-1.4.0.1.sha256sum:
> -sha256  8676849d57fb822b8728856dbadebf3867f89ee47a0ec47a20045d011f431582  gssdp-1.4.0.1.tar.xz
> +# Hash from: https://download.gnome.org/sources/gssdp/1.6/gssdp-1.6.3.sha256sum:
> +sha256  2fedb5afdb22cf14d5498a39a773ca89788a250fcf70118783df821e1f3f3446  gssdp-1.6.3.tar.xz
>  
>  # Hash for license file:
>  sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
> diff --git a/package/gssdp/gssdp.mk b/package/gssdp/gssdp.mk
> index f7ebb44acd..b512ace6d5 100644
> --- a/package/gssdp/gssdp.mk
> +++ b/package/gssdp/gssdp.mk
> @@ -4,15 +4,16 @@
>  #
>  ################################################################################
>  
> -GSSDP_VERSION_MAJOR = 1.4
> -GSSDP_VERSION = $(GSSDP_VERSION_MAJOR).0.1
> +GSSDP_VERSION_MAJOR = 1.6
> +GSSDP_VERSION = $(GSSDP_VERSION_MAJOR).3
>  GSSDP_SOURCE = gssdp-$(GSSDP_VERSION).tar.xz
>  GSSDP_SITE = https://download.gnome.org/sources/gssdp/$(GSSDP_VERSION_MAJOR)
>  GSSDP_LICENSE = LGPL-2.1+
>  GSSDP_LICENSE_FILES = COPYING
>  GSSDP_INSTALL_STAGING = YES
> -GSSDP_DEPENDENCIES = host-pkgconf libglib2 libsoup
> -GSSDP_CONF_OPTS = -Dexamples=false -Dgtk_doc=false -Dsniffer=false
> +GSSDP_DEPENDENCIES = host-pkgconf libglib2 libsoup3
> +GSSDP_CONF_OPTS = \
> +	-Dexamples=false -Dgtk_doc=false -Dmanpages=false -Dsniffer=false

An assignment that does not fit on a single line should be split with
one item per line.

Applied to master with the above fixed, thanks.

Regards,
Yann E. MORIN.

>  ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
>  GSSDP_CONF_OPTS += -Dintrospection=true -Dvapi=true
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
