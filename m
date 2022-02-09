Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD980C433EF
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 23:17:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3761E8305C;
	Wed,  9 Feb 2022 23:17:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 02iuRXTte2ld; Wed,  9 Feb 2022 23:17:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6CF0A83022;
	Wed,  9 Feb 2022 23:17:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7406B1BF3D9
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 23:17:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 61E89414C3
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 23:17:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lRnN_T36kp2G for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 23:17:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0986.aruba.it (smtpcmd0986.aruba.it [62.149.156.86])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7702C40873
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 23:17:02 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id HwCrnaAucks1JHwCrnJjAp; Thu, 10 Feb 2022 00:17:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644448621; bh=+qCNt1jDG6AsplhzYMYwg524O+lWc2kSdieeRtfLFXE=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=m50mfagR0fz+IjhBxqkDvutclv0aeP4P5rmjQLdwCN3bNo3zpADfKA0a4RJgQPZCJ
 qVAXHprJPtdaTAQ7QYaUJgVJBrs5g4EldSOJYMTB81qztIZC7pg07gMTgKmofBo4jU
 IlEm0fG6nXQMREJRPHahBCTL2nTbOx5o8IRNEy8RUI8lGSdQYtff35t46X72pq5tst
 9bg7tOxBEZF8dUl89iqXf1xVUzL5t2x8giP76OnJBJJnsZhgXuSlmtCZKBjypp9Klr
 FEWMR1UcG2SGs7OEmQA9s2AEfB2Ub5lTr5GYntAIt0nTlUAfHqDXCCP+efZ5r4ar/Y
 hnK9YGKyl1ltQ==
Message-ID: <26f60dc2-965b-08b1-bbd1-2a042a09bd0d@benettiengineering.com>
Date: Thu, 10 Feb 2022 00:17:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Pedro Aguilar <paguilar@paguilar.org>, buildroot@buildroot.org
References: <20220209225957.1257630-1-paguilar@paguilar.org>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220209225957.1257630-1-paguilar@paguilar.org>
X-CMAE-Envelope: MS4wfKvV16O51DWDjQtObcAi+rM45BrHF9W4fp6pJq/DimBUMHdgoO7aCcZMJrBuqjS+kHfb9V0PCtQQCpN7mdvkKNXBumA85eioEhBwmzKZUCkT3Z6zZjAA
 ++h6K7fJZQzkt7+Xy2o0eZ8wiMdFmS4Z3e3DLIHZt8bb2Elm8X2Llv4qI1WvMs++b/67QZ2A7WqbFsE0WtfeuCOqMzwbL0aZXS3q9xrf2IaqZ5QsinaBQa5P
 k5OqLRRjRrKdHCLdzritS4yNefqRm2GFIzzt/n55sOZQgkYN1eXGzRu6JZVmbVrm
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

And forgotten:
Tested-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

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
