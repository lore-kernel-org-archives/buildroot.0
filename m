Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5596C433EF
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 19:50:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32B7160B24;
	Sun, 17 Jul 2022 19:50:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32B7160B24
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eNHo2O-J369s; Sun, 17 Jul 2022 19:50:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C36A60A8D;
	Sun, 17 Jul 2022 19:50:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C36A60A8D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 14C621BF255
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 19:50:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E362560A8D
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 19:50:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E362560A8D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nRrVnzJW1ZOo for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 19:50:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C273F607B5
Received: from mail.tkos.co.il (guitar.tkos.co.il [84.110.109.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C273F607B5
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 19:50:29 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 7D1444403CD;
 Sun, 17 Jul 2022 22:50:02 +0300 (IDT)
References: <20220717193719.2429999-1-yann.morin.1998@free.fr>
User-agent: mu4e 1.8.5; emacs 27.1
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Sun, 17 Jul 2022 22:41:11 +0300
In-reply-to: <20220717193719.2429999-1-yann.morin.1998@free.fr>
Message-ID: <87lesry0vz.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1658087402;
 bh=ukVdWcnmUp4aSRVtcA8rtRoXmDVRh6t2ZoMKoH7K4zk=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=BJYk/z3HA3a9Qjhx7Eacqv6PzsuTEAEo2ByfNPhWr9GANh80yQqmi+fyry3rtl+Ay
 ndT1IEGx9sQzupqOZlD2sL0MeutSpX/RbFt/F4YwQtmG2lC+vdJB7L4+HZ3s8hNpQP
 8Kgo3lg6FC1QHYAXc2dEYEqAfXeMNA6swOTrh8h6u/wYexEcs5UdXchKrYrWPconEb
 ngOapzyNO6siaw8RgHl3auXpirUB1yjXHmSnl9ytSzuIqbKLWVGt3vEsNLskNsRcf4
 EBkPYhmGCEi7jwoUsUlt59QauWivBtE4j8zQMH65vmouyCM/KVwv5++zp6PwEj3rCN
 X47NdpEh5oJ5A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=BJYk/z3H
Subject: Re: [Buildroot] [PATCHv4] package/uacme: requires TLS support in
 libcurl
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: Nicola Di Lieto <nicola.dilieto@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

On Sun, Jul 17 2022, Yann E. MORIN wrote:
> From: Baruch Siach <baruch@tkos.co.il>
>
> uacme configure script fails when libcurl does not support TLS. This
> means that BR2_PACKAGE_LIBCURL_TLS_NONE is incompatible with uacme.
>
> Add a kconfig knob to libcurl so that no_TLS is not an option. Select
> that from uacme.

Looks much more elegant. Thanks.

Some comments below.

> Fixes:
> http://autobuild.buildroot.net/results/4e16f1d958ac3d30e26e7f17bdffc47834b0e2bd/
> http://autobuild.buildroot.net/results/4e16f1d958ac3d30e26e7f17bdffc47834b0e2bd/
> http://autobuild.buildroot.net/results/25280409b32282b4dd40b1e88127051439380f3d/
>
> Cc: Nicola Di Lieto <nicola.dilieto@gmail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> [yann.morin.1998@free.fr:
>   - keep the current forward select
>   - add the kconfig knob
> ]
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
>
> ---
> v4 (Yann E. MORIN)
>   Restore forward select
>   Add the force-ssl-tls kconfig knob; use it from uacme
>
> v3:
>   Move comments up to fix suboption indentation (Yann)
>   Add missing MMU comment dependency (Yann)
>
> v2:
>   Add dependency on crypto back end for uacme itself (Nicola Di Lieto)
> ---
>  package/libcurl/Config.in | 5 +++++
>  package/uacme/Config.in   | 1 +
>  2 files changed, 6 insertions(+)
>
> diff --git a/package/libcurl/Config.in b/package/libcurl/Config.in
> index 3381decca8..a3148e086d 100644
> --- a/package/libcurl/Config.in
> +++ b/package/libcurl/Config.in
> @@ -45,6 +45,10 @@ config BR2_PACKAGE_LIBCURL_EXTRA_PROTOCOLS_FEATURES
>  	  - DICT
>  	  - Gopher
>  
> +# Packages must select that if they require a SSL/TLS-enabled libcurl

Said package must also select one of the crypto back ends that libcurl
supports. This part is somewhat fragile as libcurl might remove support
for any given back end like it recently did for NSS.

> +config BR2_PACKAGE_LIBCURL_FORCE_SSL_TLS

[Bikeshed] Why not just BR2_PACKAGE_LIBCURL_FORCE_TLS ?

baruch

> +	bool
> +
>  choice
>  	prompt "SSL/TLS library to use"
>  
> @@ -77,6 +81,7 @@ comment "WolfSSL needs a toolchain w/ dynamic library"
>  
>  config BR2_PACKAGE_LIBCURL_TLS_NONE
>  	bool "None"
> +	depends on !BR2_PACKAGE_LIBCURL_FORCE_SSL_TLS
>  
>  endchoice
>  
> diff --git a/package/uacme/Config.in b/package/uacme/Config.in
> index 58b7c534e7..1458e74d28 100644
> --- a/package/uacme/Config.in
> +++ b/package/uacme/Config.in
> @@ -3,6 +3,7 @@ config BR2_PACKAGE_UACME
>  	depends on BR2_USE_MMU # fork()
>  	select BR2_PACKAGE_OPENSSL if !(BR2_PACKAGE_GNUTLS || BR2_PACKAGE_MBEDTLS)
>  	select BR2_PACKAGE_LIBCURL
> +	select BR2_PACKAGE_LIBCURL_FORCE_SSL_TLS
>  	help
>  	  uacme is a client for the ACMEv2 protocol described in
>  	  RFC8555, written in plain C with minimal dependencies


-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
