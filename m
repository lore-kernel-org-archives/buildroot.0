Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9E2AC6FD18
	for <buildroot@archiver.kernel.org>; Tue, 28 Mar 2023 20:25:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C4A940969;
	Tue, 28 Mar 2023 20:25:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C4A940969
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jsRhlKfwcbyO; Tue, 28 Mar 2023 20:25:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EDA3640982;
	Tue, 28 Mar 2023 20:25:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EDA3640982
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B2AC91BF3C4
 for <buildroot@lists.busybox.net>; Tue, 28 Mar 2023 20:25:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 85CF840147
 for <buildroot@lists.busybox.net>; Tue, 28 Mar 2023 20:25:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 85CF840147
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lu-UP1rhrWIo for <buildroot@lists.busybox.net>;
 Tue, 28 Mar 2023 20:25:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 91F5E400D9
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 91F5E400D9
 for <buildroot@buildroot.org>; Tue, 28 Mar 2023 20:25:48 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 3228B5FF96;
 Tue, 28 Mar 2023 22:25:33 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 28 Mar 2023 22:25:33 +0200
Date: Tue, 28 Mar 2023 22:25:33 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <20230328202533.GD3204460@scaer>
References: <20230326130937.56650-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230326130937.56650-1-f.fainelli@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1680035145;
 bh=3dBi71hnvaD3Z9K4wXD+KYy+QMNSc/TKK7pZzXe7TUM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=i5TvC+7qOyGBDRRCDiumodiAdCDZeQ548D1soXJCalBMTu8OxetLNd61QREaxk8ZX
 XC+tk0sCXth2wWtY67hWlUpvRkXSGSLO/IMAPnIx0qRcLdPdr6i3rO4uScjvwsp6fu
 9PWmimzaP8U1eqMsHaouBnMm5ry4fSDVvhw8Ii55U63Ie0ybYU7A9x+AdEhzmcaK8A
 eiKJTUbzws+o7zi/GbVuwEdsDgr6F0eu7P99AnHa+sDo58gLFCVcoXDdYLGpx/v/eP
 XzV2Qqhky5thVnYPncp1dJXq79UrOf3U8OkYANA7/EnnP4f4VCshP1EkCSPncvEn8m
 jf5IVocM4ZMJQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=i5TvC+7q
Subject: Re: [Buildroot] [PATCH] package/bluez5_utils: Fix builds with
 musl-libc
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
Cc: marcin@bis.org.pl, d.lang@abatec.at,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Florian, All,

On 2023-03-26 06:09 -0700, Florian Fainelli spake thusly:
> Backport upstream commit ca6546fe521360fcf905bc115b893f322e706cb2
> ("shared: define MAX_INPUT for musl") to fix builds with musl-libc.
> 
> Fixes:
> - http://autobuild.buildroot.net/results/3fd24a604a29eff70e20f82690e3f058f04903f9/
> - http://autobuild.buildroot.net/results/bd57f1813be699cd5ce2ae94f5f511a71fe10428/
> - http://autobuild.buildroot.net/results/90d528cc18a367af2f68e1c0673d962fe399e1ac/
> - http://autobuild.buildroot.net/results/552b700ee129e1c7f651de13f6766eae5325dcbc/
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
>  .../bluez5_utils/0001-musl-max-input.patch    | 35 +++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 package/bluez5_utils/0001-musl-max-input.patch
> 
> diff --git a/package/bluez5_utils/0001-musl-max-input.patch b/package/bluez5_utils/0001-musl-max-input.patch
> new file mode 100644
> index 000000000000..87fbb68f8f40
> --- /dev/null
> +++ b/package/bluez5_utils/0001-musl-max-input.patch
> @@ -0,0 +1,35 @@
> +From ca6546fe521360fcf905bc115b893f322e706cb2 Mon Sep 17 00:00:00 2001
> +From: Sam James <sam@gentoo.org>
> +Date: Tue, 31 Jan 2023 05:52:58 +0000
> +Subject: shared: define MAX_INPUT for musl
> +
> +musl systems don't have MAX_INPUT. Just define it to _POSIX_MAX_INPUT
> +which musl does have if it's not already defined.
> +
> +Note that on glibc, the values match anyway (as of glibc-2.36), and
> +indeed POSIX_MAX_INPUT has the same value on musl too.
> +
> +Bug: https://bugs.gentoo.org/888467

Please add your SoB to this patch, and a note that it is a blackport
(yes, the commit log mentions it is a backport, but when we need to
assess this patch in the future, having the notre in the patch itself is
much easier). I usually do that with a note like:

    Original commit log...

    [yann.morin.1998@free.fr: backport from upstream]
    Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Note: if the path header has the upstream commit sha1 and applies as-is
(possibly with just a bit of fuzz), then "backport from upstream" is
enough. But if you had to rewrite the ptch, and the header does not have
the upstream sha1, then add it to the note:

    [yann.morin.1998@free.fr: backport and adapt from upsteam 1234CDEF]

The most important missing part here that I can't add is your SoB, so
can you please respin?

Regards,
Yann E. MORIN.

> +---
> + src/shared/util.c | 5 +++++
> + 1 file changed, 5 insertions(+)
> +
> +diff --git a/src/shared/util.c b/src/shared/util.c
> +index 2f0ae0e86..b466fb001 100644
> +--- a/src/shared/util.c
> ++++ b/src/shared/util.c
> +@@ -28,6 +28,11 @@
> + #include <sys/random.h>
> + #endif
> + 
> ++/* define MAX_INPUT for musl */
> ++#ifndef MAX_INPUT
> ++#define MAX_INPUT _POSIX_MAX_INPUT
> ++#endif
> ++
> + #include "src/shared/util.h"
> + 
> + void *util_malloc(size_t size)
> +-- 
> +cgit 
> +
> -- 
> 2.34.1
> 

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
