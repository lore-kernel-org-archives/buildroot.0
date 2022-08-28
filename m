Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 147F1ECAAD2
	for <buildroot@archiver.kernel.org>; Sun, 28 Aug 2022 09:41:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B8AD60B4F;
	Sun, 28 Aug 2022 09:41:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B8AD60B4F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WVWhe2FyR0BO; Sun, 28 Aug 2022 09:41:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 847E960AF7;
	Sun, 28 Aug 2022 09:41:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 847E960AF7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2B72E1BF5AE
 for <buildroot@lists.busybox.net>; Sun, 28 Aug 2022 09:41:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 00C2B4040D
 for <buildroot@lists.busybox.net>; Sun, 28 Aug 2022 09:41:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 00C2B4040D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5XZtZp_bhuL1 for <buildroot@lists.busybox.net>;
 Sun, 28 Aug 2022 09:41:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B5ACC400E4
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B5ACC400E4
 for <buildroot@buildroot.org>; Sun, 28 Aug 2022 09:41:17 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:e2dc:5f1b:7f23:232])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 0559F780500;
 Sun, 28 Aug 2022 11:41:13 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 28 Aug 2022 11:41:13 +0200
Date: Sun, 28 Aug 2022 11:41:13 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220828094113.GG37358@scaer>
References: <20220828071422.267165-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220828071422.267165-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661679676;
 bh=3O6s5ZgLOi5c9PA4ljJq/OtkvukPw/kPjHjShc67eLo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QIYlpAwhAhZUwEEefPwsqg9jrdmUZv2kshQuJSv7ym5H2GGBhf0K+GFc0uNKKWnMK
 1ogi00BYvJCUis/2qA76Snbzko4acWC+5EnS5lYjF89mfNrQmMQTcuMMcz7pdWGnLX
 xk65kfzo9XUYX1q+4L3XoTyXxUktmGqnqZpnOE25LlnKLar8rGimyCuD6dJMX8T8Cr
 eluKrrFHNJAbPqk9LQ1xNzMsixF7vgYy7E8H9UNnNICG/8yOKtaC1kdjg9GfbP3WGx
 dw/zSWoYU4OuPrOq5zswendX8V0eytNj77dXMZ+bPEZYWiGmB6BDRIoFYRKLI7xdxp
 h/Di+Z9avol3g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=QIYlpAwh
Subject: Re: [Buildroot] [PATCH 1/1] package/memcached: disable -Werror
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

Fabrice, all,

On 2022-08-28 09:14 +0200, Fabrice Fontaine spake thusly:
> Disable -Werror to avoid the following build failure:
> 
> In file included from hash.c:7:
> xxhash.h:2667:5: error: #warning is a GCC extension [-Werror]
>  2667 | #   warning "XXH3 is highly inefficient without ARM or Thumb-2."
>       |     ^~~~~~~
> xxhash.h:2667:5: error: #warning "XXH3 is highly inefficient without ARM or Thumb-2." [-Werror=cpp]
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/3124bae73c207f1a118e57e41e222ef464ccb297
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Upstream is not too keen on disabling Werror, but that's still the best
solution we have.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...0003-configure.ac-add-disable-werror.patch | 65 +++++++++++++++++++
>  package/memcached/memcached.mk                |  2 +-
>  2 files changed, 66 insertions(+), 1 deletion(-)
>  create mode 100644 package/memcached/0003-configure.ac-add-disable-werror.patch
> 
> diff --git a/package/memcached/0003-configure.ac-add-disable-werror.patch b/package/memcached/0003-configure.ac-add-disable-werror.patch
> new file mode 100644
> index 0000000000..dab9b8835d
> --- /dev/null
> +++ b/package/memcached/0003-configure.ac-add-disable-werror.patch
> @@ -0,0 +1,65 @@
> +From 8497f7ed38146378a988bc22800b3a5eba38b0fd Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Mon, 13 Jun 2022 16:29:38 +0200
> +Subject: [PATCH] configure.ac: add --disable-werror
> +
> +Allow the user to disable -Werror to avoid the following build failure:
> +
> +In file included from hash.c:7:
> +xxhash.h:2667:5: error: #warning is a GCC extension [-Werror]
> + 2667 | #   warning "XXH3 is highly inefficient without ARM or Thumb-2."
> +      |     ^~~~~~~
> +xxhash.h:2667:5: error: #warning "XXH3 is highly inefficient without ARM or Thumb-2." [-Werror=cpp]
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/3124bae73c207f1a118e57e41e222ef464ccb297
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status: https://github.com/memcached/memcached/pull/926]
> +---
> + configure.ac | 11 +++++++++--
> + 1 file changed, 9 insertions(+), 2 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 3337fe7..7683b8f 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -114,6 +114,9 @@ AC_ARG_ENABLE(static,
> + AC_ARG_ENABLE(unix_socket,
> +   [AS_HELP_STRING([--disable-unix-socket], [Disable unix domain socket])])
> + 
> ++AC_ARG_ENABLE(werror,
> ++  [AS_HELP_STRING([--disable-werror], [Disable -Werror])])
> ++
> + dnl **********************************************************************
> + dnl DETECT_SASL_CB_GETCONF
> + dnl
> +@@ -783,6 +786,10 @@ AM_CONDITIONAL([BUILD_SPECIFICATIONS],
> +                [test "x$enable_docs" != "xno" -a "x$XML2RFC" != "xno" -a "x$XSLTPROC" != "xno"])
> + 
> + 
> ++if test "x$enable_werror" != "xno"; then
> ++   CFLAGS="$CFLAGS -Werror"
> ++fi
> ++
> + dnl Let the compiler be a bit more picky. Please note that you cannot
> + dnl specify these flags to the compiler before AC_CHECK_FUNCS, because
> + dnl the test program will generate a compilation warning and hence fail
> +@@ -790,12 +797,12 @@ dnl to detect the function ;-)
> + if test "$ICC" = "yes"
> + then
> +    dnl ICC trying to be gcc.
> +-   CFLAGS="$CFLAGS -diag-disable 187 -Wall -Werror"
> ++   CFLAGS="$CFLAGS -diag-disable 187 -Wall"
> +    AC_DEFINE([_GNU_SOURCE],[1],[make sure IOV_MAX is defined])
> + elif test "$GCC" = "yes"
> + then
> +   GCC_VERSION=`$CC -dumpversion`
> +-  CFLAGS="$CFLAGS -Wall -Werror -pedantic -Wmissing-prototypes -Wmissing-declarations -Wredundant-decls"
> ++  CFLAGS="$CFLAGS -Wall -pedantic -Wmissing-prototypes -Wmissing-declarations -Wredundant-decls"
> +   if test "x$enable_asan" = "xyes"; then
> +     CFLAGS="$CFLAGS -fsanitize=address"
> +   fi
> +-- 
> +2.35.1
> +
> diff --git a/package/memcached/memcached.mk b/package/memcached/memcached.mk
> index 5249195c2e..bddb713458 100644
> --- a/package/memcached/memcached.mk
> +++ b/package/memcached/memcached.mk
> @@ -8,7 +8,7 @@ MEMCACHED_VERSION = 1.6.16
>  MEMCACHED_SITE = http://www.memcached.org/files
>  MEMCACHED_DEPENDENCIES = libevent
>  MEMCACHED_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
> -MEMCACHED_CONF_OPTS = --disable-coverage
> +MEMCACHED_CONF_OPTS = --disable-coverage --disable-werror
>  MEMCACHED_LICENSE = BSD-3-Clause
>  MEMCACHED_LICENSE_FILES = COPYING
>  MEMCACHED_CPE_ID_VENDOR = memcached
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
