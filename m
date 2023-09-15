Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BC08CD37AA
	for <buildroot@archiver.kernel.org>; Fri, 15 Sep 2023 21:35:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D933540545;
	Fri, 15 Sep 2023 21:35:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D933540545
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 34JcnE0YDptH; Fri, 15 Sep 2023 21:35:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 13E5C419E8;
	Fri, 15 Sep 2023 21:35:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 13E5C419E8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9E09B1BF3D2
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 21:35:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7604642236
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 21:35:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7604642236
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UFzHulM_gx8D for <buildroot@lists.busybox.net>;
 Fri, 15 Sep 2023 21:34:59 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4A88042222
 for <buildroot@buildroot.org>; Fri, 15 Sep 2023 21:34:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A88042222
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:9162:d12f:41c1:9c3])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 94CB12003C1;
 Fri, 15 Sep 2023 23:34:55 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 15 Sep 2023 23:34:55 +0200
Date: Fri, 15 Sep 2023 23:34:55 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Joachim Wiberg <troglobit@gmail.com>
Message-ID: <20230915213455.GK2571@scaer>
References: <20230915055817.3079333-1-troglobit@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230915055817.3079333-1-troglobit@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1694813697;
 bh=5NvqTzfCm1CCdFuolY2w4bDAf3i1a2pSu0IxEJGjFU4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Odx9/i0CBLXambqHQHhIqFu0fYHN3Av/0BpxJJBzt2aQ+/pxJOyFBgHHCmz5V33ik
 sjX6zpSO2wLKtlzKQhDWzRBOx8qmCambwLdhAJQ7gpSt0aSb7FA/kLJ3E7MTslxdKz
 ioP7AElcCT32O3fBRSsLJuuUP6/F4hWmHIjZoep9KjIL5aylVFC5cU+bOgbnR8/oFY
 sFOTTWR7RDKWy01KEA4Ev0tpNzbpOqBHln/esMgX7knn7L+eORihY2wBcDhI5XlxsT
 M4qg8zvNauPDAXVQx4eyDqQbNLf/ViTaQmlxUjVHhew8UgoLZs1AtzhYUqsAq4OeAA
 j7+4BIWPDrvEA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Odx9/i0C
Subject: Re: [Buildroot] [PATCH 1/1] package/sysklogd: bump to v2.5.2
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

Joachim, All,

On 2023-09-15 07:58 +0200, Joachim Wiberg spake thusly:
>  - Improved accuracy of MARK timer, optional, default: 20 minutes.
>  - Fix sub-second faking of kernel timestamps
>  - Fix reading kernel logs from /proc/kmsg, regression in v2.4.0.
>    Only relevant to really old kernels (pre 4.4?) or systems with
>    static device nodes and no auto-devtmpfs mounting in kernel
> 
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/sysklogd/sysklogd.hash | 2 +-
>  package/sysklogd/sysklogd.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/sysklogd/sysklogd.hash b/package/sysklogd/sysklogd.hash
> index 30ce6d9c0b..7e00990174 100644
> --- a/package/sysklogd/sysklogd.hash
> +++ b/package/sysklogd/sysklogd.hash
> @@ -1,5 +1,5 @@
>  # Upstream .sha256 from GitHub
> -sha256  e1d635944e5a6062c8ea18b9506668ebdaefacea1965147f60cf3fb3a25770e8  sysklogd-2.5.0.tar.gz
> +sha256  9da4444285772ce2bfc9c687be8f978b7a9fe7d3937347cd4938eda0c4545e05  sysklogd-2.5.2.tar.gz
>  
>  # Locally calculated
>  sha256  7a71d7603a7c4456df441463e54da35acf151c1be0879246de63544f1f34f477  LICENSE
> diff --git a/package/sysklogd/sysklogd.mk b/package/sysklogd/sysklogd.mk
> index ebc9f89cf7..7a46d759d3 100644
> --- a/package/sysklogd/sysklogd.mk
> +++ b/package/sysklogd/sysklogd.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -SYSKLOGD_VERSION = 2.5.0
> +SYSKLOGD_VERSION = 2.5.2
>  SYSKLOGD_SITE = https://github.com/troglobit/sysklogd/releases/download/v$(SYSKLOGD_VERSION)
>  SYSKLOGD_LICENSE = BSD-3-Clause
>  SYSKLOGD_LICENSE_FILES = LICENSE
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
