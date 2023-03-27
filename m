Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55FD3C76195
	for <buildroot@archiver.kernel.org>; Mon, 27 Mar 2023 18:12:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9FCC74179C;
	Mon, 27 Mar 2023 18:12:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9FCC74179C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id epaW2vYSF-nN; Mon, 27 Mar 2023 18:12:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C1B3417A2;
	Mon, 27 Mar 2023 18:12:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C1B3417A2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8F2A91BF2EF
 for <buildroot@lists.busybox.net>; Mon, 27 Mar 2023 18:11:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 690F060F47
 for <buildroot@lists.busybox.net>; Mon, 27 Mar 2023 18:11:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 690F060F47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H0Tg5QVoOsgo for <buildroot@lists.busybox.net>;
 Mon, 27 Mar 2023 18:11:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5FBFE60F36
Received: from mail.tkos.co.il (mail.tkos.co.il [84.110.109.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5FBFE60F36
 for <buildroot@buildroot.org>; Mon, 27 Mar 2023 18:11:57 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id E47064404F7;
 Mon, 27 Mar 2023 21:06:55 +0300 (IDT)
References: <20230322162445.19051-1-ps.report@gmx.net>
User-agent: mu4e 1.9.21; emacs 28.2
To: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 27 Mar 2023 21:08:18 +0300
In-reply-to: <20230322162445.19051-1-ps.report@gmx.net>
Message-ID: <87pm8uukra.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1679940415;
 bh=5+XI/ydzigc7YQ75FVYtXS8riBGPtxGqCQ4SN9h73BI=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=Lnniz7WGhDViw0T2XxaeckXYoGY2od/AS/h0LOvM5OiuOldZOlW4NwJu7OtQ/+u8l
 VGf202Lhhmin4YPfe3U1HgJuOJGFBItlnuTb9/YMrWvWHeJX4q0Oovt9v7hF6aNlVw
 1/8D0T/YZxC6I9ABk6l1cbHjWtug70J2IVy8zbVgdjYCovJrSav3M9Jv5JI7kTGsaa
 LjhZ25lNYswru5KAiClRJc3PDhDDqJIPe+fh/AniTZFA4Wkq0cY3Wou4QkaWNTdWEP
 xMNs+8PoRL8pN8VPFxB/vtF7c2SBLiaR57FAQk8gmCdPkXM4kmfHbu3RUrQ/C+KFof
 CMJ6q5hB2abMw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=Lnniz7WG
Subject: Re: [Buildroot] [PATCH v1] package/libcurl: bump version to 8.0.1
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

Hi Peter,

On Wed, Mar 22 2023, Peter Seiderer wrote:

> For details see [1] and [2].
>
> [1] https://curl.se/changes.html#8_0_0
> [1] https://curl.se/changes.html#8_0_1

Thanks for the patch.

It is worth noting that this is a security bump fixing CVE-2023-27538,
CVE-2023-27537, CVE-2023-27536, CVE-2023-27535, CVE-2023-27534,
and CVE-2023-27533.

baruch

> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/libcurl/libcurl.hash | 4 ++--
>  package/libcurl/libcurl.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
> index 32b3d0b5e2..8a29e7b977 100644
> --- a/package/libcurl/libcurl.hash
> +++ b/package/libcurl/libcurl.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated after checking pgp signature
> -# https://curl.se/download/curl-7.88.1.tar.xz.asc
> +# https://curl.se/download/curl-8.0.1.tar.xz.asc
>  # signed with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
> -sha256  1dae31b2a7c1fe269de99c0c31bb488346aab3459b5ffca909d6938249ae415f  curl-7.88.1.tar.xz
> +sha256  0a381cd82f4d00a9a334438b8ca239afea5bfefcfa9a1025f2bf118e79e0b5f0  curl-8.0.1.tar.xz
>  sha256  b1d7feb949ea5023552029fbe0bf5db4f23c2f85e9b8e51e18536f0ecbf9c524  COPYING
> diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
> index 1a1594a45e..1354e526ad 100644
> --- a/package/libcurl/libcurl.mk
> +++ b/package/libcurl/libcurl.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBCURL_VERSION = 7.88.1
> +LIBCURL_VERSION = 8.0.1
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
