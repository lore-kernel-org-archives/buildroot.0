Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C83CC00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 19:31:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 23CFD4088B;
	Mon, 15 Aug 2022 19:31:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23CFD4088B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Py4p0ahU7LXC; Mon, 15 Aug 2022 19:31:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB61C4088A;
	Mon, 15 Aug 2022 19:31:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB61C4088A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 260D11BF38D
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 19:31:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C2FD4088A
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 19:31:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C2FD4088A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GTUbiTKzMC_D for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 19:31:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5AFB540873
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5AFB540873
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 19:31:38 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:c91d:14e3:a117:34c4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 63C6D60129;
 Mon, 15 Aug 2022 21:31:33 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 15 Aug 2022 21:31:33 +0200
Date: Mon, 15 Aug 2022 21:31:33 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220815193133.GJ2854108@scaer>
References: <20220815160124.5038-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220815160124.5038-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1660591896;
 bh=hUt6hJSWxeZKfWhy/x4x8pvBVSbb+G6xWQlfHjXLlkc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=U8NydJVu32ainvUIYgu+vGpnTD5aiufTVNpA5xgzbSDfge6fq7NzmJPlnotDdLMaC
 /wn+LQzwwWiFpKy4E8fD8FkjfcOmnnnEcBMopT+fJKc/Vz5YWim+yuJU0mXCd6ULwm
 aNyBwz9Pxb03W2oxSWAfNTo/kHF2FTVkXQFwV/fN+q5bfRRZAM2rt1FnLdMlt3siVY
 QoEJSQPP88t6S13PUklKzD0fxPzqg80JkaocYkrbr/dzuoe9ydCQ2Og+VTD551jtA6
 g5SMzbrTGL9rPZRWOmgd9o4XZ+y/WQvMVnZu8iITql6RtaV0ttasZ9TLMC/VB5dOj8
 0TuFSzgA8/L0w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=U8NydJVu
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/uacme: ualpn needs libopenssl
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
Cc: Nicola Di Lieto <nicola.dilieto@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-08-15 18:01 +0200, Fabrice Fontaine spake thusly:
> ualpn is not compatible with libressl as stated by upstream in
> https://github.com/ndilieto/uacme/commit/32546c7caa1626bbef860cf81e53d10e29fca5cb
> resulting in the following build failure:
> 
> ualpn.c: In function 'ssl_client_hello_cb':
> ualpn.c:2038:16: error: 'SSL_CLIENT_HELLO_RETRY' undeclared (first use in this function); did you mean 'SSL_F_CLIENT_HELLO'?
>  2038 |         return SSL_CLIENT_HELLO_RETRY;
>       |                ^~~~~~~~~~~~~~~~~~~~~~
>       |                SSL_F_CLIENT_HELLO
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/d7d49cfce6f99c59e99c8e15399164fd5ecacc21
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Yann E. Morin):
>  - Invert openssl and mbedtls order to avoid a build failure if libressl
>    and mbedtls are enabled at the same time

I've split that in two patches:
    package/uacme: fix crypto backend preference order
    package/uacme: ualpn needs libopenssl

... and wrote an analysis and a rationale for the first one.

Applied to master, thanks.

Regards,
Yann E. MORIN.

>  package/uacme/Config.in | 2 ++
>  package/uacme/uacme.mk  | 6 +++---
>  2 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/package/uacme/Config.in b/package/uacme/Config.in
> index 796f54754e..2c6864871c 100644
> --- a/package/uacme/Config.in
> +++ b/package/uacme/Config.in
> @@ -21,6 +21,8 @@ config BR2_PACKAGE_UACME_UALPN
>  	bool "enable ualpn"
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_PACKAGE_LIBEV
> +	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL \
> +		if !(BR2_PACKAGE_GNUTLS || BR2_PACKAGE_MBEDTLS)
>  	help
>  	  Build and install ualpn, the transparent proxying tls-alpn-01
>  	  challenge responder.
> diff --git a/package/uacme/uacme.mk b/package/uacme/uacme.mk
> index 2be96d534e..84e0105762 100644
> --- a/package/uacme/uacme.mk
> +++ b/package/uacme/uacme.mk
> @@ -18,12 +18,12 @@ UACME_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
>  ifeq ($(BR2_PACKAGE_GNUTLS),y)
>  UACME_CONF_OPTS += --with-gnutls
>  UACME_DEPENDENCIES += gnutls
> -else ifeq ($(BR2_PACKAGE_OPENSSL),y)
> -UACME_CONF_OPTS += --with-openssl
> -UACME_DEPENDENCIES += openssl
>  else ifeq ($(BR2_PACKAGE_MBEDTLS),y)
>  UACME_CONF_OPTS += --with-mbedtls
>  UACME_DEPENDENCIES += mbedtls
> +else ifeq ($(BR2_PACKAGE_OPENSSL),y)
> +UACME_CONF_OPTS += --with-openssl
> +UACME_DEPENDENCIES += openssl
>  endif
>  
>  ifeq ($(BR2_PACKAGE_UACME_UALPN),y)
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
