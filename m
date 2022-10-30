Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6B30ECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 18:20:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 71C49812A7;
	Sun, 30 Oct 2022 18:20:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 71C49812A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gzhtqK5qHsd5; Sun, 30 Oct 2022 18:20:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89D55812A3;
	Sun, 30 Oct 2022 18:20:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 89D55812A3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C6B191BF473
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 18:20:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A23A9605A4
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 18:20:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A23A9605A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AOuRadcj25XA for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 18:20:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA8E6605A3
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EA8E6605A3
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 18:20:46 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:6ffe:83e9:a65c:45ae])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id B77D913F84C;
 Sun, 30 Oct 2022 19:20:41 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 30 Oct 2022 19:20:41 +0100
Date: Sun, 30 Oct 2022 19:20:41 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221030182041.GX1058960@scaer>
References: <20221030175632.4139-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221030175632.4139-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1667154043;
 bh=v2DL1/WMl//cc85t7jdyumrabn6QHssAiFfJrVJJutk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SzyKvBBVzxY6sgi9UZ+O82Ia8NHFKDYCx9EkNHOag+AbsODVgGPDv4DwTMiZXgzFc
 kFtWT8n0+9Tyuvj3wKWbyWd5eOOmRkZwyCNFdwNU8axvuN9n6efvLJbdwUEEhXW6hK
 6xMENyO+ppB3wUR3f6Z3SCyZp67yV2dheKv4pacLFmITawu9DgfkYXcYZ7sUT7yjMt
 TkRcZhfIxMgfNoWOrou+ZY+f9KRYxgqMwyuI4Me54GuT1cTYTBw84Vbd5XpfU1Z/6a
 msruO85dJpxzeOJUJVJNk2RFd8s2gnOiZ3WCeYdXloZURFGaaJxD9HnbXg97InPnOR
 MebI+XgrYrsBw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=SzyKvBBV
Subject: Re: [Buildroot] [PATCH v2,
 1/2] package/openipmi: add libexecinfo optional dependency
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

On 2022-10-30 18:56 +0100, Fabrice Fontaine spake thusly:
> Add libexecinfo optional dependency as upstream rejected the patch to
> add --with-execinfo=no

Indeed, they rejected it, but they suggested an alternate solution:
check for backtrace() and whether it requires -lexecinfo.

Something like:

    AC_SEARCH_LIBS(
        [backtrace],
        [execinfo],
        ,
        [AC_MSG_ERROR([backtrace() not found and no library provides it; maybe install libexecinfo])]
    )

Regards,
Yann E. MORIN.

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Yann E. Morin):
>  - Add missing local patch
> 
>  ...igure.ac-add-without-execinfo-option.patch | 55 -------------------
>  package/openipmi/openipmi.mk                  |  6 +-
>  2 files changed, 5 insertions(+), 56 deletions(-)
>  delete mode 100644 package/openipmi/0002-configure.ac-add-without-execinfo-option.patch
> 
> diff --git a/package/openipmi/0002-configure.ac-add-without-execinfo-option.patch b/package/openipmi/0002-configure.ac-add-without-execinfo-option.patch
> deleted file mode 100644
> index e1838a06f4..0000000000
> --- a/package/openipmi/0002-configure.ac-add-without-execinfo-option.patch
> +++ /dev/null
> @@ -1,55 +0,0 @@
> -From 388033e3d0129510c3884333bc428cefeb75e0b8 Mon Sep 17 00:00:00 2001
> -From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -Date: Mon, 3 Jan 2022 23:27:21 +0100
> -Subject: [PATCH] configure.ac: add --without-execinfo option
> -
> -Add an option to allow the user to disable execinfo to avoid the
> -following build failure on musl with
> -https://github.com/mikroskeem/libexecinfo:
> -
> -/home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-musl/10.3.0/../../../../x86_64-buildroot-linux-musl/bin/ld: /home/buildroot/autobuild/instance-3/output-1/build/openipmi-2.0.28/utils/.libs/libOpenIPMIutils.so: undefined reference to `backtrace'
> -
> -Fixes:
> - - http://autobuild.buildroot.org/results/dcc33c5cca97d538231647a94212450f043974b3
> -
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -[Upstream status: https://sourceforge.net/p/openipmi/patches/36]
> ----
> - configure.ac | 14 +++++++++++++-
> - 1 file changed, 13 insertions(+), 1 deletion(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index 607864b9..f369166f 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -77,6 +77,16 @@ AC_ARG_WITH(poptlibs,
> -     POPTLIBS="$withval"
> - )
> - 
> -+tryexecinfo=yes
> -+AC_ARG_WITH(execinfo,
> -+[  --with-execinfo[[=yes|no]]      Look for execinfo.],
> -+    if test "x$withval" = "xyes"; then
> -+      tryexecinfo=yes
> -+    elif test "x$withval" = "xno"; then
> -+      tryexecinfo=no
> -+    fi,
> -+)
> -+
> - # If UCD SNMP requires OpenSSL, this tells where to find the crypto lib
> - tryopenssl=yes
> - AC_ARG_WITH(openssl,
> -@@ -275,7 +285,9 @@ AM_PROG_CC_C_O
> - AC_PROG_LIBTOOL
> - AC_STDC_HEADERS
> - 
> --AC_CHECK_HEADERS(execinfo.h)
> -+if test "x$tryexecinfo" != "xno"; then
> -+   AC_CHECK_HEADERS(execinfo.h)
> -+fi
> - AC_CHECK_HEADERS([netinet/ether.h])
> - AC_CHECK_HEADERS([sys/ethernet.h])
> - 
> --- 
> -2.34.1
> -
> diff --git a/package/openipmi/openipmi.mk b/package/openipmi/openipmi.mk
> index b3a4d90d4b..81492ec131 100644
> --- a/package/openipmi/openipmi.mk
> +++ b/package/openipmi/openipmi.mk
> @@ -15,7 +15,6 @@ OPENIPMI_INSTALL_STAGING = YES
>  OPENIPMI_AUTORECONF = YES
>  OPENIPMI_CONF_ENV = ac_cv_path_pkgprog="$(PKG_CONFIG_HOST_BINARY)"
>  OPENIPMI_CONF_OPTS = \
> -	--with-execinfo=no \
>  	--with-glib=no \
>  	--with-tcl=no \
>  	--with-perl=no \
> @@ -26,6 +25,11 @@ ifeq ($(BR2_PACKAGE_GDBM),y)
>  OPENIPMI_DEPENDENCIES += gdbm
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
> +OPENIPMI_DEPENDENCIES += libexecinfo
> +OPENIPMI_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) -lexecinfo"
> +endif
> +
>  ifeq ($(BR2_PACKAGE_OPENSSL),y)
>  OPENIPMI_DEPENDENCIES += openssl
>  OPENIPMI_CONF_OPTS += --with-openssl=yes
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
