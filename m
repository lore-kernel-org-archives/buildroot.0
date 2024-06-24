Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 375D6C2BD05
	for <buildroot@archiver.kernel.org>; Mon, 24 Jun 2024 07:46:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6057E810D0;
	Mon, 24 Jun 2024 07:46:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZvdOnBoOLboK; Mon, 24 Jun 2024 07:46:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1AD79810C2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1AD79810C2;
	Mon, 24 Jun 2024 07:46:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EE65B1BF4D5
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 07:46:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D9773810C2
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 07:46:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zdM2MFRObfBM for <buildroot@lists.busybox.net>;
 Mon, 24 Jun 2024 07:46:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2F5D5810B3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F5D5810B3
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2F5D5810B3
 for <buildroot@busybox.net>; Mon, 24 Jun 2024 07:46:19 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost ([82.135.81.90]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MeCpb-1swMOg2uiF-00oszZ; Mon, 24
 Jun 2024 09:46:13 +0200
Date: Mon, 24 Jun 2024 09:46:12 +0200
To: Peter Seiderer via buildroot <buildroot@buildroot.org>
Message-ID: <20240624094612.4ea600ec@gmx.net>
In-Reply-To: <20240621154422.18332-1-ps.report@gmx.net>
References: <20240621154422.18332-1-ps.report@gmx.net>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:xajR73g9RGVtKZpI+r9NHRFnliD2O4XdWq6jUg+Eqm+Oo6vlUfD
 45kv7WA0w1X+DMkDxfn1/u7EHcIkm1tV0azz1V3gLVNaUtO2jeHrJQB4z/nM37YEoKmjnXA
 oDSJhwxNpyQUDAPy3FfbLF9p/LEADRzmmECjXZpyrjUDvemySkMKV7i+GncWDBaI5zQ/xHG
 pGNyH4rQ77swiXhSpL1ww==
UI-OutboundReport: notjunk:1;M01:P0:+z8mhDFndVg=;LzTApA2am/HGGC3MDpd6d4aKPtF
 tYFkedKZX1K+BNbZDVD1GNtwjH1gGcnpd0bg9sNnqcTxDcDjTMdj/tGG5d05cLrHBPxvk/Cvr
 365gu/TyMSqVq966JVTio48ajFQJIyquXsqpkmRFvO2IZkP99rKHKfd0fVucR6clxguCyn2bO
 mffyCxP2p84AQOjnI4QLx/bP7rBZ21uRmfKzuiP99dAgHL7rcK52GEk/FcAgXsc/fHrPqbybL
 ktSNtZL710ilxaDTj012Ug1ebqA0DCG2FxPytriwR2k7kdmOCyRA39gQya270CDu7wCxNzGuO
 mYcdNmyd0N5Cc0R/h01oOodmNGTc+Ub6chRWJYCFSw09uenBRy2ipcIJqbTjC7y3w0gRzBIX+
 +/Z2ZiXSJ69pCfmqWrGPu7I67bMA896ybOt345RCozJNGsIGjkql44iaaopGsTVUP4Fbs+mbB
 22zjd51gQBVsoECrGsIwBU/+JFJlVQML+7OpEJHtuKU1UFZUgxMDOgBIPf7cZKRrfnC12BK5R
 DZGIZX2SxWPBFi8eET/31I/SLqDNxR2em4dT1Raz76Hi/fVLWqPPt06qhvdmo40WhkNu5GcMM
 jbC+WaAuyjyrxi3TRRrsQTVrXW2IpmRuKiEEZVKWhqng7kR78t+0Meq12BHTAVZ3JvSZXBhF4
 qpKP1F8E4i3KbWEFglDKA/PtdkocZ7+EHqUUdxyIqQnLr54RO6rdNk4qE6wDCo46ExFIDZW+I
 3lWHoso4Yq98okWAQ50Eak6yDla4OAzpn4/PZ21TXtQZnPVK3gL3cWOzHlfSiDOsanSswB4CB
 QYMbIzJSYlzYEXkW5KLF1JCzaRvRqxgjUOLZHWWVh5hAo=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1719215173; x=1719819973; i=ps.report@gmx.net;
 bh=c7/DRvtZ4mprYXqirzR6q69+xKWMqw9+z1agoGjRK7o=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=OJJRNODrzEwfQDZBqRu8uW8L5f6DYroetckYZ+4A5oqYJH2G0yGCvFFO0CX316fl
 oGW0U3fz27xAYKQVSe+MyTHmHUCueJEWIKC7mFAQnUTKG+mKG8vV21NHDDc04nGep
 /541j+oRH5l5ba/2SM2UJxxHUv5lUFe583nST1QEHTA+zM/jzI7xIztLp5MFc5olg
 x1b2E3sdCzmE45VG2xfYHbnZ1zsXbhjFc0LXKrbSrGHTlQJ9eZc6/jiB0jNTDdYNM
 tUoUTtSZS6wiLKhpVoPpfM+VttWjkdD0S+NOm2xgA1mtTsZMJsEALddC9S7xrQUrz
 Vcaqe8AAqMOWPY7+2g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=OJJRNODr
Subject: Re: [Buildroot] [PATCH v1] package/apr: bump version to 1.7.4
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
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Cc: buildroot@busybox.net, Bernd Kuhls <bernd@kuhls.net>,
 Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 21 Jun 2024 17:44:22 +0200, Peter Seiderer via buildroot <buildroot@buildroot.org> wrote:

> - remove 0002-Revert-Backport-r1872164.-Fix-the-name-of-libtool-wh.patch and
>   0003-Revert-Add-the-ability-to-cross-compile-APR.patch (cross compile
>   hopefully fixes by upstream commit [1])

A clean complete build fails for apr-util with:

Makefile:50: .../build/apr-util-1.6.3/build/rules.mk: No such file or directory
make[2]: *** No rule to make target '.../build/apr-util-1.6.3/build/rules.mk'.  Stop.

Seems at least 0002-Revert-Backport-r1872164.-Fix-the-name-of-libtool-wh.patch
is still needed...

Regards,
Peter

>
> For details see [2].
>
> [1] https://github.com/apache/apr/commit/130cf8cb3c6fe713095e560ade1df050aa2a6a14
> [2] https://downloads.apache.org/apr/CHANGES-APR-1.7
>
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  ...r1872164.-Fix-the-name-of-libtool-wh.patch |  30 -----
>  ...Add-the-ability-to-cross-compile-APR.patch | 112 ------------------
>  package/apr/apr.hash                          |   4 +-
>  package/apr/apr.mk                            |   2 +-
>  4 files changed, 3 insertions(+), 145 deletions(-)
>  delete mode 100644 package/apr/0002-Revert-Backport-r1872164.-Fix-the-name-of-libtool-wh.patch
>  delete mode 100644 package/apr/0003-Revert-Add-the-ability-to-cross-compile-APR.patch
>
> diff --git a/package/apr/0002-Revert-Backport-r1872164.-Fix-the-name-of-libtool-wh.patch b/package/apr/0002-Revert-Backport-r1872164.-Fix-the-name-of-libtool-wh.patch
> deleted file mode 100644
> index f80db1cb6b..0000000000
> --- a/package/apr/0002-Revert-Backport-r1872164.-Fix-the-name-of-libtool-wh.patch
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -From 0aa7e33372b479a26e5f04dfc4801e24573a8737 Mon Sep 17 00:00:00 2001
> -From: Graham Leggett <minfrin@apache.org>
> -Date: Wed, 1 Jan 2020 10:43:39 +0000
> -Subject: [PATCH] Revert: Backport r1872164. Fix the name of libtool when
> - cross compiling.
> -
> -git-svn-id: https://svn.apache.org/repos/asf/apr/apr/branches/1.7.x@1872165 13f79535-47bb-0310-9956-ffa450edef68
> -
> -[Revert upstream commit https://github.com/apache/apr/commit/f82374627b3a6500a7a6cb11e48bcac59bcbb6a1]
> -Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ----
> - apr-config.in | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/apr-config.in b/apr-config.in
> -index bed47ca..4873fc0 100644
> ---- a/apr-config.in
> -+++ b/apr-config.in
> -@@ -246,7 +246,7 @@ while test $# -gt 0; do
> -     if test "$location" = "installed"; then
> -         echo "${installbuilddir}/libtool"
> -     elif test "$location" = "crosscompile"; then
> --        echo "$APR_TARGET_DIR/${installbuilddir}/libtool"
> -+        echo "$APR_TARGET_DIR/${installbuilddir}/build"
> -     else
> -         echo "$APR_BUILD_DIR/libtool"
> -     fi
> ---
> -2.39.2
> -
> diff --git a/package/apr/0003-Revert-Add-the-ability-to-cross-compile-APR.patch b/package/apr/0003-Revert-Add-the-ability-to-cross-compile-APR.patch
> deleted file mode 100644
> index ad250d4427..0000000000
> --- a/package/apr/0003-Revert-Add-the-ability-to-cross-compile-APR.patch
> +++ /dev/null
> @@ -1,112 +0,0 @@
> -From ed1daed074fba0dabff825e63525d751b6bb7b8d Mon Sep 17 00:00:00 2001
> -From: Graham Leggett <minfrin@apache.org>
> -Date: Tue, 31 Dec 2019 21:26:02 +0000
> -Subject: [PATCH] Revert: Add the ability to cross compile APR.
> -
> -git-svn-id: https://svn.apache.org/repos/asf/apr/apr/branches/1.7.x@1872147 13f79535-47bb-0310-9956-ffa450edef68
> -
> -[Revert upstream commit https://github.com/apache/apr/commit/b6dbbc77da35a7b46754c99f465827f2a583e23c]
> -Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ----
> - CHANGES       |  2 --
> - apr-config.in | 22 ----------------------
> - 2 files changed, 24 deletions(-)
> -
> -diff --git a/CHANGES b/CHANGES
> -index 71b2f0e..e751c90 100644
> ---- a/CHANGES
> -+++ b/CHANGES
> -@@ -56,8 +56,6 @@ Changes for APR 1.7.1
> -   *) Don't try to use PROC_PTHREAD by default when cross compiling.
> -      [Yann Ylavic]
> -
> --  *) Add the ability to cross compile APR. [Graham Leggett]
> --
> -   *) While cross-compiling, the tools/gen_test_char could not
> -      be executed at build time, use AX_PROG_CC_FOR_BUILD to
> -      build native tools/gen_test_char
> -diff --git a/apr-config.in b/apr-config.in
> -index 4873fc0..84b4073 100644
> ---- a/apr-config.in
> -+++ b/apr-config.in
> -@@ -48,14 +48,6 @@ APR_LIBNAME="@APR_LIBNAME@"
> - # NOTE: the following line is modified during 'make install': alter with care!
> - location=@APR_CONFIG_LOCATION@
> -
> --# absolute path, but not installed path - we're cross compiling
> --case "$0" in
> --  "${bindir}/"*) ;;
> --  "/"*)         location=crosscompile;
> --                APR_TARGET_DIR=${0%${bindir}/apr-${APR_MAJOR_VERSION}-config} ;;
> --  *)            ;;
> --esac
> --
> - show_usage()
> - {
> -     cat << EOF
> -@@ -101,8 +93,6 @@ fi
> -
> - if test "$location" = "installed"; then
> -     LA_FILE="$libdir/lib${APR_LIBNAME}.la"
> --elif test "$location" = "crosscompile"; then
> --    LA_FILE="$APR_TARGET_DIR/$libdir/lib${APR_LIBNAME}.la"
> - else
> -     LA_FILE="$APR_BUILD_DIR/lib${APR_LIBNAME}.la"
> - fi
> -@@ -132,8 +122,6 @@ while test $# -gt 0; do
> -     --includedir)
> -     if test "$location" = "installed"; then
> -         flags="$includedir"
> --    elif test "$location" = "crosscompile"; then
> --        flags="$APR_TARGET_DIR/$includedir"
> -     elif test "$location" = "source"; then
> -         flags="$APR_SOURCE_DIR/include"
> -     else
> -@@ -166,8 +154,6 @@ while test $# -gt 0; do
> -     --includes)
> -     if test "$location" = "installed"; then
> -         flags="$flags -I$includedir $EXTRA_INCLUDES"
> --    elif test "$location" = "crosscompile"; then
> --        flags="$flags -I$APR_TARGET_DIR/$includedir $EXTRA_INCLUDES"
> -     elif test "$location" = "source"; then
> -         flags="$flags -I$APR_SOURCE_DIR/include $EXTRA_INCLUDES"
> -     else
> -@@ -182,8 +168,6 @@ while test $# -gt 0; do
> -     --installbuilddir)
> -     if test "$location" = "installed"; then
> -         echo "${installbuilddir}"
> --    elif test "$location" = "crosscompile"; then
> --        echo "$APR_TARGET_DIR/${installbuilddir}"
> -     elif test "$location" = "source"; then
> -         echo "$APR_SOURCE_DIR/build"
> -     else
> -@@ -200,8 +184,6 @@ while test $# -gt 0; do
> -     if test "$location" = "installed"; then
> -         ### avoid using -L if libdir is a "standard" location like /usr/lib
> -         flags="$flags -L$libdir -l${APR_LIBNAME}"
> --    elif test "$location" = "crosscompile"; then
> --        flags="$flags -L$APR_TARGET_DIR/$libdir -l${APR_LIBNAME}"
> -     else
> -         ### this surely can't work since the library is in .libs?
> -         flags="$flags -L$APR_BUILD_DIR -l${APR_LIBNAME}"
> -@@ -219,8 +201,6 @@ while test $# -gt 0; do
> -         # Since the user is specifying they are linking with libtool, we
> -         # *know* that -R will be recognized by libtool.
> -         flags="$flags -L$libdir -R$libdir -l${APR_LIBNAME}"
> --    elif test "$location" = "crosscompile"; then
> --        flags="$flags  -L${APR_TARGET_DIR}/$libdir  -l${APR_LIBNAME}"
> -     else
> -         flags="$flags $LA_FILE"
> -     fi
> -@@ -245,8 +225,6 @@ while test $# -gt 0; do
> -     --apr-libtool)
> -     if test "$location" = "installed"; then
> -         echo "${installbuilddir}/libtool"
> --    elif test "$location" = "crosscompile"; then
> --        echo "$APR_TARGET_DIR/${installbuilddir}/build"
> -     else
> -         echo "$APR_BUILD_DIR/libtool"
> -     fi
> ---
> -2.39.2
> -
> diff --git a/package/apr/apr.hash b/package/apr/apr.hash
> index 96f43d3710..66a183c11d 100644
> --- a/package/apr/apr.hash
> +++ b/package/apr/apr.hash
> @@ -1,4 +1,4 @@
> -# From https://archive.apache.org/dist/apr/apr-1.7.2.tar.bz2.sha256
> -sha256  75e77cc86776c030c0a5c408dfbd0bf2a0b75eed5351e52d5439fa1e5509a43e  apr-1.7.2.tar.bz2
> +# From https://archive.apache.org/dist/apr/apr-1.7.4.tar.bz2.sha256
> +sha256  fc648de983f3a2a6c9e78dea1f180639bd2fad6c06d556d4367a701fe5c35577  apr-1.7.4.tar.bz2
>  # Locally calculated
>  sha256  f854aeef66ecd55a126226e82b3f26793fc3b1c584647f6a0edc5639974c38ad  LICENSE
> diff --git a/package/apr/apr.mk b/package/apr/apr.mk
> index cb8c12dd65..4eb6eb12ad 100644
> --- a/package/apr/apr.mk
> +++ b/package/apr/apr.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>
> -APR_VERSION = 1.7.2
> +APR_VERSION = 1.7.4
>  APR_SOURCE = apr-$(APR_VERSION).tar.bz2
>  APR_SITE = https://archive.apache.org/dist/apr
>  APR_LICENSE = Apache-2.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
