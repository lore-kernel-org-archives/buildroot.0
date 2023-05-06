Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C4C2C77B73
	for <buildroot@archiver.kernel.org>; Sat,  6 May 2023 14:43:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CCF716129A;
	Sat,  6 May 2023 14:43:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CCF716129A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q6oAFgwvGdVd; Sat,  6 May 2023 14:43:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C16D56111C;
	Sat,  6 May 2023 14:43:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C16D56111C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B6FDF1BF36E
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 14:41:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9DECC404C4
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 14:41:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9DECC404C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NuLybOTZph9n for <buildroot@lists.busybox.net>;
 Sat,  6 May 2023 14:41:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC57E400E5
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AC57E400E5
 for <buildroot@buildroot.org>; Sat,  6 May 2023 14:41:07 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:ae89:1f5e:7283:231f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id A47E2B0055E;
 Sat,  6 May 2023 16:41:02 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 06 May 2023 16:41:02 +0200
Date: Sat, 6 May 2023 16:41:02 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20230506144102.GC2661@scaer>
References: <20230329205659.6801-1-ps.report@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230329205659.6801-1-ps.report@gmx.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683384064;
 bh=ChUNS4nrJAiBfvD6QTN1SY6nEcxF/pHg+VQMzIsY9v4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bHyzpWoodJ4dvgM41c/vi6iL0NCmJRcOQaL16burIRkS8NxtFu61bWBq3tF3Puo9p
 lD4hZirsGWuuKsorv73Q6GVaxoSfu9hGKiaWe06ZYbwaD/MViG8wAurTyv48NMQ+Hb
 WjEbTn02K+zu30uU4ueQWw07arYTaaDiVO6UqBiQBVTPiNavbHO7E/Gluqw0ou7ep+
 Q+0U+F7cinB89vDwDUoNA5yo1Anzdradb3S9bu+tjavuP6FLrUPM/VK5O4+nkmcVK6
 P+1i8VzYp9T3ziKzBaENi8MWI8LrXTR6ahxtSqaCXKNKN0zBRFoOP32I3+wrggRdNk
 9OK+SJw630ZAQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=bHyzpWoo
Subject: Re: [Buildroot] [PATCH v1] package/valgrind: bump version to 3.20.0
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

Peter, All,

On 2023-03-29 22:56 +0200, Peter Seiderer spake thusly:
> - remove 0003-coregrind-fix-compilation-for-uclibc.patch
>   (from upstream [1]) and drop AUTORECONF
> 
> For details see [2].
> 
> [1] https://sourceware.org/git/?p=valgrind.git;a=commit;h=9c9fd9ae24b45f915f0759d32f662835c26d37c3
> [2] https://www.valgrind.org/docs/manual/dist.news.html
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...coregrind-fix-compilation-for-uclibc.patch | 65 -------------------
>  package/valgrind/valgrind.hash                |  4 +-
>  package/valgrind/valgrind.mk                  |  4 +-
>  3 files changed, 3 insertions(+), 70 deletions(-)
>  delete mode 100644 package/valgrind/0003-coregrind-fix-compilation-for-uclibc.patch
> 
> diff --git a/package/valgrind/0003-coregrind-fix-compilation-for-uclibc.patch b/package/valgrind/0003-coregrind-fix-compilation-for-uclibc.patch
> deleted file mode 100644
> index ff8dc974d8..0000000000
> --- a/package/valgrind/0003-coregrind-fix-compilation-for-uclibc.patch
> +++ /dev/null
> @@ -1,65 +0,0 @@
> -From 9c9fd9ae24b45f915f0759d32f662835c26d37c3 Mon Sep 17 00:00:00 2001
> -From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> -Date: Fri, 8 Apr 2022 12:36:33 +0200
> -Subject: [PATCH] coregrind: fix compilation for uclibc
> -
> -It fixes a known iusse whose details are described at [1] and more
> -generally it guarantees that Valgrind is properly compiled for ulibc.
> -
> -[1] https://www.mail-archive.com/valgrind-users@lists.sourceforge.net/msg05295.html
> -
> -Suggested-by Michael Trimarchi <michael@amarulasolutions.com>
> -Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
> -Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ----
> - configure.ac                        | 2 ++
> - coregrind/m_debuginfo/minilzo-inl.c | 4 ++++
> - coregrind/vg_preloaded.c            | 4 ++++
> - 3 files changed, 10 insertions(+)
> -
> -diff --git a/configure.ac b/configure.ac
> -index 6f51dfd9f8fb..c627a9c17a4a 100755
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -1204,6 +1204,8 @@ AC_SUBST(DEFAULT_SUPP)
> - AC_CHECK_HEADER([features.h])
> - 
> - if test x$ac_cv_header_features_h = xyes; then
> -+  AC_DEFINE([HAVE_HEADER_FEATURES_H], 1,
> -+          [Define to 1 if you have the `features.h' header.])
> -   rm -f conftest.$ac_ext
> -   cat <<_ACEOF >conftest.$ac_ext
> - #include <features.h>
> -diff --git a/coregrind/m_debuginfo/minilzo-inl.c b/coregrind/m_debuginfo/minilzo-inl.c
> -index 153d008fd44f..b45ec92eaa85 100644
> ---- a/coregrind/m_debuginfo/minilzo-inl.c
> -+++ b/coregrind/m_debuginfo/minilzo-inl.c
> -@@ -1875,6 +1875,10 @@ extern "C" {
> - 
> - #endif
> - 
> -+#ifdef HAVE_HEADER_FEATURES_H
> -+#include <features.h>
> -+#endif
> -+
> - #undef LZO_HAVE_CONFIG_H
> - #include "minilzo.h"
> - 
> -diff --git a/coregrind/vg_preloaded.c b/coregrind/vg_preloaded.c
> -index 5e2098390847..3809811aede7 100644
> ---- a/coregrind/vg_preloaded.c
> -+++ b/coregrind/vg_preloaded.c
> -@@ -45,6 +45,10 @@
> - #include "pub_core_debuginfo.h"  // Needed for pub_core_redir.h
> - #include "pub_core_redir.h"      // For VG_NOTIFY_ON_LOAD
> - 
> -+#ifdef HAVE_HEADER_FEATURES_H
> -+#include <features.h>
> -+#endif
> -+
> - #if defined(VGO_linux) || defined(VGO_solaris) || defined(VGO_freebsd)
> - 
> - /* ---------------------------------------------------------------------
> --- 
> -2.32.0
> -
> diff --git a/package/valgrind/valgrind.hash b/package/valgrind/valgrind.hash
> index 8487c07e42..83717f26f3 100644
> --- a/package/valgrind/valgrind.hash
> +++ b/package/valgrind/valgrind.hash
> @@ -1,7 +1,7 @@
>  # From https://valgrind.org/downloads/current.html
> -md5  4687a4990585a038c52f842448ef4e63  valgrind-3.19.0.tar.bz2
> +md5  e3ca8e03c6c527e80e7da5135a1b6beb  valgrind-3.20.0.tar.bz2
>  # locally computed
> -sha256  dd5e34486f1a483ff7be7300cc16b4d6b24690987877c3278d797534d6738f02  valgrind-3.19.0.tar.bz2
> +sha256  8536c031dbe078d342f121fa881a9ecd205cb5a78e639005ad570011bdb9f3c6  valgrind-3.20.0.tar.bz2
>  
>  # License files
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/valgrind/valgrind.mk b/package/valgrind/valgrind.mk
> index 17b131c3ec..98beb7ffef 100644
> --- a/package/valgrind/valgrind.mk
> +++ b/package/valgrind/valgrind.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -VALGRIND_VERSION = 3.19.0
> +VALGRIND_VERSION = 3.20.0
>  VALGRIND_SITE = https://sourceware.org/pub/valgrind
>  VALGRIND_SOURCE = valgrind-$(VALGRIND_VERSION).tar.bz2
>  VALGRIND_LICENSE = GPL-2.0, GFDL-1.2
> @@ -14,8 +14,6 @@ VALGRIND_CONF_OPTS = \
>  	--disable-ubsan \
>  	--without-mpicc
>  VALGRIND_INSTALL_STAGING = YES
> -# 0003-coregrind-fix-compilation-for-uclibc.patch
> -VALGRIND_AUTORECONF=YES
>  
>  # Valgrind must be compiled with no stack protection, so forcefully
>  # pass -fno-stack-protector to override what Buildroot may have in
> -- 
> 2.40.0
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
