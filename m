Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C05DFA3740
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 10:03:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B59C660B4C;
	Mon, 31 Oct 2022 10:03:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B59C660B4C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MYkCvAZGNOXi; Mon, 31 Oct 2022 10:03:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CFACA60B3F;
	Mon, 31 Oct 2022 10:03:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFACA60B3F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 670551BF580
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 10:02:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4FDCB8132A
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 10:02:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4FDCB8132A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ApqX5CDR3fpq for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 10:02:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4ACC681311
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4ACC681311
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 10:02:03 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:afdc:c5f1:f1be:8b47])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 5B666B00585;
 Mon, 31 Oct 2022 11:01:58 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 31 Oct 2022 11:01:58 +0100
Date: Mon, 31 Oct 2022 11:01:58 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20221031100158.GX1058960@scaer>
References: <20221030194519.1208612-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221030194519.1208612-1-bernd.kuhls@t-online.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1667210521;
 bh=/ygDesb3WY8SNGGX417RI1SFF9BVjIaUlsTAt5pr0j0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UWKLFm9IbBXsMpiLQzEZcgZF/8LfcwHvFt9ENuH4UPkZc0IRiWcecDIaSL6zb/NJw
 LOqJs/VfqToZS9BaW/yeh65rNNV74LpLZY9T/LBfAIRnViUwv4R4a/UQdDRMsnR34q
 9lR5/A6bsNoFL4Lx5WJJAYcG1OFZIzYZie6Ha/OtGyYWKsdjYFaJIGSxeq/hAQRaNg
 jrT/0oCnQ9u/NEfcxmdXfVuApt3YaWijqClG6IBt/q4f+JAI3jGO+acWFgHo4dpZOl
 eZzBy/9m7Y2Lpnz3j+qvxeOWHcKjkWicnDV1SVMB+s00aXmgycHWYGodonInwEVdGp
 a+hbubDyNyLng==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=UWKLFm9I
Subject: Re: [Buildroot] [PATCH 1/2] package/intel-mediadriver: bump version
 to 22.6.0
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
Cc: Louis-Paul Cordier <lpdev@cordier.org>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bernd, All,

On 2022-10-30 20:45 +0100, Bernd Kuhls spake thusly:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Series of two patches applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/intel-mediadriver/intel-mediadriver.hash | 2 +-
>  package/intel-mediadriver/intel-mediadriver.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/intel-mediadriver/intel-mediadriver.hash b/package/intel-mediadriver/intel-mediadriver.hash
> index 35e4c97c7c..d1698cbfb5 100644
> --- a/package/intel-mediadriver/intel-mediadriver.hash
> +++ b/package/intel-mediadriver/intel-mediadriver.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  08d8d041f94b094a2dd5c4739c413b75185521c7f788a02411395ff374ee4ead  intel-media-22.5.4.tar.gz
> +sha256  bee655102b0c56ea3eee6e8d1d203a67bf7e0c4696ebde2b8ae40067eb12b23f  intel-media-22.6.0.tar.gz
>  sha256  74979d5aaee78b8da82e3aafd415a216b6131dfff6d95d6930927c8a4e3bded3  LICENSE.md
> diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
> index c2d480fa21..821c0920f4 100644
> --- a/package/intel-mediadriver/intel-mediadriver.mk
> +++ b/package/intel-mediadriver/intel-mediadriver.mk
> @@ -6,7 +6,7 @@
>  
>  # based on https://software.intel.com/en-us/articles/build-and-debug-open-source-media-stack
>  
> -INTEL_MEDIADRIVER_VERSION = 22.5.4
> +INTEL_MEDIADRIVER_VERSION = 22.6.0
>  INTEL_MEDIADRIVER_SITE = https://github.com/intel/media-driver/archive
>  INTEL_MEDIADRIVER_SOURCE= intel-media-$(INTEL_MEDIADRIVER_VERSION).tar.gz
>  INTEL_MEDIADRIVER_LICENSE = MIT, BSD-3-Clause
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
