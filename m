Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0757C0502A
	for <buildroot@archiver.kernel.org>; Tue, 30 Aug 2022 19:46:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E90882735;
	Tue, 30 Aug 2022 19:46:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E90882735
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lRAmYPMnLKdF; Tue, 30 Aug 2022 19:46:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9017982572;
	Tue, 30 Aug 2022 19:46:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9017982572
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 51B371BF57F
 for <buildroot@lists.busybox.net>; Tue, 30 Aug 2022 19:46:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2C30460E7D
 for <buildroot@lists.busybox.net>; Tue, 30 Aug 2022 19:46:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C30460E7D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fPeXiqmZwZEi for <buildroot@lists.busybox.net>;
 Tue, 30 Aug 2022 19:46:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4403A60E5F
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4403A60E5F
 for <buildroot@buildroot.org>; Tue, 30 Aug 2022 19:46:36 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:677e:d766:490c:af47])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 0675BB0071D;
 Tue, 30 Aug 2022 21:46:29 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 30 Aug 2022 21:46:29 +0200
Date: Tue, 30 Aug 2022 21:46:29 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Michael Nosthoff <buildroot@heine.tech>
Message-ID: <20220830194629.GE68979@scaer>
References: <20220830080447.7426-1-buildroot@heine.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220830080447.7426-1-buildroot@heine.tech>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661888793;
 bh=DX05L3WGPoSR5OnUo4ygy5Tj92noD2j/suzMV0G2hKI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ou/OnvveXriI32lb96T/3yEfQHKPlrFVTomfMzyvl4t4VEGeQ8WhLiXxTiGYUQzvS
 K9aOM1KVEPKn1jqz6bEUUtHEkMmeNn4HP5CmoPf3LG1hfMD12by/oJH9rICS8loON4
 xhndxy4zzuu/rVN1my+OWF8OoSCk4VTn1kDf64bGjnOPT3UrTaMkT8vpYT7ojHHNRL
 pyrH2XPZJY0VVdWMwqngo6poFO76Yn49pyUY391kzGrEfWoZjXqUO0Oxg4rQhBeYL8
 k/V/PI4G1heBCZ+ktbFEyh3V1vsFIDSneD0JjBI/HkqkYQGCODJnmi8IFeg/wrJII8
 fncYeEqVTDUMQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Ou/Onvve
Subject: Re: [Buildroot] [PATCH] package/fmt: bump to version 9.1.0
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
Cc: Semyon Kolganov <semenak94@mail.ru>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Michael, All,

On 2022-08-30 10:04 +0200, Michael Nosthoff via buildroot spake thusly:

I've added your SoB-line, which you provided later in the thread, and
applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/fmt/fmt.hash | 2 +-
>  package/fmt/fmt.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/fmt/fmt.hash b/package/fmt/fmt.hash
> index c203e35867..65eeaa4ebe 100644
> --- a/package/fmt/fmt.hash
> +++ b/package/fmt/fmt.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  fc96dd2d2fdf2bded630787adba892c23cb9e35c6fd3273c136b0c57d4651ad6  fmt-9.0.0.zip
> +sha256  cceb4cb9366e18a5742128cb3524ce5f50e88b476f1e54737a47ffdf4df4c996  fmt-9.1.0.zip
>  sha256  825c9324e70f8c839c8ba910543dd4a7daee243b86ef960594c11381a19980b8  LICENSE.rst
> diff --git a/package/fmt/fmt.mk b/package/fmt/fmt.mk
> index b7d67a0f28..ed0703cbc9 100644
> --- a/package/fmt/fmt.mk
> +++ b/package/fmt/fmt.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -FMT_VERSION = 9.0.0
> +FMT_VERSION = 9.1.0
>  FMT_SITE = https://github.com/fmtlib/fmt/releases/download/$(FMT_VERSION)
>  FMT_SOURCE = fmt-$(FMT_VERSION).zip
>  FMT_LICENSE = MIT with exception
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
