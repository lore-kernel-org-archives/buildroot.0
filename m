Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2518C433EF
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 23:16:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E4F860E55;
	Wed,  9 Feb 2022 23:16:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PEFk0_EfJX5p; Wed,  9 Feb 2022 23:16:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C34160E46;
	Wed,  9 Feb 2022 23:16:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7EDF31BF3D9
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 23:16:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6999C8301F
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 23:16:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xRSbmEl7-j4e for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 23:16:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0986.aruba.it (smtpcmd0986.aruba.it [62.149.156.86])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5447C83054
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 23:16:05 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id HwBvna7i7ks1JHwBvnJiwL; Thu, 10 Feb 2022 00:16:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644448564; bh=zfRFGAS2QKI/QFWEBi8F24RGR+agyQFknCstGsAR9TA=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=giODFhm4tzmYFlafKJEQ+7HdoYJwGlsnTSjbJ+loEVUMFr1wpV8Kk/Ptc/RtpDlNI
 6240VjbizCjdXllr4Dpy1+1btwfCW/9fjQKYX+c+c9jtYMzyrPi8s3uHauYV2L7Pk+
 S3qS29SlPrVNhqEEfNQv5x+DkTN0G/4o/WFHSUGMempbFtffoXJFWxn8xrx90WGWTv
 TXsASin9F3JvmHLygdczR5k6gPshIGSOZ4nH0oX+jph8bcbhTHUczZVv35zG0mNnx4
 8Wb+fWPJa8EM03JZW/dAky8nUdsROtmuxjRsuI8iS5cDe2qQHdRTEidI1ngKzKYQJT
 jzunb2jku7+Hg==
Message-ID: <966178a8-693f-fdf7-b438-8e6c1302258c@benettiengineering.com>
Date: Thu, 10 Feb 2022 00:16:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Pedro Aguilar <paguilar@paguilar.org>, buildroot@buildroot.org
References: <20220209225957.1257630-1-paguilar@paguilar.org>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220209225957.1257630-1-paguilar@paguilar.org>
X-CMAE-Envelope: MS4wfOYdyNvq+9syQz9k9+HOhONRcledfe4+u95HFJGGGbcnb8kys/ZA4JcX1q5qGNQ5bFto7ZsYtXjEksXMRmqs88dvSa9bWcgl0wSKYfCrpWDnYP8nYf0w
 X9KhpE5ZRyqFIcoCrYmvjF8utZD5uvrunJ1st9wN7RLbPnnSY3j/tuTT/PtamnHiD5HbDaS3+gZns0NFZgIxhQLlrntVr9FhiNFMFdp+GN2zwCZZhqeEC/fj
 XR5KdI/6Yzoe5bfos+65D6NkI4yh3QG+D3mpDTOFkafSFKUoixNCwv/bTZ0eIYuY
Subject: Re: [Buildroot] [PATCH v3 1/1] package/guile: Fix build failure due
 to missing libiconv
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
Cc: thomas.petazzoni@bootlin.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Pedro,

On 09/02/22 23:59, Pedro Aguilar wrote:
> When building package guile with BR2_ENABLE_LOCALE=n
> we get the following error:
> 
> ```
> In file included from filesys.c:95:
> ports-internal.h:26:10: fatal error: iconv.h: No such file or directory
>     26 | #include <iconv.h>
>        |          ^~~~~~~~~
> compilation terminated.
> ```
> 
> So let's fix it by selecting BR2_PACKAGE_LIBICONV and
> adding libiconv package as dependency.
> 
> Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>

Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Thank you!
Best regards
-- 
Giulio Benetti
Benetti Engineering sas

> ---
> Changes v2 -> v3:
>    - Improve commit message (thanks to Giulio comments)
> Changes v1 -> v2:
>    - Use BR2_ENABLE_LOCALE if selected, otherwise use libiconv
>      as before (pointed out by Thomas and Giulio)
> ---
>   package/guile/Config.in | 1 +
>   package/guile/guile.mk  | 4 ++++
>   2 files changed, 5 insertions(+)
> 
> diff --git a/package/guile/Config.in b/package/guile/Config.in
> index b1182a4cee..f70e674018 100644
> --- a/package/guile/Config.in
> +++ b/package/guile/Config.in
> @@ -9,6 +9,7 @@ config BR2_PACKAGE_GUILE
>   	select BR2_PACKAGE_LIBFFI
>   	select BR2_PACKAGE_GMP
>   	select BR2_PACKAGE_BDWGC
> +	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
>   	help
>   	  Guile is an interpreter and compiler for the Scheme
>   	  programming language, a clean and elegant dialect of Lisp.
> diff --git a/package/guile/guile.mk b/package/guile/guile.mk
> index 0f245fca76..03420407f8 100644
> --- a/package/guile/guile.mk
> +++ b/package/guile/guile.mk
> @@ -18,6 +18,10 @@ GUILE_CPE_ID_VENDOR = gnu
>   GUILE_DEPENDENCIES = host-guile libunistring libffi gmp bdwgc host-pkgconf
>   HOST_GUILE_DEPENDENCIES = host-libunistring host-libffi host-gmp host-bdwgc host-flex host-pkgconf host-gettext
>   
> +ifeq ($(BR2_ENABLE_LOCALE),)
> +GUILE_DEPENDENCIES += libiconv
> +endif
> +
>   # The HAVE_GC* CFLAGS specify that we will use internal callbacks
>   # instead of the ones provided by
>   # bdwgc. Eg. HAVE_GC_SET_FINALIZER_NOTIFIER specifies that we won't

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
