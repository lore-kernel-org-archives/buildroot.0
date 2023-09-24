Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E73CECE7A88
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 10:37:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97263418BF;
	Sun, 24 Sep 2023 10:37:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97263418BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id syXt2l6PG0a9; Sun, 24 Sep 2023 10:37:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0794041991;
	Sun, 24 Sep 2023 10:37:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0794041991
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C5C9F1BF365
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 10:36:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AAD0B41833
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 10:36:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AAD0B41833
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XlSPeE507g08 for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 10:36:18 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 31345418B9
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 10:36:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 31345418B9
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:bf8d:df06:37bc:41df])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 7B483780395;
 Sun, 24 Sep 2023 12:36:14 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 24 Sep 2023 12:36:14 +0200
Date: Sun, 24 Sep 2023 12:36:14 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230924103614.GM1469982@scaer>
References: <20230923114713.1466381-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230923114713.1466381-1-bernd@kuhls.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1695551776;
 bh=bxWv3d/uIkjDDP6TPkJwObT5gBGJRCezf/D9QlAOIjg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iM4R9VfCizr1Dcq7XiLmhdsw1X9VUq+PRT3dM+gnssPorcBiGn9nQUcjbfdOOWTzw
 m/lDogqrsFZLFXlze4j97WsEOhww7sdyGxmyXXRO24aFEgbkNjUp5zIkzSJWYjcHTb
 xYi5pNdQZClkdF/ANh20ktuKhpWKHpcOjydLIXZwd+JZ4URZl7vHHYGNBlwXnlwTD/
 f48QTT8A/VNiqSSXpG5R8ZePQ2ERiRd4zAQ1XMinHUPolf4xfJ9+m94Xs+r/23iPQ0
 NCZYyJ/yXha+Q2b68qvB8by+iwoTvojjWgqOUzZWLUwiW2C/+VsY8cxk5UZPOPhgkV
 WmsrymnpiE+tQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=iM4R9VfC
Subject: Re: [Buildroot] [PATCH 1/2] package/alsa-lib: bump version to 1.2.10
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

On 2023-09-23 13:47 +0200, Bernd Kuhls spake thusly:
> Removed patch which is included in this release:
> https://github.com/alsa-project/alsa-lib/commit/c72bbed82513074fb5f0d474c7e88e2b4b945905
> 
> Changelog:
> https://www.alsa-project.org/wiki/Changes_v1.2.9_v1.2.10#alsa-lib
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Both applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...ver-build-error-on-non-ELF-platforms.patch | 84 -------------------
>  package/alsa-lib/alsa-lib.hash                |  2 +-
>  package/alsa-lib/alsa-lib.mk                  |  2 +-
>  3 files changed, 2 insertions(+), 86 deletions(-)
>  delete mode 100644 package/alsa-lib/0002-Fix-symver-build-error-on-non-ELF-platforms.patch
> 
> diff --git a/package/alsa-lib/0002-Fix-symver-build-error-on-non-ELF-platforms.patch b/package/alsa-lib/0002-Fix-symver-build-error-on-non-ELF-platforms.patch
> deleted file mode 100644
> index 499bbb2ae4..0000000000
> --- a/package/alsa-lib/0002-Fix-symver-build-error-on-non-ELF-platforms.patch
> +++ /dev/null
> @@ -1,84 +0,0 @@
> -From 317aafb133ed797c4cd62599565a77ecc595daea Mon Sep 17 00:00:00 2001
> -From: Bernd Kuhls <bernd@kuhls.net>
> -Date: Thu, 29 Jun 2023 07:57:21 +0200
> -Subject: [PATCH] Fix symver build error on non-ELF platforms
> -
> -The following error is observed on Microblaze [1] build:
> -
> -    error: symver is only supported on ELF platforms
> -
> -due to using __attribute__((symver)) on non-ELF platform.
> -
> -[1] http://autobuild.buildroot.net/results/1e9/1e965d83d75615f35308440c5db044314a349357/build-end.log
> -
> -ac_check_attribute_symver.m4 was downloaded from
> -https://github.com/smuellerDD/libkcapi/blob/master/m4/ac_check_attribute_symver.m4
> -
> -Upstream: https://github.com/alsa-project/alsa-lib/pull/334
> -
> -Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ----
> - configure.ac                    |  1 +
> - include/alsa-symbols.h          |  2 +-
> - m4/ac_check_attribute_symver.m4 | 24 ++++++++++++++++++++++++
> - 3 files changed, 26 insertions(+), 1 deletion(-)
> - create mode 100644 m4/ac_check_attribute_symver.m4
> -
> -diff --git a/configure.ac b/configure.ac
> -index 0588eec3..71ec0b15 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -46,6 +46,7 @@ dnl Checks for typedefs, structures, and compiler characteristics.
> - AC_C_CONST
> - AC_C_INLINE
> - AC_HEADER_TIME
> -+AC_CHECK_ATTRIBUTE_SYMVER
> - 
> - dnl Checks for library functions.
> - AC_PROG_GCC_TRADITIONAL
> -diff --git a/include/alsa-symbols.h b/include/alsa-symbols.h
> -index f8c49103..521e5956 100644
> ---- a/include/alsa-symbols.h
> -+++ b/include/alsa-symbols.h
> -@@ -29,7 +29,7 @@
> - #define INTERNAL_CONCAT2_2(Pre, Post) Pre##Post
> - #define INTERNAL(Name) INTERNAL_CONCAT2_2(__, Name)
> - 
> --#if __GNUC__ > 10
> -+#if HAVE_ATTRIBUTE_SYMVER && __GNUC__ > 10
> - #define symbol_version(real, name, version) \
> - 	extern __typeof (real) real __attribute__((symver (#name "@" #version)))
> - #define default_symbol_version(real, name, version) \
> -diff --git a/m4/ac_check_attribute_symver.m4 b/m4/ac_check_attribute_symver.m4
> -new file mode 100644
> -index 00000000..b484c5eb
> ---- /dev/null
> -+++ b/m4/ac_check_attribute_symver.m4
> -@@ -0,0 +1,24 @@
> -+dnl Check compiler support for symver function attribute
> -+AC_DEFUN([AC_CHECK_ATTRIBUTE_SYMVER], [
> -+	saved_CFLAGS=$CFLAGS
> -+	CFLAGS="-O0 -Werror"
> -+	AC_COMPILE_IFELSE(
> -+		[AC_LANG_PROGRAM(
> -+			[[
> -+				void _test_attribute_symver(void);
> -+				__attribute__((__symver__("sym@VER_1.2.3"))) void _test_attribute_symver(void) {}
> -+			]],
> -+			[[ 
> -+				_test_attribute_symver()
> -+			]]
> -+		)],
> -+		[
> -+			AC_DEFINE([HAVE_ATTRIBUTE_SYMVER], 1, [Define to 1 if __attribute__((symver)) is supported])
> -+		],
> -+		[
> -+			AC_DEFINE([HAVE_ATTRIBUTE_SYMVER], 0, [Define to 0 if __attribute__((symver)) is not supported])
> -+		]
> -+	)
> -+	CFLAGS=$saved_CFLAGS
> -+])
> -+
> --- 
> -2.39.2
> -
> diff --git a/package/alsa-lib/alsa-lib.hash b/package/alsa-lib/alsa-lib.hash
> index f6735cd540..a6d9c7dbdc 100644
> --- a/package/alsa-lib/alsa-lib.hash
> +++ b/package/alsa-lib/alsa-lib.hash
> @@ -1,4 +1,4 @@
>  # Locally calculated
> -sha256  dc9c643fdc4ccfd0572cc685858dd41e08afb583f30460b317e4188275f615b2  alsa-lib-1.2.9.tar.bz2
> +sha256  c86a45a846331b1b0aa6e6be100be2a7aef92efd405cf6bac7eef8174baa920e  alsa-lib-1.2.10.tar.bz2
>  sha256  32434afcc8666ba060e111d715bfdb6c2d5dd8a35fa4d3ab8ad67d8f850d2f2b  COPYING
>  sha256  bfe16cf823bcff261fc6a062c07ee96660e3c39678f42f39a788a68dbc234ced  aserver/COPYING
> diff --git a/package/alsa-lib/alsa-lib.mk b/package/alsa-lib/alsa-lib.mk
> index 70f4c969d5..5dfcd1e861 100644
> --- a/package/alsa-lib/alsa-lib.mk
> +++ b/package/alsa-lib/alsa-lib.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -ALSA_LIB_VERSION = 1.2.9
> +ALSA_LIB_VERSION = 1.2.10
>  ALSA_LIB_SOURCE = alsa-lib-$(ALSA_LIB_VERSION).tar.bz2
>  ALSA_LIB_SITE = https://www.alsa-project.org/files/pub/lib
>  ALSA_LIB_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (aserver)
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
