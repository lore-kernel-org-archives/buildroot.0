Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B01AAC00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 13:52:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E29360F9D;
	Mon, 15 Aug 2022 13:52:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E29360F9D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o39OdSLXyKc9; Mon, 15 Aug 2022 13:52:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54C3D60F93;
	Mon, 15 Aug 2022 13:52:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 54C3D60F93
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0F2181BF31B
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 13:52:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E810460F93
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 13:52:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E810460F93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8dk8uCzo_BGL for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 13:52:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED05E60E48
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ED05E60E48
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 13:52:05 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:c91d:14e3:a117:34c4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id D6B586012C;
 Mon, 15 Aug 2022 15:52:00 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 15 Aug 2022 15:52:00 +0200
Date: Mon, 15 Aug 2022 15:52:00 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220815135200.GA2854108@scaer>
References: <20220815132057.570981-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220815132057.570981-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1660571524;
 bh=uoGnKxj1IaT33PZ0u8Tdo8WMTmJycqivsttHF4YlEXo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FgEfEcXkrrhkxZ2q9VwDDR8AUXPeTKaCLDyr7sQzjtAEOaGnjbxvw+MdjlK6bI5KV
 LKZamlp0s6/VxpeBUywZEFNkwGKUNoE0BaBI7ntg6CUdtiHJ7ylc71UBoa/a0GwVsx
 zdFCigV9FUj4Hz4RFhaK9+EANee1SPBSKkpFQKvJJ9MWlVCYdWAMUxBz2s0jlWOn1D
 pGmAWYfPKWTLI6MtLfXDWdHbdGuontGJlMS4HbDXl+gX9uC8fR/NBhyQWL6/UTavO5
 NMcA0hbKGvRynmlEh6n1rz6osjYoe5e5vJ1V16sbD31qtrRs7z0SykPmiRA71ZfFZm
 KIlovhO0GtRKg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=FgEfEcXk
Subject: Re: [Buildroot] [PATCH 1/1] package/uacme: ualpn needs libopenssl
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

On 2022-08-15 15:20 +0200, Fabrice Fontaine spake thusly:
> ualpn is not compatible with libressl as stated by upstream in
> https://github.com/ndilieto/uacme/commit/32546c7caa1626bbef860cf81e53d10e29fca5cb
[--SNIP--]
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

There is something a little fishy in uacme, and the order it depends on
openssl, gnutls, mbedtls.

So, if both mbedtls and openssl are enabled, the above will not force
libopenssl, yet, openssl is used preferentially to mbedtls:

   18 ifeq ($(BR2_PACKAGE_GNUTLS),y)
   19 UACME_CONF_OPTS += --with-gnutls
   20 UACME_DEPENDENCIES += gnutls
   21 else ifeq ($(BR2_PACKAGE_OPENSSL),y)
   22 UACME_CONF_OPTS += --with-openssl
   23 UACME_DEPENDENCIES += openssl
   24 else ifeq ($(BR2_PACKAGE_MBEDTLS),y)
   25 UACME_CONF_OPTS += --with-mbedtls
   26 UACME_DEPENDENCIES += mbedtls
   27 endif

So, this is not correct, as this could still be using libressl.

I think the order in the .mk should be reversed, with openssl coming
after embedtls, so that the preference order is the same in the .mk and
it is in Config.in.

Regards,
Yann E. MORIN.

>  	help
>  	  Build and install ualpn, the transparent proxying tls-alpn-01
>  	  challenge responder.
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
