Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58975C77B7D
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 19:07:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0160D82288;
	Sun,  7 May 2023 19:07:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0160D82288
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OwODesNhgLtV; Sun,  7 May 2023 19:07:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C945E822EA;
	Sun,  7 May 2023 19:07:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C945E822EA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7B1401BF2CD
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 19:07:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5445E60E5E
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 19:07:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5445E60E5E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B1HcZTo_C28T for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 19:07:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C805C60E35
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C805C60E35
 for <buildroot@buildroot.org>; Sun,  7 May 2023 19:07:18 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:5f9f:2ea:ec9d:3930])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 1F2C819F73F;
 Sun,  7 May 2023 21:07:15 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 07 May 2023 21:07:14 +0200
Date: Sun, 7 May 2023 21:07:14 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20230507190714.GF252090@scaer>
References: <20230507163945.4013013-1-bernd.kuhls@t-online.de>
 <20230507163945.4013013-2-bernd.kuhls@t-online.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230507163945.4013013-2-bernd.kuhls@t-online.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683486437;
 bh=hRyt/XiaEKY5DZ2p8m5SH+S897bwqSQM0cp7tuvXbYM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AtfOpwZ30A2D5JFTwfc7wFtbM0qcBJamteJraHpe+YZpOdrGMzXjg1Sr0pKkxiWvM
 crDg+R036DztEm85OUs/XTgaDADodxMnrl8sLKtjXs2ZvnStNQY2UOhQwStuxt3o0z
 jDgDhibEprjzOc9JXB2YMGdMoRgKh5kKmpprnvUhnabPQfwGYNsU7NQWDc9y4gv7IH
 RhALKTs3yBIIIGhaZnwQPDtjz/gILy3Uk2ybbIILE824jJnPA9guS565ZTX0pzusec
 f2FiI4hfxN7KnHIpFi3XeZQweepH9m5Ld8MVWh+SckzwuttF8xeWjI6Al20DFonXvv
 jVZUZ5hvPMVfA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=AtfOpwZ3
Subject: Re: [Buildroot] [PATCH 2/2] package/fontconfig: bump version to
 2.14.2
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
> Removed patch included in upstream release, renumbered and reformatted
> Upstream: tag for remaining patch, updated .checkpackageignore.

Thanks! :-)

> Updated license hash due to upstream commit:
> "Add line between licenses in COPYING."
> https://gitlab.freedesktop.org/fontconfig/fontconfig/-/commit/23cede3e955fcdbc6d6d9b5a5974aaac5760c217
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  .checkpackageignore                           |   2 -
>  ...x-the-build-issue-with-enable-static.patch | 133 ------------------
>  ...ead-as-a-dependency-of-a-static-lib.patch} |   3 +-
>  package/fontconfig/fontconfig.hash            |   6 +-
>  package/fontconfig/fontconfig.mk              |   8 +-
>  5 files changed, 8 insertions(+), 144 deletions(-)
>  delete mode 100644 package/fontconfig/0001-Fix-the-build-issue-with-enable-static.patch
>  rename package/fontconfig/{0002-add-pthread-as-a-dependency-of-a-static-lib.patch => 0001-add-pthread-as-a-dependency-of-a-static-lib.patch} (93%)
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index cd0ccc1abd..5893803096 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -500,8 +500,6 @@ package/fluent-bit/0001-lib-cfl-fixup-static_assert.patch Upstream
>  package/fluent-bit/0002-lib-c-ares-fixup-static_assert.patch Upstream
>  package/fluent-bit/0003-fix-build-without-C.patch Upstream
>  package/fluxbox/0001-fixes-bug-1138.patch Upstream
> -package/fontconfig/0001-Fix-the-build-issue-with-enable-static.patch Upstream
> -package/fontconfig/0002-add-pthread-as-a-dependency-of-a-static-lib.patch Upstream
>  package/freeipmi/0001-add-disable-doc.patch Upstream
>  package/freeradius-client/0001-fix-for-nettle.patch Upstream
>  package/freerdp/0001-Fix-variable-declaration-in-loop.patch Upstream
> diff --git a/package/fontconfig/0001-Fix-the-build-issue-with-enable-static.patch b/package/fontconfig/0001-Fix-the-build-issue-with-enable-static.patch
> deleted file mode 100644
> index bf04bd95fc..0000000000
> --- a/package/fontconfig/0001-Fix-the-build-issue-with-enable-static.patch
> +++ /dev/null
> @@ -1,133 +0,0 @@
> -From 8208f99fa1676c42bfd8d74de3e9dac5366c150c Mon Sep 17 00:00:00 2001
> -From: Akira TAGOH <akira@tagoh.org>
> -Date: Mon, 3 Sep 2018 04:56:16 +0000
> -Subject: [PATCH] Fix the build issue with --enable-static
> -
> -Fixes https://gitlab.freedesktop.org/fontconfig/fontconfig/issues/109
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -[Retrieved from:
> -https://gitlab.freedesktop.org/fontconfig/fontconfig/commit/8208f99fa1676c42bfd8d74de3e9dac5366c150c]
> ----
> - doc/fcstring.fncs       | 12 ++++++++++++
> - fontconfig/fontconfig.h |  4 ++++
> - src/fcint.h             |  4 ----
> - test/test-bz106632.c    | 35 ++++++++++++-----------------------
> - 4 files changed, 28 insertions(+), 27 deletions(-)
> -
> -diff --git a/doc/fcstring.fncs b/doc/fcstring.fncs
> -index 0412bbd..d5ec043 100644
> ---- a/doc/fcstring.fncs
> -+++ b/doc/fcstring.fncs
> -@@ -223,6 +223,18 @@ This is just a wrapper around free(3) which helps track memory usage of
> - strings within the fontconfig library.
> - @@
> - 
> -+@RET@		FcChar8 *
> -+@FUNC@		FcStrBuildFilename
> -+@TYPE1@		const FcChar8 *			@ARG1@		path
> -+@TYPE2@		...
> -+@PURPOSE@	Concatenate strings as a file path
> -+@DESC@
> -+Creates a filename from the given elements of strings as file paths
> -+and concatenate them with the appropriate file separator.
> -+Arguments must be null-terminated.
> -+This returns a newly-allocated memory which should be freed when no longer needed.
> -+@@
> -+
> - @RET@		FcChar8 *
> - @FUNC@		FcStrDirname
> - @TYPE1@		const FcChar8 *			@ARG1@		file
> -diff --git a/fontconfig/fontconfig.h b/fontconfig/fontconfig.h
> -index bac1dda..af870d0 100644
> ---- a/fontconfig/fontconfig.h
> -+++ b/fontconfig/fontconfig.h
> -@@ -1076,6 +1076,10 @@ FcUtf16Len (const FcChar8   *string,
> - 	    int		    *nchar,
> - 	    int		    *wchar);
> - 
> -+FcPublic FcChar8 *
> -+FcStrBuildFilename (const FcChar8 *path,
> -+		    ...);
> -+
> - FcPublic FcChar8 *
> - FcStrDirname (const FcChar8 *file);
> - 
> -diff --git a/src/fcint.h b/src/fcint.h
> -index de78cd8..a9d075a 100644
> ---- a/src/fcint.h
> -+++ b/src/fcint.h
> -@@ -1282,10 +1282,6 @@ FcStrUsesHome (const FcChar8 *s);
> - FcPrivate FcBool
> - FcStrIsAbsoluteFilename (const FcChar8 *s);
> - 
> --FcPrivate FcChar8 *
> --FcStrBuildFilename (const FcChar8 *path,
> --		    ...);
> --
> - FcPrivate FcChar8 *
> - FcStrLastSlash (const FcChar8  *path);
> - 
> -diff --git a/test/test-bz106632.c b/test/test-bz106632.c
> -index daa0c1e..2d67c2e 100644
> ---- a/test/test-bz106632.c
> -+++ b/test/test-bz106632.c
> -@@ -25,25 +25,26 @@
> - #ifdef HAVE_CONFIG_H
> - #include "config.h"
> - #endif
> -+#include <stdio.h>
> - #include <stdlib.h>
> -+#include <string.h>
> - #include <dirent.h>
> -+#include <unistd.h>
> -+#include <errno.h>
> - #ifndef HAVE_STRUCT_DIRENT_D_TYPE
> - #include <sys/types.h>
> - #include <sys/stat.h>
> --#include <unistd.h>
> - #endif
> --#include "fcstr.c"
> --#undef FcConfigBuildFonts
> --#undef FcConfigCreate
> --#undef FcConfigGetCurrent
> --#undef FcConfigParseAndLoadFromMemory
> --#undef FcConfigUptoDate
> --#undef FcFontList
> --#undef FcInitReinitialize
> --#undef FcPatternCreate
> --#undef FcPatternDestroy
> - #include <fontconfig/fontconfig.h>
> - 
> -+#ifdef _WIN32
> -+#  define FC_DIR_SEPARATOR         '\\'
> -+#  define FC_DIR_SEPARATOR_S       "\\"
> -+#else
> -+#  define FC_DIR_SEPARATOR         '/'
> -+#  define FC_DIR_SEPARATOR_S       "/"
> -+#endif
> -+
> - #ifdef HAVE_MKDTEMP
> - #define fc_mkdtemp	mkdtemp
> - #else
> -@@ -154,18 +155,6 @@ unlink_dirs (const char *dir)
> -     return ret;
> - }
> - 
> --FcChar8 *
> --FcLangNormalize (const FcChar8 *lang)
> --{
> --    return NULL;
> --}
> --
> --FcChar8 *
> --FcConfigHome (void)
> --{
> --    return NULL;
> --}
> --
> - int
> - main (void)
> - {
> --- 
> -2.18.1
> -
> diff --git a/package/fontconfig/0002-add-pthread-as-a-dependency-of-a-static-lib.patch b/package/fontconfig/0001-add-pthread-as-a-dependency-of-a-static-lib.patch
> similarity index 93%
> rename from package/fontconfig/0002-add-pthread-as-a-dependency-of-a-static-lib.patch
> rename to package/fontconfig/0001-add-pthread-as-a-dependency-of-a-static-lib.patch
> index eed9dba005..c6aa514534 100644
> --- a/package/fontconfig/0002-add-pthread-as-a-dependency-of-a-static-lib.patch
> +++ b/package/fontconfig/0001-add-pthread-as-a-dependency-of-a-static-lib.patch
> @@ -5,8 +5,7 @@ Subject: [PATCH] add pthread as a dependency of a static lib
>  
>  Downloaded from https://trac.netlabs.org/ports/changeset/2220
>  
> -Patch sent upstream:
> -https://gitlab.freedesktop.org/fontconfig/fontconfig/-/merge_requests/121
> +Upstream: https://gitlab.freedesktop.org/fontconfig/fontconfig/-/merge_requests/121
>  
>  Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
>  ---
> diff --git a/package/fontconfig/fontconfig.hash b/package/fontconfig/fontconfig.hash
> index 844ee426d4..a4f87caf1e 100644
> --- a/package/fontconfig/fontconfig.hash
> +++ b/package/fontconfig/fontconfig.hash
> @@ -1,5 +1,5 @@
> -# From https://lists.freedesktop.org/archives/fontconfig/2018-August/006324.html
> -sha256  f655dd2a986d7aa97e052261b36aa67b0a64989496361eca8d604e6414006741  fontconfig-2.13.1.tar.bz2
> +# From https://lists.freedesktop.org/archives/fontconfig/2023-January/006950.html
> +sha256  dba695b57bce15023d2ceedef82062c2b925e51f5d4cc4aef736cf13f60a468b  fontconfig-2.14.2.tar.xz
>  
>  # Locally calculated
> -sha256  fa4cd9ab005185e10cd8f7504518856c7dd36c01e766c2bac87f4fc638e9f886  COPYING
> +sha256  51a51aa9823704fd90bccc616cdd17ebabb5b2b3e9cbde886ca02c7002288067  COPYING
> diff --git a/package/fontconfig/fontconfig.mk b/package/fontconfig/fontconfig.mk
> index e34acde534..d2eb76e40a 100644
> --- a/package/fontconfig/fontconfig.mk
> +++ b/package/fontconfig/fontconfig.mk
> @@ -4,10 +4,10 @@
>  #
>  ################################################################################
>  
> -FONTCONFIG_VERSION = 2.13.1
> -FONTCONFIG_SITE = http://fontconfig.org/release
> -FONTCONFIG_SOURCE = fontconfig-$(FONTCONFIG_VERSION).tar.bz2
> -# 0002-add-pthread-as-a-dependency-of-a-static-lib.patch
> +FONTCONFIG_VERSION = 2.14.2
> +FONTCONFIG_SITE = https://www.freedesktop.org/software/fontconfig/release
> +FONTCONFIG_SOURCE = fontconfig-$(FONTCONFIG_VERSION).tar.xz
> +# 0001-add-pthread-as-a-dependency-of-a-static-lib.patch
>  FONTCONFIG_AUTORECONF = YES
>  FONTCONFIG_INSTALL_STAGING = YES
>  FONTCONFIG_DEPENDENCIES = freetype expat host-pkgconf host-gperf \
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
