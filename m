Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74F0AC4167B
	for <buildroot@archiver.kernel.org>; Mon, 27 Nov 2023 18:22:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 32DE1817A5;
	Mon, 27 Nov 2023 18:22:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 32DE1817A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T_-To3VqF8V0; Mon, 27 Nov 2023 18:22:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 68BBB817B3;
	Mon, 27 Nov 2023 18:22:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 68BBB817B3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EF4241BF348
 for <buildroot@lists.busybox.net>; Mon, 27 Nov 2023 18:22:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D545960F0D
 for <buildroot@lists.busybox.net>; Mon, 27 Nov 2023 18:22:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D545960F0D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1APoIfTP1OzT for <buildroot@lists.busybox.net>;
 Mon, 27 Nov 2023 18:22:17 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7553360EDF
 for <buildroot@buildroot.org>; Mon, 27 Nov 2023 18:22:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7553360EDF
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:7618:50d5:c153:9a40])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id B5400B00593;
 Mon, 27 Nov 2023 19:22:13 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 27 Nov 2023 19:22:13 +0100
Date: Mon, 27 Nov 2023 19:22:13 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Alexander Egorenkov <egorenar-dev@posteo.net>
Message-ID: <20231127182213.GY3177259@scaer>
References: <20231127115959.25625-1-egorenar-dev@posteo.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231127115959.25625-1-egorenar-dev@posteo.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1701109335;
 bh=F6Jy422NaC/oHnrtRJTHb/HGEbqP9a1HrBIbd9YzVUU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sfhFdQfkxj3Ys62h5TIk0rkWzOQlGERpH1iW480WIu63nzi88jl55CQDQBUseMUl/
 fgd3J6iuTepOl47RyyIGaCY0ThHfi0Zh/ku7HGD2jC/7wh7rcdCQlVV2CFbVS1mHtJ
 qJ8luLjZJIAwNbNJgfWTM6I9ZGt77YrYpWT95/O1OhHqvoF1BQTB5Tp+hfGICoxeGw
 68IvhTZeqZVX4UYxdTVf7EApLZNromtPHBebMntj+iC8FHZnjliYp//usujwIky70S
 UoKTOQkzS2jAAeEqCBZhCzbZFJrnKZa4CwXgCbIYklkqVnlOQVPxYco3hAvhjXAsas
 XDJas35VXsC0w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=sfhFdQfk
Subject: Re: [Buildroot] [PATCH 1/1] package/makedumpfile: bump to version
 1.7.4
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

Alexander, All,

On 2023-11-27 11:59 +0000, Alexander Egorenkov spake thusly:
> Release notes:
> - https://github.com/makedumpfile/makedumpfile/releases/tag/1.7.4
> 
> Signed-off-by: Alexander Egorenkov <egorenar-dev@posteo.net>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/makedumpfile/makedumpfile.hash | 2 +-
>  package/makedumpfile/makedumpfile.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/makedumpfile/makedumpfile.hash b/package/makedumpfile/makedumpfile.hash
> index 665023d87be5..fdb30de88d8d 100644
> --- a/package/makedumpfile/makedumpfile.hash
> +++ b/package/makedumpfile/makedumpfile.hash
> @@ -1,3 +1,3 @@
>  # Locally computed:
> -sha256  f059dbebf5156a9ab97cd3c1f41ad5df3436c7ab4dd6dbffa234fc4e93cfa2ce  makedumpfile-1.7.3.tar.gz
> +sha256  0554f5de516c51f5756e437dbfc353722b16b20e875241275554b474e89298db  makedumpfile-1.7.4.tar.gz
>  sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
> diff --git a/package/makedumpfile/makedumpfile.mk b/package/makedumpfile/makedumpfile.mk
> index 6102c92bd8bb..410752682da4 100644
> --- a/package/makedumpfile/makedumpfile.mk
> +++ b/package/makedumpfile/makedumpfile.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -MAKEDUMPFILE_VERSION = 1.7.3
> +MAKEDUMPFILE_VERSION = 1.7.4
>  MAKEDUMPFILE_SITE = https://github.com/makedumpfile/makedumpfile/releases/download/$(MAKEDUMPFILE_VERSION)
>  MAKEDUMPFILE_DEPENDENCIES = bzip2 elfutils xz zlib
>  MAKEDUMPFILE_LICENSE = GPL-2.0
> -- 
> 2.42.0
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
