Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC3D3C001E0
	for <buildroot@archiver.kernel.org>; Wed,  2 Aug 2023 20:34:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 71F24611D1;
	Wed,  2 Aug 2023 20:34:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 71F24611D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Aqt9py_3zsmc; Wed,  2 Aug 2023 20:34:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8416E611FB;
	Wed,  2 Aug 2023 20:34:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8416E611FB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 12E4E1BF30F
 for <buildroot@lists.busybox.net>; Wed,  2 Aug 2023 20:34:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AEE3E41588
 for <buildroot@lists.busybox.net>; Wed,  2 Aug 2023 20:33:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AEE3E41588
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aopt5Kz-ejMh for <buildroot@lists.busybox.net>;
 Wed,  2 Aug 2023 20:33:44 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5B93A4157E
 for <buildroot@buildroot.org>; Wed,  2 Aug 2023 20:33:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B93A4157E
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:79c1:a9ed:b3cf:6f2])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 1D4012003EF;
 Wed,  2 Aug 2023 22:33:38 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 02 Aug 2023 22:33:38 +0200
Date: Wed, 2 Aug 2023 22:33:38 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Maxim Kochetkov <fido_max@inbox.ru>
Message-ID: <20230802203338.GJ421096@scaer>
References: <20230313050938.9860-1-fido_max@inbox.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230313050938.9860-1-fido_max@inbox.ru>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1691008421;
 bh=q5rf8VgVZQzMrMqtwHBUp/89D5q+99Hm2JT1ZNiPdRE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Sa+PQrljarJnb2KXUNe+09pq0ZwUlOtFrJQk9OO8jq/4Z4vSKKvHh1k6vbYeT5+U3
 nHikexHqxPOXIKoVMB2VUKj5SYXRyy5XZkO1K407gr/lBYeQYDZVtuhPlnOBasAtjA
 4lO+Sk/gDMZBCzz9rQRYSTQviIG20TTKd3Gyxs61gyPiKacp3VJdULdwOforfRZuJ2
 FoJi4DFbco7qJti6597Q41rALDnkvU3GG2/n+ES5eTTtZyM52c05AKXarxJ5A0qQy0
 bcSy2zzjDoh9yfOoMSiCsbZ520fkwWgDDkLoKq7Nl35G2Q+bMoM5aDqtpnM8oeuPkV
 StRSiaQ1Dbcog==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Sa+PQrlj
Subject: Re: [Buildroot] [PATCH v3 1/1] package/gdal: bump version to 3.6.2
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

Maxim, All,

I've already applied this patch, but please see below...

On 2023-03-13 08:09 +0300, Maxim Kochetkov via buildroot spake thusly:
> Release notes: https://github.com/OSGeo/gdal/blob/v3.6.2/NEWS.md
> License changes: https://github.com/OSGeo/gdal/commit/a394f9cb299b2c3c2159098483d1fece3a464fda
> 
> ISC License is added for FlatGeobuf and Flatbush
> Apache-2.0 is added for flatbuffers
> 
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
[--SNIP--]
> diff --git a/package/gdal/gdal.mk b/package/gdal/gdal.mk
> index a3b11c53af..ce67399c32 100644
> --- a/package/gdal/gdal.mk
> +++ b/package/gdal/gdal.mk
> @@ -4,10 +4,10 @@
>  #
>  ################################################################################
>  
> -GDAL_VERSION = 3.5.2
> +GDAL_VERSION = 3.6.2

There is a comment a few lines below, which I'll reproduce there:

   17 # Using 'make' with CMake's Makefile generator will not work, as
   18 # 'make' uses GNUmakefile first, but GNUmakefile is provided by
   19 # autotools in gdal. We need to force 'make' to use the Makefile,
   20 # which is generated by CMake. GNUmakefile and autoconf are dropped in
   21 # 3.6 so this can be dropped in future version.
   22 GDAL_MAKE_OPTS += -f Makefile

That was added by you in 2b43579e9453 (package/gdal: switch to cmake
build to fix libgeotiff detection).

Can you check what to do: either the comment ir correct, and the
GDAL_MAKE_OPTS should be removed (with the comment), or the comment is
wrong and it must be updated.

Thanks!

Regards,
Yann E. MORIN.

>  GDAL_SITE = https://download.osgeo.org/gdal/$(GDAL_VERSION)
>  GDAL_SOURCE = gdal-$(GDAL_VERSION).tar.xz
> -GDAL_LICENSE = MIT, many others
> +GDAL_LICENSE = Apache-2.0, ISC, MIT, many others
>  GDAL_LICENSE_FILES = LICENSE.TXT
>  GDAL_CPE_ID_VENDOR = osgeo
>  GDAL_INSTALL_STAGING = YES
> -- 
> 2.39.2
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
