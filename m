Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A6A9C35274
	for <buildroot@archiver.kernel.org>; Mon, 18 Dec 2023 17:51:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BAFAA81A92;
	Mon, 18 Dec 2023 17:51:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BAFAA81A92
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qyCztkIqOyVa; Mon, 18 Dec 2023 17:51:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1120A81A4E;
	Mon, 18 Dec 2023 17:51:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1120A81A4E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8A82A1BF385
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 17:51:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 62FE460F23
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 17:51:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62FE460F23
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vQrJ-_ecMPdo for <buildroot@lists.busybox.net>;
 Mon, 18 Dec 2023 17:51:24 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0636960F1D
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 17:51:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0636960F1D
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id EEBF6B00579;
 Mon, 18 Dec 2023 18:51:17 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 18 Dec 2023 18:51:17 +0100
Date: Mon, 18 Dec 2023 18:51:17 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <ZYCGlXu0zryQD4x5@landeda>
References: <20231212205951.280961-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231212205951.280961-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1702921881;
 bh=Fe7dXG7Qby7iclbapfDtH3rr2zf4Uho3vU1TQ+T6lK8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=S2bBMFR9aQMf8OYoX4sKQ4CR04aMXqO79Gdv5eauG0QVOrDQWYE3t7uNNoT02wsnh
 fonBF9AO0PQzka0Y8ga4iygIg5Pv2T90Bb5t3V6mHrImMLaDsP8lwmbHDwYPJB0HLV
 pURMMPevlnQTgL3HPhFNQnMvK0cOyGVZhzxZfZN/2fEeVy8swzjBZZbNfC6vcwUUI6
 MW229I8Az7nW9/GIA8VUFqWtJatTBuG1cVz+LAYv2YaszeB7xZB4zzbjwQAfMd9/Pi
 3z0LPL6ZBXnCYkH5ABdgVkkfglGGvgoyt4w01FxEVdckXY6xbG3E35lxSP9OB6AFBe
 n9cfbaOXZhJnQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=S2bBMFR9
Subject: Re: [Buildroot] [PATCH v2,1/1] package/libldns: fix libressl build
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
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2023-12-12 21:59 +0100, Fabrice Fontaine spake thusly:
> Fix the following build failure raised since bump of libressl to version
> 3.8.2 in commit 21eca49ed5110872407b76ab9337d2877c4cda24:
> 
> ./keys.c:167:35: error: 'ENGINE_METHOD_ALL' undeclared (first use in this function)
>   167 |         if(!ENGINE_set_default(e, ENGINE_METHOD_ALL)) {
>       |                                   ^~~~~~~~~~~~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/37cc05b78a7004caa1b45d896121f059a4f8ca00
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2 (after review of Yann E. Morin):
>  - Disable gost without engines instead of patching code
> 
>  package/libldns/libldns.mk | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/package/libldns/libldns.mk b/package/libldns/libldns.mk
> index 06564e3d9f..d6af6a2b97 100644
> --- a/package/libldns/libldns.mk
> +++ b/package/libldns/libldns.mk
> @@ -17,7 +17,6 @@ LIBLDNS_CONF_OPTS = \
>  	--with-ssl=$(STAGING_DIR)/usr \
>  	--enable-dane \
>  	--enable-ecdsa \
> -	--enable-gost \
>  	--enable-sha2 \
>  	--without-examples \
>  	--without-p5-dns-ldns \
> @@ -30,6 +29,12 @@ else
>  LIBLDNS_CONF_OPTS += --disable-dane-verify
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LIBOPENSSL_ENGINES),y)
> +LIBLDNS_CONF_OPTS += --enable-gost
> +else
> +LIBLDNS_CONF_OPTS += --disable-gost
> +endif
> +
>  ifeq ($(BR2_STATIC_LIBS),y)
>  LIBLDNS_DEPENDENCIES += host-pkgconf
>  # missing -lz breaks configure, add it using pkgconf
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
