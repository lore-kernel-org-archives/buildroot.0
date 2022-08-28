Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2375CECAAD2
	for <buildroot@archiver.kernel.org>; Sun, 28 Aug 2022 14:13:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9277481A8E;
	Sun, 28 Aug 2022 14:13:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9277481A8E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DSeUxZnLKc-0; Sun, 28 Aug 2022 14:13:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6FCF6819D1;
	Sun, 28 Aug 2022 14:13:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FCF6819D1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E12EE1BF414
 for <buildroot@lists.busybox.net>; Sun, 28 Aug 2022 14:13:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C887D40571
 for <buildroot@lists.busybox.net>; Sun, 28 Aug 2022 14:13:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C887D40571
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pc1T1URDyrG3 for <buildroot@lists.busybox.net>;
 Sun, 28 Aug 2022 14:13:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47C92404E8
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 47C92404E8
 for <buildroot@buildroot.org>; Sun, 28 Aug 2022 14:13:18 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:c66a:3d95:4f85:baec])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 67C0F780346;
 Sun, 28 Aug 2022 16:13:14 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 28 Aug 2022 16:13:14 +0200
Date: Sun, 28 Aug 2022 16:13:14 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220828141314.GQ37358@scaer>
References: <20220828112330.12852-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220828112330.12852-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661695996;
 bh=HDOx/8YBIXan679mod+fj9FRkdCy6FN09sy+vAPMuwA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oUp23/nT1zCSudF+IGwyVN0tv49SXh9P476mlBnJCdsl31e/wM7pdFVk43aCq9jZU
 i2lUVPQpawqRHvn2O3e46un9JNzWKYLPFPxuwW5dfl/ldbgsjkiIpM8R6mmbtgnh3z
 4lkzTxdFmCSnST9mzTH7UCNovx85ZsUYb1xL97q9oLcKKE66D1EmMAfHacLAgRlcMx
 CjW+YBPoF+7ZFVsXD84skF3B+VFDYDx8qJ08BJ7di4X18BEp7wUkvoHVvm0AW+3Of3
 2cS3cYroYyS7W9ojWbhAIRlMxBckYTxErSoo3nPcClwJBNP+/PpDG2UAh2opBAek2B
 DY7sxvY1B3Pvg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=oUp23/nT
Subject: Re: [Buildroot] [PATCH/next 1/1] package/memcached: bump to version
 1.6.17
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

Fabrice, All,

On 2022-08-28 13:23 +0200, Fabrice Fontaine spake thusly:
> - Refresh second patch
> - openssl is an optional dependency since version 1.5.13 and
>   https://github.com/memcached/memcached/commit/ee1cfe3bf9384d1a93545fc942e25bed6437d910

So, do we need the conditional dependency to be also added to master?

>   which can be found through pkg-config since version 1.6.17 and
>   https://github.com/memcached/memcached/commit/656dedad48c81541060448d008b90290196263c5

As I understand this change, memcached would previously detect openssl
iwith an ad-hoc (ugly) code path, so we are already in a situation where
the depednency to openssl depends on the build order.

So, it is my undestanding that, on master, we ould want to have the
conditional openssl dependency sans the host-pkgconf dependency, no?

If so, then can you respin with the contional dependency added as a
separate patch (so that we can apply that to master), and the version
bump plus host-pkgconf dependency in a second patch (so that we can
apply both on next)?

Regards,
Yann E. MORIN.

> https://github.com/memcached/memcached/wiki/ReleaseNotes1617
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/memcached/0002-check-for-sys-auxv.h.patch | 8 ++++----
>  package/memcached/memcached.hash                  | 6 +++---
>  package/memcached/memcached.mk                    | 9 ++++++++-
>  3 files changed, 15 insertions(+), 8 deletions(-)
> 
> diff --git a/package/memcached/0002-check-for-sys-auxv.h.patch b/package/memcached/0002-check-for-sys-auxv.h.patch
> index 8c41bb4f01..ff6d84527c 100644
> --- a/package/memcached/0002-check-for-sys-auxv.h.patch
> +++ b/package/memcached/0002-check-for-sys-auxv.h.patch
> @@ -40,11 +40,11 @@ index 26df879..05e61ff 100644
>       }
>   }
>   
> --#elif defined(__aarch64__) && defined(__linux__)
> -+#elif defined(__aarch64__) && defined(__linux__) && defined(HAVE_SYS_AUX_H)
> +-#elif defined(__aarch64__) && (defined(__linux__) || defined(__APPLE__))
> ++#elif defined(__aarch64__) && ((defined(__linux__) && defined(HAVE_SYS_AUX_H))|| defined(__APPLE__))
> + #if defined(__linux__)
>   #include <sys/auxv.h>
> - 
> - #if defined(HWCAP_CRC32)
> + #elif defined(__APPLE__)
>  -- 
>  2.35.1
>  
> diff --git a/package/memcached/memcached.hash b/package/memcached/memcached.hash
> index 3bdd1e5e33..78875dde66 100644
> --- a/package/memcached/memcached.hash
> +++ b/package/memcached/memcached.hash
> @@ -1,6 +1,6 @@
> -# From http://www.memcached.org/files/memcached-1.6.16.tar.gz.sha1
> -sha1  724f31c3462fb6b07264d72d0043fd65545fd84a  memcached-1.6.16.tar.gz
> +# From http://www.memcached.org/files/memcached-1.6.17.tar.gz.sha1
> +sha1  e25639473e15f1bd9516b915fb7e03ab8209030f  memcached-1.6.17.tar.gz
>  
>  # Locally computed
> -sha256  3051a93bf1dd0c3af2d0e589ff6ef6511f876385a35b18e9ff8741e4a1ab34da  memcached-1.6.16.tar.gz
> +sha256  2055e373613d8fc21529aff9f0adce3e23b9ce01ba0478d30e7941d9f2bd1224  memcached-1.6.17.tar.gz
>  sha256  bc887c4ad8051fe690ace9528fe37a2e0bb362e6d963331d82e845ca9b585a0c  COPYING
> diff --git a/package/memcached/memcached.mk b/package/memcached/memcached.mk
> index bddb713458..dbd59d91e6 100644
> --- a/package/memcached/memcached.mk
> +++ b/package/memcached/memcached.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -MEMCACHED_VERSION = 1.6.16
> +MEMCACHED_VERSION = 1.6.17
>  MEMCACHED_SITE = http://www.memcached.org/files
>  MEMCACHED_DEPENDENCIES = libevent
>  MEMCACHED_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
> @@ -22,4 +22,11 @@ else
>  MEMCACHED_CONF_ENV += ac_cv_c_endian=little
>  endif
>  
> +ifeq ($(BR2_PACKAGE_OPENSSL),y)
> +MEMCACHED_CONF_OPTS += --enable-tls
> +MEMCACHED_DEPENDENCIES += host-pkgconf openssl
> +else
> +MEMCACHED_CONF_OPTS += --disable-tls
> +endif
> +
>  $(eval $(autotools-package))
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
