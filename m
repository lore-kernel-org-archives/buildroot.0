Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D6AAC433F5
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 08:48:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 163BE40353;
	Sun,  6 Feb 2022 08:48:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XZYFEHqSbE6r; Sun,  6 Feb 2022 08:48:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4AEA54017D;
	Sun,  6 Feb 2022 08:48:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 77B6E1BF3DD
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 08:48:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6357F817F2
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 08:48:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y3kYK1QsqN9Z for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 08:48:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0642.aruba.it (smtpcmd0642.aruba.it [62.149.156.42])
 by smtp1.osuosl.org (Postfix) with ESMTP id 63DCB817D3
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 08:48:19 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id GdDVnII1xX0z7GdDVnK7cv; Sun, 06 Feb 2022 09:48:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644137298; bh=VDTtBrYj36OjmsvGqMAYIczVU16p/RRsfJhgOXDSB0U=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=BjxXi6GFTpTXoX2D/DgIRBMov6oOwTaMf/+gkgOK6IM2V8gQDF7AUix56TaH/JHnZ
 pvvt/epYpULnIet8HThu4+4fyFYqyaNlaEvh87GSStiVDoT0M72aJRk52GI+UCowKQ
 74eGDJZXTjKrdo/hlKNOAwq6mgKnYoNV3NOEmI1rxhM/S+zOcOr0IbuTWL3iq3q/8C
 8dN/oqlyq3dWa6f9Oa12WOBtcmHrLC4MOuuJps2Lk6tEMPIaeWJzypALxjjjKZcVsc
 02g4GlGLLqTJq7dnTaXAu66z54I7ubPE4lEDGv4CRLPBej20j90r1LlRF/8iNE4RpB
 JneWS9UMkc1oA==
Message-ID: <15b995c3-8d86-55f5-2b0e-d17e3f1d6978@benettiengineering.com>
Date: Sun, 6 Feb 2022 09:48:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Pedro Aguilar <paguilar@paguilar.org>, buildroot@buildroot.org
References: <20220206084334.1900252-1-paguilar@paguilar.org>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220206084334.1900252-1-paguilar@paguilar.org>
X-CMAE-Envelope: MS4wfOqRr0mZrSuBw9BbO7nVmea+3VeOrxWuNnWZ0Y+VRwjST2uWpwierf7c69iRgcSwgKp1X86nFGoUcyZ21Ixt7DSAdkGoSPDPcLdhLuK7hEZXTMe4K9EC
 jptDoIsfn4dS+m0ymwj0VywZt1+KBgchqKTLZHCs4DAvMlB91Ny8G8Eiz1A0e+IV+8rlIa57cxbdMEDOV2G3UX8ivNmAuhhHMW3PEmw52Kj2/TNj85R9GN2V
 A3Q/LskDNXD1M2/iaYeIJg==
Subject: Re: [Buildroot] [PATCH v1 1/1] package/guile: Guile 3.0.7 requires
 libiconv.
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

Hi Pedro,

On 06/02/22 09:43, Pedro Aguilar wrote:
> This fixes the error reported in the daily results.

Please add to commit log:
```
Fixes:
http://autobuild.buildroot.net/results/0ad/0add99a8cbb143d912d48ef4670e09a6710bb8b1/
```

Thank you
Best regards
-- 
Giulio Benetti
Benetti Engineering sas

> Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>
> ---
>   package/guile/Config.in | 1 +
>   package/guile/guile.mk  | 2 +-
>   2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/guile/Config.in b/package/guile/Config.in
> index b1182a4cee..2367a3ed3d 100644
> --- a/package/guile/Config.in
> +++ b/package/guile/Config.in
> @@ -9,6 +9,7 @@ config BR2_PACKAGE_GUILE
>   	select BR2_PACKAGE_LIBFFI
>   	select BR2_PACKAGE_GMP
>   	select BR2_PACKAGE_BDWGC
> +	select BR2_PACKAGE_LIBICONV
>   	help
>   	  Guile is an interpreter and compiler for the Scheme
>   	  programming language, a clean and elegant dialect of Lisp.
> diff --git a/package/guile/guile.mk b/package/guile/guile.mk
> index 0f245fca76..0f26443023 100644
> --- a/package/guile/guile.mk
> +++ b/package/guile/guile.mk
> @@ -15,7 +15,7 @@ GUILE_LICENSE = LGPL-3.0+
>   GUILE_LICENSE_FILES = LICENSE COPYING COPYING.LESSER
>   GUILE_CPE_ID_VENDOR = gnu
>   
> -GUILE_DEPENDENCIES = host-guile libunistring libffi gmp bdwgc host-pkgconf
> +GUILE_DEPENDENCIES = host-guile libunistring libffi gmp bdwgc host-pkgconf libiconv
>   HOST_GUILE_DEPENDENCIES = host-libunistring host-libffi host-gmp host-bdwgc host-flex host-pkgconf host-gettext
>   
>   # The HAVE_GC* CFLAGS specify that we will use internal callbacks

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
