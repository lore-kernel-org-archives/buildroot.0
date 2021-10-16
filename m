Return-Path: <SRS0=a1j9=PE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47591C433F5
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 08:32:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB2C0611AF
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 08:32:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EB2C0611AF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9591E401E3;
	Sat, 16 Oct 2021 08:32:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kef2OaNczbdE; Sat, 16 Oct 2021 08:32:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 789CB40227;
	Sat, 16 Oct 2021 08:32:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 940821BF873
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 08:30:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8385B404B5
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 08:30:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XXfXQFmC4fna for <buildroot@lists.busybox.net>;
 Sat, 16 Oct 2021 08:30:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 83BED404C7
 for <buildroot@buildroot.org>; Sat, 16 Oct 2021 08:30:50 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ae:6c95:da51:607e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id F2D6E78035B;
 Sat, 16 Oct 2021 10:30:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1634373049;
 bh=xZmvSbyqilREgNOOA3p+rgXIIv3GrYONwM/BLCvY758=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pqEWx46eEvWmI8blNYyZW5gG+KfjA5rrJSNxRa8oRA7/jjGQn7ZVuRoFTteW7LJZY
 e4R+0hSqJWELYgOWP52N6VJEO4YAJTX3AKroVEKDRnnTJIcZ/VNJMhcahEWX9qrOmM
 SYHVhgRuUUZY//Jh5mHOx56E16usnAtEkOBH9uEedmjsh5NcA4YzcuBIl08aBaHPWK
 P9RLlEltP9fAh+xpmolBKS7tIvc9RAepBQLz76lKTA5tcthsCmQ6ecEBD3fUA7R1Wk
 DiweVUSPlDdoG8AcSZeiGB6D4b9lxy6dO+8XOCEmOUJuINy+wQh8RNFlgeNkotLfFf
 VnoIBQAQC0Odw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 16 Oct 2021 10:30:44 +0200
Date: Sat, 16 Oct 2021 10:30:44 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211016083044.GI4165837@scaer>
References: <20211015200741.1648668-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211015200741.1648668-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/cryptsetup: bump to version
 2.3.6
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

On 2021-10-15 22:07 +0200, Fabrice Fontaine spake thusly:
> Stable bug-fix release with minor extensions.
> 
> All users of cryptsetup 2.x and later should upgrade to this version.
> 
> https://gitlab.com/cryptsetup/cryptsetup/-/blob/v2.3.6/docs/v2.3.5-ReleaseNotes
> https://gitlab.com/cryptsetup/cryptsetup/-/blob/v2.3.6/docs/v2.3.6-ReleaseNotes
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/cryptsetup/cryptsetup.hash | 2 +-
>  package/cryptsetup/cryptsetup.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/cryptsetup/cryptsetup.hash b/package/cryptsetup/cryptsetup.hash
> index 3b58345611..0aa3f79df7 100644
> --- a/package/cryptsetup/cryptsetup.hash
> +++ b/package/cryptsetup/cryptsetup.hash
> @@ -1,4 +1,4 @@
>  # From https://www.kernel.org/pub/linux/utils/cryptsetup/v2.3/sha256sums.asc
> -sha256  9d16eebb96b53b514778e813019b8dd15fea9fec5aafde9fae5febf59df83773  cryptsetup-2.3.4.tar.xz
> +sha256  b296b7a21ea576c2b180611ccb19d06aec8dddaedf7c704b0c6a81210c25635f  cryptsetup-2.3.6.tar.xz
>  sha256  45670cce8b6a0ddd66c8016cd8ccef6cd71f35717cbacc7f1e895b3855207b33  COPYING
>  sha256  8c33cc37871654ec7ed87e6fbb896c8cf33ef5ef05b1611a5aed857596ffafa5  COPYING.LGPL
> diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
> index b816dc2f22..3cf6c8a301 100644
> --- a/package/cryptsetup/cryptsetup.mk
> +++ b/package/cryptsetup/cryptsetup.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  CRYPTSETUP_VERSION_MAJOR = 2.3
> -CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).4
> +CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).6
>  CRYPTSETUP_SOURCE = cryptsetup-$(CRYPTSETUP_VERSION).tar.xz
>  CRYPTSETUP_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/cryptsetup/v$(CRYPTSETUP_VERSION_MAJOR)
>  CRYPTSETUP_DEPENDENCIES = \
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
