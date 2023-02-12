Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EC76C636D3
	for <buildroot@archiver.kernel.org>; Sun, 12 Feb 2023 20:35:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35A42813ED;
	Sun, 12 Feb 2023 20:35:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35A42813ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T-w36JLQpwCd; Sun, 12 Feb 2023 20:35:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5EF1D81412;
	Sun, 12 Feb 2023 20:35:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5EF1D81412
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 94B351BF865
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 20:35:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7BFFE60BFF
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 20:35:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7BFFE60BFF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uN5V9hBhAocd for <buildroot@lists.busybox.net>;
 Sun, 12 Feb 2023 20:35:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A10560AC2
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1A10560AC2
 for <buildroot@buildroot.org>; Sun, 12 Feb 2023 20:35:22 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id F276E5FF33;
 Sun, 12 Feb 2023 21:35:16 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 12 Feb 2023 21:35:16 +0100
Date: Sun, 12 Feb 2023 21:35:16 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230212203516.GS2796@scaer>
References: <20230212144316.1181860-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230212144316.1181860-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1676234120;
 bh=mJG48249NLbEgtgo7JXCHnVVtbHxudiOB7HgJEIvHiM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PuZ+Euh5WvZCJ44Tdddzm+3fbzUOiBtZmK3ZYwOZQzV2ap8qsQw40sBfTV9AIWRGM
 CnIBIu2zT03lQDLhu017Er/Ttyc2FAF04a9TTqDZrCa228cJ2DQml8qFyYFKPNYyMD
 Aa4NCTVq+sg0NHAQ3jsmZ1bZ2FjOI67/VdrW7izULrqUoHTTD2giqKKZ1482qHsNxX
 c3BLjhuBLVxNiVs++HZmZkbLS8BhBvzxUSr4P6HlnvSpJMusmstPSU19zm8lZjbfV0
 twEP7NdgMYebJRXrTi2M/71T7KfDzZfulyd4r9r/n9ykzQMly61IfEi8s384knzAe0
 yj8vHiapucF/w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=PuZ+Euh5
Subject: Re: [Buildroot] [PATCH 1/2] package/libsolv: drop unrecognized
 variables
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
Cc: TIAN Yuanhao <tianyuanhao3@163.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2023-02-12 15:43 +0100, Fabrice Fontaine spake thusly:
> Drop unrecognized variables:
> 
> CMake Warning:
>   Manually-specified variables were not used by the project:
> 
>     BUILD_DOC
>     BUILD_DOCS
>     BUILD_EXAMPLE
>     BUILD_EXAMPLES
>     BUILD_TEST
>     BUILD_TESTING
>     BUILD_TESTS
>     CMAKE_CXX_COMPILER_FORCED
>     DISABLE_STATIC
>     ENABLE_SHARED
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Both patches applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libsolv/libsolv.mk | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libsolv/libsolv.mk b/package/libsolv/libsolv.mk
> index 29f8a6a3d2..04fdb387fd 100644
> --- a/package/libsolv/libsolv.mk
> +++ b/package/libsolv/libsolv.mk
> @@ -11,16 +11,15 @@ LIBSOLV_LICENSE_FILES = LICENSE.BSD
>  LIBSOLV_CPE_ID_VENDOR = opensuse
>  LIBSOLV_INSTALL_STAGING = YES
>  LIBSOLV_DEPENDENCIES = zlib
> -LIBSOLV_CONF_OPTS = -DCMAKE_CXX_COMPILER_FORCED=ON
>  
>  ifeq ($(BR2_STATIC_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
>  LIBSOLV_CONF_OPTS += -DENABLE_STATIC=ON
>  else
> -LIBSOLV_CONF_OPTS += -DDISABLE_STATIC=ON
> +LIBSOLV_CONF_OPTS += -DENABLE_STATIC=OFF
>  endif
>  
>  ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
> -LIBSOLV_CONF_OPTS += -DENABLE_SHARED=ON
> +LIBSOLV_CONF_OPTS += -DDISABLE_SHARED=OFF
>  else
>  LIBSOLV_CONF_OPTS += -DDISABLE_SHARED=ON
>  endif
> -- 
> 2.39.0
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
