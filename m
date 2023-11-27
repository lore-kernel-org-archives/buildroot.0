Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0347C4167B
	for <buildroot@archiver.kernel.org>; Mon, 27 Nov 2023 16:40:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37E8B405C7;
	Mon, 27 Nov 2023 16:40:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37E8B405C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xZkw-0POOGCh; Mon, 27 Nov 2023 16:40:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6657D405D8;
	Mon, 27 Nov 2023 16:40:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6657D405D8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E7CCD1BF405
 for <buildroot@lists.busybox.net>; Mon, 27 Nov 2023 16:40:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B9815405D8
 for <buildroot@lists.busybox.net>; Mon, 27 Nov 2023 16:40:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9815405D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ht8KFZbJgGvw for <buildroot@lists.busybox.net>;
 Mon, 27 Nov 2023 16:40:20 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BEE46405C7
 for <buildroot@buildroot.org>; Mon, 27 Nov 2023 16:40:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BEE46405C7
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:7618:50d5:c153:9a40])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 53F8EB0056A;
 Mon, 27 Nov 2023 17:40:14 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 27 Nov 2023 17:40:14 +0100
Date: Mon, 27 Nov 2023 17:40:14 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231127164014.GR3177259@scaer>
References: <20231126224849.321916-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231126224849.321916-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1701103217;
 bh=srtGOvFqbD7eKNye9Wnt4+ry+OAOqBKLMNSN8T9YLWE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ns9Zn6BlEGMLsu90GY5MekxiE2h7zVP5E84bl+rjqwFUFVSasfxEOHkazhxi9LeIA
 6K7cptQTdhGNjUGO9MD2ErY/PNUMV9ey2ONIIzHSPnRcUiAyBU8cdtU0LP1QDbiGBo
 mYSvu8F6KVctm+bPWUJbQ/ke9imr0Hfoe6uBj6e/VrTakFykj1fNaHLlS4+D/KBXtm
 gbDRXTUhAoBZtehYBJrN+8mSWWLXR59uX0zbTOIHf7SFg23e3l7wFNu2flip0xew60
 r93+BXj6zLO4WEFjZM+hGsg7rmWTgW4CKzx4rI/HgJXkkVDRaYRvb/jE03wuV15G6c
 +xrH5h9J7h3Xg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ns9Zn6Bl
Subject: Re: [Buildroot] [PATCH 1/1] package/libldns: fix libressl build
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

On 2023-11-26 23:48 +0100, Fabrice Fontaine spake thusly:
> Fix the following build failure raised since bump of libressl to version
> 3.8.2 in commit 21eca49ed5110872407b76ab9337d2877c4cda24:
> 
> ./keys.c:167:35: error: 'ENGINE_METHOD_ALL' undeclared (first use in this function)
>   167 |         if(!ENGINE_set_default(e, ENGINE_METHOD_ALL)) {
>       |                                   ^~~~~~~~~~~~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/37cc05b78a7004caa1b45d896121f059a4f8ca00

Rather than patch, can we just disable it for libressl:

    diff --git a/package/libldns/libldns.mk b/package/libldns/libldns.mk
    index 06564e3d9f..d6af6a2b97 100644
    --- a/package/libldns/libldns.mk
    +++ b/package/libldns/libldns.mk
    @@ -17,7 +17,6 @@ LIBLDNS_CONF_OPTS = \
     	--with-ssl=$(STAGING_DIR)/usr \
     	--enable-dane \
     	--enable-ecdsa \
    -	--enable-gost \
     	--enable-sha2 \
     	--without-examples \
     	--without-p5-dns-ldns \
    @@ -30,6 +29,12 @@ else
     LIBLDNS_CONF_OPTS += --disable-dane-verify
     endif
     
    +ifeq ($(BR2_PACKAGE_LIBOPENSSL_ENGINES),y)
    +LIBLDNS_CONF_OPTS += --enable-gost
    +else
    +LIBLDNS_CONF_OPTS += --disable-gost
    +endif
    +
     ifeq ($(BR2_STATIC_LIBS),y)
     LIBLDNS_DEPENDENCIES += host-pkgconf
     # missing -lz breaks configure, add it using pkgconf

Note: the condition on libopenssl-engines if outside the condition on
libopenssl, so that we have a --disable-gost even when libopenssl is not
enabled.

Regards,
Yann E. MORIN.

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...keys.c-fix-build-with-libressl-3.8.1.patch | 40 +++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 package/libldns/0001-keys.c-fix-build-with-libressl-3.8.1.patch
> 
> diff --git a/package/libldns/0001-keys.c-fix-build-with-libressl-3.8.1.patch b/package/libldns/0001-keys.c-fix-build-with-libressl-3.8.1.patch
> new file mode 100644
> index 0000000000..c385cc44b9
> --- /dev/null
> +++ b/package/libldns/0001-keys.c-fix-build-with-libressl-3.8.1.patch
> @@ -0,0 +1,40 @@
> +From 681cb309620e44d3d4d96494554e19bcab0b6f9d Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Sun, 26 Nov 2023 23:38:14 +0100
> +Subject: [PATCH] keys.c: fix build with libressl >= 3.8.1
> +
> +libressl >= 3.8.1 removed ENGINE support:
> +"ENGINE support was removed and OPENSSL_NO_ENGINE is set. In spite
> +of this, some stub functions are provided to avoid patching some
> +applications that do not honor OPENSSL_NO_ENGINE."
> +resulting in the following build failure with gost:
> +
> +./keys.c:167:35: error: 'ENGINE_METHOD_ALL' undeclared (first use in this function)
> +  167 |         if(!ENGINE_set_default(e, ENGINE_METHOD_ALL)) {
> +      |                                   ^~~~~~~~~~~~~~~~~
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/37cc05b78a7004caa1b45d896121f059a4f8ca00
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Upstream: https://github.com/NLnetLabs/ldns/pull/227
> +---
> + keys.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/keys.c b/keys.c
> +index 78bea972..59de186e 100644
> +--- a/keys.c
> ++++ b/keys.c
> +@@ -132,7 +132,7 @@ ldns_key_new_frm_engine(ldns_key **key, ENGINE *e, char *key_id, ldns_algorithm
> + }
> + #endif
> + 
> +-#ifdef USE_GOST
> ++#if defined(USE_GOST) && !defined(OPENSSL_NO_ENGINE)
> + /** store GOST engine reference loaded into OpenSSL library */
> + ENGINE* ldns_gost_engine = NULL;
> + 
> +-- 
> +2.42.0
> +
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
