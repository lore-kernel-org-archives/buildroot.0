Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BF14C47073
	for <buildroot@archiver.kernel.org>; Tue, 26 Dec 2023 20:28:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5EE3E81746;
	Tue, 26 Dec 2023 20:28:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5EE3E81746
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mtAsStkLRjXM; Tue, 26 Dec 2023 20:28:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A5F32814AB;
	Tue, 26 Dec 2023 20:28:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A5F32814AB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3F6E41BF591
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 20:28:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 183458134F
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 20:28:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 183458134F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IY_kcSYnae6Y for <buildroot@lists.busybox.net>;
 Tue, 26 Dec 2023 20:28:12 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0F305814AB
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 20:28:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F305814AB
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id AEDCCB00539;
 Tue, 26 Dec 2023 21:28:06 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 26 Dec 2023 21:28:06 +0100
Date: Tue, 26 Dec 2023 21:28:06 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <ZYs3VqYaMAMAEvOE@landeda>
References: <20231226152535.519193-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231226152535.519193-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1703622489;
 bh=QkvHPSn5PIfejWFaZZCmb8BoOv7lfHRKeNldHRuFJ8c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SwXMU/9SVERMn812J7qAGfGMw7xUgCKZU2mLydhWGCMR/zrl8+R7aXb2rCUhPsSxq
 U9Nn/8GEfa4NmQfYYPrIXuDtvFsFbm/ofx1PGVQn0c+q8xribmz8QtuZeLXzPx3N0M
 XOC4fqxUSleTqgiVP33nQrT9/ebyCPRQKhqEx6W1LLK1VWl+T3Ejj8pVD4ZtpbCVT1
 DQ62PxTTTIktUnOq/UAleTxidZ71jB7oaxo10G+td/nfCTl15NKWlMRrvua9fSc3Zo
 voXxKdFZd63Y1pwJp1REJ+hruLT899v+y4R8yHEq5+4W+tI60prcFGTZqrysV5sGmH
 RxNW8qPxfw3Kw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=SwXMU/9S
Subject: Re: [Buildroot] [PATCH 1/1] package/strongswan: security bump to
 version 5.9.13
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
Cc: =?utf-8?B?SsOpcsO0bWU=?= Pouiller <jezz@sysmic.org>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2023-12-26 16:25 +0100, Fabrice Fontaine spake thusly:
> A vulnerability in charon-tkm related to processing DH public values was
> discovered in strongSwan that can result in a buffer overflow and
> potentially remote code execution. All versions since 5.3.0 are
> affected.
> 
> https://www.strongswan.org/blog/2023/11/20/strongswan-vulnerability-(cve-2023-41913).html
> https://github.com/strongswan/strongswan/blob/5.9.13/NEWS
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/strongswan/strongswan.hash | 6 +++---
>  package/strongswan/strongswan.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/strongswan/strongswan.hash b/package/strongswan/strongswan.hash
> index de8f18747a..ed8cf0ae31 100644
> --- a/package/strongswan/strongswan.hash
> +++ b/package/strongswan/strongswan.hash
> @@ -1,7 +1,7 @@
> -# From http://download.strongswan.org/strongswan-5.9.11.tar.bz2.md5
> -md5  673e194cd256af77b46928179f2c81ad  strongswan-5.9.11.tar.bz2
> +# From http://download.strongswan.org/strongswan-5.9.13.tar.bz2.md5
> +md5  9ada6be0c89846fb7ded1787a17cfbb2  strongswan-5.9.13.tar.bz2
>  # Calculated based on the hash above
> -sha256  ddf53f1f26ad26979d5f55e8da95bd389552f5de3682e35593f9a70b2584ed2d  strongswan-5.9.11.tar.bz2
> +sha256  56e30effb578fd9426d8457e3b76c8c3728cd8a5589594b55649b2719308ba55  strongswan-5.9.13.tar.bz2
>  # Locally calculated
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
>  sha256  2292e21797754548dccdef9eef6aee7584e552fbd890fa914e1de8d3577d23f0  LICENSE
> diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
> index 6058631696..36cb72f6be 100644
> --- a/package/strongswan/strongswan.mk
> +++ b/package/strongswan/strongswan.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -STRONGSWAN_VERSION = 5.9.11
> +STRONGSWAN_VERSION = 5.9.13
>  STRONGSWAN_SOURCE = strongswan-$(STRONGSWAN_VERSION).tar.bz2
>  STRONGSWAN_SITE = http://download.strongswan.org
>  STRONGSWAN_LICENSE = GPL-2.0+
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
