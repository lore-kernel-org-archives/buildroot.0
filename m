Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 134E7ECAAD2
	for <buildroot@archiver.kernel.org>; Sun, 28 Aug 2022 10:18:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 93B19404D0;
	Sun, 28 Aug 2022 10:18:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 93B19404D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8MBxtAnsUiAs; Sun, 28 Aug 2022 10:18:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ADCF340465;
	Sun, 28 Aug 2022 10:18:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ADCF340465
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 88CAE1BF5AA
 for <buildroot@lists.busybox.net>; Sun, 28 Aug 2022 10:18:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6469B605B0
 for <buildroot@lists.busybox.net>; Sun, 28 Aug 2022 10:18:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6469B605B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0iCCk-jB1XlK for <buildroot@lists.busybox.net>;
 Sun, 28 Aug 2022 10:18:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 50005605B1
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 50005605B1
 for <buildroot@buildroot.org>; Sun, 28 Aug 2022 10:18:43 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:e2dc:5f1b:7f23:232])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 7D761780516;
 Sun, 28 Aug 2022 12:18:39 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 28 Aug 2022 12:18:39 +0200
Date: Sun, 28 Aug 2022 12:18:39 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220828101839.GO37358@scaer>
References: <20220827210028.308523-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220827210028.308523-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661681921;
 bh=HD8zLqjnw/caUMW3CFpxmnd8fllIK1eWZ5Zsnf3MAlk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=o2GQDYklo4oXr/zv1QDlh0EN5XpX8Jm3FrqYvoQ78NuqbEMsi/NC/8xfe+q3Rk23h
 l7U7VB/BasVK7SryFBMNJs+zx+PVFBByf7HnDfNfXfl6afwPQcfWKdMaCCkZFE2Chx
 qs3+FMLs00zJdgc3jO+HaGFE9TwXOWR2Axu0KXXZJkpZKtTTgne/Gr2tEkZ0y6KnYl
 JCBZTRI4henEq1qsH3u9L1tGWyEs15IR0eaoUv4J+9ZRj/3h1LHySMUqRs3UTwQy+0
 KZTTltnHpwsDurOD/kgKOGPyXlDOxU4lDLrSXhbvoAR5uw2/j6rTmxLKfhFBUadAvE
 AUNZexm18YAQA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=o2GQDYkl
Subject: Re: [Buildroot] [PATCH 1/1] package/libxslt: bump to version 1.1.36
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

On 2022-08-27 23:00 +0200, Fabrice Fontaine spake thusly:
> https://gitlab.gnome.org/GNOME/libxslt/-/tags/v1.1.36
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libxslt/libxslt.hash | 4 ++--
>  package/libxslt/libxslt.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libxslt/libxslt.hash b/package/libxslt/libxslt.hash
> index 39523a6953..8d1a2af193 100644
> --- a/package/libxslt/libxslt.hash
> +++ b/package/libxslt/libxslt.hash
> @@ -1,5 +1,5 @@
> -# from https://download.gnome.org/sources/libxslt/1.1/libxslt-1.1.35.sha256sum
> -sha256  8247f33e9a872c6ac859aa45018bc4c4d00b97e2feac9eebc10c93ce1f34dd79  libxslt-1.1.35.tar.xz
> +# from https://download.gnome.org/sources/libxslt/1.1/libxslt-1.1.36.sha256sum
> +sha256  12848f0a4408f65b530d3962cd9ff670b6ae796191cfeff37522b5772de8dc8e  libxslt-1.1.36.tar.xz
>  
>  # Hash for license file:
>  sha256  7e48e290b6bfccc2ec1b297023a1d77f2fd87417f71fbb9f50aabef40a851819  COPYING
> diff --git a/package/libxslt/libxslt.mk b/package/libxslt/libxslt.mk
> index df0286e986..d908e3c552 100644
> --- a/package/libxslt/libxslt.mk
> +++ b/package/libxslt/libxslt.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBXSLT_VERSION = 1.1.35
> +LIBXSLT_VERSION = 1.1.36
>  LIBXSLT_SOURCE = libxslt-$(LIBXSLT_VERSION).tar.xz
>  LIBXSLT_SITE = https://download.gnome.org/sources/libxslt/1.1
>  LIBXSLT_INSTALL_STAGING = YES
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
