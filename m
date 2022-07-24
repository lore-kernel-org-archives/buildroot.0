Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C47DC433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 15:11:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0B8A740C4C;
	Sun, 24 Jul 2022 15:11:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B8A740C4C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id abn9mkMR3_fN; Sun, 24 Jul 2022 15:11:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 099684053C;
	Sun, 24 Jul 2022 15:11:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 099684053C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2A9001BF282
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 15:11:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1368382CA3
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 15:11:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1368382CA3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3hTGKSXRQWe5 for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 15:11:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0996480DE9
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0996480DE9
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 15:11:43 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8acf:5600:88cd:5a50:8d8a:801])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 07A5913F84C;
 Sun, 24 Jul 2022 17:11:39 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 24 Jul 2022 17:11:39 +0200
Date: Sun, 24 Jul 2022 17:11:39 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
Message-ID: <20220724151139.GX2641@scaer>
References: <20220724144318.653289-1-aleksandr.o.makarov@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220724144318.653289-1-aleksandr.o.makarov@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658675502;
 bh=8Ez43/f6S85Nfho3HgwWtoH/A2K3F8lCbIIAlm1koMA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TMdVBcbuf3tHNutrcr8oF4zapk++8srXOzLM5zvvmgoax69FUB+O9c48tY7CIz6L9
 SCOUrJ67J3CwoGugap8qFhSj2s8Tq65XQHyFdapwX8E9j5uvO2XzdFimoPKFiUxdHO
 0+XWfSI/cami+JK3bXTBtOJ31/xnehWMyiMfK1MuOZqB6NKqAmMePOroienGNc4ZFL
 Qfv4lH08v4Y6co7ebgzOsTGr1+BPOQPZ/QUSgRN5QJqDwK3t23x4cIQYyRCFI4J6W1
 MnN3jkXF+60j3lnUI+I6tVnu3J03OhbTyS/p2FWu6vq1+L3/r2mgFII87cxxb4opJH
 j+u6Lz+RAk/CA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=TMdVBcbu
Subject: Re: [Buildroot] [PATCH v3 1/2] package/libest: auto-select safeclib
 to avoid use of bundled copy of library
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

Aleksandr, All,

On 2022-07-24 17:43 +0300, Aleksandr Makarov spake thusly:
> Support for libsafec can not be completely disabled - currently,
> --disable-safec does not exactly allow for compiling libest on
> systems without libsafec, but instead just uses bundled copy of
> library from safe_c_stub/
> 
> To avoid that, do automatically select the full-featured safeclib
> package and always use --with-system-libsafec
> 
> Signed-off-by: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>

Thanks for the fast respin. Series of two patches applied to master,
thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libest/Config.in |  1 +
>  package/libest/libest.mk | 14 +++++---------
>  2 files changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/package/libest/Config.in b/package/libest/Config.in
> index 6abe9d2848..bd5f40afae 100644
> --- a/package/libest/Config.in
> +++ b/package/libest/Config.in
> @@ -7,6 +7,7 @@ config BR2_PACKAGE_LIBEST
>  	select BR2_PACKAGE_LIBEXECINFO if !BR2_TOOLCHAIN_USES_GLIBC
>  	select BR2_PACKAGE_OPENSSL
>  	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
> +	select BR2_PACKAGE_SAFECLIB
>  	help
>  	  libest is a C implementation of RFC 7030 (Enrollment over
>  	  Secure Transport).
> diff --git a/package/libest/libest.mk b/package/libest/libest.mk
> index d9f3cf87bc..0dd3e7d0e4 100644
> --- a/package/libest/libest.mk
> +++ b/package/libest/libest.mk
> @@ -12,14 +12,17 @@ LIBEST_LICENSE = BSD-3-Clause, MIT, W3C
>  LIBEST_LICENSE_FILES = LICENSE
>  LIBEST_INSTALL_STAGING = YES
>  LIBEST_AUTORECONF = YES
> -LIBEST_DEPENDENCIES = openssl host-pkgconf
> +LIBEST_DEPENDENCIES = openssl host-pkgconf safeclib
>  # libcoap support is explicitly disabled because it breaks the build
> +# libsafec support is explicitly enabled because we want to avoid
> +# possible hidden use of bundled copy of library.
>  LIBEST_CONF_OPTS = \
>  	--with-ssl-dir=$(STAGING_DIR)/usr \
>  	$(if $(BR2_TOOLCHAIN_HAS_THREADS),--enable-pthreads,--disable-pthreads) \
>  	$(if $(BR2_PACKAGE_LIBEST_BRSKI),--enable-brski,--disable-brski) \
>  	--disable-examples \
> -	--without-libcoap-dir
> +	--without-libcoap-dir \
> +	--with-system-libsafec
>  
>  ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
>  LIBEST_DEPENDENCIES += libexecinfo
> @@ -55,13 +58,6 @@ else
>  LIBEST_CONF_OPTS += --without-uriparser-dir
>  endif
>  
> -ifeq ($(BR2_PACKAGE_SAFECLIB),y)
> -LIBEST_CONF_OPTS += --with-system-libsafec
> -LIBEST_DEPENDENCIES += safeclib
> -else
> -LIBEST_CONF_OPTS += --without-system-libsafec
> -endif
> -
>  define LIBEST_INSTALL_PC
>  	$(INSTALL) -c -m 0644 $(LIBEST_PKGDIR)/libest.pc \
>  		$(STAGING_DIR)/usr/lib/pkgconfig/libest.pc
> -- 
> 2.36.1
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
