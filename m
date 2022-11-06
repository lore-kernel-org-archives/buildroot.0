Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33DFCC4332F
	for <buildroot@archiver.kernel.org>; Sun,  6 Nov 2022 14:07:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C0B8740150;
	Sun,  6 Nov 2022 14:07:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C0B8740150
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mdtoKjLxNVyd; Sun,  6 Nov 2022 14:07:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B7B01400E5;
	Sun,  6 Nov 2022 14:07:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B7B01400E5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 553AB1BF8B4
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 14:07:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3A6C8400E5
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 14:07:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A6C8400E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VhO7h19ZT0jj for <buildroot@lists.busybox.net>;
 Sun,  6 Nov 2022 14:07:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 450E6400B8
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 450E6400B8
 for <buildroot@buildroot.org>; Sun,  6 Nov 2022 14:07:19 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:b857:25fc:60e2:657f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 2A0895FFAF;
 Sun,  6 Nov 2022 15:07:14 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 06 Nov 2022 15:07:13 +0100
Date: Sun, 6 Nov 2022 15:07:13 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221106140713.GU3918838@scaer>
References: <20221106133821.677548-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221106133821.677548-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1667743637;
 bh=P5yBrWkMlGLKVdiuZvo4g6REAJ4t7d1HQNiJyD4TzJ0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lmh9s0rX8x5NfjAQ80jN56zhfB1eUgs2YWY1TbXIUwybGLq7ETXhbkvtaxY69BNoU
 jbP1QxewigbM8XDxelSf5IRys33c/ruEbmZRV/2BaRFiq9b3XRrMjocYJPfy3lG254
 HQxUYyshRMQg/uc3BuV7s823NGt2kr0kLzetgx/wcOeZ1CBZT5uo7d7KYvL/XCIh38
 PAAsSvEAIwb29LYYrdTugFum0MK4QTUeU1qT784HuLbllPuU08EiSkLUjipnmYrY7o
 yL/93bDI4OOswDPFnmytNg8rAn0oRrAprHKhBP3nqj9PoVrlmt69jwjt7SGU/d3crm
 sXRj6vCPaBAqQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=lmh9s0rX
Subject: Re: [Buildroot] [PATCH 1/1] package/mupdf: fix CVE-2021-4216
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
Cc: =?utf-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-11-06 14:38 +0100, Fabrice Fontaine spake thusly:
> A Floating point exception (division-by-zero) flaw was found in Mupdf
> for zero width pages in muraster.c. It is fixed in Mupdf-1.20.0-rc1
> upstream.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...ero-for-zero-width-pages-in-muraster.patch | 29 +++++++++++++++++++
>  package/mupdf/mupdf.mk                        |  3 ++
>  2 files changed, 32 insertions(+)
>  create mode 100644 package/mupdf/0005-Bug-704834-Fix-division-by-zero-for-zero-width-pages-in-muraster.patch
> 
> diff --git a/package/mupdf/0005-Bug-704834-Fix-division-by-zero-for-zero-width-pages-in-muraster.patch b/package/mupdf/0005-Bug-704834-Fix-division-by-zero-for-zero-width-pages-in-muraster.patch
> new file mode 100644
> index 0000000000..099a3fdbab
> --- /dev/null
> +++ b/package/mupdf/0005-Bug-704834-Fix-division-by-zero-for-zero-width-pages-in-muraster.patch
> @@ -0,0 +1,29 @@
> +From 22c47acbd52949421f8c7cb46ea1556827d0fcbf Mon Sep 17 00:00:00 2001
> +From: Sebastian Rasmussen <sebras@gmail.com>
> +Date: Tue, 18 Jan 2022 20:33:10 +0100
> +Subject: [PATCH] Bug 704834: Fix division by zero for zero width pages in
> + muraster.
> +
> +[Retrieved from:
> +https://github.com/ArtifexSoftware/mupdf/commit/22c47acbd52949421f8c7cb46ea1556827d0fcbf]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + source/tools/muraster.c | 5 +++--
> + 1 file changed, 3 insertions(+), 2 deletions(-)
> +
> +diff --git a/source/tools/muraster.c b/source/tools/muraster.c
> +index c2ceb62f2e..97f4ae2633 100644
> +--- a/source/tools/muraster.c
> ++++ b/source/tools/muraster.c
> +@@ -1003,8 +1003,9 @@ initialise_banding(fz_context *ctx, render_details *render, int color)
> + 
> + 	w = render->ibounds.x1 - render->ibounds.x0;
> + 	min_band_mem = (size_t)bpp * w * min_band_height;
> +-	reps = (int)(max_band_memory / min_band_mem);
> +-	if (reps < 1)
> ++	if (min_band_mem > 0)
> ++		reps = (int)(max_band_memory / min_band_mem);
> ++	if (min_band_mem == 0 || reps < 1)
> + 		reps = 1;
> + 
> + 	/* Adjust reps to even out the work between threads */
> diff --git a/package/mupdf/mupdf.mk b/package/mupdf/mupdf.mk
> index 56ea7cc507..e86ba1e73f 100644
> --- a/package/mupdf/mupdf.mk
> +++ b/package/mupdf/mupdf.mk
> @@ -28,6 +28,9 @@ MUPDF_IGNORE_CVES += CVE-2021-3407
>  # 0003-Bug-703791-Stay-within-hash-table-max-key-size-in-cached-color-converter.patch
>  MUPDF_IGNORE_CVES += CVE-2021-37220
>  
> +# 0005-Bug-704834-Fix-division-by-zero-for-zero-width-pages-in-muraster.patch
> +MUPDF_IGNORE_CVES += CVE-2021-4216
> +
>  # The pkg-config name for gumbo-parser is `gumbo`.
>  MUPDF_PKG_CONFIG_PACKAGES = \
>  	freetype2 \
> -- 
> 2.35.1
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
