Return-Path: <SRS0=vewd=OP=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 300BEC433F5
	for <buildroot@archiver.kernel.org>; Sat, 25 Sep 2021 14:46:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD695610D1
	for <buildroot@archiver.kernel.org>; Sat, 25 Sep 2021 14:46:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CD695610D1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7E7E540130;
	Sat, 25 Sep 2021 14:46:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SDfWpjPsH4Ch; Sat, 25 Sep 2021 14:46:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 605374021B;
	Sat, 25 Sep 2021 14:46:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 549901BF868
 for <buildroot@lists.busybox.net>; Sat, 25 Sep 2021 14:46:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 445E6827A8
 for <buildroot@lists.busybox.net>; Sat, 25 Sep 2021 14:46:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ajvqKqGypxzP for <buildroot@lists.busybox.net>;
 Sat, 25 Sep 2021 14:46:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3C37E8247F
 for <buildroot@buildroot.org>; Sat, 25 Sep 2021 14:46:27 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:e5cb:5ead:8e76:4901])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 6EB8A780344;
 Sat, 25 Sep 2021 16:46:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1632581185;
 bh=+xQEwTwLI9pZdNcQp7i2sq1fXSupVz4xPbD1DuG/dT4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=i4JQIfVKwtuH41Sq6EVtfAS+DQtKYEQ0iGAQPiGV6R53zvJrqePfSpgZo9bNS/AM2
 3urCeckFUlv0Fusr9wWaKDwOSAM9WP8AYKUCH6t5ctyB34BXX5a3bMfNSx8QF3aCVM
 kCQMX+NOTgmubMJvLrw2wQxZr8+8fF+9+u10DcylTdpYmZdWOOgHLMNNmtkH691DGi
 TRVk15gR/OFsSrrFcTzpFrVUiELf889y3S9OK/wll2g1vPtFhAcZtl1meMPVipDY+i
 xsoufZhopxAqBB0F751ZXouu4Wp8AfyLscps+Uw2Nsiq1vjmFF7iUTa6rLiJBu1hAJ
 O4EQXn1X8wQ2A==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 25 Sep 2021 16:46:19 +0200
Date: Sat, 25 Sep 2021 16:46:19 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210925144619.GP3176@scaer>
References: <20210924162844.2192755-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210924162844.2192755-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/cryptopp: security bump to
 version 8.6.0
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
Cc: Julian Scheel <julian@jusst.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2021-09-24 18:28 +0200, Fabrice Fontaine spake thusly:
> This release clears CVE-2021-40530 and fixes a problem with ChaCha20
> AVX2 implementation. The CVE was due to ElGamal encryption using a work
> estimate to size encryption exponents instead subgroup order. The
> ChaCha20 issue was due to mishandling a carry in the AVX2 code path. The
> ChaCha20 issue was difficult to duplicate, so most users should not
> experience it.
> 
> https://github.com/weidai11/cryptopp/releases/tag/CRYPTOPP_8_6_0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/cryptopp/cryptopp.hash | 4 ++--
>  package/cryptopp/cryptopp.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/cryptopp/cryptopp.hash b/package/cryptopp/cryptopp.hash
> index 404d8a41ae..9a113b8f04 100644
> --- a/package/cryptopp/cryptopp.hash
> +++ b/package/cryptopp/cryptopp.hash
> @@ -1,5 +1,5 @@
> -# Hash from: https://www.cryptopp.com/release850.html:
> -sha512  090472545c74bbf0579b56b09e8b5dcd777b38f29f7199a2e68f45d4a8c687acc82f105ba8b2a38f9aa65e5997a3d846aaf2341ab74d58b4bbfd1f5f03823b93  cryptopp850.zip
> +# Hash from: https://www.cryptopp.com/release860.html:
> +sha512  e7773f5e4a7dc7e8e735b1702524bee56ba38e5211544c9c9778bc51ed8dc7b376c17f2e406410043b636312336f26f76dc963f298872f8c13933e88c232fc03  cryptopp860.zip
>  
>  # Hash for license file:
>  sha256  e668af8c73a38a66a1e8951d14ec24e7582fee5254dd6c3dae488a416d105d5f  License.txt
> diff --git a/package/cryptopp/cryptopp.mk b/package/cryptopp/cryptopp.mk
> index 1d303a67a0..6711a37fbc 100644
> --- a/package/cryptopp/cryptopp.mk
> +++ b/package/cryptopp/cryptopp.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -CRYPTOPP_VERSION = 8.5.0
> +CRYPTOPP_VERSION = 8.6.0
>  CRYPTOPP_SOURCE = cryptopp$(subst .,,$(CRYPTOPP_VERSION)).zip
>  CRYPTOPP_SITE = https://cryptopp.com
>  CRYPTOPP_LICENSE = BSL-1.0, BSD-3-Clause (CRYPTOGAMS), Public domain (ChaCha SSE2 and AVX)
> -- 
> 2.33.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@lists.buildroot.org
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
