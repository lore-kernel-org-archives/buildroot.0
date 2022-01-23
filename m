Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FF5BC433F5
	for <buildroot@archiver.kernel.org>; Sun, 23 Jan 2022 19:55:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2A396405E3;
	Sun, 23 Jan 2022 19:55:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KDGnmadRTGFk; Sun, 23 Jan 2022 19:55:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0734F40253;
	Sun, 23 Jan 2022 19:55:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4658C1BF406
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 19:55:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 357FB40867
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 19:55:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ms3Jt8PZF7Vg for <buildroot@lists.busybox.net>;
 Sun, 23 Jan 2022 19:55:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 487F240333
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 19:55:00 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:a491:f028:92d2:337e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id A5EFA5FFA7;
 Sun, 23 Jan 2022 20:54:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1642967698;
 bh=ecDQhV4DBe95fq8InqLyAgklhNsdzVMZAEXXJvr6QXw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Oq/LM+2pEZVrcchBWfkFU9I/nqFt1HB32Qcznv2WSKJlzvuR0olD7c5jVuavN+qch
 dZ718vuOR4hBsu6XAeDxHzJkVZrTMxXTcR2Cb7CkKT+5CbYLGhp1ukjp1q6XQhTvjc
 FQp1IWczjT1EMihLV5cW8bsDpRTw+M7K/DW924028VUhngDx+ENN3kw2A1hDlKpMm7
 cf289uFd3K6RKPdCQOOYQFeCsTPLk90bVAdcQtdeMaRPQIE4FtgXnuFYxF41U0Bhlr
 STZwLWf600stC0uG22FlyPYzu1+lhKFC3x4Qqg99a7K8LIMI2pE+Tgk93zyFZbmG6U
 CnZu8nsOReUEQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 23 Jan 2022 20:54:55 +0100
Date: Sun, 23 Jan 2022 20:54:55 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220123195455.GG2502@scaer>
References: <20220123134751.703269-1-fontaine.fabrice@gmail.com>
 <20220123134751.703269-2-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220123134751.703269-2-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 2/2] package/libpjsip: security bump to
 version 2.11.1
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
Cc: Luca Ceresoli <luca@lucaceresoli.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All

On 2022-01-23 14:47 +0100, Fabrice Fontaine spake thusly:
> Security update. This version is recommended for all users to improve
> the security of applications using PJSIP.
> 
> Fix CVE-2020-15260, CVE-2021-21375 and CVE-2021-32686
> 
> Update indentation in hash file (two spaces)
> 
> https://github.com/pjsip/pjproject/security/advisories/GHSA-8hcp-hm38-mfph
> https://github.com/pjsip/pjproject/security/advisories/GHSA-hvq6-f89p-frvp
> https://github.com/pjsip/pjproject/security/advisories/GHSA-cv8x-p47p-99wr
> https://github.com/pjsip/pjproject/releases/tag/2.11
> https://github.com/pjsip/pjproject/releases/tag/2.11.1
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libpjsip/libpjsip.hash | 4 ++--
>  package/libpjsip/libpjsip.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/libpjsip/libpjsip.hash b/package/libpjsip/libpjsip.hash
> index 68c2208885..f39ebf4060 100644
> --- a/package/libpjsip/libpjsip.hash
> +++ b/package/libpjsip/libpjsip.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256	936a4c5b98601b52325463a397ddf11ab4106c6a7b04f8dc7cdd377efbb597de	pjproject-2.10.tar.gz
> -sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643	COPYING
> +sha256  45f6604372df3f49293749cd7c0b42cb21c4fb666c66f8ed9765de004d1eae38  pjproject-2.11.1.tar.gz
> +sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
> index 771db0ac72..b05cc31a83 100644
> --- a/package/libpjsip/libpjsip.mk
> +++ b/package/libpjsip/libpjsip.mk
> @@ -4,10 +4,10 @@
>  #
>  ################################################################################
>  
> -LIBPJSIP_VERSION = 2.10
> +LIBPJSIP_VERSION = 2.11.1
>  LIBPJSIP_SOURCE = pjproject-$(LIBPJSIP_VERSION).tar.gz
>  LIBPJSIP_SITE = $(call github,pjsip,pjproject,$(LIBPJSIP_VERSION))
> -# https://github.com/pjsip/pjproject/archive/2.10.tar.gz
> +# https://github.com/pjsip/pjproject/archive/2.11.1.tar.gz
>  
>  LIBPJSIP_DEPENDENCIES = libsrtp
>  LIBPJSIP_LICENSE = GPL-2.0+
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
