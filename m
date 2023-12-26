Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8BE2C46CD3
	for <buildroot@archiver.kernel.org>; Tue, 26 Dec 2023 20:28:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD1B380B68;
	Tue, 26 Dec 2023 20:28:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD1B380B68
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rELPx_Q_QG9a; Tue, 26 Dec 2023 20:28:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E92DA80BE3;
	Tue, 26 Dec 2023 20:28:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E92DA80BE3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C79101BF591
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 20:28:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9BF95409DB
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 20:28:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9BF95409DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Pjaxr5dlzPRU for <buildroot@lists.busybox.net>;
 Tue, 26 Dec 2023 20:28:49 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3EFDF4098F
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 20:28:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3EFDF4098F
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 3EE8EB0053E;
 Tue, 26 Dec 2023 21:28:45 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 26 Dec 2023 21:28:45 +0100
Date: Tue, 26 Dec 2023 21:28:45 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <ZYs3fZ9YMPVWUdMo@landeda>
References: <20231226170333.820436-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231226170333.820436-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1703622527;
 bh=H3Gf2Pzd0O0jbeXBDp0thAPsl6kM5YBOD0bVv6ycE04=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ooqvpRH0BBlSsrUsBoD+Vw5yhud+pLHADSRD7vnZG5hoi/sPwz36Z+T17h9KiigYX
 SHjDdZGaV8boMk64wJT58L+NqJ8R2e0Uk2xRgToVZGZliR1qNanR9YD2se+F0+WNcq
 FRpHP1/CHRFm2vqcMR/zfKdUzGlkFC//9MkzPn9l9MRSb8kQsWwvqjXcPRgXqutuF4
 jmRfO3GaKMzJraRHHUiaoCiyQYWrzOdtPWnv8d0JrQtqNl3zkVieoBRpq3EVTofkpa
 X+4tvjT1ivUPDIAHihnEiTFjkMl1opiVfSw/er/hz4V7PXUVjS9mCPzWwoE4uUP09m
 S12xWS9lSsaBg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ooqvpRH0
Subject: Re: [Buildroot] [PATCH 1/1] package/libebml: security bump to
 version 1.4.5
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

On 2023-12-26 18:03 +0100, Fabrice Fontaine spake thusly:
> Fix invalid memory access (reading beyond allocated memory) due to
> missing integer overflow check.
> 
> https://github.com/Matroska-Org/libebml/blob/release-1.4.5/NEWS.md
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libebml/libebml.hash | 2 +-
>  package/libebml/libebml.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libebml/libebml.hash b/package/libebml/libebml.hash
> index c83fde32ab..34626eb1f4 100644
> --- a/package/libebml/libebml.hash
> +++ b/package/libebml/libebml.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  82dc5f83356cc9340aee76ed7512210b3a4edf5f346bc9c2c7044f55052687a7  libebml-1.4.4.tar.xz
> +sha256  4971640b0592da29c2d426f303e137a9b0b3d07e1b81d069c1e56a2f49ab221b  libebml-1.4.5.tar.xz
>  sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL
> diff --git a/package/libebml/libebml.mk b/package/libebml/libebml.mk
> index c85638c03e..0f69de8c81 100644
> --- a/package/libebml/libebml.mk
> +++ b/package/libebml/libebml.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBEBML_VERSION = 1.4.4
> +LIBEBML_VERSION = 1.4.5
>  LIBEBML_SOURCE = libebml-$(LIBEBML_VERSION).tar.xz
>  LIBEBML_SITE = http://dl.matroska.org/downloads/libebml
>  LIBEBML_INSTALL_STAGING = YES
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
