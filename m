Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0BF6C433EF
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 07:20:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3306840543;
	Sun, 17 Jul 2022 07:20:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3306840543
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4ZD0McizoPJU; Sun, 17 Jul 2022 07:20:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0BDC040A0D;
	Sun, 17 Jul 2022 07:20:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0BDC040A0D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id ADABB1BF2CA
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 07:20:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 85F3E40A18
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 07:20:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 85F3E40A18
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UzHXrkb-TmHJ for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 07:20:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 075F44011A
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 075F44011A
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 07:20:05 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4985:d730:3c09:77ac])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 2A0CB78050A;
 Sun, 17 Jul 2022 09:20:02 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 17 Jul 2022 09:20:01 +0200
Date: Sun, 17 Jul 2022 09:20:01 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220717072001.GV2543@scaer>
References: <20220716150247.753062-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220716150247.753062-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658042404;
 bh=dt9QMTaYm4b3srDry4qzQdlyeEVJ5AC4bdb31a12OAA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SnAxp5pEs44e8UhIzVs54yxihNQEJ+/+Ut6zr7wceqrcMnzo8uf8+QuGht1OsANhz
 7feMF0//L1uvC0r1dbjQkO0lqBBBP0gHHC5L21v3q+cLixPPX5ABy54z/PMwAsudCs
 cd84XRYzbCEOTaalM44RoA4hN/52R7h8e1qEwS1M8fR+qTdnaaCPoWfHr7QE/JCmNz
 cjST52btG3h9pR+TptuO+JeCPfq5keB49bs7URtgsIs4mjFK6UB2u0PPcbpwf0j7MZ
 YTgmQaMyp2+vTtQoxv6RIqNcx/6pCdKs10th53dyK+jZ2SRAekii/i3+hZZjP2mOVK
 DmU9+PJb8SHTg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=SnAxp5pE
Subject: Re: [Buildroot] [PATCH 1/1] package/libgpg-error: bump to version
 1.45
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

On 2022-07-16 17:02 +0200, Fabrice Fontaine spake thusly:
> Drop patches (already in version)
> 
> https://dev.gnupg.org/T5352
> https://dev.gnupg.org/T5676
> https://dev.gnupg.org/T5802
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...tion-of-lock-obj-pub.native.h-for-cr.patch | 34 ----------------
>  .../0002-build-Fix-disable-threads.patch      | 39 -------------------
>  package/libgpg-error/libgpg-error.hash        |  8 ++--
>  package/libgpg-error/libgpg-error.mk          |  2 +-
>  4 files changed, 5 insertions(+), 78 deletions(-)
>  delete mode 100644 package/libgpg-error/0001-build-Fix-generation-of-lock-obj-pub.native.h-for-cr.patch
>  delete mode 100644 package/libgpg-error/0002-build-Fix-disable-threads.patch
> 
> diff --git a/package/libgpg-error/0001-build-Fix-generation-of-lock-obj-pub.native.h-for-cr.patch b/package/libgpg-error/0001-build-Fix-generation-of-lock-obj-pub.native.h-for-cr.patch
> deleted file mode 100644
> index 621f070ee2..0000000000
> --- a/package/libgpg-error/0001-build-Fix-generation-of-lock-obj-pub.native.h-for-cr.patch
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -From 7350874f6f62314af4c8ec1973c91d305a6f4ddc Mon Sep 17 00:00:00 2001
> -From: David Michael <fedora.dm0@gmail.com>
> -Date: Fri, 26 Mar 2021 16:06:50 +0900
> -Subject: [PATCH] build: Fix generation of lock-obj-pub.native.h for cross
> - build.
> -
> -* src/gen-lock-obj.sh: Capture echo output with quotes.
> -
> ---
> -
> -Fixes-commit: 99ae862a96a569724f49a604ebb7d3f6d2c2d374
> -Signed-off-by: David Michael <fedora.dm0@gmail.com>
> -Upstream: 33593864cd54143db594c4237bba41e14179061c
> -Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ----
> - src/gen-lock-obj.sh | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/src/gen-lock-obj.sh b/src/gen-lock-obj.sh
> -index a710f0c..258eec6 100755
> ---- a/src/gen-lock-obj.sh
> -+++ b/src/gen-lock-obj.sh
> -@@ -38,7 +38,7 @@
> - #     AWK=gawk ./gen-lock-obj.sh
> - #
> - 
> --if test -n `echo -n`; then
> -+if test -n "`echo -n`"; then
> -     ECHO_C='\c'
> -     ECHO_N=''
> - else
> --- 
> -2.31.1
> -
> diff --git a/package/libgpg-error/0002-build-Fix-disable-threads.patch b/package/libgpg-error/0002-build-Fix-disable-threads.patch
> deleted file mode 100644
> index 6ed0f83070..0000000000
> --- a/package/libgpg-error/0002-build-Fix-disable-threads.patch
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -From 7ede0d4ce19e0ed14cd1cec81ba7df4e467f1eeb Mon Sep 17 00:00:00 2001
> -From: NIIBE Yutaka <gniibe@fsij.org>
> -Date: Mon, 21 Jun 2021 12:16:20 +0900
> -Subject: [PATCH] build: Fix --disable-threads.
> -
> -* src/gen-lock-obj.sh: Fix generating '}}}'.
> -
> ---
> -
> -GnuPG-bug-id: 5495
> -Reported-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -Fixes-commit: 1fb90a7da186ee2ee098a666f6f3a35bb1720e59
> -Signed-off-by: NIIBE Yutaka <gniibe@fsij.org>
> -[Retrieved from:
> -https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libgpg-error.git;a=commit;h=220a427b4f997ef6af1b2d4e82ef1dc96e0cd6ff]
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ----
> - src/gen-lock-obj.sh | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/src/gen-lock-obj.sh b/src/gen-lock-obj.sh
> -index 258eec6..014667f 100755
> ---- a/src/gen-lock-obj.sh
> -+++ b/src/gen-lock-obj.sh
> -@@ -121,10 +121,10 @@ while test "$i" -lt $ac_mtx_size; do
> -     fi
> -     i=$(( i + 1 ))
> - done
> -+echo '}}}'
> - fi
> - 
> - cat <<'EOF'
> --}}}
> - ##
> - ## Local Variables:
> - ## mode: c
> --- 
> -2.31.1
> -
> diff --git a/package/libgpg-error/libgpg-error.hash b/package/libgpg-error/libgpg-error.hash
> index 4e124941cd..b29ec37598 100644
> --- a/package/libgpg-error/libgpg-error.hash
> +++ b/package/libgpg-error/libgpg-error.hash
> @@ -1,10 +1,10 @@
>  # From https://www.gnupg.org/download/integrity_check.html
> -sha1  5e620d71fc24d287a7ac2460b1d819074bb8b9bb  libgpg-error-1.42.tar.bz2
> +sha1  fe724ed37b4935964059a47b7c64d5f8246659d8  libgpg-error-1.45.tar.bz2
>  
>  # Locally calculated after checking pgp signature
> -# https://gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-1.42.tar.bz2.sig
> -# using key D8692123C4065DEA5E0F3AB5249B39D24F25E3B6
> -sha256  fc07e70f6c615f8c4f590a8e37a9b8dd2e2ca1e9408f8e60459c67452b925e23  libgpg-error-1.42.tar.bz2
> +# https://gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-1.45.tar.bz2.sig
> +# using key 6DAA6E64A76D2840571B4902528897B826403ADA
> +sha256  570f8ee4fb4bff7b7495cff920c275002aea2147e9a1d220c068213267f80a26  libgpg-error-1.45.tar.bz2
>  # Locally calculated
>  sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
>  sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING.LIB
> diff --git a/package/libgpg-error/libgpg-error.mk b/package/libgpg-error/libgpg-error.mk
> index babcbdaded..86dea6ad2a 100644
> --- a/package/libgpg-error/libgpg-error.mk
> +++ b/package/libgpg-error/libgpg-error.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBGPG_ERROR_VERSION = 1.42
> +LIBGPG_ERROR_VERSION = 1.45
>  LIBGPG_ERROR_SITE = https://www.gnupg.org/ftp/gcrypt/libgpg-error
>  LIBGPG_ERROR_SOURCE = libgpg-error-$(LIBGPG_ERROR_VERSION).tar.bz2
>  LIBGPG_ERROR_LICENSE = GPL-2.0+, LGPL-2.1+
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
