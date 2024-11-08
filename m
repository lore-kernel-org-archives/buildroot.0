Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A136D64097
	for <buildroot@archiver.kernel.org>; Fri,  8 Nov 2024 21:58:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D16B784604;
	Fri,  8 Nov 2024 21:58:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C39UVGiZw_nH; Fri,  8 Nov 2024 21:58:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1E1284605
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1E1284605;
	Fri,  8 Nov 2024 21:58:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 218DAC2
 for <buildroot@buildroot.org>; Fri,  8 Nov 2024 21:58:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1CC8384610
 for <buildroot@buildroot.org>; Fri,  8 Nov 2024 21:58:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0IQIhFpFRTka for <buildroot@buildroot.org>;
 Fri,  8 Nov 2024 21:58:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F0B4684605
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F0B4684605
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F0B4684605
 for <buildroot@buildroot.org>; Fri,  8 Nov 2024 21:58:32 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id DE4C82003C3;
 Fri,  8 Nov 2024 22:58:24 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:55650])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 08 Nov 2024 22:58:24 +0100
MIME-Version: 1.0
Date: Fri, 08 Nov 2024 22:58:24 +0100
From: Julien Olivain <ju.o@free.fr>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: buildroot@buildroot.org, Andy Yan <andyshrk@gmail.com>, Andy Yan
 <andyshrk@163.com>, Aaron Sierra <aaron@bubbl-tek.com>
In-Reply-To: <20241106184841.1053511-1-andriy.shevchenko@linux.intel.com>
References: <20241106184841.1053511-1-andriy.shevchenko@linux.intel.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <e097e9606bcd844e440d8cd95e2d494a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1731103109;
 bh=3z1HnezFuY1zYc6reaEvdKBwF0RBfw3co3VggT6HqUo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=b7ChJOdQCr8fyiWdg7TuJme2eq+kszXAnKrJOznk9KadYgNlZ0G80x+CCOiFrrYL/
 NKLaTElRA5LiWLsaV73EGPOyRidqDes0qEQAKFESk2bKFds9Fi91vlrBqL/VNRCW5G
 UmgjeBRgwet9buHkK9RSOnbiqO94P29YhZPMP4hnkhqpI+EIhJ8Y3Lyrl94WPblIUi
 /YRXED2hKMHBVs8+n2bV9L8u7EO1NYH1l/XW9fBVwblQRNGfCt8oXur42K2vonYIIf
 RR1SEP3gMw46C0wfFEipmmAhGqFH+qQveHJ5YFpPgHeSaBxBlHPz8fuzHuNU0C23Mf
 7SYN/usY8Aw9Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=b7ChJOdQ
Subject: Re: [Buildroot] [PATCH v1 1/1] package/iotools: Update to v1.8
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Andy, all,

On 06/11/2024 19:48, Andy Shevchenko wrote:
> This is minor update to iotools to fix some issues Aaron noticed and
> addressed. The bigger change will come later with better integration
> with the regular build systems (CMake).
> 
> Cc: Aaron Sierra <aaron@bubbl-tek.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Applied to master, thanks!

The patch was not applying as is, as the version number in the Buildroot
tree does not have the "v". This is for the release monitoring, for new
release notifications:
https://release-monitoring.org/project/375158

Since the modification was trivial, I fixed it while applying.

Best regards,

Julien.

> ---
>  package/iotools/iotools.hash | 2 +-
>  package/iotools/iotools.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/iotools/iotools.hash 
> b/package/iotools/iotools.hash
> index 11d7ffb73e39..48d347bb3c11 100644
> --- a/package/iotools/iotools.hash
> +++ b/package/iotools/iotools.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  
> 13b8b87c7d1f22b8d8f50c499af09f9414a0879d69c22393f1051ed4bf28f378  
> iotools-v1.7.tar.gz
> +sha256  
> 9cb6184030b2e5c2e6a7c7a2d016d29d42d4075a77e1ba982bdc3cd919491faf  
> iotools-v1.8.tar.gz
>  sha256  
> ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  
> COPYING
> diff --git a/package/iotools/iotools.mk b/package/iotools/iotools.mk
> index 03b87c89e9d0..f5e322eab818 100644
> --- a/package/iotools/iotools.mk
> +++ b/package/iotools/iotools.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -IOTOOLS_VERSION = v1.7
> +IOTOOLS_VERSION = v1.8
>  IOTOOLS_SITE = $(call github,andy-shev,iotools,$(IOTOOLS_VERSION))
>  IOTOOLS_LICENSE = GPL-2.0+
>  IOTOOLS_LICENSE_FILES = COPYING
> --
> 2.43.0.rc1.1336.g36b5255a03ac
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
