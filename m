Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B2AEC433EF
	for <buildroot@archiver.kernel.org>; Fri, 29 Apr 2022 08:10:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21083610CA;
	Fri, 29 Apr 2022 08:10:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vJW7opbYMrDk; Fri, 29 Apr 2022 08:10:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 02EB260D6D;
	Fri, 29 Apr 2022 08:10:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7C7321BF2A4
 for <buildroot@lists.busybox.net>; Fri, 29 Apr 2022 08:10:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 78B7940917
 for <buildroot@lists.busybox.net>; Fri, 29 Apr 2022 08:10:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dRbZ29PjjZ4s for <buildroot@lists.busybox.net>;
 Fri, 29 Apr 2022 08:10:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 64BEF40004
 for <buildroot@buildroot.org>; Fri, 29 Apr 2022 08:10:03 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:dcb4:7861:786a:5693])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 6FEEE19F5A6;
 Fri, 29 Apr 2022 10:09:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1651219800;
 bh=T9DUVHIUilDicMnDBqdKyBQlnBNGq7XuE2tL8Rv2D0o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=O0aKHMDlhQdLuQKwNZVMCdQcsVQhnf2D7i448Uvuex71mzIFSl40nX3IbXy6CvfFk
 0CgZghXk9CGOyKuzgp4IDkSFj8zzhUPh3r8X3eJeTa1GZUiVHFWpt2Kmeg9z2alQiM
 lE26BCS2A3KL07KPbQy5e83060U0sfOnkjAw/iORyTRVjxvIFBjBorJJHlrvVONe5S
 FT3sVWodt3/hoQd9K44qZIeOPdKL6pCfS5INMmqlfkiowUWYxsNasN0g8rn7Ug9rob
 n4Nygdi+R27H33Er05Y3OpnnWwynC1Mp6NxgpAiUoNJ1aDPCddv0tRO685SO7F8Q/j
 SyAkOuwQ44fPg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 29 Apr 2022 10:09:57 +0200
Date: Fri, 29 Apr 2022 10:09:57 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20220429080957.GM3624965@scaer>
References: <20220429051206.38141-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220429051206.38141-1-bernd.kuhls@t-online.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/libcurl: security bump version
 to 7.83.0
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
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bernd, All,

On 2022-04-29 07:12 +0200, Bernd Kuhls spake thusly:
> Changelog: https://curl.se/changes.html#7_83_0
> Release notes: https://curl.se/news.html
> 
> Fixes the following CVEs:
> CVE-2022-22576: OAUTH2 bearer bypass in connection re-use
> CVE-2022-27774: Credential leak on redirect
> CVE-2022-27775: Bad local IPv6 connection reuse
> CVE-2022-27776: Auth/cookie leak on redirect
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libcurl/libcurl.hash | 4 ++--
>  package/libcurl/libcurl.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
> index 4be245041c..64a1129a90 100644
> --- a/package/libcurl/libcurl.hash
> +++ b/package/libcurl/libcurl.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated after checking pgp signature
> -# https://curl.se/download/curl-7.82.0.tar.xz.asc
> +# https://curl.se/download/curl-7.83.0.tar.xz.asc
>  # signed with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
> -sha256  0aaa12d7bd04b0966254f2703ce80dd5c38dbbd76af0297d3d690cdce58a583c  curl-7.82.0.tar.xz
> +sha256  bbff0e6b5047e773f3c3b084d80546cc1be4e354c09e419c2d0ef6116253511a  curl-7.83.0.tar.xz
>  sha256  321b1a09ebc30410f2e837c072e5521cf7095b757193af4a7dae1086e36ed31a  COPYING
> diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
> index 97857954db..ea8529c914 100644
> --- a/package/libcurl/libcurl.mk
> +++ b/package/libcurl/libcurl.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBCURL_VERSION = 7.82.0
> +LIBCURL_VERSION = 7.83.0
>  LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
>  LIBCURL_SITE = https://curl.se/download
>  LIBCURL_DEPENDENCIES = host-pkgconf \
> -- 
> 2.30.2
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
