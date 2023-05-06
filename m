Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E857C77B7F
	for <buildroot@archiver.kernel.org>; Sat,  6 May 2023 15:36:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FC478403B;
	Sat,  6 May 2023 15:36:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3FC478403B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GdbmuR7cKI5r; Sat,  6 May 2023 15:36:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3BA7281762;
	Sat,  6 May 2023 15:36:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3BA7281762
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 924001BF36C
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 15:35:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 77290405BC
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 15:35:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 77290405BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q7TNCtc_5KMr for <buildroot@lists.busybox.net>;
 Sat,  6 May 2023 15:35:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 862D2401B7
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 862D2401B7
 for <buildroot@buildroot.org>; Sat,  6 May 2023 15:35:34 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:ae89:1f5e:7283:231f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id D01E0B00583;
 Sat,  6 May 2023 17:35:29 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 06 May 2023 17:35:29 +0200
Date: Sat, 6 May 2023 17:35:29 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20230506153529.GG252090@scaer>
References: <20230505223025.47663-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230505223025.47663-1-giulio.benetti@benettiengineering.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683387332;
 bh=2BwX52QrBPHRe4e7WxADI/nK1zeql7NgfeMlrPhDqRY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QljcntS2ENV+8RfUxtcpeZQbglJPEo6TPbdYlq/f7dZ8svFXsnn+5aHwnI2QK9kqD
 UenJJkP69qZxP9tkfYFDCA8taLSKOhAWbqEI5SH3chkwlkAGtMpJFPIk0WuP4mJuWf
 HSDWyQya7Zec9DpwBbCR/UcyBwFDWTX4d30PAyWRRZYFmf2EoEbXWh6HH8WRUQL36/
 bLhqIy8BTiynQ13NmCYYJDry51dPbHptX5bf68u037/0h7q5l8HU7hxY5VflFnmf+d
 XLljUkAAlvL4BPz3lbyyCaw+ArissATVD/a7P6bEfMnxxyus6UiC8kxulhVh6Egj+w
 B4mPnnLoGfrzQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=QljcntS2
Subject: Re: [Buildroot] [PATCH] package/libnss: bump version to 3.89.1
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Giulio, All,

On 2023-05-06 00:30 +0200, Giulio Benetti spake thusly:
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libnss/libnss.hash | 4 ++--
>  package/libnss/libnss.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
> index 483320d95c..63a35285d7 100644
> --- a/package/libnss/libnss.hash
> +++ b/package/libnss/libnss.hash
> @@ -1,4 +1,4 @@
> -# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_89_RTM/src/SHA256SUMS
> -sha256  55c37a3f4da010d0574fb8b39264cb1e7b4ce9e6c2954c1c7ecf9f41ee00bed5  nss-3.89.tar.gz
> +# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_89_1_RTM/src/SHA256SUMS
> +sha256  3adaedb9e70c3c5f40603bf60a01e336190a6dbe01929d395f16b01fe84a0156  nss-3.89.1.tar.gz
>  # Locally calculated
>  sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
> diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
> index cc5dd8bdca..d3f227e909 100644
> --- a/package/libnss/libnss.mk
> +++ b/package/libnss/libnss.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBNSS_VERSION = 3.89
> +LIBNSS_VERSION = 3.89.1
>  LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
>  LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
>  LIBNSS_DISTDIR = dist
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
