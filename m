Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42B9AC433EF
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 21:24:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2A5A60F49;
	Sun, 17 Jul 2022 21:24:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D2A5A60F49
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qJfEv7ve0Zx6; Sun, 17 Jul 2022 21:24:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC79260F14;
	Sun, 17 Jul 2022 21:24:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC79260F14
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E55801BF29D
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 21:24:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CD7124046D
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 21:24:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD7124046D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2YAXC8Q1NxBS for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 21:24:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD7FE40AA0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BD7FE40AA0
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 21:24:36 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:6518:6457:938c:3f55])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id A2EEC13F8AC;
 Sun, 17 Jul 2022 23:24:31 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 17 Jul 2022 23:24:31 +0200
Date: Sun, 17 Jul 2022 23:24:31 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220717212431.GA2249625@scaer>
References: <20220710212822.876720-1-fontaine.fabrice@gmail.com>
 <20220710212822.876720-2-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220710212822.876720-2-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658093074;
 bh=dqXOO7Sx7cqNhR/P/5kAhxpz/NAEh4DNPrEg2jCB2fw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=U2fQWFcxLfVhCOFws71JKjt02bXedUyPVxRlt+Hvp8eDnz8LCaWocryJaUUG+McKr
 yM7CcXqqVdbsgKYYmMtYXwSOTtq16KOU+nXHq+ECjWpHvTIgCIjuFHIGdqmvXyYdoF
 xAHZcdYykg4YrezmzVFTLAUB2E6vwj9kHa8YznkZ/r4d6h5ykXRyWHxscIiZFe8Z2R
 yAplCH9VODzoBdkwBV5zMswEUOlEj1RpkXnbN18GKoG523aQOPXCMP5Chdd8kA5HBm
 +RVX+KCPuqa2z9BM7+l+V4FCC6ML7QEhsP2TdttlggsYqeS5iBImvNa9ODWoqLhRb0
 JEqo+sQ395x8w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=U2fQWFcx
Subject: Re: [Buildroot] [PATCH 2/2] package/kvazaar: add cryptopp support
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
Cc: Alexandre Esse <alexandre.esse.dev@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-07-10 23:28 +0200, Fabrice Fontaine spake thusly:
> host-pkgconf is only needed to find cryptopp

... yet the configure always test for a pkg-config that is the correct
version, even if not needed, so I restored it as an unconditional
dependency (and it is a very fast-to-build one, so who cares).

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/kvazaar/kvazaar.mk | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/package/kvazaar/kvazaar.mk b/package/kvazaar/kvazaar.mk
> index e2ab132203..9354f7ab5f 100644
> --- a/package/kvazaar/kvazaar.mk
> +++ b/package/kvazaar/kvazaar.mk
> @@ -10,7 +10,12 @@ KVAZAAR_SITE = https://github.com/ultravideo/kvazaar/releases/download/v$(KVAZAA
>  KVAZAAR_LICENSE = BSD-3-Clause, ISC (greatest, x264asm)
>  KVAZAAR_LICENSE_FILES = LICENSE LICENSE.greatest LICENSE.x264asm
>  KVAZAAR_INSTALL_STAGING = YES
> -KVAZAAR_DEPENDENCIES = host-pkgconf
> +
> +ifeq ($(BR2_PACKAGE_CRYPTOPP),y)
> +KVAZAAR_DEPENDENCIES = host-pkgconf cryptopp
> +KVAZAAR_CONF_OPTS = --with-cryptopp
> +else
>  KVAZAAR_CONF_OPTS = --without-cryptopp

    $ make check-package
    WARNING: package/kvazaar/kvazaar.mk:17: conditional override of variable KVAZAAR_CONF_OPTS
    WARNING: package/kvazaar/kvazaar.mk:19: conditional override of variable KVAZAAR_CONF_OPTS

Fixed, and applied to master, thanks.

Regards,
Yann E. MORIN.

> +endif
>  
>  $(eval $(autotools-package))
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
