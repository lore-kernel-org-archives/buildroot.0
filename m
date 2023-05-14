Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CF3AC7EE22
	for <buildroot@archiver.kernel.org>; Sun, 14 May 2023 12:25:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99ACA41EDC;
	Sun, 14 May 2023 12:25:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99ACA41EDC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IUOiBGFl-tuB; Sun, 14 May 2023 12:25:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5AA6941ECC;
	Sun, 14 May 2023 12:25:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5AA6941ECC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 243221BF48B
 for <buildroot@lists.busybox.net>; Sun, 14 May 2023 12:25:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F2966401DF
 for <buildroot@lists.busybox.net>; Sun, 14 May 2023 12:25:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F2966401DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z1jmW6YNeXjw for <buildroot@lists.busybox.net>;
 Sun, 14 May 2023 12:25:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE62C40186
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DE62C40186
 for <buildroot@buildroot.org>; Sun, 14 May 2023 12:25:34 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:e91d:2912:5826:9d75])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 338F7B0056B;
 Sun, 14 May 2023 14:25:31 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 14 May 2023 14:25:30 +0200
Date: Sun, 14 May 2023 14:25:30 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230514122530.GV2582048@scaer>
References: <20230513205312.408050-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230513205312.408050-1-ju.o@free.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1684067133;
 bh=bnKhg9LqfxbyRIKzxX9TWMWvO2T9SxSDGMaCN5RApz8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LNwadChN6HFIEHnUk2Abi5SPbYGEEQUcTcSBxP2lqQ7iYtCuOBQAvqQzvQqgFsSM2
 W6zpx3TpUaYjDOJXUcsMXCDko6CJ9UTYUwYBVnVC5/8XELgDO6SAiGh/FhLhmQpHW8
 a6/ElRLF4b26/96MLuTxqJz2WNwIKx+DIcJbKZZ/KT70ezcDr0reVKUgcCWJ2GHvKE
 B/nUxbE87FEAwCV5gWDKBni0cIT5Ykz4k8LPFChEe1nvrQyV9GNi1Uo9tFY4v/alRj
 xJ0k+12TfH+i8BxialHxDDuWKCbb8v/2bkxjowmSHTWVe1mb9ji79W+M1OgfzEFZoq
 V9A01cGxiqv6w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=LNwadChN
Subject: Re: [Buildroot] [PATCH 1/1] package/rdma-core: bump to version v46.0
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

On 2023-05-13 22:53 +0200, Julien Olivain spake thusly:
> For change log, see:
> https://github.com/linux-rdma/rdma-core/releases/tag/v46.0
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Patch tested on branch master at commit d1b8e72 with commands:
> 
>     utils/docker-run make check-package
>     382270 lines processed
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
> index 128ca54e3e..b6ded0af5b 100644
> --- a/package/rdma-core/rdma-core.hash
> +++ b/package/rdma-core/rdma-core.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated
> -sha256  8725cf10f05579585c9fdebdce5613120e632f204fc098a77d24f5974a0c4321  rdma-core-45.0.tar.gz
> +sha256  23fd2a5a656f7d147796660c3d3728b31287bc70a3e913e28ea5da7f39269229  rdma-core-46.0.tar.gz
>  sha256  99e0df1d009a21d0dfb031600c550fd8f4efc0c6b2a4ef8b34a995aa6f79c9f4  COPYING.BSD_MIT
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPL2
>  sha256  c46a557f25b8ef9bec76526c4e593fc13e6cba27e7ba30d73b6497a689cf06f6  COPYING.md
> diff --git a/package/rdma-core/rdma-core.mk b/package/rdma-core/rdma-core.mk
> index 0cbe22d043..acacc0320a 100644
> --- a/package/rdma-core/rdma-core.mk
> +++ b/package/rdma-core/rdma-core.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -RDMA_CORE_VERSION = 45.0
> +RDMA_CORE_VERSION = 46.0
>  RDMA_CORE_SITE = $(call github,linux-rdma,rdma-core,v$(RDMA_CORE_VERSION))
>  RDMA_CORE_LICENSE = GPL-2.0 or BSD-2-Clause
>  RDMA_CORE_LICENSE_FILES = COPYING.GPL2 COPYING.BSD_MIT COPYING.md
> -- 
> 2.40.1
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
