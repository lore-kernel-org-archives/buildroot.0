Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BD13C77B7D
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 18:55:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2EA0081DF4;
	Sun,  7 May 2023 18:55:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2EA0081DF4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cvj7ac_KwVnv; Sun,  7 May 2023 18:54:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E5CF381DEB;
	Sun,  7 May 2023 18:54:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5CF381DEB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E2EA51BF2E3
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 18:54:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BA75041859
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 18:54:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA75041859
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 56tUHmBFysWw for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 18:54:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F5DC401D1
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1F5DC401D1
 for <buildroot@buildroot.org>; Sun,  7 May 2023 18:54:55 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:5f9f:2ea:ec9d:3930])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 5B72019F744;
 Sun,  7 May 2023 20:54:50 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 07 May 2023 20:54:50 +0200
Date: Sun, 7 May 2023 20:54:50 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230507185450.GC252090@scaer>
References: <20230507181424.246228-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230507181424.246228-1-ju.o@free.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683485692;
 bh=vyrIb3Qnj2xJwWvriwz5omjo3KE+bmIhJiQ6wVOf8AU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=f/Sqxf/F3/rpwueqHYzXHcdS4CCkY0PF84K4GUYs7mRnuzrfWTtbfyw3jQgpYeeog
 +KpNv+JQKwUrv6gWtx5shIsam8zKiUzFoZ5P7pm48oZ5jKcevm4GzIl8oTGyac0gVq
 30jnxwvnTklXgZt028MV/FfmTjO16UHzal/UPBZMs3KTPeCO/UnGwerEX018MWxOSk
 /l7ypuJY8VwwpAZxl8OWQJvCuupTJAoXEbEGWatw4DNhcJL0rYHmu8KnW2R2LK40DH
 Q1DcDst3vyBTAg7lzclRgjhnaGL3kp/Pdx1zK1dBDZ+MtRVjrYaefP5NYpI2ZLVFnL
 Qp80i9Edvjv1g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=f/Sqxf/F
Subject: Re: [Buildroot] [PATCH 1/1] package/openblas: bump to version
 v0.3.23
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

Julien, All,

On 2023-05-07 20:14 +0200, Julien Olivain spake thusly:
> This commit also:
> - adds the md5 from the release note in the package hash file,
> - rebase the patch on the new version tag,
> - adds the "Upstream:" tag in the patch.
> 
> For change log since v0.3.22, see:
> - https://github.com/xianyi/OpenBLAS/releases/tag/v0.3.23
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  ...ile.system-don-t-specify-optimization-level-bui.patch | 9 +++++----
>  package/openblas/openblas.hash                           | 4 +++-
>  package/openblas/openblas.mk                             | 2 +-
>  3 files changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/package/openblas/0001-Makefile.system-don-t-specify-optimization-level-bui.patch b/package/openblas/0001-Makefile.system-don-t-specify-optimization-level-bui.patch
> index e0c738748a..ed3cae82ef 100644
> --- a/package/openblas/0001-Makefile.system-don-t-specify-optimization-level-bui.patch
> +++ b/package/openblas/0001-Makefile.system-don-t-specify-optimization-level-bui.patch
> @@ -1,4 +1,4 @@
> -From d8ec4e4c6ef69165179f376e365034de10e6fee3 Mon Sep 17 00:00:00 2001
> +From 89648b76e35dc4657942c861ed9dbfbfe5a3df28 Mon Sep 17 00:00:00 2001
>  From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
>  Date: Fri, 5 Mar 2021 14:09:23 +0100
>  Subject: [PATCH] Makefile.system: don't specify optimization level
> @@ -11,16 +11,17 @@ The CFLAGS/FFLAGS would e.g. contain '-Os -O2' in which -O2 survives.
>  
>  Remove the optimization level specified in openblas itself.
>  
> +Upstream: N/A, not upstreamable

My post-applypatch hook triggered, and Baruch noticed:

    $ ./utils/docker-run make check-package
    package/openblas/0001-Makefile.system-don-t-specify-optimization-level-bui.patch:0: Upstream was expected to fail, did you fix the file and forget to update .checkpackageignore?

Applied to master, with the above fixed, thanks.

Regards,
Yann E. MORIN.

>  Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
>  ---
>   Makefile.system | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>  
>  diff --git a/Makefile.system b/Makefile.system
> -index 438a8148..9de1bbd5 100644
> +index 343b94bb3..c355ca5d9 100644
>  --- a/Makefile.system
>  +++ b/Makefile.system
> -@@ -1519,11 +1519,11 @@ FCOMMON_OPT += -g
> +@@ -1585,11 +1585,11 @@ FCOMMON_OPT += -g
>   endif
>   
>   ifndef COMMON_OPT
> @@ -35,5 +36,5 @@ index 438a8148..9de1bbd5 100644
>   
>   override CFLAGS     += $(COMMON_OPT) $(CCOMMON_OPT) -I$(TOPDIR)
>  -- 
> -2.35.1
> +2.40.1
>  
> diff --git a/package/openblas/openblas.hash b/package/openblas/openblas.hash
> index a8b5527e81..2e5fa8865f 100644
> --- a/package/openblas/openblas.hash
> +++ b/package/openblas/openblas.hash
> @@ -1,3 +1,5 @@
> +# From https://github.com/xianyi/OpenBLAS/releases/tag/v0.3.23
> +md5  115634b39007de71eb7e75cf7591dfb2  openblas-0.3.23.tar.gz
>  # Locally calculated
> -sha256  7fa9685926ba4f27cfe513adbf9af64d6b6b63f9dcabb37baefad6a65ff347a7  openblas-0.3.22.tar.gz
> +sha256  5d9491d07168a5d00116cdc068a40022c3455bf9293c7cb86a65b1054d7e5114  openblas-0.3.23.tar.gz
>  sha256  190b5a9c8d9723fe958ad33916bd7346d96fab3c5ea90832bb02d854f620fcff  LICENSE
> diff --git a/package/openblas/openblas.mk b/package/openblas/openblas.mk
> index 27f20654e7..f7a50d7bc7 100644
> --- a/package/openblas/openblas.mk
> +++ b/package/openblas/openblas.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -OPENBLAS_VERSION = 0.3.22
> +OPENBLAS_VERSION = 0.3.23
>  OPENBLAS_SITE = https://github.com/xianyi/OpenBLAS/releases/download/v$(OPENBLAS_VERSION)
>  OPENBLAS_LICENSE = BSD-3-Clause
>  OPENBLAS_LICENSE_FILES = LICENSE
> -- 
> 2.40.1
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
