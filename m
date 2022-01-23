Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25D9FC433EF
	for <buildroot@archiver.kernel.org>; Sun, 23 Jan 2022 19:54:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB43140422;
	Sun, 23 Jan 2022 19:54:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TGaZ2qhJnRzh; Sun, 23 Jan 2022 19:54:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1690240353;
	Sun, 23 Jan 2022 19:54:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8E2641BF406
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 19:54:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8B182814B6
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 19:54:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pqajnbU9Uof8 for <buildroot@lists.busybox.net>;
 Sun, 23 Jan 2022 19:54:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A913581466
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 19:54:44 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:a491:f028:92d2:337e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 2A68B5FFB7;
 Sun, 23 Jan 2022 20:54:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1642967683;
 bh=y6nBvsvo8C8n+pyB8eajMqlD1j/MWGUKTF2Xk2h6SR8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sToCm3ojShehWSn34Kb3yo7u9HZKPWwsqPlI5VpDVDO00yF4jA/vENIdQM/i+UAQP
 8f8Kq2bgZ8y7R0GZT48Rqi/cQzz3TvYrkzUHmf865fNGWQxwXJ/ZSdqAl+8UUlVquZ
 hdEicfVVmCetFpB9ody82vQ/Y1d8x3r3j82Z8QGjp67I0ZNipAUs5rrlkDy1m6U9C1
 eHY9DQP86waUBcQOIoNZ0EtERbfjyx1HoMqyMKgJkuwz1+uqERyUjwy8TlQKMsGKME
 PzbYm2+yh+bK6X1ayGycfTy6p5QQouX68eyvyRCxpaox6d3zYfA4cUnm0XpxcoIdPI
 W8NDKKEq9VKXg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 23 Jan 2022 20:54:40 +0100
Date: Sun, 23 Jan 2022 20:54:40 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220123195440.GF2502@scaer>
References: <20220123112220.578219-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220123112220.578219-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/lft: bump to version 3.91
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

Fab rice, All,

On 2022-01-23 12:22 +0100, Fabrice Fontaine spake thusly:
> lft 3.91 / WhoB 3.91
> ----------------------
> - Fixed bugs.debian.org/cgi-bin/bugreport.cgi?bug=922430
> - Updated date
> 
> lft 3.9 / WhoB 3.9
> ----------------------
> - Fixed a bug that could indicate a target was closed when it was open
> - Improved support for DLT_NULL interfaces on BSD-like operating systems
> - Improved deprecated pcap device enumeration method
> - Improved GraphViz output format appearance
> 
> Update indentation in hash file (two spaces)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/lft/lft.hash | 6 +++---
>  package/lft/lft.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/lft/lft.hash b/package/lft/lft.hash
> index 91a1fb0659..9bcce843bc 100644
> --- a/package/lft/lft.hash
> +++ b/package/lft/lft.hash
> @@ -1,5 +1,5 @@
>  # From http://pwhois.org/lft/
> -md5 31b15aabc619707427a73657512560f8  lft-3.8.tar.gz
> +md5  73cb955546692cf0fb5d7931939c56de  lft-3.91.tar.gz
>  # Locally calculated
> -sha256 10f427e77b0f8207817329bd8ef0310078434612620073369264d15e6f97e990  lft-3.8.tar.gz
> -sha256 e3b7634630e6800eccca6ecafb5d40153d4f8f7a20e2b2399bf3c0ea92f44614  COPYING
> +sha256  aad13e671adcfc471ab99417161964882d147893a54664f3f465ec5c8398e6af  lft-3.91.tar.gz
> +sha256  e3b7634630e6800eccca6ecafb5d40153d4f8f7a20e2b2399bf3c0ea92f44614  COPYING
> diff --git a/package/lft/lft.mk b/package/lft/lft.mk
> index 5154c83fef..37e6e77767 100644
> --- a/package/lft/lft.mk
> +++ b/package/lft/lft.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LFT_VERSION = 3.8
> +LFT_VERSION = 3.91
>  LFT_SITE = http://pwhois.org/get
>  LFT_DEPENDENCIES = libpcap
>  LFT_LICENSE = VOSTROM Public License for Open Source
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
