Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F086BC35274
	for <buildroot@archiver.kernel.org>; Mon, 18 Dec 2023 16:45:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9B0AE40493;
	Mon, 18 Dec 2023 16:45:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B0AE40493
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SCb7s4jLE_qf; Mon, 18 Dec 2023 16:45:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 08C23408A8;
	Mon, 18 Dec 2023 16:45:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 08C23408A8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 18AA21BF2B3
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 16:45:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E1AAB80C04
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 16:45:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1AAB80C04
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M1loapVjfYCH for <buildroot@lists.busybox.net>;
 Mon, 18 Dec 2023 16:45:27 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2CB2E80BE1
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 16:45:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2CB2E80BE1
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 56A88B0053D;
 Mon, 18 Dec 2023 17:45:20 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 18 Dec 2023 17:45:20 +0100
Date: Mon, 18 Dec 2023 17:45:20 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <ZYB3IOYkssfcdw7t@landeda>
References: <20231205235919.510051-1-adam.duskett@amarulasolutions.com>
 <20231205235919.510051-2-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231205235919.510051-2-adam.duskett@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1702917923;
 bh=ppBF33HT2XaFBymwcsiJ7lHh6MmgOTFRu3BkL1y3ejk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qolb1UbfjW0uknE4yvYV+X4Y0e2tlfpcgg+So+vW0wtRjuwgfaw32eI8oGNup/ekp
 RnhEln28bLNSQBf4UxTsm67dNFhKU4qUTelslQgpkJWBHAWjWaKsVEx4LDXa86ONqY
 /NtxAmfp1h3EwizGlGKvaj4rtX+RgqoS95cfhD4EwTQHfCak8EPp60U3MugMNTaoY7
 N3mhMr4pyQYy99jL8pimISGboc2lkFs2k/Hk0GJryNmAitiWw2JxkddKnYm0pkrsS2
 +j8KRmy3KN80XQLAAsK5Phd4D2UTmaOEoFOGW/w5FqIc/RR4Hyc0nkltE1+1xkRF2k
 Vse2P/Un6QABQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=qolb1Ubf
Subject: Re: [Buildroot] [PATCH 1/3]
 package/giflib/0002-Fix-CVE-2022-28506.patch: New security patch
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
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Adam, All,

On 2023-12-05 16:59 -0700, Adam Duskett spake thusly:
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
>  package/giflib/0002-Fix-CVE-2022-28506.patch | 34 ++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 package/giflib/0002-Fix-CVE-2022-28506.patch
> 
> diff --git a/package/giflib/0002-Fix-CVE-2022-28506.patch b/package/giflib/0002-Fix-CVE-2022-28506.patch
> new file mode 100644
> index 0000000000..35d5f60a95
> --- /dev/null
> +++ b/package/giflib/0002-Fix-CVE-2022-28506.patch
> @@ -0,0 +1,34 @@
> +From c0cca041fc4fb6748d8dff3675fe7a839253d668 Mon Sep 17 00:00:00 2001
> +From: Sandro Mani <manisandro@gmail.com>
> +Date: Tue, 5 Dec 2023 16:24:32 -0700
> +Subject: [PATCH] Fix CVE-2022-28506

You forgot tadd GIFLIB_IGNORE_CVES = CVE-2022-28506

Applied to master with the above fixed, thanks.

Regards,
Yann E. MORIN.

> +From: giflib-5.2.1-17.fc39.src.rpm
> +Fixes https://nvd.nist.gov/vuln/detail/CVE-2022-28506
> +Upstream: https://sourceforge.net/p/giflib/bugs/159/
> +
> +Signed-off-by: Sandro Mani <manisandro@gmail.com>
> +Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> +---
> + gif2rgb.c | 5 +++++
> + 1 file changed, 5 insertions(+)
> +
> +diff --git a/gif2rgb.c b/gif2rgb.c
> +index 8d7c0ff..d9a469f 100644
> +--- a/gif2rgb.c
> ++++ b/gif2rgb.c
> +@@ -294,6 +294,11 @@ static void DumpScreen2RGB(char *FileName, int OneFileFlag,
> +             GifRow = ScreenBuffer[i];
> +             GifQprintf("\b\b\b\b%-4d", ScreenHeight - i);
> +             for (j = 0, BufferP = Buffer; j < ScreenWidth; j++) {
> ++                /* Check if color is within color palete */
> ++                if (GifRow[j] >= ColorMap->ColorCount)
> ++                {
> ++                   GIF_EXIT(GifErrorString(D_GIF_ERR_IMAGE_DEFECT));
> ++                }
> +                 ColorMapEntry = &ColorMap->Colors[GifRow[j]];
> +                 *BufferP++ = ColorMapEntry->Red;
> +                 *BufferP++ = ColorMapEntry->Green;
> +-- 
> +2.43.0
> +
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
