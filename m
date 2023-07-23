Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDCD9C001DE
	for <buildroot@archiver.kernel.org>; Sun, 23 Jul 2023 15:25:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33C5541365;
	Sun, 23 Jul 2023 15:25:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33C5541365
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pFQkBlsppQAR; Sun, 23 Jul 2023 15:25:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A99C410C5;
	Sun, 23 Jul 2023 15:25:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A99C410C5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DD9541BF28A
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 15:25:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B2CD860B1D
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 15:25:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B2CD860B1D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zdzosFWjdN9q for <buildroot@lists.busybox.net>;
 Sun, 23 Jul 2023 15:25:40 +0000 (UTC)
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6C9D260675
 for <buildroot@buildroot.org>; Sun, 23 Jul 2023 15:25:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C9D260675
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:46bc:e175:93d0:2fb4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 3D8445FFA9;
 Sun, 23 Jul 2023 17:25:34 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 23 Jul 2023 17:25:33 +0200
Date: Sun, 23 Jul 2023 17:25:33 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230723152533.GH2503916@scaer>
References: <20230723074303.603364-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230723074303.603364-1-bernd@kuhls.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1690125937;
 bh=A2kSwjvIQjhvB+3uml8eHHDtGcXWwjBaL2BoI/rU+Zc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hw7o29olHwlHR4EZVG7j4kGKLnp493Zos/N4lruYkKAiIT4UZZ6X67zF5G/6aw+45
 g0qr9p2kA5xYuBf3MLVvObVbNGTwOAnBCteSFo7+h+7lBsrX2exH2UHaTls5w//89D
 uZAZAim5/KmJJsx7+t66KOGH/ESwaqSH/ZRz+TR2zTmKyWS+GrOQXzJJgmIzH9R7DA
 Zm+MlZW2uFJIV/o+EJijHoW6wy5yQXWLyEqoQ5B8AR9Nxrqs4Ii5C6dPPnZvOmEYEj
 mOeAiu11tTwa22tLtNhGxwAUko39drcwDFJMdhMej5efIxpnf97GH6Rlc/u36KLEdJ
 +kICBXyGgCeQw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=hw7o29ol
Subject: Re: [Buildroot] [PATCH v2 1/1] package/piglit: bump version
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bernd, All,

On 2023-07-23 09:43 +0200, Bernd Kuhls spake thusly:
> Disable Vulkan tests due to missing dependency libvulkan:
> https://gitlab.freedesktop.org/mesa/piglit/-/commit/2519c330fba55ce6efd0dbee07aa67c703124d4f
> 
> Fixes python related build error:
> AttributeError: module 'collections' has no attribute 'MutableMapping'
> 
> This build error first occured in the autobuilder logs on Jan 13, 2022:
> http://autobuild.buildroot.net/results/ff6/ff6efa43102a56bb4b87401cd425a5241f0920cd/
> The cause for this error is unknown

It is not unknown. A bit of searhing around turns up:
  - https://stackoverflow.com/questions/69464512/django-rest-error-attributeerror-module-collections-has-no-attribute-mutab
  - https://github.com/python/cpython/commit/c66f9f8d3909f588c251957d499599a1680e2320
  - https://bugs.python.org/issue25988

So guess what hapenned not too long before 2022-01-13 when this piglit
issue first popped up? We bumped python from 3.9 to 3.10, which stopped
emitting deprecation warnings, and defeinitely dropped the ABCs imports
from collections, which now raise AttributeError, so now one must import
the ABCs from collections.abc.

So, it is not unknown; it is due to the python 3.10 bump.

Yet...

> as it seems unrelated to the piglit
> version which was last bumped in 2020 with commit
> 9061fd7bf6855431939bdace7e3091d4e1c48e53.
> 
> Fixes:
> http://autobuild.buildroot.net/results/ed3/ed3c5806458efdb9db78732d3709e1d6ec441bcb/

This build failure is from 2022-10-04, almost a year ago now. Since
then, we haven't had such a failure again...

I'm OK for fixing a old build failure, but I'd like to understand why
it suddenly stopped appearing when nothing changed in the package, and
when python certainly did not reinstate MutableMapping in collections,
and so we should still hit it (at least once in a while).

Do you have a defconfig that still exhibit the issue? Do you know why
the autobuilders no longer report that issue?

Regards,
Yann E. MORIN.

> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
> v2: added known information about the build error (Thomas)
> 
>  package/piglit/piglit.hash | 2 +-
>  package/piglit/piglit.mk   | 3 ++-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/piglit/piglit.hash b/package/piglit/piglit.hash
> index 923569a6f3..b10645c7a6 100644
> --- a/package/piglit/piglit.hash
> +++ b/package/piglit/piglit.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated
> -sha256  ec2a80c49f10761980334f1591be54ee6f365165d7ac637270b4ca15a12ad674  piglit-2affee53f3ad7a96f5b397a2b6d6408af8a374b0-br1.tar.gz
> +sha256  3505bbd3170cdb7cae0284613025ad31285e021fb4d09bcc6570ee05503b3314  piglit-ed58dfbd12be34fa3dab97a7a2987b890e0637f1-br1.tar.gz
>  sha256  dcc398730859aee7cc1d6aa57f526f8d181b47bb3a49830e85b5723d5bc2c3bc  COPYING
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  licences/GPL-2
>  sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  licences/GPL-3
> diff --git a/package/piglit/piglit.mk b/package/piglit/piglit.mk
> index 4d17405d10..da34d156ac 100644
> --- a/package/piglit/piglit.mk
> +++ b/package/piglit/piglit.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -PIGLIT_VERSION = 2affee53f3ad7a96f5b397a2b6d6408af8a374b0
> +PIGLIT_VERSION = ed58dfbd12be34fa3dab97a7a2987b890e0637f1
>  PIGLIT_SITE = https://gitlab.freedesktop.org/mesa/piglit.git
>  PIGLIT_SITE_METHOD = git
>  PIGLIT_LICENSE = MIT (code), \
> @@ -29,6 +29,7 @@ PIGLIT_DEPENDENCIES = host-pkgconf \
>  PIGLIT_CONF_OPTS += \
>  	-DPIGLIT_USE_WAFFLE=ON \
>  	-DPIGLIT_BUILD_CL_TESTS=OFF \
> +	-DPIGLIT_BUILD_VK_TESTS=OFF \
>  	-DPIGLIT_BUILD_WGL_TESTS=OFF \
>  	-DPYTHON_EXECUTABLE=$(HOST_DIR)/bin/python3
>  
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
