Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99D14CD1292
	for <buildroot@archiver.kernel.org>; Mon,  1 Apr 2024 12:28:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 23FEC81EC7;
	Mon,  1 Apr 2024 12:28:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CEbq4HWyo4sm; Mon,  1 Apr 2024 12:28:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EBB8881EB3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EBB8881EB3;
	Mon,  1 Apr 2024 12:28:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 93CC41BF2CD
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 12:28:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 810C74031C
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 12:28:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VT8RNfGzUHLa for <buildroot@lists.busybox.net>;
 Mon,  1 Apr 2024 12:28:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 36DD9402F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 36DD9402F3
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 36DD9402F3
 for <buildroot@buildroot.org>; Mon,  1 Apr 2024 12:28:01 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 6649313F8AE;
 Mon,  1 Apr 2024 14:27:57 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 01 Apr 2024 14:27:57 +0200
Date: Mon, 1 Apr 2024 14:27:57 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Marcus Hoffmann <buildroot@bubu1.eu>
Message-ID: <ZgqoTVT8z0SyY8Pu@landeda>
References: <20240328095024.2023356-1-buildroot@bubu1.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240328095024.2023356-1-buildroot@bubu1.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1711974479;
 bh=gPGSfgOdEm5dv8W7eiFBXwSMR2Qd2/N9s1h9MUw9jio=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VLi7qwr4qDJOEh0BYiW1G7H9T6Of6fbzwdhppk8QsJd42ncP/cNxaOcQW35dV/jfk
 8JVdkQ8LWBTy58GTiNuJZ7RJbcKgsCN0kXXC0aGw7wkgPpTQuaGfVDCGwDsU1zodj9
 Caw5gTApuD9eN3BzTkJjQwx02zN4rPPTOUIdTfP4J+S+n6Yf/TQBH4bbXX5dXJYh0k
 MWAMpiFZTeJXQX/8tAejbAhcA6c3K8j4cQ9CkpAJ8W3ksU7v6lXMR4xY+s9I9S/9th
 LiRX2IIkaBG90kP8lVWyfu0xJyIS2xP9my/IqgvWiSbbM+pwxfBAhEMU6mVjDkD3lq
 ATdoN8bMkI52w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=VLi7qwr4
Subject: Re: [Buildroot] [PATCH] package/libcurl: security bump to 8.7.1
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

Marcus, All,

On 2024-03-28 10:50 +0100, Marcus Hoffmann via buildroot spake thusly:
> Drop patch that is included in this release. Drop autoreconf that was
> introduced for this patch.
> 
> Fixes the following security issues:
> 
> * CVE-2024-2004
> * CVE-2024-2379
> * CVE-2024-2398
> * CVE-2024-2466
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...igure.ac-find-libpsl-with-pkg-config.patch | 109 ------------------
>  package/libcurl/libcurl.hash                  |   4 +-
>  package/libcurl/libcurl.mk                    |   4 +-
>  3 files changed, 3 insertions(+), 114 deletions(-)
>  delete mode 100644 package/libcurl/0001-configure.ac-find-libpsl-with-pkg-config.patch
> 
> diff --git a/package/libcurl/0001-configure.ac-find-libpsl-with-pkg-config.patch b/package/libcurl/0001-configure.ac-find-libpsl-with-pkg-config.patch
> deleted file mode 100644
> index 46df1e36a2..0000000000
> --- a/package/libcurl/0001-configure.ac-find-libpsl-with-pkg-config.patch
> +++ /dev/null
> @@ -1,109 +0,0 @@
> -From 9b3f67e267d1fa8d7867655d133bdbf8830a0ab3 Mon Sep 17 00:00:00 2001
> -From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -Date: Thu, 15 Feb 2024 20:59:25 +0100
> -Subject: [PATCH] configure.ac: find libpsl with pkg-config
> -
> -Find libpsl with pkg-config to avoid static build failures.
> -
> -Ref: http://autobuild.buildroot.org/results/1fb15e1a99472c403d0d3b1a688902f32e78d002
> -
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -Closes #12947
> -
> -Upstream: https://github.com/curl/curl/commit/9b3f67e267d1fa8d7867655d133bdbf8830a0ab3
> ----
> - configure.ac | 79 ++++++++++++++++++++++++++++++++++++++++++++--------
> - docs/TODO    |  7 -----
> - 2 files changed, 67 insertions(+), 19 deletions(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index cd0e2d07d8d164..09d5364f4de575 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -2075,19 +2075,74 @@ dnl **********************************************************************
> - dnl Check for libpsl
> - dnl **********************************************************************
> - 
> --AC_ARG_WITH(libpsl,
> --           AS_HELP_STRING([--without-libpsl],
> --           [disable support for libpsl]),
> --           with_libpsl=$withval,
> --           with_libpsl=yes)
> --curl_psl_msg="no      (libpsl disabled)"
> --if test $with_libpsl != "no"; then
> --  AC_SEARCH_LIBS(psl_builtin, psl,
> --    [curl_psl_msg="enabled";
> --     AC_DEFINE([USE_LIBPSL], [1], [PSL support enabled])
> --     ],
> --    [AC_MSG_ERROR([libpsl was not found]) ]
> -+dnl Default to compiler & linker defaults for LIBPSL files & libraries.
> -+OPT_LIBPSL=off
> -+AC_ARG_WITH(libpsl,dnl
> -+AS_HELP_STRING([--with-libpsl=PATH],[Where to look for libpsl, PATH points to the LIBPSL installation; when possible, set the PKG_CONFIG_PATH environment variable instead of using this option])
> -+AS_HELP_STRING([--without-libpsl], [disable LIBPSL]),
> -+  OPT_LIBPSL=$withval)
> -+
> -+if test X"$OPT_LIBPSL" != Xno; then
> -+  dnl backup the pre-libpsl variables
> -+  CLEANLDFLAGS="$LDFLAGS"
> -+  CLEANCPPFLAGS="$CPPFLAGS"
> -+  CLEANLIBS="$LIBS"
> -+
> -+  case "$OPT_LIBPSL" in
> -+  yes)
> -+    dnl --with-libpsl (without path) used
> -+    CURL_CHECK_PKGCONFIG(libpsl)
> -+
> -+    if test "$PKGCONFIG" != "no" ; then
> -+      LIB_PSL=`$PKGCONFIG --libs-only-l libpsl`
> -+      LD_PSL=`$PKGCONFIG --libs-only-L libpsl`
> -+      CPP_PSL=`$PKGCONFIG --cflags-only-I libpsl`
> -+    else
> -+      dnl no libpsl pkg-config found
> -+      LIB_PSL="-lpsl"
> -+    fi
> -+
> -+    ;;
> -+  off)
> -+    dnl no --with-libpsl option given, just check default places
> -+    LIB_PSL="-lpsl"
> -+    ;;
> -+  *)
> -+    dnl use the given --with-libpsl spot
> -+    LIB_PSL="-lpsl"
> -+    PREFIX_PSL=$OPT_LIBPSL
> -+    ;;
> -+  esac
> -+
> -+  dnl if given with a prefix, we set -L and -I based on that
> -+  if test -n "$PREFIX_PSL"; then
> -+    LD_PSL=-L${PREFIX_PSL}/lib$libsuff
> -+    CPP_PSL=-I${PREFIX_PSL}/include
> -+  fi
> -+
> -+  LDFLAGS="$LDFLAGS $LD_PSL"
> -+  CPPFLAGS="$CPPFLAGS $CPP_PSL"
> -+  LIBS="$LIB_PSL $LIBS"
> -+
> -+  AC_CHECK_LIB(psl, psl_builtin,
> -+    [
> -+     AC_CHECK_HEADERS(libpsl.h,
> -+        curl_psl_msg="enabled"
> -+        LIBPSL_ENABLED=1
> -+        AC_DEFINE(USE_LIBPSL, 1, [if libpsl is in use])
> -+        AC_SUBST(USE_LIBPSL, [1])
> -+     )
> -+    ],
> -+      dnl not found, revert back to clean variables
> -+      LDFLAGS=$CLEANLDFLAGS
> -+      CPPFLAGS=$CLEANCPPFLAGS
> -+      LIBS=$CLEANLIBS
> -   )
> -+
> -+  if test X"$OPT_LIBPSL" != Xoff &&
> -+     test "$LIBPSL_ENABLED" != "1"; then
> -+    AC_MSG_ERROR([libpsl libs and/or directories were not found where specified!])
> -+  fi
> - fi
> - AM_CONDITIONAL([USE_LIBPSL], [test "$curl_psl_msg" = "enabled"])
> - 
> diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
> index 1f3dce0fd5..7fcad973c3 100644
> --- a/package/libcurl/libcurl.hash
> +++ b/package/libcurl/libcurl.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated after checking pgp signature
> -# https://curl.se/download/curl-8.6.0.tar.xz.asc
> +# https://curl.se/download/curl-8.7.1.tar.xz.asc
>  # signed with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
> -sha256  3ccd55d91af9516539df80625f818c734dc6f2ecf9bada33c76765e99121db15  curl-8.6.0.tar.xz
> +sha256  6fea2aac6a4610fbd0400afb0bcddbe7258a64c63f1f68e5855ebc0c659710cd  curl-8.7.1.tar.xz
>  sha256  adb1fc06547fd136244179809f7b7c2d2ae6c4534f160aa513af9b6a12866a32  COPYING
> diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
> index 4281cfabb1..99320c1315 100644
> --- a/package/libcurl/libcurl.mk
> +++ b/package/libcurl/libcurl.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBCURL_VERSION = 8.6.0
> +LIBCURL_VERSION = 8.7.1
>  LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
>  LIBCURL_SITE = https://curl.se/download
>  LIBCURL_DEPENDENCIES = host-pkgconf \
> @@ -14,8 +14,6 @@ LIBCURL_LICENSE = curl
>  LIBCURL_LICENSE_FILES = COPYING
>  LIBCURL_CPE_ID_VENDOR = haxx
>  LIBCURL_INSTALL_STAGING = YES
> -# 0001-configure.ac-find-libpsl-with-pkg-config.patch
> -LIBCURL_AUTORECONF = YES
>  
>  # We disable NTLM delegation to winbinds ntlm_auth ('--disable-ntlm-wb')
>  # support because it uses fork(), which doesn't work on non-MMU platforms.
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
