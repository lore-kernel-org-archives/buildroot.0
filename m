Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A329C46467
	for <buildroot@archiver.kernel.org>; Sun, 15 Jan 2023 11:12:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 089B6410CA;
	Sun, 15 Jan 2023 11:12:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 089B6410CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oU1xt-2hNb26; Sun, 15 Jan 2023 11:12:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6A4D41296;
	Sun, 15 Jan 2023 11:12:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6A4D41296
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 890C31BF29F
 for <buildroot@lists.busybox.net>; Sun, 15 Jan 2023 11:11:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6D0D841296
 for <buildroot@lists.busybox.net>; Sun, 15 Jan 2023 11:11:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D0D841296
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jsV1DMVyGytL for <buildroot@lists.busybox.net>;
 Sun, 15 Jan 2023 11:11:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3FB514136C
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3FB514136C
 for <buildroot@buildroot.org>; Sun, 15 Jan 2023 11:11:10 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 6EE835FF93;
 Sun, 15 Jan 2023 12:11:04 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 15 Jan 2023 12:11:04 +0100
Date: Sun, 15 Jan 2023 12:11:04 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230115111104.GJ199036@scaer>
References: <20230109045908.2502002-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230109045908.2502002-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1673781068;
 bh=UAiLoLWoRz7STQV66RZHGnog0GMDSAA6uogyAKPcEYY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ChnqHwAcr/YtZ6+JTVhY3IEDbp85OKcOdSBT+VXfkmRKwgDhdDsohEybjdntaRwtw
 pcUBCa+1CsiFxVSkuj7EMdbz8+FrRUvV0wwxvcUcT4o9dVmOWIQQTkUb0QGorphUou
 6ClKBr3Zy8ITSVUUeZj3rKo/HMP4d8kw8dKdHe+Umg5uGqbMbxjyXlYH3z3+pDFzah
 fcFPkpfB6x6OAnedzTYFBIQx4ZHUAHe9HbmwQfArjykuekeq0FuFQaMO49KM9RAtfQ
 VmDoz7ETAhD+23ewzgnjvX7lcZVxiJiqL4PrdDWn8dFgnWHpxHcN1xuyj4mGa1hPHE
 FTXTPeBmswl2Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ChnqHwAc
Subject: Re: [Buildroot] [PATCH 1/1] package/{python-}protobuf: bump to
 version 21.12
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
Cc: Matt Weber <matthew.weber@collins.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2023-01-08 21:59 -0700, James Hilliard spake thusly:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Not applied, as I instead applied Michael's patch that he sent earlier.

Regards,
Yann E. MORIN.

> ---
>  package/protobuf/protobuf.hash               | 2 +-
>  package/protobuf/protobuf.mk                 | 2 +-
>  package/python-protobuf/python-protobuf.hash | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/protobuf/protobuf.hash b/package/protobuf/protobuf.hash
> index f1f5fa77cd..b092c9303f 100644
> --- a/package/protobuf/protobuf.hash
> +++ b/package/protobuf/protobuf.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
>  sha256  6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
> -sha256  96f0ab99b7414e44e7bf9b218bb59510d61549ca68e648f19e3622f9999bec00  protobuf-cpp-3.21.11.tar.gz
> +sha256  4eab9b524aa5913c6fffb20b2a8abf5ef7f95a80bc0701f3a6dbb4c607f73460  protobuf-cpp-3.21.12.tar.gz
> diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
> index 33a7c40f40..8cd4e99e06 100644
> --- a/package/protobuf/protobuf.mk
> +++ b/package/protobuf/protobuf.mk
> @@ -7,7 +7,7 @@
>  # When bumping this package, make sure to also verify if the
>  # python-protobuf package still works and to update its hash,
>  # as they share the same version/site variables.
> -PROTOBUF_VERSION = 21.11
> +PROTOBUF_VERSION = 21.12
>  PROTOBUF_SOURCE = protobuf-cpp-3.$(PROTOBUF_VERSION).tar.gz
>  PROTOBUF_SITE = https://github.com/protocolbuffers/protobuf/releases/download/v$(PROTOBUF_VERSION)
>  PROTOBUF_LICENSE = BSD-3-Clause
> diff --git a/package/python-protobuf/python-protobuf.hash b/package/python-protobuf/python-protobuf.hash
> index c2afc3955a..e7af678b97 100644
> --- a/package/python-protobuf/python-protobuf.hash
> +++ b/package/python-protobuf/python-protobuf.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  ae4ca6e1da635f31019d8911923163f372d9d333e8857510f513acba33172d0c  protobuf-python-4.21.11.tar.gz
> +sha256  e2b976e67d6fcf7078f799143a73f2a4d9cf3126ca68a1a6f1bda30fe5f3585c  protobuf-python-4.21.12.tar.gz
>  sha256  6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
> -- 
> 2.34.1
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
