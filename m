Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFA51C77B73
	for <buildroot@archiver.kernel.org>; Sat,  6 May 2023 14:44:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9BBC460812;
	Sat,  6 May 2023 14:44:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9BBC460812
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0MSy8nSh90un; Sat,  6 May 2023 14:44:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CFFFD6104F;
	Sat,  6 May 2023 14:44:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFFFD6104F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 050C41BF36E
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 14:41:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DF4AC610FA
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 14:41:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF4AC610FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lere91XHHKZp for <buildroot@lists.busybox.net>;
 Sat,  6 May 2023 14:41:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D2AA261152
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D2AA261152
 for <buildroot@buildroot.org>; Sat,  6 May 2023 14:41:28 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:ae89:1f5e:7283:231f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 07D8BB0059B;
 Sat,  6 May 2023 16:41:24 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 06 May 2023 16:41:24 +0200
Date: Sat, 6 May 2023 16:41:24 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230506144124.GD2661@scaer>
References: <20230329191323.733704-1-ju.o@free.fr>
 <20230329191323.733704-2-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230329191323.733704-2-ju.o@free.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683384087;
 bh=b7zdstxYTuQT/Z89Qo7C1wMr9mDIa/0pHz00ZTtGyCA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UIz1kTGHVZ1RwDwQJol8/U7uZLMaHpv6j4061PASoUTHYQwJf0DMIdMO9eHNK+Rpg
 CWuNkK7ebM4zdnEaMwyCTeKlf/tDYY0J2Q4HIm+A7xMPgWNx7l6lmbpHyXbWkHht++
 JmYIZmvZ2d4w9h32zDhXtncfs5Pi2ZNdRBD33aybc6500YixBY3RWu3nyAZl5m0nKR
 zkNRVT1so7SRtDuW5pZmP3mUYTK/0xNPj5aalhSeCgG/eOXcuCdLM6bs1AtgapJBB+
 CgCyGUbStcWxVrTZGYNfObjRd5ZKY1Gy8uP+GJ9eekJN1QXDpTtzJcc45CmsTNnvIr
 IFGWxN0miXYBQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=UIz1kTGH
Subject: Re: [Buildroot] [PATCH 2/2] package/openblas: bump to version
 v0.3.22
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

On 2023-03-29 21:13 +0200, Julien Olivain spake thusly:
> For change log since v0.3.21, see:
> - https://github.com/xianyi/OpenBLAS/releases/tag/v0.3.22
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Both applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/openblas/openblas.hash | 2 +-
>  package/openblas/openblas.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/openblas/openblas.hash b/package/openblas/openblas.hash
> index 3a52600056..a8b5527e81 100644
> --- a/package/openblas/openblas.hash
> +++ b/package/openblas/openblas.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  f36ba3d7a60e7c8bcc54cd9aaa9b1223dd42eaf02c811791c37e8ca707c241ca  openblas-0.3.21.tar.gz
> +sha256  7fa9685926ba4f27cfe513adbf9af64d6b6b63f9dcabb37baefad6a65ff347a7  openblas-0.3.22.tar.gz
>  sha256  190b5a9c8d9723fe958ad33916bd7346d96fab3c5ea90832bb02d854f620fcff  LICENSE
> diff --git a/package/openblas/openblas.mk b/package/openblas/openblas.mk
> index ac40c57afb..27f20654e7 100644
> --- a/package/openblas/openblas.mk
> +++ b/package/openblas/openblas.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -OPENBLAS_VERSION = 0.3.21
> +OPENBLAS_VERSION = 0.3.22
>  OPENBLAS_SITE = https://github.com/xianyi/OpenBLAS/releases/download/v$(OPENBLAS_VERSION)
>  OPENBLAS_LICENSE = BSD-3-Clause
>  OPENBLAS_LICENSE_FILES = LICENSE
> -- 
> 2.40.0
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
