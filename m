Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 066B8C433F5
	for <buildroot@archiver.kernel.org>; Thu, 12 May 2022 20:53:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB8DD41739;
	Thu, 12 May 2022 20:53:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SkPwOE7aNYQp; Thu, 12 May 2022 20:53:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1BF1E4174F;
	Thu, 12 May 2022 20:53:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 967501BF9CB
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 20:52:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 846228264A
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 20:52:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RfobQN85yPlm for <buildroot@lists.busybox.net>;
 Thu, 12 May 2022 20:52:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4C8B2825C6
 for <buildroot@buildroot.org>; Thu, 12 May 2022 20:52:38 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ccab:5af8:e14c:c986])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 6514419F593;
 Thu, 12 May 2022 22:52:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1652388755;
 bh=0Y8A5hEb04vNEfv4pmaAwoHziyuvMMoWZep8Nh/xM9E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Cl6Orl6YMjPXe0WLZ8reQMRZg205nZZMclQs7qCx3oD+xluKN5t9MCkgZPcjTGdf9
 nHh8AyxObAAg5/72Dv0hutL6A7OxjobX7Hif8ugMYmciesxZJhi2FZEHq/KkjDoGhh
 U9S1U4zFc827a7NDgGwcWouU2OkiyMhoLYU3lx7rVyGhvLnvzev5ckvFsHexAVukWQ
 upjL3UB2MBkidiHILffzzo0M6Zuem5gFN6QaZsb5ZDR+ep8IR8jPLHxb15sN6Zn9Lh
 ma9mTop62otSwyRRA8q4hLan4BMvBWZdllK/ibF3BDNNkswWTMVYkjYPBFOx5QkF4e
 ovlRcxvHTP44w==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 12 May 2022 22:52:32 +0200
Date: Thu, 12 May 2022 22:52:32 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
Message-ID: <20220512205232.GJ1597494@scaer>
References: <20220512160116.2011627-1-arnout@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220512160116.2011627-1-arnout@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/5] package/gnutls: disable library search
 in /usr/lib
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
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Arnout, All,

On 2022-05-12 18:01 +0200, Arnout Vandecappelle (Essensium/Mind) spake thusly:
> gnutls's configure script has a weird approach where it first searches
> for dependent libraries in the path specified by --prefix, before
> searching in the default search path. Since we set --prefix to /usr,
> and it doesn't take into account DESTDIR (which is anyway not set at
> configure time), that means it will first search /usr/lib before
> searching $(STAGING_DIR)/usr/lib.
> 
> Ideally, this would be fixed in the configure script itself. However,
> the m4 file that does this is pretty complex, it's not immediately clear
> where to add $DESTDIR. In addition it comes from gnulib which is a
> somewhat annoying upstream.
> 
> Therefore, instead, bypass the prefix lookup with
> --without-libfoo-prefix. Note that we could set
> --with-libfoo-prefix=$(STAGING_DIR)/usr (the latter is already done for
> librt and libpthread), but that's pretty pointless -
> --without-libfoo-prefix in fact reverts to what should have been done in
> the first place, i.e. use the toolchain search path.
> 
> Add --without-libfoo-prefix for all options defined in configure (found
> with ./configure --help | grep without-.*-prefix). Most of these are
> only used in tests (e.g. libcrypto) or even not at all (e.g. libiconv),
> but it's fairly hard to discover this and to be sure that they are
> indeed not needed, so better pass all of them.
> 
> Remove the now-redundant arguments for librt and libpthread.
> 
> Add a comment to remind people to revisit these when bumping the
> version.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> This is for stable, but need to check if the same prefix options exist
> in 3.7.3.
> ---
>  package/gnutls/gnutls.mk | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
> index 0e461cd44c..b5503b1fc9 100644
> --- a/package/gnutls/gnutls.mk
> +++ b/package/gnutls/gnutls.mk
> @@ -4,6 +4,7 @@
>  #
>  ################################################################################
>  
> +# When bumping, make sure *all* --without-libfoo-prefix options are in GNUTLS_CONF_OPTS
>  GNUTLS_VERSION_MAJOR = 3.7
>  GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).4
>  GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
> @@ -26,7 +27,15 @@ GNUTLS_CONF_OPTS = \
>  	--disable-tests \
>  	--enable-local-libopts \
>  	--enable-openssl-compatibility \
> -	--with-librt-prefix=$(STAGING_DIR) \
> +	--without-libcrypto-prefix \
> +	--without-libdl-prefix \
> +	--without-libev-prefix \
> +	--without-libiconv-prefix \
> +	--without-libintl-prefix \
> +	--without-libpthread-prefix \
> +	--without-libseccomp-prefix \
> +	--without-librt-prefix \
> +	--without-libz-prefix \
>  	--without-tpm \
>  	$(if $(BR2_PACKAGE_GNUTLS_OPENSSL),--enable,--disable)-openssl-compatibility \
>  	$(if $(BR2_PACKAGE_GNUTLS_TOOLS),--enable-tools,--disable-tools) \
> @@ -39,9 +48,6 @@ GNUTLS_CONF_ENV = gl_cv_socket_ipv6=yes \
>  	gl_cv_func_gettimeofday_clobber=no
>  GNUTLS_INSTALL_STAGING = YES
>  
> -# libpthread autodetection poison the linkpath
> -GNUTLS_CONF_OPTS += $(if $(BR2_TOOLCHAIN_HAS_THREADS),--with-libpthread-prefix=$(STAGING_DIR)/usr)
> -
>  # gnutls needs libregex, but pcre can be used too
>  # The check isn't cross-compile friendly
>  GNUTLS_CONF_ENV += libopts_cv_with_libregex=yes
> @@ -70,7 +76,6 @@ GNUTLS_CONF_OPTS += --without-p11-kit
>  endif
>  
>  ifeq ($(BR2_PACKAGE_LIBUNISTRING),y)
> -GNUTLS_CONF_OPTS += --with-libunistring-prefix=$(STAGING_DIR)/usr
>  GNUTLS_DEPENDENCIES += libunistring
>  else
>  GNUTLS_CONF_OPTS += --with-included-unistring
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
