Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAE02C433F5
	for <buildroot@archiver.kernel.org>; Sun, 23 Jan 2022 19:53:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DFCF82456;
	Sun, 23 Jan 2022 19:53:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P5l8io_JC6w9; Sun, 23 Jan 2022 19:53:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC58081BE3;
	Sun, 23 Jan 2022 19:53:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B9FF31BF406
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 19:52:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B662D81A58
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 19:52:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ofOGT1V1kYjl for <buildroot@lists.busybox.net>;
 Sun, 23 Jan 2022 19:52:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 60AEE81289
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 19:52:46 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:a491:f028:92d2:337e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 312865FEF7;
 Sun, 23 Jan 2022 20:52:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1642967563;
 bh=vjpVz6jKVK1DhPejFoCKZqr8xcoUgKddqV1uV/Rgeuo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TRaRXEuAmBdKHgmiiPyu6j0Ab74UjA8mt8cWAnJzxhD+Pi3MCX2Ccc5Tr+W8uwzUN
 56mNOiW37wTiW3Ltr4v+QXCKRCOeDAOvkAoUzUO2hV+pMaY78GT4xqHU+3ESndW9UB
 n2xSXoRrgRgTPP8TKCXPK4bZByiVr/20Kgc2c75pvzgQ7xEFeDbaBeCZBbvkIHSpPK
 daiVVAPU3jD/T/uJ6ajo9KZi03X3OHrPoMDyevZwPD4MOHIffKTHXk46PVHUsfj1gO
 q+kGeQoXoid0JHtqAQEQHkDU/KxNMQ086D1jAh9/7TRU16iPNIc2YVJzisgatIVMt0
 L5EeM+YFtnALw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 23 Jan 2022 20:52:40 +0100
Date: Sun, 23 Jan 2022 20:52:40 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220123195240.GB2502@scaer>
References: <20220123104057.556978-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220123104057.556978-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/xl2tp: bump to version 1.3.17
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

On 2022-01-23 11:40 +0100, Fabrice Fontaine spake thusly:
> https://github.com/xelerance/xl2tpd/releases/tag/v1.3.17
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/xl2tp/xl2tp.hash | 2 +-
>  package/xl2tp/xl2tp.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/xl2tp/xl2tp.hash b/package/xl2tp/xl2tp.hash
> index 471657f0f2..eca918bc83 100644
> --- a/package/xl2tp/xl2tp.hash
> +++ b/package/xl2tp/xl2tp.hash
> @@ -1,3 +1,3 @@
>  # locally computed
> -sha256  c28608b315adb25c8bf9579c1d6ab52ab47c4c43b68a5ab63c5d039196fd180f  xl2tp-1.3.16.tar.gz
> +sha256  898d9b6a374c78dea5f20d80fd50fac13428ad746fefb16ff5f6bec449affe67  xl2tp-1.3.17.tar.gz
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
> diff --git a/package/xl2tp/xl2tp.mk b/package/xl2tp/xl2tp.mk
> index 65a78504f3..4a2bd66308 100644
> --- a/package/xl2tp/xl2tp.mk
> +++ b/package/xl2tp/xl2tp.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -XL2TP_VERSION = 1.3.16
> +XL2TP_VERSION = 1.3.17
>  XL2TP_SITE = $(call github,xelerance,xl2tpd,v$(XL2TP_VERSION))
>  XL2TP_DEPENDENCIES = libpcap
>  XL2TP_LICENSE = GPL-2.0
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
