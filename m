Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD684C05027
	for <buildroot@archiver.kernel.org>; Thu,  2 Feb 2023 20:47:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7E4314108D;
	Thu,  2 Feb 2023 20:47:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E4314108D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8EqkSZrS77rF; Thu,  2 Feb 2023 20:47:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ABD9D41095;
	Thu,  2 Feb 2023 20:47:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ABD9D41095
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6C8DC1BF417
 for <buildroot@lists.busybox.net>; Thu,  2 Feb 2023 20:47:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 460E9611E9
 for <buildroot@lists.busybox.net>; Thu,  2 Feb 2023 20:47:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 460E9611E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pPXG5j0wg0Co for <buildroot@lists.busybox.net>;
 Thu,  2 Feb 2023 20:47:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E89861177
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8E89861177
 for <buildroot@buildroot.org>; Thu,  2 Feb 2023 20:46:59 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost ([62.216.209.54]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MQv8x-1p1VAd0PnL-00O18d; Thu, 02
 Feb 2023 21:46:56 +0100
Date: Thu, 2 Feb 2023 21:46:55 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20230202214655.11ccfccf@gmx.net>
In-Reply-To: <20230201181005.731564-1-bernd.kuhls@t-online.de>
References: <20230201181005.731564-1-bernd.kuhls@t-online.de>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:lRARxX/Q1rfFXLY6/GE8H/F1tBd2EDJbtNorLn6pVHiBoxo1bUI
 bsTNygokrf/d7nayNyBommq3/sSJx+kVKZmMUP8PXS3LOJGlJuqpES7VHCV9rq/pfkAWM7Q
 JVMIBiRiRmTXF4LJriYCQhB9JPbHrhsCFmV8fwD4VH3BDRx1CYFj9T51jIBSuaT/GRxWs7S
 gi3uUlQV4qdNAy9TatxXA==
UI-OutboundReport: notjunk:1;M01:P0:tsTI76Ec2dE=;E3ZgEQ903fuWX90mRdkDxe0ecWK
 MDRka/4cRbYEbmj/qmtAfJOepUPxq7aGAZVzjzZ9ZGKVebqLw2MaR1eYWdNL+fjpwCNnyOHkS
 ozOdRZd8R1QSjWGJ7lt/2BUUqZNzsmTrX+ihJ7kIxIieyqMgLrumV0RmCvTO7BuoXllMtfIhE
 2EC0SC/KOIMp+7T6LT4g+DMqpTRbtL2eW11itJzzrPHa8+SrCMzGhTh7V7nxES8p66TCliNIq
 NFu0jd23kTm02lYl+pyuH0Gfvdn+f77MmDL+GItL2/F4wNKhaNoJvyHTpy/lqnYN5fhqq4C22
 X8C2ajeR4JM8HxAHCfTKSMVXDgh5qrja+Ctp4UgG9pr4Po/cZiYETgjTfCK9mSaFijg8eOMUK
 LSikLSkgSpS9nrVwik1cVYHzAImNk8mLiRhJzxvvX80HrtQfqozoNl4lSbCYY4T+nWUvfF7T2
 tTY5DlO0EEILSPsAcDDFjQoijvqkMkYXDekPtXB3v4fNHd37H2vtA6oUW1dcHpziTrIqa3s5Z
 9cKc9O7iAHIFog1B0k4uM2g36Q95DX4Ay2OsbmutwrablisQl13PYYF+YxdMG3DrYQpKRRTzR
 oyT39cvDsBjYDqHErWwhh/urORGnJ5F4/kGsDSBGT3fFtT+ufUdqhMq0rLIJa5+c6FZtjb2qg
 kA7YopmC8/K6jew43uGrhaUEj94k4CoDKXfQCMq8YaDgzJa4qg/2fEfls0HwCV6aJpzQVx1wf
 l5NpRtzyzzNxT0PoXKJJOEdGbR42RpQx2ggnIyF4jKFN2GGnbaZeG8OSYYhcMTr7PtHGzlyFx
 DbY37hcgUY+ohFJU3L3p6eoazvUHUu7TwtoMWkwntI/z+ZVFTlMYYShe8MVp+AsBzhZ4P8C8U
 21U6dDytUQc6wDKO68msXummIxRWP6aOSNde5rtkhiOSfiwmJPEzcCOXZFJgvoJf7Q/Ay6Q9r
 7wh8NA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=s31663417; 
 t=1675370816; bh=59o/uEPvYP8zDiRupod5y7squ5DCqIZQhJy+9k5LSeY=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=SeMYxubKUwMbdJMWhn7wCQlet69BaZkeA9Ah+hP3EBKWu4Nk3eqiSAw9DkPqYFM8c
 QCEuArjUiaGDUYf4OOg8l5tahsiMG5PkS5lR/bQ3GaGsssHKDznDMiLoWydE2WF5Rf
 unOn+c3q80eQH2/X7LFU7ZC9ViBIUlgfFdBtIsAq806oqG2MxznNdIvo/ZsA9DGBTa
 pKEuW9Evee7wWqP3xeui8tkpAsV1Si3fI8h2j/nqGTzi2HUp9tEvRObVKUnDeKC5+T
 nmmNtAPWpuprdWOtGInQg7QJzeWqcgriwIsTuMp6jRnGGjS8K/ptK039DDltFov0WW
 AOUcPoygGH4AA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=SeMYxubK
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

On Wed,  1 Feb 2023 19:10:05 +0100, Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

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

And some opkg autobuild failures:

http://autobuild.buildroot.net/results/3c0cb8ff764fb97c9d0498a4d58857351b659676/
http://autobuild.buildroot.net/results/87d5ebbe2db2358da05751c087e31b8528d8b0e7/
http://autobuild.buildroot.net/results/f604b2e3cdc0b8d8fcdfc847a3b2c8904fff649c/
http://autobuild.buildroot.net/results/9a54d6267fb69657bf994f77a1193c37dff01066/
http://autobuild.buildroot.net/results/5dc839d26b34824f78311c5e745d51209f7a1987/
http://autobuild.buildroot.net/results/7cc3bceddd4ba016164d31d2718138c43cb8b976/
http://autobuild.buildroot.net/results/b844d753f5d1969e941e2a865c7ff760fde37d9c/
http://autobuild.buildroot.net/results/29d5d20660318620befb78af3be06896d4a70e99/

Regards,
Peter


>
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
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

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
