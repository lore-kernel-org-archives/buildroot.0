Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5053AC43217
	for <buildroot@archiver.kernel.org>; Thu,  1 Dec 2022 19:55:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AD5A6400FD;
	Thu,  1 Dec 2022 19:55:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD5A6400FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FT5NZarTXezW; Thu,  1 Dec 2022 19:55:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BD65640B76;
	Thu,  1 Dec 2022 19:55:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD65640B76
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D51EB1BF379
 for <buildroot@lists.busybox.net>; Thu,  1 Dec 2022 19:55:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AEBA84195E
 for <buildroot@lists.busybox.net>; Thu,  1 Dec 2022 19:55:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AEBA84195E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gqWdiG-2HhXB for <buildroot@lists.busybox.net>;
 Thu,  1 Dec 2022 19:55:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AAF4C4193B
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AAF4C4193B
 for <buildroot@buildroot.org>; Thu,  1 Dec 2022 19:55:29 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9d7e:5704:aa80:b7b1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 77124B0053B;
 Thu,  1 Dec 2022 20:55:21 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 01 Dec 2022 20:55:20 +0100
Date: Thu, 1 Dec 2022 20:55:20 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Zikui Zhao <zhaozikui@eswincomputing.com>
Message-ID: <20221201195520.GA978091@scaer>
References: <20221201004458.673-1-zhaozikui@eswincomputing.com>
 <20221201004458.673-2-zhaozikui@eswincomputing.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221201004458.673-2-zhaozikui@eswincomputing.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1669924526;
 bh=tya1pbETTRlN8GWbPfkMsyaqndEIVLegxb0zuRwIS/E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=J0WZDvEdTmiuTphGJ52SwUO0jWY1GJWkF1vMCQQK9Nmuar6m1GarPFU9MSeMEgH+f
 XRsQLMt8q0vb3i11G8VKg3lvvv8PU3A7IC2jJVAF3vFdal0JkObFdUxOgxVaeu3wnv
 pWtcbarM5eJWEO2i+T8HjmM7Wjer3qzDvGWuWPOKKpNK7PhAa8POzty0lULS4lhssy
 tQ8plyE5LdhUnVWdLBKWsMmbnbcMdC7kHNnuvBkGHx5AOMyOUi4OjB68x59Ap90LJN
 1K+Aax2cLhlMx/GYmWr7IY1+VqaLaULs4L2PZVQZ60Yvk/ZkvnvUHe50eGt0HXHixQ
 COJuBjD+aMlGw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=J0WZDvEd
Subject: Re: [Buildroot] [PATCH 1/1] BUILDROOT: fixed some spelling mistakes
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
Cc: Titouan Christophe <titouanchristophe@gmail.com>,
 Bilal Wasim <bilalwasim676@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Zhao, All,

On 2022-12-01 08:44 +0800, Zikui Zhao spake thusly:
> Fixed some spelling mistakes of countable nouns.
> 
> Zikui Zhao <zhaozikui@eswincomputing.com>
> ---
[--SNIP--]
> diff --git a/board/chromebook/elm/readme.txt b/board/chromebook/elm/readme.txt
> index b63e7e8bcf..3387933ab4 100644
> --- a/board/chromebook/elm/readme.txt
> +++ b/board/chromebook/elm/readme.txt
> @@ -30,7 +30,7 @@ The important files are:
>  	rootfs.tar
>  	bootsd.img (SD card image containing both kernel and rootfs)
>  
> -Write the image directly to some SD card.
> +Write the image directly to some SD cards.

No. 'some' does not refer to a plural, but to an arbitrary item left to
the choice of the user. See first sense in:

    https://www.merriam-webster.com/dictionary/some

Besides, it does not make sense to write the resulting image to more
than one SD card to boot a single board, which the readme is about.

>  WARNING: make sure there is nothing important on that card,
>  and double-check the device name!
>  
> diff --git a/board/chromebook/snow/readme.txt b/board/chromebook/snow/readme.txt
> index 1afd949829..9533bf69b0 100644
> --- a/board/chromebook/snow/readme.txt
> +++ b/board/chromebook/snow/readme.txt
> @@ -30,7 +30,7 @@ The important files are:
>  	rootfs.tar
>  	bootsd.img (SD card image containing both kernel and rootfs)
>  
> -Write the image directly to some SD card.
> +Write the image directly to some SD cards.

Ditto

>  WARNING: make sure there is nothing important on that card,
>  and double-check the device name!
>  
> diff --git a/docs/manual/customize-directory-structure.txt b/docs/manual/customize-directory-structure.txt
> index a3a7ad4cb9..1249421da2 100644
> --- a/docs/manual/customize-directory-structure.txt
> +++ b/docs/manual/customize-directory-structure.txt
> @@ -27,10 +27,10 @@ to you.
>  |           +-- post_image.sh
>  |           +-- rootfs_overlay/
>  |           |   +-- etc/
> -|           |   +-- <some file>
> +|           |   +-- <some files>
>  |           +-- patches/
>  |               +-- foo/
> -|               |   +-- <some patch>
> +|               |   +-- <some patches>

Those two are acceptable.

>  |               +-- libbar/
>  |                   +-- <some other patches>
>  |
> diff --git a/docs/manual/writing-rules.txt b/docs/manual/writing-rules.txt
> index 758965d80a..1b88a411e6 100644
> --- a/docs/manual/writing-rules.txt
> +++ b/docs/manual/writing-rules.txt
> @@ -6,8 +6,8 @@
>  Overall, these coding style rules are here to help you to add new files in
>  Buildroot or refactor existing ones.
>  
> -If you slightly modify some existing file, the important thing is
> -to keep the consistency of the whole file, so you can:
> +If you slightly modify some existing files, the important thing is
> +to keep the consistency of the whole files, so you can:

Again, nope. For 'some', the reason is the same as above: it is not a
plural, but an indetermined unit.

For 'whole', we still refer to the "existing file" mentioned just
before, and what this sentence means is that, when modifying an existing
file in Buildroot, we want the code style of that file to be consistent,
hence the "whole file", i.e. "whole" means "entire".

See sense 3.a in:

    https://www.merriam-webster.com/dictionary/whole

The following fixes to "some" are also incorrect:
    support/kconfig/menu.c                        | 2 +-
    support/kconfig/streamline_config.pl          | 2 +-
    support/kconfig/zconf.lex.c_shipped           | 4 ++--

The first three (kconfig) are from the kernel, so we just copied them
as-is; any fixes should be pushed to the kernel instead (but those
"some" fixes are incorrect).

> diff --git a/support/testing/tests/package/test_crudini.py b/support/testing/tests/package/test_crudini.py
> index 470a714eb6..abb188c1b7 100644
> --- a/support/testing/tests/package/test_crudini.py
> +++ b/support/testing/tests/package/test_crudini.py
> @@ -22,7 +22,7 @@  class TestCrudiniBase(TestPythonPackageBase):
>  
>          self.emulator.login()
>  
> -        # 1. Create some sample .ini file
> +        # 1. Create some sample .ini files

This one, like the others above, is incorrect. Furthermore, it is
obvious in contect that we are indeed creating only one .ini file:

>          cmd = "echo -e '%s' > config.ini" % INI_FILE_CONTENT

... here, this only creates a single .ini file.

Can you re-send a patch with only the two correct fixes, please?

Regards,
Yann E. MORIN.

>          _, ret = self.emulator.run(cmd)
>          self.assertEqual(ret, 0)

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
