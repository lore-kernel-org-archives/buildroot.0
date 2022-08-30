Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16530ECAAA1
	for <buildroot@archiver.kernel.org>; Tue, 30 Aug 2022 19:08:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98E4D60FF7;
	Tue, 30 Aug 2022 19:08:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 98E4D60FF7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HcOzgkfndKRO; Tue, 30 Aug 2022 19:08:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8D5B60FB4;
	Tue, 30 Aug 2022 19:08:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A8D5B60FB4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3620C1BF57F
 for <buildroot@lists.busybox.net>; Tue, 30 Aug 2022 19:08:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1E519408E3
 for <buildroot@lists.busybox.net>; Tue, 30 Aug 2022 19:08:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E519408E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5XPgpow3vsBM for <buildroot@lists.busybox.net>;
 Tue, 30 Aug 2022 19:08:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B2A78400AF
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B2A78400AF
 for <buildroot@buildroot.org>; Tue, 30 Aug 2022 19:08:15 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:677e:d766:490c:af47])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 8F86BB00723;
 Tue, 30 Aug 2022 21:08:06 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 30 Aug 2022 21:08:06 +0200
Date: Tue, 30 Aug 2022 21:08:06 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Michael Nosthoff <buildroot@heine.tech>
Message-ID: <20220830190806.GA68979@scaer>
References: <20220830133857.25406-1-buildroot@heine.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220830133857.25406-1-buildroot@heine.tech>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661886491;
 bh=iG9TQiwEz4LcgN0z31uGFVu4qylKOpfq67GZRclFumA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JM677VJW/q0W8OseWfPqS2cQ1pPxBZjGo6O4L5I7EIapn7BnKWPeL5pFy7Y6Y4IBy
 8FMgSr7WlAu0S9DEQMxSgNT15flhji3jIeuC3QZQScMnqxzw9ldWaFqdjHm3au+SBv
 Kolv9lTtiFGQDE3MlFxsRHFzVZB7Vjo1iNnsDpYzjoMNx9U/PLsXeIzfK95E3XZb0b
 P9QBn70piDPiPK9Z5qY/JfbbFrs3m5iJfDdSP6bAnObQzzYk7k+RRd6NzyFdcvjEfU
 5HjSJVeDiYBdaS9l0+rk5C+XPn18wUOUbzPJGDFkrm43Yx5EO1+xm1sx5igWIHpObn
 OS/4GgefPl2oA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=JM677VJW
Subject: Re: [Buildroot] [PATCH] package/{python-}protobuf: bump to version
 31.5
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Matt Weber <matthew.weber@collins.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Michael, All,

In the commit title: s/31\.5/21.5/  ;-)

On 2022-08-30 15:38 +0200, Michael Nosthoff via buildroot spake thusly:
> fixes:
> - Fixed comparison of maps in Python.
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

Since this is a bug-fix release: applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/protobuf/protobuf.hash               | 2 +-
>  package/protobuf/protobuf.mk                 | 2 +-
>  package/python-protobuf/python-protobuf.hash | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/protobuf/protobuf.hash b/package/protobuf/protobuf.hash
> index 9dc0f9ff07..8e5ba09c9d 100644
> --- a/package/protobuf/protobuf.hash
> +++ b/package/protobuf/protobuf.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
>  sha256  6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
> -sha256  a9fd8043fef746e8d8cca9f023fb7ba6d3d102eab6dd35a04ce7157d1928726b  protobuf-cpp-3.21.4.tar.gz
> +sha256  58c8a18b4ec22655535c493155c5465a8903e8249094ceead87e00763bdbc44f  protobuf-cpp-3.21.5.tar.gz
> diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
> index ffbc39347f..199e423d71 100644
> --- a/package/protobuf/protobuf.mk
> +++ b/package/protobuf/protobuf.mk
> @@ -7,7 +7,7 @@
>  # When bumping this package, make sure to also verify if the
>  # python-protobuf package still works and to update its hash,
>  # as they share the same version/site variables.
> -PROTOBUF_VERSION = 21.4
> +PROTOBUF_VERSION = 21.5
>  PROTOBUF_SOURCE = protobuf-cpp-3.$(PROTOBUF_VERSION).tar.gz
>  PROTOBUF_SITE = https://github.com/protocolbuffers/protobuf/releases/download/v$(PROTOBUF_VERSION)
>  PROTOBUF_LICENSE = BSD-3-Clause
> diff --git a/package/python-protobuf/python-protobuf.hash b/package/python-protobuf/python-protobuf.hash
> index ae2e07d637..1b106445a5 100644
> --- a/package/python-protobuf/python-protobuf.hash
> +++ b/package/python-protobuf/python-protobuf.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  32d8a37271f42aaa0f40659f77040484d6048b187e4a98dac09eb9ed592a91dc  protobuf-python-4.21.4.tar.gz
> +sha256  4b384ad2bc6832ede8703b4567c47498bccf104cb79fd20d2d2e3069066ae245  protobuf-python-4.21.5.tar.gz
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
