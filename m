Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84FF7C433F5
	for <buildroot@archiver.kernel.org>; Sun, 24 Apr 2022 17:44:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4313A81351;
	Sun, 24 Apr 2022 17:44:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0r-k4XSjUuwi; Sun, 24 Apr 2022 17:44:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B5C281348;
	Sun, 24 Apr 2022 17:44:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C91051BF352
 for <buildroot@lists.busybox.net>; Sun, 24 Apr 2022 17:44:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B78C840330
 for <buildroot@lists.busybox.net>; Sun, 24 Apr 2022 17:44:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U4HGTwASV9UM for <buildroot@lists.busybox.net>;
 Sun, 24 Apr 2022 17:44:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8CE7D40303
 for <buildroot@buildroot.org>; Sun, 24 Apr 2022 17:44:46 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:657d:21bd:cb37:8719])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id D7F947802BE;
 Sun, 24 Apr 2022 19:44:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1650822285;
 bh=MFnmv1dN3MNcLwBvMQEF6XmHurQcAqgcPQWPFkBOkpM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lwk3EFp292+/DTXCm1Sm8DlFUANcxxQuGUUf7Brr2+kvjNOq8HnL6oJ0fV1onWWnG
 S43lwRt4rNGf2r3hY3uX+VgtEyzMYvmvWAq1pmYhR5pE/65gcXe+/pICeSCKFkNX9R
 lx97rEB8rNo5HcMwPx050AKkqN6BHiPRoPYdCKCLdGDDVCRwYMBkxt6P3OLX9T1xHL
 QdOwuC+fynaz/ZrBKjLLLiibF/qpEGItNivMJNFII6BjP0I3KL0zRCkIbSGqueAkUI
 S8eL1luaxFY7tDrei3mn8oHxWdyG/+lL515398MllXHnuLapfYVswqnRQwbgICrWLZ
 9PUiYChK2T8Mw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 24 Apr 2022 19:44:41 +0200
Date: Sun, 24 Apr 2022 19:44:41 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220424174441.GZ2730@scaer>
References: <20220424084538.2740476-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220424084538.2740476-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/omniorb: fix openssl build
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
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-04-24 10:45 +0200, Fabrice Fontaine spake thusly:
> Add host-pkgconf dependency to fix the following build failure with
> openssl raised since commit 9d519412d65e13e4a7ffbb83edd8d1e4b2dfe4b7:
> 
> /nvmedata/autobuild/instance-25/output-1/per-package/omniorb/host/bin/m68k-buildroot-linux-uclibc-g++ -c -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0  -Wall -Wno-unused -fexceptions  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I.. -I./.. -I../../../../../include/omniORB4/internal -I../../../../../include/omniORB4/internal -D_OMNIORB_SSL_LIBRARY -D__OMNIORB4__ -I../../../../../stub -D_REENTRANT -I/usr/include -I. -I. -I../../../../../include -I../../../../../include -D__OSVERSION__=2 -D__linux__ -D__m68k__ -o static/sslActive.o sslActive.cc
> m68k-buildroot-linux-uclibc-g++: WARNING: unsafe header/library path used in cross-compilation: '-I/usr/include'
> In file included from /usr/include/stdlib.h:55,
>                  from /usr/include/openssl/crypto.h:14,
>                  from /usr/include/openssl/bio.h:20,
>                  from /usr/include/openssl/ssl.h:18,
>                  from ../../../../../include/omniORB4/sslContext.h:48,
>                  from sslActive.cc:32:
> /usr/include/bits/floatn.h:75:70: error: unknown machine mode '__TC__'
>    75 | typedef _Complex float __cfloat128 __attribute__ ((__mode__ (__TC__)));
>       |
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/47b1906eb7dd122a81191d14ad663c5931cbfade
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/omniorb/omniorb.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/omniorb/omniorb.mk b/package/omniorb/omniorb.mk
> index b44ec53fd5..d6434735cf 100644
> --- a/package/omniorb/omniorb.mk
> +++ b/package/omniorb/omniorb.mk
> @@ -25,7 +25,7 @@ HOST_OMNIORB_CONF_OPTS += --disable-longdouble
>  
>  ifeq ($(BR2_PACKAGE_OPENSSL),y)
>  OMNIORB_CONF_OPTS += --with-openssl
> -OMNIORB_DEPENDENCIES += openssl
> +OMNIORB_DEPENDENCIES += host-pkgconf openssl
>  else
>  OMNIORB_CONF_OPTS += --without-openssl
>  endif
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
