Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC3B3C38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 16:17:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5EB2B40335;
	Sun, 30 Oct 2022 16:17:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5EB2B40335
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d17fCQzI-dfF; Sun, 30 Oct 2022 16:17:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F24C84032F;
	Sun, 30 Oct 2022 16:17:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F24C84032F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B021E1BF479
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 16:17:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 98946812A0
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 16:17:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 98946812A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7MX7SkC2TfhL for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 16:17:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2453A81271
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2453A81271
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 16:17:23 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:6ffe:83e9:a65c:45ae])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id D33E213F85F;
 Sun, 30 Oct 2022 17:17:18 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 30 Oct 2022 17:17:18 +0100
Date: Sun, 30 Oct 2022 17:17:18 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221030161718.GL1058960@scaer>
References: <20221028220223.286949-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221028220223.286949-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1667146642;
 bh=iywF+1etpafRN+Dcyghfd3PMTA8dV7Rnp18IMrimvm4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=B9gVfe+SYB0mBYKLZ2B+EZEsKb+E2qTggsTX2Tp7bxtGc1MY/6LDFZWMgxuyHtewm
 hE0stfp4gh73e2K/INFJBn6fA9SIBJ722hsabeJ5avRrtfESPRD6oB/+UfK4Al4DzQ
 yaurVkciDtLiTqOy+heAM+1cZcROs8q4r1HRhJl5Ns2o1vKGlIZ1gP9OJu11+4MYUD
 jF+QHzzslh02SxCt61fEHh3V78DFcg1qWQmMjWAQwcr1WB6Who80hs7yhBiQ3YfySc
 6ZWqvOpf8Ev3/UcHlkaprhOQF9wmCX4PcBBq4Og2Q5RBJcylblGtfQ/QLMQBmc7jww
 Ud340jw8yviNw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=B9gVfe+S
Subject: Re: [Buildroot] [PATCH 1/1] package/taglib: bump to version 1.13
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-10-29 00:02 +0200, Fabrice Fontaine spake thusly:
> - Drop patch (already in version)
> - Use WITH_ZLIB which is available since
>   https://github.com/taglib/taglib/commit/1644c0dd87f40a2492bde4011fe72257fc72ee0e
> 
> https://github.com/taglib/taglib/releases/tag/v1.13
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...e-on-systems-without-HAVE_GCC_ATOMIC.patch | 34 -------------------
>  package/taglib/taglib.hash                    |  2 +-
>  package/taglib/taglib.mk                      |  5 ++-
>  3 files changed, 5 insertions(+), 36 deletions(-)
>  delete mode 100644 package/taglib/0001-Fix-error-duplicate-volatile-on-systems-without-HAVE_GCC_ATOMIC.patch
> 
> diff --git a/package/taglib/0001-Fix-error-duplicate-volatile-on-systems-without-HAVE_GCC_ATOMIC.patch b/package/taglib/0001-Fix-error-duplicate-volatile-on-systems-without-HAVE_GCC_ATOMIC.patch
> deleted file mode 100644
> index d8af73cb08..0000000000
> --- a/package/taglib/0001-Fix-error-duplicate-volatile-on-systems-without-HAVE_GCC_ATOMIC.patch
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -From 1d24bd3399f2284104cbe87d017f87325b1797ab Mon Sep 17 00:00:00 2001
> -From: Oleg Antonyan <oleg.b.antonyan@gmail.com>
> -Date: Thu, 13 May 2021 16:41:35 +0200
> -Subject: [PATCH] =?UTF-8?q?Fix=20"error:=20duplicate=20=E2=80=98volatile?=
> - =?UTF-8?q?=E2=80=99"=20on=20systems=20without=20HAVE=5FGCC=5FATOMIC=20in?=
> - =?UTF-8?q?=201.12=20(#1012)?=
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=UTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -* fix error: duplicate volatile
> -
> -* fix volatile ATOMIC_INT in constructor
> -
> -[Retrieved from:
> -https://github.com/taglib/taglib/commit/1d24bd3399f2284104cbe87d017f87325b1797ab]
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ----
> - taglib/toolkit/trefcounter.cpp | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/taglib/toolkit/trefcounter.cpp b/taglib/toolkit/trefcounter.cpp
> -index 18cb596c0..5b089abf9 100644
> ---- a/taglib/toolkit/trefcounter.cpp
> -+++ b/taglib/toolkit/trefcounter.cpp
> -@@ -52,7 +52,7 @@
> - # define ATOMIC_INC(x) __sync_add_and_fetch(&x, 1)
> - # define ATOMIC_DEC(x) __sync_sub_and_fetch(&x, 1)
> - #else
> --# define ATOMIC_INT volatile int
> -+# define ATOMIC_INT int
> - # define ATOMIC_INC(x) (++x)
> - # define ATOMIC_DEC(x) (--x)
> - #endif
> diff --git a/package/taglib/taglib.hash b/package/taglib/taglib.hash
> index 38a44b41a5..7d1b2e8422 100644
> --- a/package/taglib/taglib.hash
> +++ b/package/taglib/taglib.hash
> @@ -1,4 +1,4 @@
>  # Locally calculated
> -sha256  7fccd07669a523b07a15bd24c8da1bbb92206cb19e9366c3692af3d79253b703  taglib-1.12.tar.gz
> +sha256  58f08b4db3dc31ed152c04896ee9172d22052bc7ef12888028c01d8b1d60ade0  taglib-1.13.tar.gz
>  sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
>  sha256  53692a2ed6c6a2c6ec9b32dd0b820dfae91e0a1fcdf625ca9ed0bdf8705fcc4f  COPYING.MPL
> diff --git a/package/taglib/taglib.mk b/package/taglib/taglib.mk
> index 9513e0d0e1..c687891002 100644
> --- a/package/taglib/taglib.mk
> +++ b/package/taglib/taglib.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -TAGLIB_VERSION = 1.12
> +TAGLIB_VERSION = 1.13
>  TAGLIB_SITE = http://taglib.github.io/releases
>  TAGLIB_INSTALL_STAGING = YES
>  TAGLIB_LICENSE = LGPL-2.1 or MPL-1.1
> @@ -13,6 +13,9 @@ TAGLIB_CPE_ID_VENDOR = taglib
>  
>  ifeq ($(BR2_PACKAGE_ZLIB),y)
>  TAGLIB_DEPENDENCIES += zlib
> +TAGLIB_CONF_OPTS += -DWITH_ZLIB=ON
> +else
> +TAGLIB_CONF_OPTS += -DWITH_ZLIB=OFF
>  endif
>  
>  define TAGLIB_REMOVE_DEVFILE
> -- 
> 2.35.1
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
