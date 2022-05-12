Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25137C433EF
	for <buildroot@archiver.kernel.org>; Thu, 12 May 2022 20:04:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C13D460B3C;
	Thu, 12 May 2022 20:04:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4LD5EiY_1Z4A; Thu, 12 May 2022 20:04:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC81260B3A;
	Thu, 12 May 2022 20:04:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 76D741BF352
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 20:04:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7213F60B3A
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 20:04:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PO-5kdTBh4kK for <buildroot@lists.busybox.net>;
 Thu, 12 May 2022 20:04:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 810FA60669
 for <buildroot@buildroot.org>; Thu, 12 May 2022 20:04:15 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ccab:5af8:e14c:c986])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 32E1019F574;
 Thu, 12 May 2022 22:04:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1652385853;
 bh=iL5xPejY+pl+p4jWjH4X+udPNTEG2pQwXJOWBN03l4Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CF0E0ccVBKmEYka8PoF3WuxRsE1bZrYXzGJb5e+ssJZ7rDuqqkzi4aMwKCBSOSj3L
 daWygXginuC32rEpQMQWAiobMLnD3nNnuoraVsAKJyNe5Q1YqV4/STBCVpnWfvEaTg
 bGhuDhRO8QjaSeFiJIDSzifw/MRe9gTM6cQHZ1PH+H92WnoqZrTmpBA0DcvikMVW85
 oL7WhrFygnNL6b75junKIeN8tX/VgiNSiMTdqpYcZQ87EcpPn+pnY7sCWA78lTS6zo
 wlv9uIqj857yXnur5cnw7x7UZ+7bJeLh2FVpr07rG3QhbAy+B3bJhUWjb6911KWEiK
 yIp8bFQbyhqeQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 12 May 2022 22:04:10 +0200
Date: Thu, 12 May 2022 22:04:10 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20220512200410.GE1597494@scaer>
References: <20220512185857.955701-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220512185857.955701-1-bernd.kuhls@t-online.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/clamav: security bump version
 to 0.103.6
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

On 2022-05-12 20:58 +0200, Bernd Kuhls spake thusly:
> Release notes:
> https://blog.clamav.net/2022/05/clamav-01050-01043-01036-released.html
> 
> Fixes CVE-2022-20770, CVE-2022-20771, CVE-2022-20785, CVE-2022-20792,
> CVE-2022-20796 & CVE-2022-20803.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/clamav/clamav.hash | 2 +-
>  package/clamav/clamav.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/clamav/clamav.hash b/package/clamav/clamav.hash
> index 73f4ff88f1..579b0ec89e 100644
> --- a/package/clamav/clamav.hash
> +++ b/package/clamav/clamav.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated
> -sha256  1e74b1e1d2a8a9056449c313f48a6983b9d5ba0d6fb5ef0b2be6ad3c841a5426  clamav-0.103.5.tar.gz
> +sha256  aaa12e3dc19f1d323b1c50d7a10fa8af557e4390149e864d59bde39b6ad9ba33  clamav-0.103.6.tar.gz
>  sha256  0c4fd2fa9733fc9122503797648710851e4ee6d9e4969dd33fcbd8c63cd2f584  COPYING
>  sha256  d72a145c90918184a05ef65a04c9e6f7466faa59bc1b82c8f6a8ddc7ddcb9bed  COPYING.bzip2
>  sha256  dfb818a0d41411c6fb1c193c68b73018ceadd1994bda41ad541cbff292894bc6  COPYING.file
> diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
> index e2ee99d02b..10856ed971 100644
> --- a/package/clamav/clamav.mk
> +++ b/package/clamav/clamav.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -CLAMAV_VERSION = 0.103.5
> +CLAMAV_VERSION = 0.103.6
>  CLAMAV_SITE = https://www.clamav.net/downloads/production
>  CLAMAV_LICENSE = GPL-2.0
>  CLAMAV_LICENSE_FILES = COPYING COPYING.bzip2 COPYING.file COPYING.getopt \
> -- 
> 2.30.2
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
