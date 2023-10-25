Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 160FAC0032E
	for <buildroot@archiver.kernel.org>; Wed, 25 Oct 2023 19:54:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98A3A80C2F;
	Wed, 25 Oct 2023 19:54:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 98A3A80C2F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7uCTwrXf9Jvn; Wed, 25 Oct 2023 19:54:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE1F880B87;
	Wed, 25 Oct 2023 19:54:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE1F880B87
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EFCC01BF377
 for <buildroot@lists.busybox.net>; Wed, 25 Oct 2023 19:54:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D70EB60A81
 for <buildroot@lists.busybox.net>; Wed, 25 Oct 2023 19:54:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D70EB60A81
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TRSP2_jXOdR4 for <buildroot@lists.busybox.net>;
 Wed, 25 Oct 2023 19:54:44 +0000 (UTC)
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8CFDA60A74
 for <buildroot@buildroot.org>; Wed, 25 Oct 2023 19:54:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8CFDA60A74
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4e76:c8a5:3c3f:7e55])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 88AFA60136;
 Wed, 25 Oct 2023 21:54:40 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 25 Oct 2023 21:54:40 +0200
Date: Wed, 25 Oct 2023 21:54:40 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20231025195440.GB2582@scaer>
References: <20231025192553.370253-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231025192553.370253-1-ju.o@free.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1698263682;
 bh=pmRUubwUk/PdS1Uozi2uReeEWNwFpt/hSioNG+Y/qlE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DLq2Nv2jG0dzXb6QoWJhC44jCKcelV2PJ/jBBtSFwYNhzFeY7Ztl06mXvm6sEyk6W
 SCV1PXy48BLJJGrlQkC4r6ZIx9Zfe3b6QH0UDeBCBvewzlITJbfss6TBNhK5n0T1Wu
 glhM3oBHA4pSEMSagyAakgSE98A8gMFEBcF0n9ANhlSZqkrheFMKMne04M+hvjy7aY
 TdykOr3vHKeqGCo7AKL7UZDgm82RV/0RinuLcqz0XqxAqHFPEwHHmGETpMOgTRMX9+
 TWSEqETWEWBfu2AQiFDsFDJYnFjmNXk0bQ3XoxMleLJAKXkAB1mgjXdjbZeNvEvzhz
 Uq4c8qn2D75eA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=DLq2Nv2j
Subject: Re: [Buildroot] [PATCH 1/1] package/rdma-core: bump to version v48.0
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

Julien, All,

On 2023-10-25 21:25 +0200, Julien Olivain spake thusly:
> For change log, see:
> https://github.com/linux-rdma/rdma-core/releases/tag/v48.0
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Patch tested on branch master at commit 75fa573 with commands:
> 
>     make check-package
>     ...
>     0 warnings generated
> 
>     utils/test-pkg -p rdma-core
>     ...
>     6 builds, 2 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
> 
>     support/testing/run-tests \
>         -d dl -o output_folder \
>         tests.package.test_rdma_core
>     ...
>     OK
> ---
>  package/rdma-core/rdma-core.hash | 2 +-
>  package/rdma-core/rdma-core.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/rdma-core/rdma-core.hash b/package/rdma-core/rdma-core.hash
> index 0dfcce7fe4..f0f2448a8f 100644
> --- a/package/rdma-core/rdma-core.hash
> +++ b/package/rdma-core/rdma-core.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated
> -sha256  c1d84405e05e00bfd99732bdc1b8394ac1332ffd0eedbf0af99f926732f67044  rdma-core-47.0.tar.gz
> +sha256  e78abaa3ed16771bc6c40b538fe27082429363b86b6ce47636bb57a59238b2be  rdma-core-48.0.tar.gz
>  sha256  99e0df1d009a21d0dfb031600c550fd8f4efc0c6b2a4ef8b34a995aa6f79c9f4  COPYING.BSD_MIT
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPL2
>  sha256  c46a557f25b8ef9bec76526c4e593fc13e6cba27e7ba30d73b6497a689cf06f6  COPYING.md
> diff --git a/package/rdma-core/rdma-core.mk b/package/rdma-core/rdma-core.mk
> index 9cc9434744..41f10d44f6 100644
> --- a/package/rdma-core/rdma-core.mk
> +++ b/package/rdma-core/rdma-core.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -RDMA_CORE_VERSION = 47.0
> +RDMA_CORE_VERSION = 48.0
>  RDMA_CORE_SITE = $(call github,linux-rdma,rdma-core,v$(RDMA_CORE_VERSION))
>  RDMA_CORE_LICENSE = GPL-2.0 or BSD-2-Clause
>  RDMA_CORE_LICENSE_FILES = COPYING.GPL2 COPYING.BSD_MIT COPYING.md
> -- 
> 2.41.0
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
