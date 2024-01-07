Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43912C47074
	for <buildroot@archiver.kernel.org>; Sun,  7 Jan 2024 16:04:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C4E7F400D0;
	Sun,  7 Jan 2024 16:04:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C4E7F400D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HILCfhqWsWmJ; Sun,  7 Jan 2024 16:04:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 95ABC4029F;
	Sun,  7 Jan 2024 16:04:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 95ABC4029F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AAE621BF38B
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 16:04:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 83C2182CFD
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 16:04:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 83C2182CFD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vQFHLSyP9Hxr for <buildroot@lists.busybox.net>;
 Sun,  7 Jan 2024 16:04:30 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7F90181E14
 for <buildroot@buildroot.org>; Sun,  7 Jan 2024 16:04:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F90181E14
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 72D73B0059B;
 Sun,  7 Jan 2024 17:04:25 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 07 Jan 2024 17:04:25 +0100
Date: Sun, 7 Jan 2024 17:04:25 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <ZZrLiclSbyjimNmj@landeda>
References: <20240107114101.2793416-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240107114101.2793416-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1704643467;
 bh=eNEnO+VCMxlM3xByp5W2JJXHdiFdywqmmUEDP5hWOco=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BJPJz2vdy/CaJBkyTMdEog3xUQlFE0/WyO5cFNX809SH5wVkPJtYQVi0WNDGho4zv
 3Gjk+4CyN0pibudDFXA9suDRBe35gnTTmN53hKlBqmOxdOgizonJr8GUF2s0iZ5nOv
 hTbKw8CPKEEOyEDK08rQpjSonFspX5IYXAueRbL7dF4hmly4Z2+Is5fU2/wo+TULpS
 4GDMgYcc/py2DO6GQdjlcPsbRHPKOlVZUaUwSoL1PH1kT6X6NNsVIIp0QD84qA9ZUJ
 4a96GnUPcT1pAf7IipJPKKN+kIsOKVpHYr4RLZArF6hN344GhuA7Obt/cxWQLtOFoM
 dXTLz5c72wr/A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=BJPJz2vd
Subject: Re: [Buildroot] [PATCH 1/1] package/libreplaygain: update
 LIBREPLAYGAIN_VERSION
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

On 2024-01-07 12:41 +0100, Fabrice Fontaine spake thusly:
> Update LIBREPLAYGAIN_VERSION to match what is returned by
> https://release-monitoring.org/project/370816

I was wondering what this weird commit title was all about, rather than
just stating "bump version". So I changed it to:
    package/XXX: use version friendly to release-monitoring

both for this patch and the following, and applied to master, thanks.

Regards,
Yann E. MORIN.

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libreplaygain/libreplaygain.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libreplaygain/libreplaygain.mk b/package/libreplaygain/libreplaygain.mk
> index ff0950c43d..129eb90d5f 100644
> --- a/package/libreplaygain/libreplaygain.mk
> +++ b/package/libreplaygain/libreplaygain.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -LIBREPLAYGAIN_VERSION = r475
> +LIBREPLAYGAIN_VERSION = 475
>  LIBREPLAYGAIN_SITE = http://files.musepack.net/source
> -LIBREPLAYGAIN_SOURCE = libreplaygain_$(LIBREPLAYGAIN_VERSION).tar.gz
> +LIBREPLAYGAIN_SOURCE = libreplaygain_r$(LIBREPLAYGAIN_VERSION).tar.gz
>  # upstream doesn't ship configure
>  LIBREPLAYGAIN_AUTORECONF = YES
>  LIBREPLAYGAIN_INSTALL_STAGING = YES
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
