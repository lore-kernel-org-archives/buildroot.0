Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D43FC433F5
	for <buildroot@archiver.kernel.org>; Tue,  8 Feb 2022 22:06:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BE3AB408C8;
	Tue,  8 Feb 2022 22:06:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jt0jjsXn3AzF; Tue,  8 Feb 2022 22:06:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A56EA401CA;
	Tue,  8 Feb 2022 22:06:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 00D081BF2EF
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 22:06:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EB320408DF
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 22:06:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SZVPrlhEDnNk for <buildroot@lists.busybox.net>;
 Tue,  8 Feb 2022 22:06:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd04132.aruba.it (smtpcmd04132.aruba.it [62.149.158.132])
 by smtp4.osuosl.org (Postfix) with ESMTP id 600FA408B6
 for <buildroot@buildroot.org>; Tue,  8 Feb 2022 22:06:40 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id HYdAndYJhkz4hHYdBnygsK; Tue, 08 Feb 2022 23:06:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644357997; bh=SNlzmlc+XAyp3fbIFra1IAnaMDRsjgabrtsMXqeKifI=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=BWljlT5wxaWyn7YaB/SOBzlj4FJn2T40vzMjiwFVCVDh8vZVtNITk++/XAt+uu6HO
 MI6S2WSKKe9Htachyp40liyPdN4po0I9PDjg7Wso12HCQaPKglqC36RAM0MKR0Nyl8
 u7rZ5eGGU6kWbuamlzqbs+pgdwXrLA5R7k36NnacgppnbaYWEXk2/6tJ9HD5aCQBqU
 SipnudU32QVWGWbM3+Wwcj3n0/ZfxBTCdL/u5VbykaBUf15x/89tvCIUGn+8CvZXKw
 k+sHxieXJZM19lR5aLjMECOlwhXfYwgeiyIgJ2VYN5ZjjSOvoW65mlfXBM0/EUHwsb
 w9R2meVJhsZJg==
Message-ID: <5f710ea1-3f98-9435-c033-e73e70e86342@benettiengineering.com>
Date: Tue, 8 Feb 2022 23:06:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Pedro Aguilar <paguilar@paguilar.org>, buildroot@buildroot.org
References: <20220208213722.836257-1-paguilar@paguilar.org>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220208213722.836257-1-paguilar@paguilar.org>
X-CMAE-Envelope: MS4wfOulGmWOcDIxkeMqdMhNYGKLATScIfQ3rQK/BKK55l8AtcNvrZujZFS9v8HtUz4GPibPUwoPLQXJJu2+1m08mKsU9SqUjKFqsvwwVpGmaEDUER7HB6m0
 YXSFnpbF7c8TIEDJJcGjgoeMBiahB5zlSGSYfpLeowvFlpQ6n2lTevjwXvbzRPc7Oa0HiVa2DJ8pre9sg7/kNPAoLXs4MnCIQ+mJ79D9r0guWuh1p5pMd0Oa
 8XssidQDu0shz5ca8zcUw9yvKcJ2cJ8p60d+Cn+sgj5CoOFirsVMwWasRSonqug8
Subject: Re: [Buildroot] [PATCH v2 1/1] package/guile: Add BR2_ENABLE_LOCALE
 as dependency.
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

On 08/02/22 22:37, Pedro Aguilar wrote:
> If it's not present, enable libiconv.

Here it's missing:
Fixes:
URL to autobuilder failure

And also I can't find guile failing due to LIBICONV.

At least, I only find:
http://autobuild.buildroot.net/?reason=guile-3.0.7

But it seems to be about another problem(to be solved too).

Can you please point the autobuilder failure?
Otherwise I can't test/review your patch.

Thank you!
Best regards
-- 
Giulio Benetti
Benetti Engineering sas

> Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>
> 
> ---
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
