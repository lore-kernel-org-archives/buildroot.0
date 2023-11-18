Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2C9DC5ACB3
	for <buildroot@archiver.kernel.org>; Sat, 18 Nov 2023 14:33:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8D34D40516;
	Sat, 18 Nov 2023 14:33:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D34D40516
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mWomEI9afaxe; Sat, 18 Nov 2023 14:33:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 74C98404B9;
	Sat, 18 Nov 2023 14:33:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 74C98404B9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2EF1A1BF364
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 14:33:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 08BED60B15
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 14:33:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08BED60B15
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id poQ1nCU9ewGr for <buildroot@lists.busybox.net>;
 Sat, 18 Nov 2023 14:33:24 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0786160B0B
 for <buildroot@buildroot.org>; Sat, 18 Nov 2023 14:33:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0786160B0B
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4173:7e62:c00c:757b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 2B5B2780316;
 Sat, 18 Nov 2023 15:33:20 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 18 Nov 2023 15:33:19 +0100
Date: Sat, 18 Nov 2023 15:33:19 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20231118143319.GZ996011@scaer>
References: <20231114204012.372583-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231114204012.372583-1-ju.o@free.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1700318002;
 bh=F/v5umvTxIZfvzYcmOmJOF38/bG+hw0tJgXkKdvAs3I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SClgkrhs4jTVkAh8OYvTxJ1EuZ3L73qYYE12qyhUXQEIb8E0gZzCwd9mN6oj+oQtw
 IY9eysVmdJk6gJuGdfvoKNrhEsjd5nQRkm1qpVIoW6srtpgOIKHlLaA8V70/jVW+5w
 Oi4SdJylfyWxiMTtTXpR/1OrVvOMMIPZgGspiiRuXOoz9hb3wdBkk7e8DK5K1ycEZg
 AhRF4WXoqPT8YUHfrSTD5ujQJmLnqCRdZf7K1xKJVoWuD7a5jmzHL/6Ov0m1Ert+v9
 YUDYmtmvy1/2HXU3cXTq60hLkTqk9WJh5C8A+vibmAyHf6YDvgvH3Zs1WHXkqC/k1P
 jxGjYMRDgrTnA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=SClgkrhs
Subject: Re: [Buildroot] [PATCH 1/1] package/openblas: bump to version
 v0.3.25
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

On 2023-11-14 21:40 +0100, Julien Olivain spake thusly:
> For change log since v0.3.24, see:
> https://github.com/xianyi/OpenBLAS/releases/tag/v0.3.25
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
> Patch tested on branch master at commit f1ee701 with commands:
> 
>     make check-package
>     ...
>     0 warnings generated
> 
>     support/testing/run-tests \
>         -d dl -o output_folder \
>         tests.package.test_openblas
>     ...
>     OK
> ---
>  package/openblas/openblas.hash | 6 +++---
>  package/openblas/openblas.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/openblas/openblas.hash b/package/openblas/openblas.hash
> index 8e416f98f6..d946ae7296 100644
> --- a/package/openblas/openblas.hash
> +++ b/package/openblas/openblas.hash
> @@ -1,5 +1,5 @@
> -# From https://github.com/xianyi/OpenBLAS/releases/tag/v0.3.24
> -md5  23599a30e4ce887590957d94896789c8  openblas-0.3.24.tar.gz
> +# From https://github.com/xianyi/OpenBLAS/releases/tag/v0.3.25
> +md5  48384e324cd1cdcfbdb0d2e16ca55327  openblas-0.3.25.tar.gz
>  # Locally calculated
> -sha256  ceadc5065da97bd92404cac7254da66cc6eb192679cf1002098688978d4d5132  openblas-0.3.24.tar.gz
> +sha256  4c25cb30c4bb23eddca05d7d0a85997b8db6144f5464ba7f8c09ce91e2f35543  openblas-0.3.25.tar.gz
>  sha256  190b5a9c8d9723fe958ad33916bd7346d96fab3c5ea90832bb02d854f620fcff  LICENSE
> diff --git a/package/openblas/openblas.mk b/package/openblas/openblas.mk
> index aacfc74b53..76833121a9 100644
> --- a/package/openblas/openblas.mk
> +++ b/package/openblas/openblas.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -OPENBLAS_VERSION = 0.3.24
> +OPENBLAS_VERSION = 0.3.25
>  OPENBLAS_SITE = https://github.com/xianyi/OpenBLAS/releases/download/v$(OPENBLAS_VERSION)
>  OPENBLAS_LICENSE = BSD-3-Clause
>  OPENBLAS_LICENSE_FILES = LICENSE
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
