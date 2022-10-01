Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF831C4332F
	for <buildroot@archiver.kernel.org>; Sat,  1 Oct 2022 16:51:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9D19D40BC0;
	Sat,  1 Oct 2022 16:51:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D19D40BC0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2OSJz-DX7jvi; Sat,  1 Oct 2022 16:51:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A37B940BAC;
	Sat,  1 Oct 2022 16:51:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A37B940BAC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1C9D71BF59C
 for <buildroot@lists.busybox.net>; Sat,  1 Oct 2022 16:51:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CE4374183A
 for <buildroot@lists.busybox.net>; Sat,  1 Oct 2022 16:51:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE4374183A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S2f-JilQ_abn for <buildroot@lists.busybox.net>;
 Sat,  1 Oct 2022 16:51:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5BE5D41825
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5BE5D41825
 for <buildroot@buildroot.org>; Sat,  1 Oct 2022 16:51:12 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9961:1217:61e8:73cc])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 3FAD578035B;
 Sat,  1 Oct 2022 18:51:08 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 01 Oct 2022 18:51:08 +0200
Date: Sat, 1 Oct 2022 18:51:08 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20221001165107.GL30794@scaer>
References: <20220929083004.2387969-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220929083004.2387969-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1664643070;
 bh=DmtGsN4PtY5qjio57iYeNDs78U1wQF1JS9Sco0gUjhY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DQEcQWnv7qamZwaKadKumIgvmEpKT7PotSuVWFB4/Rh6jRvJLahnX1/B2TOONRpMy
 G4pDfM/rvdpkMGlvkNwO0Ir33rShUPFloGZugfnm+W+bYruHPVN9ybYdGuitEFRHgD
 28yIm0Fgkza37zdtASgJLAnQefXGnh3Xu7lQMntFTOfWfDtnGa3XuK+a87sYWmFxr1
 NLMd66ME6oUw32RgarvsBVn/RQXwNcZLvFoRxkoZMSauOGOKz779ohm3eKAsNvzCUF
 jfto1ho9w3V80FY0pVGDnkMIuRA/kql2MDDleg4T5oqnLZ40t0Ftf5v+2V1u1m+bug
 JwG1/wOjACKfQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=DQEcQWnv
Subject: Re: [Buildroot] [PATCH 1/1] package/gensio: bump to version 2.5.5
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

James, All,

On 2022-09-29 02:30 -0600, James Hilliard spake thusly:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...01-tools-gensiot-Fix-build-with-musl.patch | 29 -------------------
>  package/gensio/gensio.hash                    |  6 ++--
>  package/gensio/gensio.mk                      |  2 +-
>  3 files changed, 4 insertions(+), 33 deletions(-)
>  delete mode 100644 package/gensio/0001-tools-gensiot-Fix-build-with-musl.patch
> 
> diff --git a/package/gensio/0001-tools-gensiot-Fix-build-with-musl.patch b/package/gensio/0001-tools-gensiot-Fix-build-with-musl.patch
> deleted file mode 100644
> index 7cda950c9e..0000000000
> --- a/package/gensio/0001-tools-gensiot-Fix-build-with-musl.patch
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -From 64f8f754447572a6b7bed4038a9a29a12b448479 Mon Sep 17 00:00:00 2001
> -From: Jan Luebbe <jlu@pengutronix.de>
> -Date: Thu, 25 Aug 2022 12:19:16 +0200
> -Subject: [PATCH] tools:gensiot: Fix build with musl
> -
> -According to POSIX getpid() is available in unistd.h, not sys/unistd.h.
> -
> -Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
> -
> -[Retrieved from:
> -https://github.com/cminyard/gensio/commit/64f8f754447572a6b7bed4038a9a29a12b448479]
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ----
> - tools/gensiotool.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/tools/gensiotool.c b/tools/gensiotool.c
> -index cac531bb..ab0bb958 100644
> ---- a/tools/gensiotool.c
> -+++ b/tools/gensiotool.c
> -@@ -44,7 +44,7 @@
> - #include <signal.h>
> - #include <errno.h>
> - #include <sys/types.h>
> --#include <sys/unistd.h>
> -+#include <unistd.h>
> - #include <syslog.h>
> - #endif
> - 
> diff --git a/package/gensio/gensio.hash b/package/gensio/gensio.hash
> index a0db4bc516..84af3fdab1 100644
> --- a/package/gensio/gensio.hash
> +++ b/package/gensio/gensio.hash
> @@ -1,7 +1,7 @@
>  # From https://sourceforge.net/projects/ser2net/files/ser2net/
> -md5  60f90f62180922e2c7550877c4bb950c  gensio-2.5.2.tar.gz
> -sha1  b6c2ec39b51a56f5d28e88a59122f4c65ff844fa  gensio-2.5.2.tar.gz
> +md5  c8d65e1809ed5cd1138fa309e3ab0e94  gensio-2.5.5.tar.gz
> +sha1  076fc8324dedb658972a88c738131a409968e2ba  gensio-2.5.5.tar.gz
>  # Locally computed:
> -sha256  f7bc3d2ba9da73489dd3227a21ddd2f44a18c443185ce2b1a08ec564da06e6d1  gensio-2.5.2.tar.gz
> +sha256  63c5fff536efd080fb7bc7fa084331c19fc64abd42b7f2bec86bd77b4fd10840  gensio-2.5.5.tar.gz
>  sha256  501f3108e6c03e5a0a5585ebaaa369171aead5319cd0a7a4dc1f66211c1f09f1  COPYING
>  sha256  dcac7d447dd81ab96d28dce00a07a6486e623f7ded94e2a2a8e83312405cdf89  COPYING.LIB
> diff --git a/package/gensio/gensio.mk b/package/gensio/gensio.mk
> index f1cc00bf32..5538f97b19 100644
> --- a/package/gensio/gensio.mk
> +++ b/package/gensio/gensio.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -GENSIO_VERSION = 2.5.2
> +GENSIO_VERSION = 2.5.5
>  GENSIO_SITE = http://downloads.sourceforge.net/project/ser2net/ser2net
>  GENSIO_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
>  GENSIO_LICENSE_FILES = COPYING.LIB COPYING
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
