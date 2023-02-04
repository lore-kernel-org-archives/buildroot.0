Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 158C6C636CC
	for <buildroot@archiver.kernel.org>; Sat,  4 Feb 2023 14:55:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6C0160F7D;
	Sat,  4 Feb 2023 14:55:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6C0160F7D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UdsK75u8NgRG; Sat,  4 Feb 2023 14:55:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CAAED60F7E;
	Sat,  4 Feb 2023 14:55:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CAAED60F7E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2018F1BF425
 for <buildroot@lists.busybox.net>; Sat,  4 Feb 2023 14:55:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EE73582136
 for <buildroot@lists.busybox.net>; Sat,  4 Feb 2023 14:55:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE73582136
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pTbviQwQl3nT for <buildroot@lists.busybox.net>;
 Sat,  4 Feb 2023 14:55:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB8B882112
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DB8B882112
 for <buildroot@buildroot.org>; Sat,  4 Feb 2023 14:55:20 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [92.184.102.219])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id B3C0919F5AE;
 Sat,  4 Feb 2023 15:55:15 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 04 Feb 2023 15:55:14 +0100
Date: Sat, 4 Feb 2023 15:55:14 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20230204145514.GD24755@scaer>
References: <20230201181005.731564-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230201181005.731564-1-bernd.kuhls@t-online.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1675522519;
 bh=8aIl9NhY7jB6ioi7dCGqYB7ZeTfd2g5TSUc/5nRDXdM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QIQUW7RHvmpQeHtoevCddewULQWHwdDsMgNEGP5l+e6+SWaSyTQUPWzBbm00pWsiZ
 nzK+7S+ZvHcoq89byyJDpP1rSAuBnFy24J6GZtOXGca89KSyma6CbR7CgBiBDmUdpO
 r4pd+y0nUAnfRP7N5LuMY1U783jwGoboli5tlnxYQQYzH/5mfkbCLDHePZhKU0PaVE
 rjpT+HScog1f6z8xAgSNbK9K++X43R/jHw2wCUaIer2j5XioLwlIQeaMj4VlgqVBG/
 i82PHuL2ZJREP26K4KN/quY1jKfx2FYSKDvUHcYsu0cop5/NDtAeRmmM+P+un0zSWi
 +BL72nOUDR6oQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=QIQUW7RH
Subject: Re: [Buildroot] [PATCH v2 1/1] package/libarchive: Only add "iconv"
 to the .pc file if needed
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bernd, All,

On 2023-02-01 19:10 +0100, Bernd Kuhls spake thusly:
> Fix the following build failure with fwup raised since bump to version
> 3.6.2 in commit 380341b249175382691f268de4b41d3843ff0acc and
> https://github.com/libarchive/libarchive/commit/a83f3d327aefe8d628230f326621b014d82f55b4
> 
> checking for pkg-config... /tmp/instance-19/output-1/host/bin/pkg-config
> checking pkg-config is at least version 0.9.0... yes
> checking for ARCHIVE... no
> configure: error: Requires libarchive. Libarchive must be built with zlib support.
> 
> Fixes:
> http://autobuild.buildroot.net/results/f5d/f5d549fb4f08156ba5952ce75926f7fd2242bfdf/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> v2: added dependency to host-pkgconf to fix autoconf error
> 
>  ...y-add-iconv-to-the-pc-file-if-needed.patch | 44 +++++++++++++++++++
>  package/libarchive/libarchive.mk              |  4 ++
>  2 files changed, 48 insertions(+)
>  create mode 100644 package/libarchive/0001-Only-add-iconv-to-the-pc-file-if-needed.patch
> 
> diff --git a/package/libarchive/0001-Only-add-iconv-to-the-pc-file-if-needed.patch b/package/libarchive/0001-Only-add-iconv-to-the-pc-file-if-needed.patch
> new file mode 100644
> index 0000000000..c93944f789
> --- /dev/null
> +++ b/package/libarchive/0001-Only-add-iconv-to-the-pc-file-if-needed.patch
> @@ -0,0 +1,44 @@
> +From 1f35c466aaa9444335a1b854b0b7223b0d2346c2 Mon Sep 17 00:00:00 2001
> +From: Peter Pentchev <roam@ringlet.net>
> +Date: Thu, 29 Dec 2022 00:04:40 +0200
> +Subject: [PATCH] Only add "iconv" to the .pc file if needed (#1825)
> +
> +Hi,
> +
> +Thanks for writing and maintaining libarchive!
> +
> +What do you think about this trivial change that does not add "iconv" to
> +the pkg-config file's list of required packages unless it is actually
> +needed? On at least Debian GNU/Linux systems, the iconv(3) function is
> +part of the system C library and there is no Debian package that
> +installs an iconv.pc file, so I had to make this change to the Debian
> +package of libarchive.
> +
> +Thanks again, and keep up the great work!
> +
> +G'luck,
> +Peter
> +
> +Downloaded from upstream commit:
> +https://github.com/libarchive/libarchive/commit/1f35c466aaa9444335a1b854b0b7223b0d2346c2
> +
> +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> +---
> + configure.ac | 4 +++-
> + 1 file changed, 3 insertions(+), 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 99bff20d1..e2715cfde 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -378,7 +378,9 @@ if test "x$with_iconv" != "xno"; then
> +     AC_CHECK_HEADERS([localcharset.h])
> +     am_save_LIBS="$LIBS"
> +     LIBS="${LIBS} ${LIBICONV}"
> +-    LIBSREQUIRED="$LIBSREQUIRED${LIBSREQUIRED:+ }iconv"
> ++    if test -n "$LIBICONV"; then
> ++      LIBSREQUIRED="$LIBSREQUIRED${LIBSREQUIRED:+ }iconv"
> ++    fi
> +     AC_CHECK_FUNCS([locale_charset])
> +     LIBS="${am_save_LIBS}"
> +     if test "x$ac_cv_func_locale_charset" != "xyes"; then
> diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
> index cfc148d01d..cd7c13fbed 100644
> --- a/package/libarchive/libarchive.mk
> +++ b/package/libarchive/libarchive.mk
> @@ -11,6 +11,10 @@ LIBARCHIVE_INSTALL_STAGING = YES
>  LIBARCHIVE_LICENSE = BSD-2-Clause, BSD-3-Clause, CC0-1.0, OpenSSL, Apache-2.0
>  LIBARCHIVE_LICENSE_FILES = COPYING
>  LIBARCHIVE_CPE_ID_VENDOR = libarchive
> +# We're patching configure.ac
> +LIBARCHIVE_AUTORECONF = YES
> +# needed for autoreconf
> +LIBARCHIVE_DEPENDENCIES += host-pkgconf
>  
>  ifeq ($(BR2_PACKAGE_LIBARCHIVE_BSDTAR),y)
>  ifeq ($(BR2_STATIC_LIBS),y)
> -- 
> 2.39.1
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
