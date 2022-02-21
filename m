Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3BDEC433EF
	for <buildroot@archiver.kernel.org>; Mon, 21 Feb 2022 20:42:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 210A3400A8;
	Mon, 21 Feb 2022 20:42:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pAfLpHS9fRSd; Mon, 21 Feb 2022 20:42:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B3E884018B;
	Mon, 21 Feb 2022 20:42:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3D1481BF279
 for <buildroot@lists.busybox.net>; Mon, 21 Feb 2022 20:42:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2AB2D408C4
 for <buildroot@lists.busybox.net>; Mon, 21 Feb 2022 20:42:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VoNRh8fNs-Kr for <buildroot@lists.busybox.net>;
 Mon, 21 Feb 2022 20:42:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AD94A4049A
 for <buildroot@buildroot.org>; Mon, 21 Feb 2022 20:42:41 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:c4d2:14e:83d5:3704])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id D8C5219F574;
 Mon, 21 Feb 2022 21:42:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1645476159;
 bh=qMNYGiWsMaC+K9y/03gL/m1/3wT47TCzZqQ03uTgdSc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IKDJA3kAZ95sbqqNa7x8oAokfOHQakmJgshzr7jJ8SndtrUiNr2PLlgv28sMLlZAD
 lchAn7EmhrGTkvrsfisvdOS0YbYTs/GbtP5ms74mkq82McW+eVDzrr9Mb9AXQYj0FG
 4QjM5nhiapGvegz7GzSAJdP3mTKPgynf+8co4IB5WqMPwoRZRdecKWs138VoZvC1nq
 M+gemDZB7WX9fsna4PRcObaQ9e/2voQt9UVIcMPQZP0f+dyI2kHM8r5iYoJv713dtj
 12ZjaZXRyQbTCI/EUGZPyJPlH+LH8jNffxJpRbsjMbTIS5G2l1KnUIYSVjERcgiO98
 l6PEIOPNkeoVQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 21 Feb 2022 21:42:35 +0100
Date: Mon, 21 Feb 2022 21:42:35 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220221204235.GB2166282@scaer>
References: <20220221172621.1937610-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220221172621.1937610-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/flac: security bump to version
 1.3.4
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-02-21 18:26 +0100, Fabrice Fontaine spake thusly:
> This release mostly fixes (security related) bugs including:
>  - Fix 12 decoder bugs found by oss-fuzz, including CVE-2020-0499
>  - Fix encoder bug CVE-2021-0561
> 
> Also:
>  - Replace first patch which was reverted by
>    https://github.com/xiph/flac/commit/4fbb6d4f2ecf2a96c17ea9880108409f852c08a9

You removed that patch entirely, but forgot to drop FLAC_AUTORECONF=YES.

I had a look at that upstream commit, and I was wondering how they got
to fix that build issue if they reverted the patch. And indeed it is not
fixed and still happens:

    cpu.c:58:10: fatal error: sys/auxv.h: No such file or directory
     #include <sys/auxv.h>
              ^~~~~~~~~~~~
    compilation terminated.
    make[6]: *** [Makefile:739: cpu.lo] Error 1
    make[5]: *** [Makefile:796: all-recursive] Error 1
    make[4]: *** [Makefile:435: all-recursive] Error 1
    make[3]: *** [Makefile:500: all-recursive] Error 1
    make[2]: *** [Makefile:432: all] Error 2

So we need to adapt that patch instead of dropping it (and thus we need
to keep AUTORECONF=YES, of course).

Regards,
Yann E. MORIN.

>  - Disable stack protection (enabled by default since
>    https://github.com/xiph/flac/commit/f706f2832270a0b7851cdffe62ad37acda9423fe)
>  - Drop md5 which is not provided anymore
>  - Update indentation in hash file (two spaces)
> 
> https://github.com/xiph/flac/releases/tag/1.3.4
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...ck-for-sys-auxv.h-before-defining-FL.patch | 36 -------------------
>  package/flac/flac.hash                        | 12 +++----
>  package/flac/flac.mk                          |  5 +--
>  3 files changed, 8 insertions(+), 45 deletions(-)
>  delete mode 100644 package/flac/0001-configure.ac-check-for-sys-auxv.h-before-defining-FL.patch
> 
> diff --git a/package/flac/0001-configure.ac-check-for-sys-auxv.h-before-defining-FL.patch b/package/flac/0001-configure.ac-check-for-sys-auxv.h-before-defining-FL.patch
> deleted file mode 100644
> index d1398d4b3e..0000000000
> --- a/package/flac/0001-configure.ac-check-for-sys-auxv.h-before-defining-FL.patch
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -From 14a0713389fbfef59225d027ea466ebb478a8c6b Mon Sep 17 00:00:00 2001
> -From: Peter Seiderer <ps.report@gmx.net>
> -Date: Thu, 19 Sep 2019 21:18:04 +0200
> -Subject: [PATCH] configure.ac: check for sys/auxv.h before defining FLAC__CPU_PPC
> -
> -Upstream: https://github.com/xiph/flac/pull/142
> -Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ----
> - configure.ac | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index 0228a12..64cb3f2 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -144,7 +144,7 @@ case "$host_cpu" in
> - 	powerpc64|powerpc64le)
> - 		cpu_ppc64=true
> - 		cpu_ppc=true
> --		AC_DEFINE(FLAC__CPU_PPC)
> -+		AC_CHECK_HEADER(sys/auxv.h, AC_DEFINE(FLAC__CPU_PPC))
> - 		AH_TEMPLATE(FLAC__CPU_PPC, [define if building for PowerPC])
> - 		AC_DEFINE(FLAC__CPU_PPC64)
> - 		AH_TEMPLATE(FLAC__CPU_PPC64, [define if building for PowerPC64])
> -@@ -152,7 +152,7 @@ case "$host_cpu" in
> - 		;;
> - 	powerpc|powerpcle)
> - 		cpu_ppc=true
> --		AC_DEFINE(FLAC__CPU_PPC)
> -+		AC_CHECK_HEADER(sys/auxv.h, AC_DEFINE(FLAC__CPU_PPC))
> - 		AH_TEMPLATE(FLAC__CPU_PPC, [define if building for PowerPC])
> - 		asm_optimisation=$asm_opt
> - 		;;
> ---
> -2.23.0
> -
> diff --git a/package/flac/flac.hash b/package/flac/flac.hash
> index df7c2d1b95..2444535e0f 100644
> --- a/package/flac/flac.hash
> +++ b/package/flac/flac.hash
> @@ -1,10 +1,8 @@
> -# From https://ftp.osuosl.org/pub/xiph/releases/flac/MD5SUMS
> -md5 26703ed2858c1fc9ffc05136d13daa69  flac-1.3.3.tar.xz
>  # From https://ftp.osuosl.org/pub/xiph/releases/flac/SHA1SUMS
> -sha1 6ac2e8f1dd18c9b0214c4d81bd70cdc1e943cffe  flac-1.3.3.tar.xz
> +sha1  99c28482a8b2d81deaf740639e4cb55658427420  flac-1.3.4.tar.xz
>  # From http://downloads.xiph.org/releases/flac/SHA256SUMS.txt
> -sha256 213e82bd716c9de6db2f98bcadbc4c24c7e2efe8c75939a1a84e28539c4e1748  flac-1.3.3.tar.xz
> +sha256  8ff0607e75a322dd7cd6ec48f4f225471404ae2730d0ea945127b1355155e737  flac-1.3.4.tar.xz
>  # Locally computed
> -sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPL
> -sha256 5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING.LGPL
> -sha256 fa27cb11f13f97b0c5f3ff363b1e2610c6efe87ed175779cb2a78e44eb19d34c  COPYING.Xiph
> +sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPL
> +sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING.LGPL
> +sha256  fa27cb11f13f97b0c5f3ff363b1e2610c6efe87ed175779cb2a78e44eb19d34c  COPYING.Xiph
> diff --git a/package/flac/flac.mk b/package/flac/flac.mk
> index 9aa00b7ffd..2ff048b6e6 100644
> --- a/package/flac/flac.mk
> +++ b/package/flac/flac.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -FLAC_VERSION = 1.3.3
> +FLAC_VERSION = 1.3.4
>  FLAC_SITE = http://downloads.xiph.org/releases/flac
>  FLAC_SOURCE = flac-$(FLAC_VERSION).tar.xz
>  FLAC_INSTALL_STAGING = YES
> @@ -19,7 +19,8 @@ FLAC_AUTORECONF = YES
>  FLAC_CONF_OPTS = \
>  	$(if $(BR2_INSTALL_LIBSTDCPP),--enable-cpplibs,--disable-cpplibs) \
>  	--disable-xmms-plugin \
> -	--disable-altivec
> +	--disable-altivec \
> +	--disable-stack-smash-protection
>  
>  ifeq ($(BR2_PACKAGE_LIBOGG),y)
>  FLAC_CONF_OPTS += --with-ogg=$(STAGING_DIR)/usr
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
