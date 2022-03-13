Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C5F2C433EF
	for <buildroot@archiver.kernel.org>; Sun, 13 Mar 2022 18:12:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D459D60BB5;
	Sun, 13 Mar 2022 18:12:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z7s2pWojMdBz; Sun, 13 Mar 2022 18:12:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E3AF460B1F;
	Sun, 13 Mar 2022 18:12:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2C0D91BF41C
 for <buildroot@lists.busybox.net>; Sun, 13 Mar 2022 18:12:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 19AFB408D9
 for <buildroot@lists.busybox.net>; Sun, 13 Mar 2022 18:12:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=tkos.co.il
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zpIILC_f6fsO for <buildroot@lists.busybox.net>;
 Sun, 13 Mar 2022 18:12:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.tkos.co.il (guitar.tcltek.co.il [84.110.109.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4980F408D3
 for <buildroot@buildroot.org>; Sun, 13 Mar 2022 18:12:13 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 50C82440FA1;
 Sun, 13 Mar 2022 20:12:03 +0200 (IST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
 s=default; t=1647195123;
 bh=j9ofwS5bs+A4+mElNKYNflA/if3IZ5NTnSFVPg2M8s8=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=oDScfnZ+1SECCTzt3Gmi5Hu8rmrSLbjbS+fLWqoLxDZ8dztcr/WD7LYI58tZ+Wcv+
 6fVdmWZo9/EszXoKpY8TZarfCgJUhc3jpMgpF0x3ogpUiQQAuNY5kg+ggz6IIieJRE
 ByAj+8Sup5vGlwjZrmKWQh0Idw74Go2aKut1+vITHskTxGPB8dqN2fZo0lu+Zx3P9b
 5ZmoLyTeJCPAyqrFmXTXf6c7p7F0RpaIiy1IeYZ7jkcQTVcvnrF2FVwKV7stOR5LuY
 0b6pH7ofu4aBUjb570PKABHhN/vGzig7HtwwcYyvIVyNZj3CH3YjeiWXjFL+v9Pmdy
 FTwn2zHFTrY9Q==
References: <20220313130424.3046857-1-bernd.kuhls@t-online.de>
User-agent: mu4e 1.6.10; emacs 27.1
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 13 Mar 2022 20:05:45 +0200
In-reply-to: <20220313130424.3046857-1-bernd.kuhls@t-online.de>
Message-ID: <877d8xd8nb.fsf@tarshish>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libcurl: bump version to 7.82.0
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
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Bernd,

On Sun, Mar 13 2022, Bernd Kuhls wrote:
> Changelog: https://curl.se/changes.html
>
> Updated license hash due to copyright year bump:
> https://github.com/curl/curl/commit/0409192b1fde6b7a4f09667e80ca5dc555eab3f1
>
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Thanks for the bump.

It looks like NSS crypto back-end support requires --with-nss-deprecated
now. Maybe just drop deprecated NSS support?

baruch

> ---
>  package/libcurl/libcurl.hash | 6 +++---
>  package/libcurl/libcurl.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
> index 63d6ba306c..4be245041c 100644
> --- a/package/libcurl/libcurl.hash
> +++ b/package/libcurl/libcurl.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated after checking pgp signature
> -# https://curl.se/download/curl-7.81.0.tar.xz.asc
> +# https://curl.se/download/curl-7.82.0.tar.xz.asc
>  # signed with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
> -sha256  a067b688d1645183febc31309ec1f3cdce9213d02136b6a6de3d50f69c95a7d3  curl-7.81.0.tar.xz
> -sha256  6fd1a1c008b5ef4c4741dd188c3f8af6944c14c25afa881eb064f98fb98358e7  COPYING
> +sha256  0aaa12d7bd04b0966254f2703ce80dd5c38dbbd76af0297d3d690cdce58a583c  curl-7.82.0.tar.xz
> +sha256  321b1a09ebc30410f2e837c072e5521cf7095b757193af4a7dae1086e36ed31a  COPYING
> diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
> index 20ebb4f271..863cc268b4 100644
> --- a/package/libcurl/libcurl.mk
> +++ b/package/libcurl/libcurl.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBCURL_VERSION = 7.81.0
> +LIBCURL_VERSION = 7.82.0
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
