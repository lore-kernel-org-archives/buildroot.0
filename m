Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15E7EC433F5
	for <buildroot@archiver.kernel.org>; Sat, 18 Dec 2021 21:51:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BAD6160B3B;
	Sat, 18 Dec 2021 21:51:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xkcXRnP_LtEh; Sat, 18 Dec 2021 21:51:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2509960B20;
	Sat, 18 Dec 2021 21:51:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 23C661BF2A0
 for <buildroot@lists.busybox.net>; Sat, 18 Dec 2021 21:50:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 131CD41EA1
 for <buildroot@lists.busybox.net>; Sat, 18 Dec 2021 21:50:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ga9sEk6u4j6x for <buildroot@lists.busybox.net>;
 Sat, 18 Dec 2021 21:50:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0042C41F70
 for <buildroot@buildroot.org>; Sat, 18 Dec 2021 21:50:48 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4cb3:149f:d03e:db5a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id A4EB25FF27;
 Sat, 18 Dec 2021 22:50:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1639864247;
 bh=Zr3J2H7Ml5lKkPxO6zpv+r+keswQ6KpV90UnHhSfs6Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RY1aOMLBVvcunvcYplQLo6J+M2bXVFHYCH5PKgZODVlxKNp3OZH/ahQrpCj1ox1pt
 PkcwtFbEuc7S9s7WhpqjgQ9PDuhwZLMSotqQDE3AZyTJ8gLIadVdV5WBjt8BM98Y2u
 gqvVTa1KHpog5pvdN3eQ3fBhfCd21dwJUP7v3aHgSnW8X9HINiBhm4guGru5vuSkY+
 l1TCo8jKmh+cFnk8gUrxBOSC1dCRpTY7a7j45ZxILQhODUdTn4VmiurEKuSI5HScmK
 6ixq7lT9jn6mAAcul2MmWgUxNIDQG6aZsQOI0zlwOZ3N1YUc5l9m6QBNhkoCuDnBej
 tdHD7PnsWzFrg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 18 Dec 2021 22:50:37 +0100
Date: Sat, 18 Dec 2021 22:50:37 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211218215037.GR2603@scaer>
References: <20211217215047.101887-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211217215047.101887-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/lapack: add LAPACK_CPE_ID_VENDOR
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
Cc: Benjamin Kamath <kamath.ben@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2021-12-17 22:50 +0100, Fabrice Fontaine spake thusly:
> cpe:2.3:a:lapack_project:lapack is a valid CPE identifier for this
> package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alapack_project%3Alapack
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/lapack/lapack.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/lapack/lapack.mk b/package/lapack/lapack.mk
> index a80131c9ad..609075842d 100644
> --- a/package/lapack/lapack.mk
> +++ b/package/lapack/lapack.mk
> @@ -8,6 +8,7 @@ LAPACK_VERSION = 3.10.0
>  LAPACK_LICENSE = BSD-3-Clause
>  LAPACK_LICENSE_FILES = LICENSE
>  LAPACK_SITE = $(call github,Reference-LAPACK,lapack,v$(LAPACK_VERSION))
> +LAPACK_CPE_ID_VENDOR = lapack_project
>  LAPACK_INSTALL_STAGING = YES
>  LAPACK_SUPPORTS_IN_SOURCE_BUILD = NO
>  LAPACK_CONF_OPTS = -DLAPACKE=ON -DCBLAS=ON
> -- 
> 2.33.0
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
