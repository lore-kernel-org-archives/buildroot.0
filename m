Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51D38C54EBD
	for <buildroot@archiver.kernel.org>; Sun,  8 Jan 2023 22:29:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DDB4C60758;
	Sun,  8 Jan 2023 22:29:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DDB4C60758
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id clA_jm-O37Ja; Sun,  8 Jan 2023 22:29:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B43B607F2;
	Sun,  8 Jan 2023 22:29:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B43B607F2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 23DF61BF4D7
 for <buildroot@lists.busybox.net>; Sun,  8 Jan 2023 22:29:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F24BD403D0
 for <buildroot@lists.busybox.net>; Sun,  8 Jan 2023 22:29:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F24BD403D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GXPu8Xy7734O for <buildroot@lists.busybox.net>;
 Sun,  8 Jan 2023 22:29:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29F44403B4
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 29F44403B4
 for <buildroot@buildroot.org>; Sun,  8 Jan 2023 22:29:38 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id D16695FF7A;
 Sun,  8 Jan 2023 23:29:26 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 08 Jan 2023 23:29:26 +0100
Date: Sun, 8 Jan 2023 23:29:26 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230108222926.GJ151997@scaer>
References: <20230107010437.2471513-1-james.hilliard1@gmail.com>
 <20230107010437.2471513-4-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230107010437.2471513-4-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1673216975;
 bh=lGAFt/k3y+kj+fqUmD87Ltpqe7DjGuHkLlC6vV8uZOs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=l0f96ptFQH8KIrKj7XclqNp3Eb01g2/rtZyRKg4q+b5PiViPwrGJdcdHUsIzrZgLv
 vPaWPjjgaL5Mq5meKx08wOmNTucM4AmCtpRRhaEua7OGvEBQjn2x2Xci11BUeYmHO4
 iqeILpj0316O4jtQFRqaChjtJ0z2Tyd6Vkg+ROvcI24EY/gDvwJKD2lCGbiJVdZ/pX
 PN++oXQslbNmKUdBkbzIHzFxtXA9KjIvIsABNtAxk6K8vHGYYYP3gk88rAs8osHHVe
 7HudlRHcq9V8QaHS4p9reCj11Ti9WdveGwZslkwDyC6/MXnbhmvw2Ai9N/BZ4yWBzV
 XJNYBE7Nt6aEg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=l0f96ptF
Subject: Re: [Buildroot] [PATCH 4/4] package/ccache: bump to version 4.7.4
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
Cc: Anders F =?utf-8?Q?Bj=C3=B6rklund?= <anders.f.bjorklund@gmail.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>, Dominik Michael Rauh <dmrauh@posteo.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

+Dominik, +Anders

On 2023-01-06 18:04 -0700, James Hilliard spake thusly:
> Migrate to cmake package infrastructure.
> 
> Add new host-hiredis host-zstd dependencies.
> 
> Add new ccache dependency exclusions to pkg-generic.
> 
> Migrate HOST_CCACHE_PATCH_CONFIGURATION to handle updated
> source files/format.
> 
> License hashes changed due to migrating urls to https:
> https://github.com/ccache/ccache/commit/a0f32f161f1b8b9c5d287ca8abe88e3fd1e940a2
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/ccache/ccache.hash |  6 +++---
>  package/ccache/ccache.mk   | 30 +++++++++++-------------------

This misses a critical part: what prevents cmake from using ccache to
build?

Dominik and Anders got that correct in their patch:

    +# we are built before ccache
    +HOST_CMAKE_CONFIGURE_OPTS = \
    +	$(HOST_CONFIGURE_OPTS) \
    +	CC="$(HOSTCC_NOCCACHE)" \
    +	GCC="$(HOSTCC_NOCCACHE)" \
    +	CXX="$(HOSTCXX_NOCCACHE)"
    +
     define HOST_CMAKE_CONFIGURE_CMDS
     	(cd $(@D); \
    -		$(HOST_CONFIGURE_OPTS) \
    +		$(HOST_CMAKE_CONFIGURE_OPTS) \
     		CFLAGS="$(HOST_CMAKE_CFLAGS)" \

(Arguably, CFLAGS assignment should have been moved into
HOST_CMAKE_CONFIGURE_OPTS as well.)

[--SNIP--]
> diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
> index 97aa8b1c75..0c208cb9e6 100644
> --- a/package/ccache/ccache.mk
> +++ b/package/ccache/ccache.mk
> @@ -4,27 +4,19 @@
>  #
>  ################################################################################
>  
> -CCACHE_VERSION = 3.7.12
> +CCACHE_VERSION = 4.7.4
>  CCACHE_SITE = https://github.com/ccache/ccache/releases/download/v$(CCACHE_VERSION)
>  CCACHE_SOURCE = ccache-$(CCACHE_VERSION).tar.xz
>  CCACHE_LICENSE = GPL-3.0+, others
>  CCACHE_LICENSE_FILES = LICENSE.adoc GPL-3.0.txt
> -
> -# Force ccache to use its internal zlib. The problem is that without
> -# this, ccache would link against the zlib of the build system, but we
> -# might build and install a different version of zlib in $(O)/host
> -# afterwards, which ccache will pick up. This might break if there is
> -# a version mismatch. A solution would be to add host-zlib has a
> -# dependency of ccache, but it would require tuning the zlib .mk file
> -# to use HOSTCC_NOCCACHE as the compiler. Instead, we take the easy
> -# path: tell ccache to use its internal copy of zlib, so that ccache
> -# has zero dependency besides the C library.
> -HOST_CCACHE_CONF_OPTS += --with-bundled-zlib
> +HOST_CCACHE_DEPENDENCIES = host-hiredis host-zstd

Dominik and Anders made hiredis an optional dependency. Given that
hiredis builds very, very fast (just about 3s here), I wonder if that
really makes sense to make it optional; hiredis has no dependency that
are not dependencies of ccache, so there is no hidden overhead.

If hiredis support is compiled in, does that make it mandatory to use a
hiredis server, or does ccache still uses local files by default?

If the latter, then I think a mandatory dependency is OK.

Dominik, Anders, did you make it a optional because of a previous review
by Thomas asking so?

[--SNIP--]
> +HOST_CCACHE_CONF_OPTS += \
> +	-DCMAKE_C_COMPILER_LAUNCHER="" \
> +	-DCMAKE_CXX_COMPILER_LAUNCHER="" \

Same as for hiredis: use -U.

[--SNIP--]
> @@ -35,11 +27,11 @@ HOST_CCACHE_CONF_ENV = \
>  #    the need to specify BR_CACHE_DIR when invoking ccache directly.
>  #    CCache replaces "%s" with the home directory of the current user,
>  #    So rewrite BR_CACHE_DIR to take that into consideration for SDK purpose
> -HOST_CCACHE_DEFAULT_CCACHE_DIR = $(patsubst $(HOME)/%,\%s/%,$(BR_CACHE_DIR))
> +HOST_CCACHE_DEFAULT_CCACHE_DIR = $(patsubst $(HOME)/%,%,$(BR_CACHE_DIR))

Err, this is probably bad and the comment above no longer matches the
code.

Did you meant using 'home_dir +' to replace '%s' (see Dominik and
Anders' patch):

    HOST_CCACHE_DEFAULT_CCACHE_DIR = $(patsubst \"$(HOME)/%,home_dir + \"/%,\"$(BR_CACHE_DIR)\")

>  define HOST_CCACHE_PATCH_CONFIGURATION
> -	sed -i 's,getenv("CCACHE_DIR"),getenv("BR_CACHE_DIR"),' $(@D)/src/ccache.c
> -	sed -i 's,"%s/.ccache","$(HOST_CCACHE_DEFAULT_CCACHE_DIR)",' $(@D)/src/conf.c
> +	sed -i 's,getenv("CCACHE_DIR"),getenv("BR_CACHE_DIR"),' $(@D)/src/Config.cpp
> +	sed -i 's,".ccache","$(HOST_CCACHE_DEFAULT_CCACHE_DIR)",' $(@D)/src/Config.cpp

This needs a bit of consolidation and further explanations, becasue
ccache now has more locations where it looks for, and we do not want it
to default to those:

    home_dir + "/.ccache"           -> the legacy location
    home_dir + "/.cache/ccache"     -> new, XDG-based
    home_dir + "/.config/ccache"    -> new, XDG-based

Also, it seems that we need a patch to use BR_CACHE_DIR from the
environment...

[--SNIP--]
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index f24e03a325..0863444221 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -792,7 +792,7 @@ $(2)_EXTRACT_DEPENDENCIES += \
>  endif
>  
>  ifeq ($$(BR2_CCACHE),y)
> -ifeq ($$(filter host-tar host-skeleton host-xz host-lzip host-fakedate host-ccache,$(1)),)
> +ifeq ($$(filter host-tar host-skeleton host-xz host-lzip host-fakedate host-ccache host-cmake host-hiredis host-pkgconf host-zstd,$(1)),)

I've applied that part with just host-hiredis, host-pkgconf, and host-zstd,
and left host-cmake out for now.

Regards,
Yann E. MORIN.

>  $(2)_DEPENDENCIES += host-ccache
>  endif
>  endif
> -- 
> 2.34.1
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
