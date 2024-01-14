Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94679C4707B
	for <buildroot@archiver.kernel.org>; Sun, 14 Jan 2024 10:25:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3A2E340159;
	Sun, 14 Jan 2024 10:25:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A2E340159
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xcqnJkPkwv3m; Sun, 14 Jan 2024 10:25:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1E7EF40187;
	Sun, 14 Jan 2024 10:25:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E7EF40187
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 110261BF2E4
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 10:25:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DDEFA41A79
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 10:25:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DDEFA41A79
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uuAxGXl-1K06 for <buildroot@lists.busybox.net>;
 Sun, 14 Jan 2024 10:25:18 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BBA25416D2
 for <buildroot@buildroot.org>; Sun, 14 Jan 2024 10:25:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BBA25416D2
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id BEE3F13F8E1;
 Sun, 14 Jan 2024 11:25:12 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 14 Jan 2024 11:25:12 +0100
Date: Sun, 14 Jan 2024 11:25:12 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Michael Nosthoff <buildroot@heine.tech>
Message-ID: <ZaO2iLrtQHKBsUmN@landeda>
References: <20240113204619.8831-1-buildroot@heine.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240113204619.8831-1-buildroot@heine.tech>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1705227915;
 bh=twkV3FCJ6CH/0qEOzIIYTI+xWlogjZenUsgk1urAo38=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bLB5wXO0vINM3onewLNaz6X2ulQ3qfktzY92TLRbYIiLu8HeKxi53DT0pO8ZeFplX
 xRpgeIAWGz4J0LZt1UnWv3RBEa4mDJGxMKbah+MMgdU77goApmgyYo+uuvV9PiQBQZ
 tNFhTfndXcx0zJHfaL+jeUkov6GhQykDnZJno/uJgZ/js05uWq6kYXFgi7p7GZ/E5C
 6N6G/f/5KREAcbXwPveOhuDqehEI6y6P+y3E9kamJDSxo9zejPQf47A8Q2H765yFpL
 OVRvE68u9dDT7fBM44Fnx/yaFVO9ZU4bG4rXa4vgg+hi9FVGgXdk/VzYHQJoEguff8
 NIV1OfggNGu9Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=bLB5wXO0
Subject: Re: [Buildroot] [PATCH] package/spdlog: bump to version 1.13.0
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Michael, All,

On 2024-01-13 21:46 +0100, Michael Nosthoff via buildroot spake thusly:
> - updated LICENSE hash because of changed link to fmt's license
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/spdlog/spdlog.hash | 4 ++--
>  package/spdlog/spdlog.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/spdlog/spdlog.hash b/package/spdlog/spdlog.hash
> index a943abba2c..3dbe43ac2d 100644
> --- a/package/spdlog/spdlog.hash
> +++ b/package/spdlog/spdlog.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  4dccf2d10f410c1e2feaff89966bfc49a1abb29ef6f08246335b110e001e09a9  spdlog-1.12.0.tar.gz
> -sha256  a7241a379cb98d37788f82c2fc2e484c3ae85dae881fd3406f0637644850926f  LICENSE
> +sha256  534f2ee1a4dcbeb22249856edfb2be76a1cf4f708a20b0ac2ed090ee24cfdbc9  spdlog-1.13.0.tar.gz
> +sha256  4ccecab18d1ff0b61174fe3d6c430541625d3ddb865b0d5887db296f883c76e7  LICENSE
> diff --git a/package/spdlog/spdlog.mk b/package/spdlog/spdlog.mk
> index 15a80edbd0..b45ae0a17d 100644
> --- a/package/spdlog/spdlog.mk
> +++ b/package/spdlog/spdlog.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -SPDLOG_VERSION = 1.12.0
> +SPDLOG_VERSION = 1.13.0
>  SPDLOG_SITE = $(call github,gabime,spdlog,v$(SPDLOG_VERSION))
>  SPDLOG_LICENSE = MIT
>  SPDLOG_LICENSE_FILES = LICENSE
> -- 
> 2.39.3 (Apple Git-145)
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
