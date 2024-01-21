Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16356C47422
	for <buildroot@archiver.kernel.org>; Sun, 21 Jan 2024 19:14:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9B5FE40136;
	Sun, 21 Jan 2024 19:14:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B5FE40136
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JjgTvELqQMOh; Sun, 21 Jan 2024 19:14:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 70437404F8;
	Sun, 21 Jan 2024 19:14:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 70437404F8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 987971BF3C9
 for <buildroot@lists.busybox.net>; Sun, 21 Jan 2024 19:14:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 718078215C
 for <buildroot@lists.busybox.net>; Sun, 21 Jan 2024 19:14:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 718078215C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v6nbtddbvOPh for <buildroot@lists.busybox.net>;
 Sun, 21 Jan 2024 19:14:12 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F11B282068
 for <buildroot@buildroot.org>; Sun, 21 Jan 2024 19:14:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F11B282068
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 0579013F8A7;
 Sun, 21 Jan 2024 20:14:06 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 21 Jan 2024 20:14:06 +0100
Date: Sun, 21 Jan 2024 20:14:06 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <Za1s_qUfC2CeN1Wy@landeda>
References: <20240121183728.50314-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240121183728.50314-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1705864449;
 bh=T0q7j3O84CdxCBA0htdQOeoDMRz6sgR5EwWeQdBZGQo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AVFh55bJ1p7P8RGL/QXD6MUGz860eCklvLdKdi0zHoDdsHOm0AjCxoHH2wN1pP6WO
 doRwxngQd6Lh8bq1zRaSuRSIN36FkrisM9ilS/FAs8txtFIWSu5/UbxMrJyMLNtkZr
 +9V8kxJeXVMxPMGN8+wwZGhUR6t1juQ9C0c6Dy5GM/P/Bid0VBATYaH8Olyqn3Pqrx
 /eAcDPLKTORVOItttT5cAXBxzNyB3MEIhx+rX6vl4YbkY8rxHmHCN1umMKuw3MHGKS
 vCyi4m0hi/0uZGzBluH1/wtSPlhXzd/hRNgV//EYvg0vOfxAxE0uhC5rEGDJ/XfExp
 ooxVz7zJhh1mw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=AVFh55bJ
Subject: Re: [Buildroot] [PATCH 1/1] package/highway: fix package license
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

On 2024-01-21 19:37 +0100, Julien Olivain spake thusly:
> Commit 0db3c08daf "package/highway: bump to version 1.0.7" updated the
> package, but forgot to update the legal information accordingly.
> 
> Highway was relicensed from "Apache-2.0" (only) to dual "Apache-2.0 or
> BSD-3-Clause" in upstream commit [1]. This commit was first included
> in Highway version 1.0.6. See [2].
> 
> This commit updates _LICENSE, _LICENSE_FILES and adds the new license
> hash.
> 
> [1] https://github.com/google/highway/commit/92a7139f88e534378fb2525abb919ac79d894f82
> [2] https://github.com/google/highway/releases/tag/1.0.6
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/highway/highway.hash | 1 +
>  package/highway/highway.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/highway/highway.hash b/package/highway/highway.hash
> index 55b1bca774..3cb497f20a 100644
> --- a/package/highway/highway.hash
> +++ b/package/highway/highway.hash
> @@ -1,3 +1,4 @@
>  # Locally computed:
>  sha256  5434488108186c170a5e2fca5e3c9b6ef59a1caa4d520b008a9b8be6b8abe6c5  highway-1.0.7.tar.gz
>  sha256  43070e2d4e532684de521b885f385d0841030efa2b1a20bafb76133a5e1379c1  LICENSE
> +sha256  6dcc159f448e3aca73a15e355d0a6735ca3fd224abe637e0b7437dce2d24f765  LICENSE-BSD3
> diff --git a/package/highway/highway.mk b/package/highway/highway.mk
> index 692794959a..bb87e5fc0d 100644
> --- a/package/highway/highway.mk
> +++ b/package/highway/highway.mk
> @@ -6,8 +6,8 @@
>  
>  HIGHWAY_VERSION = 1.0.7
>  HIGHWAY_SITE = $(call github,google,highway,$(HIGHWAY_VERSION))
> -HIGHWAY_LICENSE = Apache-2.0
> -HIGHWAY_LICENSE_FILES = LICENSE
> +HIGHWAY_LICENSE = Apache-2.0 or BSD-3-Clause
> +HIGHWAY_LICENSE_FILES = LICENSE LICENSE-BSD3
>  HIGHWAY_INSTALL_STAGING = YES
>  
>  HIGHWAY_CXXFLAGS = $(TARGET_CXXFLAGS)
> -- 
> 2.43.0
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
