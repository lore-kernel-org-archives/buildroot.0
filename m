Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44266C433F5
	for <buildroot@archiver.kernel.org>; Sat,  1 Jan 2022 11:05:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B9F8B400D9;
	Sat,  1 Jan 2022 11:05:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b12PqpuU4fAV; Sat,  1 Jan 2022 11:05:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9A1834012F;
	Sat,  1 Jan 2022 11:05:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2BE721BF4E6
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 11:05:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1A6DF405C8
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 11:05:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RJrRUePpVJlg for <buildroot@lists.busybox.net>;
 Sat,  1 Jan 2022 11:05:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D315340598
 for <buildroot@buildroot.org>; Sat,  1 Jan 2022 11:05:21 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:b440:9a6c:7abd:86f8])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id F38D85FF20;
 Sat,  1 Jan 2022 12:05:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1641035119;
 bh=lkRSuT+ODvGLeyaCyVEKsfHbG/utPSgR6WMczkSpsNA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=W/5V8nLKTTZJ4Sq0AZRroYv8vMZGlokDLqBgxBAAwJzXhdjUsNBJpbRPXKkzx301/
 Dx2mCPoWiFCjpfSjIqtdojmtmBlMH7T5QJCjg/LvBSEvLjhJinjcY2akg2+0DC0XE1
 v5Bclfbp+OMW9ka7/LpHzZ4c0FQWjFq1bOyUrHgeCxydHp223D3K0oCXaTLPNMH9/I
 ZzX8uI6tI3LiUjuPTE90S6WeaQSWVG96eXg2hsmI1wPFJX5Tmk7HDXG9ET4AgJsIG9
 poTRJsopelnIWJABjEOVroUsSjzY5E5xkxbOPJVFuq0ZrY8kCVbhYLp/QJW16K2oXY
 2Nj61p138tufA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 01 Jan 2022 12:05:12 +0100
Date: Sat, 1 Jan 2022 12:05:12 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220101110512.GF3390456@scaer>
References: <20211230225204.3080462-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211230225204.3080462-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/sslh: bump to version 1.22c
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
Cc: David Bachelart <david.bachelart@bbright.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2021-12-30 23:52 +0100, Fabrice Fontaine spake thusly:
> - pcre2 is mandatory since version 1.22b and
>   https://github.com/yrutschle/sslh/commit/37d275670345bc177d4081d7d348c0943f743132
> - Drop patch (not needed anymore)
> 
> https://github.com/yrutschle/sslh/blob/v1.22c/ChangeLog
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...akefile-fix-static-linking-with-pcre.patch | 41 -------------------
>  package/sslh/Config.in                        |  1 +
>  package/sslh/sslh.hash                        |  2 +-
>  package/sslh/sslh.mk                          | 10 +----
>  4 files changed, 4 insertions(+), 50 deletions(-)
>  delete mode 100644 package/sslh/0001-Makefile-fix-static-linking-with-pcre.patch
> 
> diff --git a/package/sslh/0001-Makefile-fix-static-linking-with-pcre.patch b/package/sslh/0001-Makefile-fix-static-linking-with-pcre.patch
> deleted file mode 100644
> index 5fc3296da5..0000000000
> --- a/package/sslh/0001-Makefile-fix-static-linking-with-pcre.patch
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -From 0d9e004d324cc030c173de04c40db51a0f22bb5c Mon Sep 17 00:00:00 2001
> -From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -Date: Thu, 15 Oct 2020 07:58:05 +0200
> -Subject: [PATCH] Makefile: fix static linking with pcre
> -
> -Static build with pcre is broken since version 1.19b and
> -https://github.com/yrutschle/sslh/commit/cb90cc97ae64a445242e517847c6e44b7003eda4
> -because -lpcre has been replaced by -lpcreposix which will result in
> -the following static build failure:
> -
> -/srv/storage/autobuild/run/instance-1/output-1/host/bin/mipsel-linux-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os   -static -static -o echosrv echosrv.o probe.o common.o tls.o  -lpcreposix -lconfig -lcap
> -/srv/storage/autobuild/run/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/mipsel-buildroot-linux-uclibc/8.3.0/../../../../mipsel-buildroot-linux-uclibc/bin/ld: /srv/storage/autobuild/run/instance-1/output-1/host/mipsel-buildroot-linux-uclibc/sysroot/usr/lib/libpcreposix.a(libpcreposix_la-pcreposix.o): in function `regfree':
> -pcreposix.c:(.text+0x120): undefined reference to `pcre_free'
> -
> -So append -lpcre after -lpcreposix
> -
> -Fixes:
> - - http://autobuild.buildroot.org/results/a601824fc0c205a6a940e0f9f079ce2c39840605
> -
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -[Upstream status: https://github.com/yrutschle/sslh/pull/280]
> ----
> - Makefile | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/Makefile b/Makefile
> -index 986cf1c..ecadc22 100644
> ---- a/Makefile
> -+++ b/Makefile
> -@@ -43,7 +43,7 @@ endif
> - 
> - ifneq ($(strip $(USELIBPCRE)),)
> - 	CPPFLAGS+=-DLIBPCRE
> --	LIBS:=$(LIBS) -lpcreposix
> -+	LIBS:=$(LIBS) -lpcreposix -lpcre
> - endif
> - 
> - ifneq ($(strip $(USELIBCONFIG)),)
> --- 
> -2.28.0
> -
> diff --git a/package/sslh/Config.in b/package/sslh/Config.in
> index f6b46f3218..a1d5211851 100644
> --- a/package/sslh/Config.in
> +++ b/package/sslh/Config.in
> @@ -2,6 +2,7 @@ config BR2_PACKAGE_SSLH
>  	bool "sslh"
>  	depends on BR2_USE_MMU # fork()
>  	select BR2_PACKAGE_LIBCONFIG if BR2_PACKAGE_SYSTEMD
> +	select BR2_PACKAGE_PCRE2
>  	help
>  	  Applicative protocol multiplexer
>  
> diff --git a/package/sslh/sslh.hash b/package/sslh/sslh.hash
> index 00e5c12d77..ae678563da 100644
> --- a/package/sslh/sslh.hash
> +++ b/package/sslh/sslh.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  3bfe783726f82c1f5a4be630ddc494ebb08dbb69980662cd7ffdeb7bc9e1e706  sslh-v1.21c.tar.gz
> +sha256  8e3742d14edf4119350cfdc7bb96b89134d9218eb6d2a6e1f70891ca18a649b1  sslh-v1.22c.tar.gz
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/sslh/sslh.mk b/package/sslh/sslh.mk
> index 4bde143cd8..99fb6bf922 100644
> --- a/package/sslh/sslh.mk
> +++ b/package/sslh/sslh.mk
> @@ -4,11 +4,12 @@
>  #
>  ################################################################################
>  
> -SSLH_VERSION = 1.21c
> +SSLH_VERSION = 1.22c
>  SSLH_SOURCE = sslh-v$(SSLH_VERSION).tar.gz
>  SSLH_SITE = http://www.rutschle.net/tech/sslh
>  SSLH_LICENSE = GPL-2.0+
>  SSLH_LICENSE_FILES = COPYING
> +SSLH_DEPENDENCIES = pcre2
>  
>  SSLH_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS)
>  
> @@ -33,13 +34,6 @@ else
>  SSLH_MAKE_OPTS += USELIBCONFIG=
>  endif
>  
> -ifeq ($(BR2_PACKAGE_PCRE),y)
> -SSLH_DEPENDENCIES += pcre
> -SSLH_MAKE_OPTS += USELIBPCRE=1
> -else
> -SSLH_MAKE_OPTS += USELIBPCRE=
> -endif
> -
>  ifeq ($(BR2_PACKAGE_SYSTEMD),y)
>  SSLH_DEPENDENCIES += systemd
>  SSLH_MAKE_OPTS += USESYSTEMD=1
> -- 
> 2.33.0
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
