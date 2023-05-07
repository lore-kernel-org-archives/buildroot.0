Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD4F1C77B7D
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 19:04:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3771182159;
	Sun,  7 May 2023 19:04:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3771182159
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0BKc-nvPQAhg; Sun,  7 May 2023 19:04:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2ECC181FBB;
	Sun,  7 May 2023 19:04:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2ECC181FBB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 599591BF2CD
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 19:04:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 32FC140612
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 19:04:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32FC140612
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ibRVcxlW4zfi for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 19:04:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EBF6A402DC
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EBF6A402DC
 for <buildroot@buildroot.org>; Sun,  7 May 2023 19:04:33 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:5f9f:2ea:ec9d:3930])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 3F22E19F73B;
 Sun,  7 May 2023 21:04:29 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 07 May 2023 21:04:29 +0200
Date: Sun, 7 May 2023 21:04:29 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20230507190429.GE252090@scaer>
References: <20230507163945.4013013-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230507163945.4013013-1-bernd.kuhls@t-online.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683486271;
 bh=pF5Qde86HRM+ZqoCuxZ2wmtl7qMsdKNrHlADcVyhcbE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=F0XvIlS4LOO0qoGl/EQtXmZo7fIVctr5RanaOxoFgAj23NxZYybcp/2abmIuvcH62
 J1MEJjsQjGt2mfk6Y/Hid2HRpQ3VaDih8Bu+3c6s3SVXGnMmwpA064S/dzyseq9IOJ
 CE/ZEbwtaF2QQ+6HL8c9ZYnZfELLZvi7UDmKHiandInez7x9xKG2k/yJVmPMYtvYAS
 2sKY37ICTjN6+1oXQKVS0y1tMfR5TyPkNRpqOTbAG/zpyiZ3fhXv5o4rywdpi6nQ9v
 NEKZL5co3AIN19jWgfiPqQkEDTtyiSHigieOQw7Ugx2vWuQZW8hoao/5tQ7c7lbvBW
 V7n8trmOt8DKg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=F0XvIlS4
Subject: Re: [Buildroot] [PATCH 1/2] package/freetype: bump version to 2.13.0
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bernd, All,

On 2023-05-07 18:39 +0200, Bernd Kuhls spake thusly:
> Release notes:
> https://sourceforge.net/projects/freetype/files/freetype2/2.13.0/
> 
> Updated license hash due to upstream commits:
> 
> "fix spelling err in LICENSE.txt"
> https://gitlab.freedesktop.org/freetype/freetype/-/commit/c0b4f6a8625a39ecd4c323d74ddec0e94fca214d
> 
> [autofit] Don't depend on 'hb-ft'.
> https://gitlab.freedesktop.org/freetype/freetype/-/commit/ebe7e9128cdf81cb0a0d27fe293ecff96f6c98a8
> Since we build freetype without harfbuzz support anyway no changes to
> the license information of this package are necessary.

That is not entirely true, but neither it is entirely false; it is a bit
murky...

Indeed, the new license added by ebe7e9128cdf applies to two new files
that are unconditinally included in the build:

    https://gitlab.freedesktop.org/freetype/freetype/-/blob/ebe7e9128cdf81cb0a0d27fe293ecff96f6c98a8/src/autofit/autofit.c

    #include "ft-hb.c"
    #include "afblue.c"
    #include "afcjk.c"
    #include "afdummy.c"
    #include "afglobal.c"
    #include "afhints.c"
    #include "afindic.c"
    #include "aflatin.c"
    #include "afloader.c"
    #include "afmodule.c"
    #include "afranges.c"
    #include "afshaper.c"

So, ft-hb.c is always included. But its code is entorely guarded away
under the FT_CONFIG_OPTION_USE_HARFBUZZ condition, so the license for
that file can be considered moot, indeed.

So, I've tweaked the commit log accordingly.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/freetype/freetype.hash | 8 ++++----
>  package/freetype/freetype.mk   | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/freetype/freetype.hash b/package/freetype/freetype.hash
> index a558a3e846..60eb8dbb1d 100644
> --- a/package/freetype/freetype.hash
> +++ b/package/freetype/freetype.hash
> @@ -1,8 +1,8 @@
> -# From https://sourceforge.net/projects/freetype/files/freetype2/2.12.1/
> -sha1  5133eed28a7624ffabbf6d00aa3f68b841d62d80  freetype-2.12.1.tar.xz
> -sha256  4766f20157cc4cf0cd292f80bf917f92d1c439b243ac3018debf6b9140c41a7f  freetype-2.12.1.tar.xz
> +# From https://sourceforge.net/projects/freetype/files/freetype2/2.13.0/
> +sha1  6393c1451c2f1c5f83aed5ea92d280af078e27d9  freetype-2.13.0.tar.xz
> +sha256  5ee23abd047636c24b2d43c6625dcafc66661d1aca64dec9e0d05df29592624c  freetype-2.13.0.tar.xz
>  
>  # Locally calculated
> -sha256  c85e842b7ff04d95dab7d68e812773de0f8b67940e5449d35b42c66eb0f619fe  LICENSE.TXT
> +sha256  2e3bbb7d7c5c396368dd0853a790ec29ce5b8647163dde42a0493fb0d6556b2b  LICENSE.TXT
>  sha256  08c135755dd589039470f1fdbb400daaabaaa50d0b366d19cebff4d22986baa1  docs/FTL.TXT
>  sha256  c4120c6752c910c299e3bd9cb3a46ff262c268303ca2069b61f92f10a5656c18  docs/GPLv2.TXT
> diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
> index 36ef3cb527..4d7c4cd0d5 100644
> --- a/package/freetype/freetype.mk
> +++ b/package/freetype/freetype.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -FREETYPE_VERSION = 2.12.1
> +FREETYPE_VERSION = 2.13.0
>  FREETYPE_SOURCE = freetype-$(FREETYPE_VERSION).tar.xz
>  FREETYPE_SITE = http://download.savannah.gnu.org/releases/freetype
>  FREETYPE_INSTALL_STAGING = YES
> -- 
> 2.39.2
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
