Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ACAAECAAD2
	for <buildroot@archiver.kernel.org>; Sat, 27 Aug 2022 13:39:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB44881CBA;
	Sat, 27 Aug 2022 13:39:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB44881CBA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N8BnMR6Mdrwh; Sat, 27 Aug 2022 13:39:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C263481B72;
	Sat, 27 Aug 2022 13:39:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C263481B72
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3EB851BF588
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 13:39:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1A61F40516
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 13:39:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A61F40516
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9QnydVlz-e-t for <buildroot@lists.busybox.net>;
 Sat, 27 Aug 2022 13:39:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C89640286
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6C89640286
 for <buildroot@buildroot.org>; Sat, 27 Aug 2022 13:39:01 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:e2dc:5f1b:7f23:232])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 7BE1678050E;
 Sat, 27 Aug 2022 15:38:54 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 27 Aug 2022 15:38:54 +0200
Date: Sat, 27 Aug 2022 15:38:54 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: lancethepants <lancethepants@gmail.com>
Message-ID: <20220827133854.GW37358@scaer>
References: <20220824202617.21650-1-lancethepants@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220824202617.21650-1-lancethepants@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661607537;
 bh=pTfBDMDN+p+UN4/FyAxZ8cQQVhn7EFELrLBGEwj8+6c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ar2pIbPW6Fe6pgSIDZQMUTZxPMM5jt9VLPYqgItoe7voHMv7AnjKh3DfX6o4vLYWV
 VXMDv8tQHOFTBFBE0xtA0RaP1JleMY7kP+5BRSP9UQGPtxvD1yWynxQAaV4zO0SBYX
 /tD8wL50o7wDRLUq777ggHlXdv5Gyg6SabZhAxQPlCv0nrdNF34jDL89DBMxvFjdhO
 KRtA8tOU3bzOW7hQlF8pWcJs+gT9ABj0PjwELKU09b2PH3an5GKweH6iIIcIkflEiM
 n1e+FWLiwqzKr+pJ8etnneRtnqqwTbmCjDF8uyjll/mjmZgFedqKK66T/iXztjVkX/
 DDC/XzZ6ee7Pw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ar2pIbPW
Subject: Re: [Buildroot] [PATCH 1/1] package/musl-fts: always build static
 library
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Lance, All,

Please, be sure that the From header matches your SoB line; evne though
your email matches, the From lacks your real name.

On 2022-08-24 14:26 -0600, lancethepants spake thusly:
> musl-fts provides features left out of musl that are included in other libc's.
> 
> This patch always enables building the static library so
> that it is always present with musl's libc.a when enabled.
> 
> For those that are using buildroot for toolchain creation
> and want to static link, then libfts.a is available.

Sorry, I am not sure I totally understood what you meant here.

If I understood correctly, you want to use Buildroot, to generate a
musl-based toolchain, that you can distribute. You want that that
toolchain be usable to do both shared and static linking. Right?

Then you want to be able to use that toolchain to build some software
that uses fts(3). And so, since you want to allow static-only linking,
you want that toolchain to also include the fts library as a static
library.

However, this is, in my opinion, problematic for a few reasons.

First, including musl-ftx under the toolchain denomination is wrong; it
no longer is a toolchain, but more of an SDK. Including musl-fts will
for example mean that that toolchain will not be reusable as an external
toolchain for Buildroot, because then musl-fts in the toolchain will
come conflicting with musl-fts the package in Buildroot.

Second, if you need both static and shared libraries, why don't you
build your SDK with BR2_SHARED_STATIC_LIBS to begin with? With that, we
pass both --enable-static --enable-shared when building autotools
packages (and musl-fts is an autotools package); see package/Makefile.in
lines 423-424.

Third, what makes musl-fts different from other libraries that may be
included in the SDK? If your external software needs other libraries,
and you do not have them in the SDK, then you'll have to build those
libraries first, and point your software buildsystem to use them; why
can't you do the same for musl-fts?

> Signed-off-by: Lance Fredrickson <lancethepants@gmail.com>
> Signed-off-by: lancethepants <lancethepants@gmail.com>

That second SoB line is incorrect, as it has no real-name part; it is
also superfluous, because it is the same email part.

Regards,
Yann E. MORIN.

> ---
>  package/musl-fts/musl-fts.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/musl-fts/musl-fts.mk b/package/musl-fts/musl-fts.mk
> index dd7f1f9ea0..fcad9c3d75 100644
> --- a/package/musl-fts/musl-fts.mk
> +++ b/package/musl-fts/musl-fts.mk
> @@ -12,5 +12,6 @@ MUSL_FTS_LICENSE_FILES = COPYING
>  # pkg-config needed for autoreconf
>  MUSL_FTS_DEPENDENCIES = host-pkgconf
>  MUSL_FTS_INSTALL_STAGING = YES
> +MUSL_FTS_CONF_OPTS += --enable-static
>  
>  $(eval $(autotools-package))
> -- 
> 2.20.1
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
