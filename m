Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2448EC433F5
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 08:54:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 901FB4019D;
	Sun,  6 Feb 2022 08:54:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jWvBS87UuIjV; Sun,  6 Feb 2022 08:54:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 841664015A;
	Sun,  6 Feb 2022 08:54:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2763E1BF3DD
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 08:54:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 148C74015A
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 08:54:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VyYjVehIPfDz for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 08:54:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0641.aruba.it (smtpcmd0641.aruba.it [62.149.156.41])
 by smtp2.osuosl.org (Postfix) with ESMTP id BC2B8400A8
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 08:54:46 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id GdJknIM6uX0z7GdJlnK9D3; Sun, 06 Feb 2022 09:54:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644137685; bh=zphmUenbA1piFxniK5g1XClzVszNfQwuS4GRXJyXNBg=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=BJj/fUspTjuBtuffgyeOp8LYfrw38bfxfebrVH7SN60Bw903t0nJwAcSSDVPt4XaA
 VT6F6IG2m0kS09hQAc5wdlq2I0my2m/4IqyxTWaBTVm/v5zetTnA6QknPvwCIoA/1O
 3j509l1F12YjYWuDkRzE8gvmG0PnWAy4e9Wv9hWD3XOYjo4ZgqS54QkWRJsTHPRLKk
 aK6Btsu7dAB/kD/HRYT/lOgBo5qzi9yukoiZXtWGgVmyLaYv1NhzSZYUxoZW5BNwLV
 GWWWZm+E+vziMIA1BFFAaWj/8kd+puGIgzOevQTot9npuEm5Jm+ie7l8VKTHlrGIPl
 eULtztK9erXDA==
Message-ID: <3942047e-e69e-d079-3ca5-55409fdda839@benettiengineering.com>
Date: Sun, 6 Feb 2022 09:54:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Pedro Aguilar <paguilar@paguilar.org>, buildroot@buildroot.org
References: <20220206084334.1900252-1-paguilar@paguilar.org>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220206084334.1900252-1-paguilar@paguilar.org>
X-CMAE-Envelope: MS4wfOdROpXiu/dj+wMw/21gENIoo6Py1RSWYfcEAiVCbRmegkjjintsjl25gd5bdnDT+QcVhMdCtVgSf/6bV9rqjg7CjipmxGTaTH6ufkbkPN6392UlWFsL
 WzkjL4bLC2aNhwZwkQhEKENOeTv7R1EaNCmWG9VTXFYIlhutuiupwZv/DLpRZPu9LyIhE4yM52AdRk2YDK19narrYIFuWSky/UagdJyZv7FAHe9osUs5OL10
 ln1yyBXzthaIrOuXPeX+Xg==
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

Too fast...

On 06/02/22 09:43, Pedro Aguilar wrote:
> This fixes the error reported in the daily results.
> 
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

Here ^^^ please keep alphabetical order, so libiconv goes before 
libunistring and doing so can you please move host-pkgconf after host-guile?

Thank you!

-- 
Giulio Benetti
Benetti Engineering sas

>   HOST_GUILE_DEPENDENCIES = host-libunistring host-libffi host-gmp host-bdwgc host-flex host-pkgconf host-gettext
>   
>   # The HAVE_GC* CFLAGS specify that we will use internal callbacks

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
