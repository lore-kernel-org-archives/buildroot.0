Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EC24C64EC7
	for <buildroot@archiver.kernel.org>; Tue, 28 Feb 2023 12:51:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A121740B51;
	Tue, 28 Feb 2023 12:51:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A121740B51
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1J9AqCRCEp0p; Tue, 28 Feb 2023 12:51:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DB70A404D8;
	Tue, 28 Feb 2023 12:51:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB70A404D8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CE0BA1BF421
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 12:51:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A6F7C81F09
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 12:51:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A6F7C81F09
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jDLWHYgs2gc2 for <buildroot@lists.busybox.net>;
 Tue, 28 Feb 2023 12:51:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3027980310
Received: from mail.tkos.co.il (golan.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3027980310
 for <buildroot@buildroot.org>; Tue, 28 Feb 2023 12:51:36 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 7AE6D440F4F;
 Tue, 28 Feb 2023 14:47:05 +0200 (IST)
References: <20230228124151.16044-1-mf@go-sys.de>
User-agent: mu4e 1.9.21; emacs 28.2
To: Michael Fischer <mf@go-sys.de>
Date: Tue, 28 Feb 2023 14:50:30 +0200
In-reply-to: <20230228124151.16044-1-mf@go-sys.de>
Message-ID: <87h6v67y23.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1677588425;
 bh=gloXAISP4kMWZilu46/6kiGy+2jefC8P9IgVznfTczY=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=inZphyg71h+srAIkOx4D+hr855ERZ08knegMUDVuI2CCU08hlLlNK83evKQndLq3F
 M5J22LtoY1/lJ8rF12hohMzzxay8SWX8QyLDaPIJzIolNPqps6KqUeha8tGcGdze4s
 Ke5EGlSSitIMUrmaEJcvMO4hvCKGa05G5SsvGdFRf6SV56pDwOCoU3eG6VN1GskTiP
 P/JpmLjAaQAjj9pJQv7i+O+zUv0T7lPNfEN4wExFQYjpq1SPamD9wc/THyfCQD7Bpi
 tHmtb372Wcvakhqq/XzsrVLkZv+ZxAziYFRPUkph9eAkaaXTtCDn/XXWAYEwR/VZQx
 lul1P2FYp1Iug==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=inZphyg7
Subject: Re: [Buildroot] [PATCH] package/libcurl: bump version to 7.88.1
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Michael,

On Tue, Feb 28 2023, Michael Fischer wrote:
> Changelog: https://curl.se/changes.html#7_88_1
>
> Signed-off-by: Michael Fischer <mf@go-sys.de>

There is a pending patch from Peter K doing the same bump:

  http://patchwork.ozlabs.org/project/buildroot/patch/20230227161040.2239744-1-peter@korsgaard.com/

baruch

> ---
>  package/libcurl/libcurl.hash | 4 ++--
>  package/libcurl/libcurl.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
> index 714b02acb0..32b3d0b5e2 100644
> --- a/package/libcurl/libcurl.hash
> +++ b/package/libcurl/libcurl.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated after checking pgp signature
> -# https://curl.se/download/curl-7.88.0.tar.xz.asc
> +# https://curl.se/download/curl-7.88.1.tar.xz.asc
>  # signed with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
> -sha256  fd17432cf28714a4cf39d89e26b8ace0d8901199fe5d01d75eb0ae3bbfcc731f  curl-7.88.0.tar.xz
> +sha256  1dae31b2a7c1fe269de99c0c31bb488346aab3459b5ffca909d6938249ae415f  curl-7.88.1.tar.xz
>  sha256  b1d7feb949ea5023552029fbe0bf5db4f23c2f85e9b8e51e18536f0ecbf9c524  COPYING
> diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
> index eb481e4782..1a1594a45e 100644
> --- a/package/libcurl/libcurl.mk
> +++ b/package/libcurl/libcurl.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBCURL_VERSION = 7.88.0
> +LIBCURL_VERSION = 7.88.1
>  LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
>  LIBCURL_SITE = https://curl.se/download
>  LIBCURL_DEPENDENCIES = host-pkgconf \


-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
