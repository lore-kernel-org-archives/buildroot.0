Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77F8BC77B7F
	for <buildroot@archiver.kernel.org>; Mon,  8 May 2023 21:00:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 009E142123;
	Mon,  8 May 2023 21:00:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 009E142123
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6EBBQOXfpfVs; Mon,  8 May 2023 21:00:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8BD44202E;
	Mon,  8 May 2023 20:59:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8BD44202E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 338E61BF25B
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 20:59:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 09B2B84436
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 20:59:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09B2B84436
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lIrCBiBsdthN for <buildroot@lists.busybox.net>;
 Mon,  8 May 2023 20:59:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2B3784433
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F2B3784433
 for <buildroot@buildroot.org>; Mon,  8 May 2023 20:59:56 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:89f6:f9b6:d1a9:3e6e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 4D5BC780503;
 Mon,  8 May 2023 22:59:53 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 08 May 2023 22:59:53 +0200
Date: Mon, 8 May 2023 22:59:53 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Yair Ben-Avraham <yairba@protonmail.com>
Message-ID: <20230508205953.GT252090@scaer>
References: <Tm7UB83oi2aPJoQgoeiYTQrMJLPO4yjcBMbKqUPLlebN4FU9m2kt2n7NpycuWBjEDKrXzTL0AngujcH42EmoZLtIdZ8PxVtmUE1fYjH3jJU=@protonmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Tm7UB83oi2aPJoQgoeiYTQrMJLPO4yjcBMbKqUPLlebN4FU9m2kt2n7NpycuWBjEDKrXzTL0AngujcH42EmoZLtIdZ8PxVtmUE1fYjH3jJU=@protonmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683579595;
 bh=p9Kg3A/hTMERFXCI8UL6fQIKE2CbtI39VZFy61Qprd8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QC/yQ+cF7SfxMl20O30yQcmWRL+VIyyY7sUtstBaMUzV3cgz94d1vhL1IHuRFC4Uz
 35g9IaRaFhRAAOZVDq9hKt9nBGa8uj8mCVtSmPo1z2QTH+p7IifeKcVTNs5pbD4OtA
 M8FRjx8X4FW1C+Kxu4np44PVxFxVFuSvgf0CfN+3Y+OOGMITRa/d27OaLPTCZc/wtF
 zCHyAieUydcin+LdbbeTW0Zw6LH49UKqJHCGLGyQV7A10WNZnxEDxZ/XifeJgmfaCj
 CVIAub6RwQgKwsDQ+s/uq9vYkEmFi+OT0dku2I69q+O/jd5CtVHufnPDjsyYGr26Zl
 vOUQhYI1HUbBw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=QC/yQ+cF
Subject: Re: [Buildroot] package/gloox: bump version to 1.0.27
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Yair, All,

On 2023-04-25 13:34 +0000, Yair Ben-Avraham via buildroot spake thusly:
> Signed-off-by: Yair Ben-Avraham <yairba@protonmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...src-connectiontcpserver-cpp-fix-musl.patch | 25 -------------------
>  package/gloox/gloox.hash                      |  2 +-
>  package/gloox/gloox.mk                        |  2 +-
>  3 files changed, 2 insertions(+), 27 deletions(-)
>  delete mode 100644 package/gloox/0001-src-connectiontcpserver-cpp-fix-musl.patch
> 
> diff --git a/package/gloox/0001-src-connectiontcpserver-cpp-fix-musl.patch b/package/gloox/0001-src-connectiontcpserver-cpp-fix-musl.patch
> deleted file mode 100644
> index 56a2d4982c..0000000000
> --- a/package/gloox/0001-src-connectiontcpserver-cpp-fix-musl.patch
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -src/connectiontcpserver.cpp: fix musl build
> -
> -Build on musl fails on:
> -
> -connectiontcpserver.cpp:131:13: error: 'strerror' was not declared in this scope
> -           + strerror( err ) + " (errno: " + util::int2string( err ) + ")";
> -             ^~~~~~~~
> -
> -Fixes:
> - - http://autobuild.buildroot.org/results/a61a91bb6e1156eff5fb756f9dccfc2bb6c0f277
> -
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -[Upstream status: https://bugs.camaya.net/ticket/?id=291]
> -
> -diff -Nuar gloox-1.0.23-orig/src/connectiontcpserver.cpp gloox-1.0.23/src/connectiontcpserver.cpp
> ---- gloox-1.0.23-orig/src/connectiontcpserver.cpp	2020-06-05 23:22:59.624018949 +0200
> -+++ gloox-1.0.23/src/connectiontcpserver.cpp	2020-06-05 23:26:20.708027221 +0200
> -@@ -36,6 +36,7 @@
> - # include <resolv.h>
> - # include <netdb.h>
> - # include <arpa/inet.h>
> -+# include <string.h>
> - # include <sys/socket.h>
> - # include <sys/un.h>
> - # include <sys/select.h>
> diff --git a/package/gloox/gloox.hash b/package/gloox/gloox.hash
> index 6419db90f8..66a3c2d1be 100644
> --- a/package/gloox/gloox.hash
> +++ b/package/gloox/gloox.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  ae1462be2a2eb8fe5cd054825143617c53c2c9c7195606cb5a5ba68c0f68f9c9  gloox-1.0.24.tar.bz2
> +sha256  0b8b7371439bc58d9e51384b616c964b18b7b41b87af1b7855104380eda86ffb  gloox-1.0.27.tar.bz2
>  sha256  40a20c41c8dabb8ba61bea983fa8f2f6989e67fac56bb62c2249053807fd26af  LICENSE
> diff --git a/package/gloox/gloox.mk b/package/gloox/gloox.mk
> index b741d5ebc1..3495db96f0 100644
> --- a/package/gloox/gloox.mk
> +++ b/package/gloox/gloox.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -GLOOX_VERSION = 1.0.24
> +GLOOX_VERSION = 1.0.27
>  GLOOX_SOURCE = gloox-$(GLOOX_VERSION).tar.bz2
>  GLOOX_SITE = https://camaya.net/download
>  GLOOX_LICENSE = GPL-3.0 with OpenSSL exception
> -- 
> 2.30.2
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
