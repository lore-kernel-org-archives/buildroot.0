Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06F10C678DB
	for <buildroot@archiver.kernel.org>; Sat,  4 Mar 2023 19:51:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 973CC4168C;
	Sat,  4 Mar 2023 19:51:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 973CC4168C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UzKRSsiuYsJC; Sat,  4 Mar 2023 19:51:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7940441695;
	Sat,  4 Mar 2023 19:51:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7940441695
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7ED8F1BF337
 for <buildroot@lists.busybox.net>; Sat,  4 Mar 2023 19:51:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6244841695
 for <buildroot@lists.busybox.net>; Sat,  4 Mar 2023 19:51:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6244841695
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2-QwJhXJcE1q for <buildroot@lists.busybox.net>;
 Sat,  4 Mar 2023 19:51:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C61E04168C
Received: from smtpcmd13146.aruba.it (smtpcmd13146.aruba.it [62.149.156.146])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C61E04168C
 for <buildroot@buildroot.org>; Sat,  4 Mar 2023 19:51:15 +0000 (UTC)
Received: from [192.168.50.169] ([146.241.82.238])
 by Aruba Outgoing Smtp  with ESMTPSA
 id YXuSpMnJjfXgAYXuSphhiv; Sat, 04 Mar 2023 20:51:12 +0100
Message-ID: <12e4ada5-7750-017f-a7cc-1833be77c8ff@benettiengineering.com>
Date: Sat, 4 Mar 2023 20:51:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
To: buildroot@buildroot.org
References: <20230222145059.1939094-1-giulio.benetti@benettiengineering.com>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20230222145059.1939094-1-giulio.benetti@benettiengineering.com>
X-CMAE-Envelope: MS4xfGe+5/5qn10LU2VXnj2p6LyKiPT9rYxJJipvGJhQVKFUK1/34u1aTZceClfCJsHbB9t9//DEer0oYbhi+8mpitmNaBkdepjZ1HXEz/4JxLDMeqlUYZoL
 5dg7uqbU3VD12fZMK25DyPN7fLwcwIZspqX3/HkR/Kd2aWra+gsdRJv7PaS93aeEKmdp+pkd13yyhA4+jCSUF6Bx3QpBtfIlzKD27OXstw0FeW+q7eym0oLG
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1677959472; bh=jTEfUOxxavmVuJQbd1Ar3eFyABQioYyuPNJzfDvEqP8=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=U0OV+/njSZNn2cMkwUhqxVmbO76JLOcCkWuGyanf4K9oI70pB84kfnTb2RaTmptr8
 Vm+DWkNi9f/Z3Atpsem0D3/E1xnHwPtTHvgszBDT41OD0cj1pHp8TDQ2+rk7nr0pg5
 tshLXH0I3h/2S2hcUs9JQ5ds1s6OYCjjSJlF8LZwz+Wd7IvaApzclCpTUt9Az5qguw
 x53HjhTyfum3rscbSZliUilbaO7BoMuPg80mEZZm39dQwssGycz8dDXOi+4W/STeRP
 JQBMsdOZavMxAtaCi/A/A7tCgIBU0NhNocfy7NZBCphYyira4Xf0aIS+YWvpOIyyjX
 4rYhxyiVINzWw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=U0OV+/nj
Subject: Re: [Buildroot] [PATCH] package/harfbuzz: bump to version 7.0.1
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch is superseded by this one:
https://patchwork.ozlabs.org/project/buildroot/patch/20230304194927.2385765-1-giulio.benetti@benettiengineering.com/

-- 
Giulio Benetti
Benetti Engineering sas

On 22/02/23 15:50, Giulio Benetti wrote:
> Since the major release changed all the packages that have direct
> dependency to harfbuzz has been succesfully built:
> - efl
> - libass
> - mupdf
> - pango
> - qt5base
> - qt5webengine
> - qt6base
> - sdl2_ttf
> - supertuxkart
> - vlc
> - webkitgtk
> - wpewebkit
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   package/harfbuzz/harfbuzz.hash | 2 +-
>   package/harfbuzz/harfbuzz.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
> index 9489f25c6a..eee48c0b68 100644
> --- a/package/harfbuzz/harfbuzz.hash
> +++ b/package/harfbuzz/harfbuzz.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  4a6ce097b75a8121facc4ba83b5b083bfec657f45b003cd5a3424f2ae6b4434d  harfbuzz-5.3.1.tar.xz
> +sha256  2cf4d3d8f225007511990a36a34195f0d6562ca56df0a8b0885b382837948199  harfbuzz-7.0.1.tar.xz
>   sha256  4345e1735f8bc6d812fed5180cabb5a5e88a4109d332652f2a45c13cfa5ee692  COPYING
> diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
> index b0112168e1..f8724793a9 100644
> --- a/package/harfbuzz/harfbuzz.mk
> +++ b/package/harfbuzz/harfbuzz.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -HARFBUZZ_VERSION = 5.3.1
> +HARFBUZZ_VERSION = 7.0.1
>   HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
>   HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
>   HARFBUZZ_LICENSE = MIT, ISC (ucdn library)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
